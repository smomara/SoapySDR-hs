module SoapySDR
  ( -- * Types

    -- ** Core Types
    Device ()
  , DeviceArgs (..)
  , Direction (..)
  , Channel (..)

    -- ** Error Handling
  , SoapySDRError (..)

    -- * Device Management
  , withDevice

    -- * Identification API
  , getDriverKey
  , getHardwareKey
  , getHardwareInfo

    -- * Channels API
  , setFrontendMapping
  , getFrontendMapping
  , getChannelInfo
  , getFullDuplex
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

-- * Types

-- ** Core Types

{- | An opaque handle to a SoapySDR device.

Use `withDevice` to safely acquire and release device resources.
-}
newtype Device = Device (Ptr.Ptr Bindings.SoapySDRDevice)
  deriving stock (Eq, Show, Generic)

{- | Extract the underlying device pointer.

This functin provides safe access to the device pointer without exposing the constructor.
-}
devicePtr :: Device -> Ptr.Ptr Bindings.SoapySDRDevice
devicePtr (Device p) = p

{- | Device arguments as key-value pairs.

>>> DeviceArgs (Map.fromList [("driver", "rtlsdr")])
DeviceArgs {unDeviceArgs = fromList [("driver","rtlsdr")]}
-}
newtype DeviceArgs = DeviceArgs {unDeviceArgs :: Map String String}
  deriving stock (Eq, Show, Generic)
  deriving newtype (Semigroup, Monoid)

-- | RF signal direction.
data Direction
  = -- | Receive direction
    RX
  | -- | Transmit direction
    TX
  deriving stock (Eq, Show, Enum, Bounded, Generic)

{- | Channel identifier.

Channels are typically numbered starting from 0.
-}
newtype Channel = Channel Int
  deriving stock Generic
  deriving newtype (Eq, Show, Ord, Enum, Bounded, Num, Integral, Real)

-- ** Error Handling

{- | SoapySDR error with error code.

Error codes follow the SoapySDR C API conventions where 0 indicates success and non-zero values indiciate error conditions.
-}
newtype SoapySDRError = SoapySDRError Int
  deriving stock (Eq, Show, Generic)
  deriving anyclass Exception

-- * Device Management

{- | Safely acquire and use a SoapySDR device.

The device is automatically released when the action completes or throws an exception.

@
withDevice mempty $ \\device -> do
  driver <- getDriverKey device
  putStrLn driver
@
-}
withDevice :: DeviceArgs -> (Device -> IO a) -> IO a
withDevice args f = withArgs args $ \argsPtr -> f . Device =<< Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)

-- * Identification API

getDriverKey :: Device -> IO String
getDriverKey device =
  peekCString
    =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr $ devicePtr device)

getHardwareKey :: Device -> IO String
getHardwareKey device =
  peekCString
    =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr $ devicePtr device)

getHardwareInfo :: Device -> IO DeviceArgs
getHardwareInfo device =
  toDeviceArgs
    =<< Unsafe.soapySDRDevice_getHardwareInfo (ConstPtr.ConstPtr $ devicePtr device)

-- * Channels API

setFrontendMapping :: Device -> Direction -> String -> IO ()
setFrontendMapping device dir mapping = withCString mapping $ \cstring ->
  throwIfError
    =<< Unsafe.soapySDRDevice_setFrontendMapping
      (devicePtr device)
      (fromDirection dir)
      (ConstPtr.ConstPtr cstring)

getFrontendMapping :: Device -> Direction -> IO String
getFrontendMapping device dir =
  peekCString
    =<< Unsafe.soapySDRDevice_getFrontendMapping
      (ConstPtr.ConstPtr $ devicePtr device)
      (fromDirection dir)

getChannelInfo :: Device -> Direction -> Channel -> IO DeviceArgs
getChannelInfo device dir chan =
  toDeviceArgs
    =<< Unsafe.soapySDRDevice_getChannelInfo
      (ConstPtr.ConstPtr $ devicePtr device)
      (fromDirection dir)
      (fromChannel chan)

getFullDuplex :: Device -> Direction -> Channel -> IO Bool
getFullDuplex device dir chan =
  toBool
    <$> Unsafe.soapySDRDevice_getFullDuplex
      (ConstPtr.ConstPtr $ devicePtr device)
      (fromDirection dir)
      (fromChannel chan)

-- * Internal Utilities

fromDirection :: Direction -> FC.CInt
fromDirection = fromIntegral . fromEnum

fromChannel :: Channel -> FC.CSize
fromChannel (Channel n) = fromIntegral n

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

throwIfError :: Integral a => a -> IO ()
throwIfError 0 = pure ()
throwIfError n = throwIO . SoapySDRError $ fromIntegral n

withCStringArray :: [String] -> (Ptr.Ptr CString -> IO a) -> IO a
withCStringArray strings f =
  withMany withCString strings $ \cstrings ->
    withArray0 Ptr.nullPtr cstrings f

peekCStringArray :: Integral a => a -> Ptr.Ptr CString -> IO [String]
peekCStringArray n p = mapM peekCString =<< peekArray (fromIntegral n) p
