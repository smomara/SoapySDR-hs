module SoapySDR
  ( -- * Types

    -- ** Core Types
    Device ()
  , DeviceArgs (..)
  , Direction (..)
  , Channel (..)

    -- ** Error Handling
  , SoapySDRError (..)

    -- ** Date Types
  , Format (..)
  , NumberType (..)
  , parseFormat

    -- * Device Management
  , makeDevice
  , unmakeDevice
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

    -- * Stream API
  , setupStream
  , closeStream
  , withStream
  , activateStream
  , deactivateStream
  ) where

import Control.Exception (Exception (..), bracket, throwIO)
import Data.Attoparsec.Text (Parser, char, choice, decimal, option, parseOnly)
import Data.Map (Map)
import Data.Map.Strict qualified as Map
import Data.Text qualified as Text
import Foreign.C qualified as FC
import Foreign.C.ConstPtr qualified as ConstPtr
import Foreign.C.String (CString, peekCString, withCString)
import Foreign.Marshal.Array (peekArray, withArray0, withArrayLen)
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

{- | An opaque handle to a stream.

Streams are created with `setupStream` and must be closed with `closeStream`.
-}
newtype Stream = Stream (Ptr.Ptr Bindings.SoapySDRStream)
  deriving stock (Eq, Show, Generic)

{- | Extract the underlying stream pointer.

This function provides safe access to the stream pointer without exposing the constructor.
-}
streamPtr :: Stream -> Ptr.Ptr Bindings.SoapySDRStream
streamPtr (Stream p) = p

-- | Number type for stream formats.
data NumberType
  = -- | Floating point numbers
    Float
  | -- | Signed integers
    Signed
  | -- | Unsigned integers
    Unsigned
  deriving stock (Eq, Show, Enum, Bounded, Generic)

{- | Stream format specification.

SoapySDR uses format strings like:
- "CF32" - complex float32
- "CS16" - complex int16
- "CS12" - complex int12
- "S32"  - int32
- "U8"   - uint8
-}
data Format = Format
  { isComplex :: Bool
  -- ^ True for complex (I/Q pairs)
  , numberType :: NumberType
  , bits :: Int
  }
  deriving stock (Eq, Show, Generic)

-- ** Format Parsing

numberType :: Parser NumberType
numberType =
  choice
    [ Float <$ char 'F'
    , Signed <$ char 'S'
    , Unsigned <$ char 'U'
    ]

isComplex :: Parser Bool
isComplex = option False (True <$ char 'C')

format :: Parser Format
format =
  Format
    <$> isComplex
    <*> numberType
    <*> decimal

parseFormat :: String -> Maybe Format
parseFormat str = either (const Nothing) Just $ parseOnly format (Text.pack str)

numberTypeToString :: NumberType -> String
numberTypeToString Float = "F"
numberTypeToString Signed = "S"
numberTypeToString Unsigned = "U"

formatToString :: Format -> String
formatToString fmt =
  mconcat
    [ if fmt.isComplex then "C" else ""
    , numberTypeToString fmt.numberType
    , show fmt.bits
    ]

-- ** Error Handling

{- | SoapySDR error with error code.

Error codes follow the SoapySDR C API conventions where 0 indicates success and non-zero values indiciate error conditions.
-}
data SoapySDRError
  = SoapySDRTimeout
  | SoapySDRStreamError
  | SoapySDRCorruption
  | SoapySDROverflow
  | SoapySDRNotSupported
  | SoapySDRTimeError
  | SoapySDRUnderflow
  | SoapySDRUnknownError Int
  deriving stock (Eq, Show, Generic)
  deriving anyclass Exception

-- * Device Management

makeDevice :: DeviceArgs -> IO Device
makeDevice args = withArgs args $ \argsPtr -> Device <$> Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)

unmakeDevice :: Device -> IO ()
unmakeDevice device = throwIfError =<< Unsafe.soapySDRDevice_unmake (devicePtr device)

{- | Safely acquire and use a SoapySDR device.

The device is automatically released when the action completes or throws an exception.

@
withDevice mempty $ \\device -> do
  driver <- getDriverKey device
  putStrLn driver
@
-}
withDevice :: DeviceArgs -> (Device -> IO a) -> IO a
withDevice args = bracket make unmake
 where
  make = withArgs args $ \argsPtr -> Device <$> Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)
  unmake = Unsafe.soapySDRDevice_unmake . devicePtr

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

-- * Stream API

setupStream
  :: Device -> Direction -> Format -> [Channel] -> DeviceArgs -> IO Stream
setupStream device dir fmt chans args =
  withCString (formatToString fmt)
    $ \fmtCStr -> withChannelArray chans
      $ \chansPtr chansLen -> withArgs args
        $ \argsPtr ->
          Stream
            <$> Unsafe.soapySDRDevice_setupStream
              (devicePtr device)
              (fromDirection dir)
              (ConstPtr.ConstPtr fmtCStr)
              (ConstPtr.ConstPtr chansPtr)
              chansLen
              (ConstPtr.ConstPtr argsPtr)

closeStream :: Device -> Stream -> IO ()
closeStream device stream =
  throwIfError
    =<< Unsafe.soapySDRDevice_closeStream (devicePtr device) (streamPtr stream)

withStream
  :: Device
  -> Direction
  -> Format
  -> [Channel]
  -> DeviceArgs
  -> (Stream -> IO a)
  -> IO a
withStream device dir fmt chans args = bracket (setupStream device dir fmt chans args) (closeStream device)

activateStream :: Device -> Stream -> IO ()
activateStream device stream =
  throwIfError
    =<< Unsafe.soapySDRDevice_activateStream (devicePtr device) (streamPtr stream) 0 0 0

deactivateStream :: Device -> Stream -> IO ()
deactivateStream device stream =
  throwIfError
    =<< Unsafe.soapySDRDevice_deactivateStream (devicePtr device) (streamPtr stream) 0 0

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

withChannelArray :: [Channel] -> (Ptr.Ptr FC.CSize -> FC.CSize -> IO a) -> IO a
withChannelArray channels f = withArrayLen (map fromChannel channels) $ \len ptr -> f ptr (fromIntegral len)

toDeviceArgs :: Bindings.SoapySDRKwargs -> IO DeviceArgs
toDeviceArgs args = do
  keys <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_keys
  vals <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_vals
  pure . DeviceArgs . Map.fromList $ zip keys vals

throwIfError :: Integral a => a -> IO ()
throwIfError 0 = pure ()
throwIfError (-1) = throwIO SoapySDRTimeout
throwIfError (-2) = throwIO SoapySDRStreamError
throwIfError (-3) = throwIO SoapySDRCorruption
throwIfError (-4) = throwIO SoapySDROverflow
throwIfError (-5) = throwIO SoapySDRNotSupported
throwIfError (-6) = throwIO SoapySDRTimeError
throwIfError (-7) = throwIO SoapySDRUnderflow
throwIfError n = throwIO . SoapySDRUnknownError $ fromIntegral n

withCStringArray :: [String] -> (Ptr.Ptr CString -> IO a) -> IO a
withCStringArray strings f =
  withMany withCString strings $ \cstrings ->
    withArray0 Ptr.nullPtr cstrings f

peekCStringArray :: Integral a => a -> Ptr.Ptr CString -> IO [String]
peekCStringArray n p = mapM peekCString =<< peekArray (fromIntegral n) p
