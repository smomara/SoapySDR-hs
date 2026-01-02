module SoapySDR
  ( -- * Device
    Device ()
  , withDevice
  , DeviceArgs (..)
  , Direction (..)
  , Channel (..)

    -- ** Identification API
  , getDriverKey
  , getHardwareKey
  , getHardwareInfo

    -- ** Channels API
  , setFrontendMapping
  , getFrontendMapping
  , getChannelInfo
  , getFullDuplex

    -- ** Exception Handling
  , SoapySDRError (..)
  ) where

import Control.Exception (Exception (..), throwIO)
import Data.Map (Map)
import Data.Map.Strict qualified as Map
import Foreign.C qualified as FC
import Foreign.C.ConstPtr qualified as ConstPtr
import Foreign.C.String (CString, peekCString, withCString)
import Foreign.Marshal.Array (peekArray, withArray0)
import Foreign.Marshal.Utils (toBool, with, withMany)
import Foreign.Ptr qualified as Ptr
import GHC.Generics

import SoapySDR.Bindings qualified as Bindings
import SoapySDR.Bindings.Unsafe qualified as Unsafe

-- * Device

newtype Device = Device (Ptr.Ptr Bindings.SoapySDRDevice)
  deriving stock (Eq, Show, Generic)

withDevice :: DeviceArgs -> (Device -> IO a) -> IO a
withDevice args f = withArgs args $ \argsPtr -> f . Device =<< Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)

newtype DeviceArgs = DeviceArgs {unDeviceArgs :: Map String String}
  deriving stock (Eq, Show, Generic)

withArgs :: DeviceArgs -> (Ptr.Ptr Bindings.SoapySDRKwargs -> IO a) -> IO a
withArgs (DeviceArgs m) f = do
  withCStringArray (Map.keys m) $ \keys -> do
    withCStringArray (Map.elems m) $ \values -> do
      let size = fromIntegral (Map.size m)
          kwargs = Bindings.SoapySDRKwargs size keys values
      with kwargs f

toDeviceArgs :: Bindings.SoapySDRKwargs -> IO DeviceArgs
toDeviceArgs args = do
  keys <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_keys
  vals <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_vals
  pure . DeviceArgs . Map.fromList $ zip keys vals

data Direction = RX | TX
  deriving stock (Eq, Show, Enum, Bounded, Generic)

fromDirection :: Direction -> FC.CInt
fromDirection = fromIntegral . fromEnum

newtype Channel = Channel Int
  deriving stock Generic
  deriving newtype (Eq, Show, Ord, Enum, Bounded, Num, Integral, Real)

fromChannel :: Channel -> FC.CSize
fromChannel (Channel n) = fromIntegral n

-- ** Identification API

getDriverKey :: Device -> IO String
getDriverKey (Device p) = peekCString =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr p)

getHardwareKey :: Device -> IO String
getHardwareKey (Device p) = peekCString =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr p)

getHardwareInfo :: Device -> IO DeviceArgs
getHardwareInfo (Device p) = toDeviceArgs =<< Unsafe.soapySDRDevice_getHardwareInfo (ConstPtr.ConstPtr p)

-- ** Channels API

setFrontendMapping :: Device -> Direction -> String -> IO ()
setFrontendMapping (Device p) dir mapping = withCString mapping $ \cstring ->
  throwIfError
    =<< Unsafe.soapySDRDevice_setFrontendMapping
      p
      (fromDirection dir)
      (ConstPtr.ConstPtr cstring)

getFrontendMapping :: Device -> Direction -> IO String
getFrontendMapping (Device p) dir =
  peekCString
    =<< Unsafe.soapySDRDevice_getFrontendMapping
      (ConstPtr.ConstPtr p)
      (fromDirection dir)

getChannelInfo :: Device -> Direction -> Channel -> IO DeviceArgs
getChannelInfo (Device p) dir chan =
  toDeviceArgs
    =<< Unsafe.soapySDRDevice_getChannelInfo
      (ConstPtr.ConstPtr p)
      (fromDirection dir)
      (fromChannel chan)

getFullDuplex :: Device -> Direction -> Channel -> IO Bool
getFullDuplex (Device p) dir chan =
  toBool
    <$> Unsafe.soapySDRDevice_getFullDuplex
      (ConstPtr.ConstPtr p)
      (fromDirection dir)
      (fromChannel chan)

-- ** Exception Handling

newtype SoapySDRError = SoapySDRError Int
  deriving stock (Eq, Show, Generic)
  deriving anyclass Exception

throwIfError :: Integral a => a -> IO ()
throwIfError 0 = pure ()
throwIfError n = throwIO . SoapySDRError $ fromIntegral n

-- ** Utils

withCStringArray :: [String] -> (Ptr.Ptr CString -> IO a) -> IO a
withCStringArray strings f =
  withMany withCString strings $ \cstrings ->
    withArray0 Ptr.nullPtr cstrings f

peekCStringArray :: Integral a => a -> Ptr.Ptr CString -> IO [String]
peekCStringArray n p = mapM peekCString =<< peekArray (fromIntegral n) p
