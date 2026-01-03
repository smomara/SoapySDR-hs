module SoapySDR
  ( -- * Types

    -- ** Core Types
    Device ()
  , Kwargs (..)
  , Direction (..)
  , Channel (..)
  , Range (..)
  , ArgType (..)
  , ArgInfo (..)

    -- ** Error Handling
  , SoapySDRError (..)

    -- ** Data Types
  , Format (..)
  , NumberType (..)
  , parseFormat

    -- * API

    -- ** Device Management
  , enumerate
  , enumerateWithFilter
  , makeDevice
  , unmakeDevice
  , withDevice

    -- ** Identification API
  , getDriverKey
  , getHardwareKey
  , getHardwareInfo

    -- ** Channels API
  , setFrontendMapping
  , getFrontendMapping
  , getChannelInfo
  , getFullDuplex

    -- ** Stream API
  , getStreamFormats
  , getNativeStreamFormat
  , getStreamArgsInfo
  , setupStream
  , closeStream
  , withStream
  , getStreamMTU
  , activateStream
  , deactivateStream
  ) where

import Control.Exception (Exception, bracket, throwIO)
import Data.Attoparsec.Text (Parser, char, choice, decimal, option, parseOnly)
import Data.Coerce (coerce)
import Data.Map (Map)
import Data.Map.Strict qualified as Map
import Data.Maybe (mapMaybe)
import Data.Text qualified as Text
import Foreign.C qualified as FC
import Foreign.C.ConstPtr qualified as ConstPtr
import Foreign.C.String (CString, peekCString, withCString)
import Foreign.Marshal.Array (peekArray, withArray0, withArrayLen)
import Foreign.Marshal.Utils (toBool, with, withMany)
import Foreign.Ptr qualified as Ptr
import Foreign.Storable (Storable, peek)
import GHC.Generics (Generic)

import SoapySDR.Bindings qualified as Bindings
import SoapySDR.Bindings.Unsafe qualified as Unsafe

-- * Types

-- ** Core Types

newtype Device = Device (Ptr.Ptr Bindings.SoapySDRDevice)
  deriving stock (Eq, Show, Generic)

devicePtr :: Device -> Ptr.Ptr Bindings.SoapySDRDevice
devicePtr (Device p) = p

newtype Kwargs = Kwargs {unKwargs :: Map String String}
  deriving stock (Eq, Show, Generic)
  deriving newtype (Semigroup, Monoid)

data Direction
  = RX
  | TX
  deriving stock (Eq, Show, Enum, Bounded, Generic)

newtype Channel = Channel Int
  deriving stock Generic
  deriving newtype (Eq, Show, Ord, Enum, Bounded, Num, Integral, Real)

data Stream = Stream
  { numBuffers :: Int
  , ptr :: Ptr.Ptr Bindings.SoapySDRStream
  }
  deriving stock (Eq, Show, Generic)

streamPtr :: Stream -> Ptr.Ptr Bindings.SoapySDRStream
streamPtr stream = stream.ptr

data ArgType
  = ArgTypeBool
  | ArgTypeInt
  | ArgTypeFloat
  | ArgTypeString
  deriving stock (Eq, Show, Enum, Bounded, Generic)

data Range = Range
  { minimum :: Double
  , maximum :: Double
  , step :: Double
  }
  deriving stock (Eq, Show, Generic)

data ArgInfo = ArgInfo
  { key :: String
  , value :: String
  , name :: String
  , description :: String
  , units :: String
  , argType :: ArgType
  , range :: Range
  , numOptions :: Int
  , options :: [String]
  , optionNames :: [String]
  }
  deriving stock (Eq, Show, Generic)

-- ** Error Handling

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

-- ** Data Types

data NumberType
  = Float
  | Signed
  | Unsigned
  deriving stock (Eq, Show, Enum, Bounded, Generic)

data Format = Format
  { isComplex :: Bool
  , numberType :: NumberType
  , bits :: Int
  }
  deriving stock (Eq, Show, Generic)

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

