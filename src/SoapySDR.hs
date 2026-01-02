module SoapySDR (
    Device (),
    DeviceArgs (..),
    withDevice,
    getDriverKey,
    getHardwareKey,
    getHardwareInfo,
    setFrontendMapping,
    SoapySDRError (..),
) where

import Control.Exception (Exception (..), throwIO)
import Data.Map (Map)
import Data.Map.Strict qualified as Map
import Foreign.C.ConstPtr qualified as ConstPtr
import Foreign.C.String (CString, peekCString, withCString)
import Foreign.Marshal.Array (peekArray, withArray0)
import Foreign.Marshal.Utils (with, withMany)
import Foreign.Ptr qualified as Ptr
import GHC.Generics
import SoapySDR.Bindings qualified as Bindings
import SoapySDR.Bindings.Unsafe qualified as Unsafe

newtype SoapySDRError = SoapySDRError Int
    deriving stock (Eq, Show, Generic)
    deriving anyclass (Exception)

throwIfError :: (Integral a) => a -> IO ()
throwIfError 0 = pure ()
throwIfError n = throwIO . SoapySDRError $ fromIntegral n

data Direction = RX | TX
    deriving stock (Eq, Show, Enum, Bounded, Generic)

newtype Device = Device (Ptr.Ptr Bindings.SoapySDRDevice)
    deriving stock (Eq, Show, Generic)

newtype DeviceArgs = DeviceArgs {unDeviceArgs :: Map String String}
    deriving stock (Eq, Show, Generic)

withCStringArray :: [String] -> (Ptr.Ptr CString -> IO a) -> IO a
withCStringArray strings f =
    withMany withCString strings $ \cstrings ->
        withArray0 Ptr.nullPtr cstrings f

peekCStringArray :: (Integral a) => a -> Ptr.Ptr CString -> IO [String]
peekCStringArray n p = mapM peekCString =<< peekArray (fromIntegral n) p

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

withDevice :: DeviceArgs -> (Device -> IO a) -> IO a
withDevice args f = withArgs args $ \argsPtr -> f . Device =<< Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)

getDriverKey :: Device -> IO String
getDriverKey (Device p) = peekCString =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr p)

getHardwareKey :: Device -> IO String
getHardwareKey (Device p) = peekCString =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr p)

getHardwareInfo :: Device -> IO DeviceArgs
getHardwareInfo (Device p) = toDeviceArgs =<< Unsafe.soapySDRDevice_getHardwareInfo (ConstPtr.ConstPtr p)

setFrontendMapping :: Device -> Direction -> String -> IO ()
setFrontendMapping (Device p) direction mapping = withCString mapping $ \cstring -> throwIfError =<< Unsafe.soapySDRDevice_setFrontendMapping p (fromIntegral $ fromEnum direction) (ConstPtr.ConstPtr cstring)