-- * API

-- ** Device Management

enumerate :: IO [Kwargs]
enumerate = enumerateWithFilter mempty

enumerateWithFilter :: Kwargs -> IO [Kwargs]
enumerateWithFilter args = withKwargs args $ \argsPtr ->
  mapM toKwargs
    =<< withOutputArray (Unsafe.soapySDRDevice_enumerate (ConstPtr.ConstPtr argsPtr))

makeDevice :: Kwargs -> IO Device
makeDevice args = withKwargs args $ \argsPtr -> Device <$> Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)

unmakeDevice :: Device -> IO ()
unmakeDevice device = throwIfError =<< Unsafe.soapySDRDevice_unmake (devicePtr device)

withDevice :: Kwargs -> (Device -> IO a) -> IO a
withDevice args = bracket make unmake
 where
  make = withKwargs args $ \argsPtr -> Device <$> Unsafe.soapySDRDevice_make (ConstPtr.ConstPtr argsPtr)
  unmake = Unsafe.soapySDRDevice_unmake . devicePtr

-- ** Identification API

getDriverKey :: Device -> IO String
getDriverKey device =
  peekCString
    =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr $ devicePtr device)

getHardwareKey :: Device -> IO String
getHardwareKey device =
  peekCString
    =<< Unsafe.soapySDRDevice_getDriverKey (ConstPtr.ConstPtr $ devicePtr device)

getHardwareInfo :: Device -> IO Kwargs
getHardwareInfo device =
  toKwargs
    =<< Unsafe.soapySDRDevice_getHardwareInfo (ConstPtr.ConstPtr $ devicePtr device)

-- ** Channels API

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

getChannelInfo :: Device -> Direction -> Channel -> IO Kwargs
getChannelInfo device dir chan =
  toKwargs
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

-- ** Stream API

getStreamFormats :: Device -> Direction -> Channel -> IO [Format]
getStreamFormats device dir chan =
  fmap (mapMaybe parseFormat) . mapM peekCString
    =<< withOutputArray
      ( Unsafe.soapySDRDevice_getStreamFormats
          (ConstPtr.ConstPtr $ devicePtr device)
          (fromDirection dir)
          (fromChannel chan)
      )

getNativeStreamFormat :: Device -> Direction -> Channel -> IO Format
getNativeStreamFormat device dir chan =
  maybe (throwIO SoapySDRCorruption) pure . parseFormat
    =<< peekCString
    =<< with
      0
      ( Unsafe.soapySDRDevice_getNativeStreamFormat
          (ConstPtr.ConstPtr $ devicePtr device)
          (fromDirection dir)
          (fromChannel chan)
      )

getStreamArgsInfo :: Device -> Direction -> Channel -> IO [ArgInfo]
getStreamArgsInfo device dir chan =
  mapM toArgInfo
    =<< withOutputArray
      ( Unsafe.soapySDRDevice_getStreamArgsInfo
          (ConstPtr.ConstPtr $ devicePtr device)
          (fromDirection dir)
          (fromChannel chan)
      )

setupStream
  :: Device -> Direction -> Format -> [Channel] -> Kwargs -> IO Stream
setupStream device dir fmt chans args =
  withCString (formatToString fmt)
    $ \fmtCStr -> withChannelArray chans
      $ \chansPtr chansLen -> withKwargs args
        $ \argsPtr ->
          Stream (length chans)
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
  -> Kwargs
  -> (Stream -> IO a)
  -> IO a
withStream device dir fmt chans args = bracket (setupStream device dir fmt chans args) (closeStream device)

getStreamMTU :: Device -> Stream -> IO FC.CSize
getStreamMTU device stream =
  Unsafe.soapySDRDevice_getStreamMTU
    (ConstPtr.ConstPtr $ devicePtr device)
    (streamPtr stream)

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

withKwargs :: Kwargs -> (Ptr.Ptr Bindings.SoapySDRKwargs -> IO a) -> IO a
withKwargs (Kwargs m) f = do
  withCStringArray (Map.keys m) $ \keys -> do
    withCStringArray (Map.elems m) $ \values -> do
      let size = fromIntegral (Map.size m)
          kwargs = Bindings.SoapySDRKwargs size keys values
      with kwargs f

withChannelArray :: [Channel] -> (Ptr.Ptr FC.CSize -> FC.CSize -> IO a) -> IO a
withChannelArray channels f = withArrayLen (map fromChannel channels) $ \len ptr -> f ptr (fromIntegral len)

toKwargs :: Bindings.SoapySDRKwargs -> IO Kwargs
toKwargs args = do
  keys <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_keys
  vals <- peekCStringArray args.soapySDRKwargs_size args.soapySDRKwargs_vals
  pure . Kwargs . Map.fromList $ zip keys vals

toRange :: Bindings.SoapySDRRange -> Range
toRange range =
  Range
    { maximum = coerce range.soapySDRRange_maximum
    , minimum = coerce range.soapySDRRange_minimum
    , step = coerce range.soapySDRRange_step
    }

toArgType :: Bindings.SoapySDRArgInfoType -> Maybe ArgType
toArgType Bindings.SOAPY_SDR_ARG_INFO_BOOL = Just ArgTypeBool
toArgType Bindings.SOAPY_SDR_ARG_INFO_INT = Just ArgTypeInt
toArgType Bindings.SOAPY_SDR_ARG_INFO_FLOAT = Just ArgTypeFloat
toArgType Bindings.SOAPY_SDR_ARG_INFO_STRING = Just ArgTypeString
toArgType _ = Nothing

toArgInfo :: Bindings.SoapySDRArgInfo -> IO ArgInfo
toArgInfo info = do
  key <- peekCString info.soapySDRArgInfo_key
  value <- peekCString info.soapySDRArgInfo_value
  name <- peekCString info.soapySDRArgInfo_name
  description <- peekCString info.soapySDRArgInfo_description
  units <- peekCString info.soapySDRArgInfo_units
  argType <-
    maybe (throwIO SoapySDRCorruption) pure $ toArgType info.soapySDRArgInfo_type
  let numOptions = fromIntegral info.soapySDRArgInfo_numOptions
      range = toRange info.soapySDRArgInfo_range
  options <- peekCStringArray numOptions info.soapySDRArgInfo_options
  optionNames <- peekCStringArray numOptions info.soapySDRArgInfo_optionNames
  pure
    $ ArgInfo
      key
      value
      name
      description
      units
      argType
      range
      numOptions
      options
      optionNames

throwIfError :: Integral a => a -> IO ()
throwIfError n = maybe mempty throwIO $ toError n

toError :: Integral a => a -> Maybe SoapySDRError
toError (-1) = Just SoapySDRTimeout
toError (-2) = Just SoapySDRStreamError
toError (-3) = Just SoapySDRCorruption
toError (-4) = Just SoapySDROverflow
toError (-5) = Just SoapySDRNotSupported
toError (-6) = Just SoapySDRTimeError
toError (-7) = Just SoapySDRUnderflow
toError n
  | n >= 0 = Nothing
  | otherwise = Just . SoapySDRUnknownError $ fromIntegral n

withCStringArray :: [String] -> (Ptr.Ptr CString -> IO a) -> IO a
withCStringArray strings f =
  withMany withCString strings $ \cstrings ->
    withArray0 Ptr.nullPtr cstrings f

peekCStringArray :: Integral a => a -> Ptr.Ptr CString -> IO [String]
peekCStringArray n p = mapM peekCString =<< peekArray (fromIntegral n) p

withOutputArray
  :: (Storable a, Storable b, Integral a) => (Ptr.Ptr a -> IO (Ptr.Ptr b)) -> IO [b]
withOutputArray action = with 0 $ \lengthPtr -> do
  resultPtr <- action lengthPtr
  len <- peek lengthPtr
  peekArray (fromIntegral len) resultPtr
