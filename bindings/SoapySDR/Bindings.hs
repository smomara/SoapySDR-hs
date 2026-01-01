{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MagicHash #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UnboxedTuples #-}
{-# LANGUAGE UndecidableInstances #-}

module SoapySDR.Bindings where

import qualified Data.List.NonEmpty
import qualified Data.Primitive.Types
import qualified Data.Proxy
import qualified Foreign as F
import qualified Foreign.C as FC
import qualified GHC.Ptr as Ptr
import qualified GHC.Records
import qualified HsBindgen.Runtime.CEnum
import qualified HsBindgen.Runtime.HasBaseForeignType
import qualified HsBindgen.Runtime.HasCField
import qualified HsBindgen.Runtime.Prelude
import qualified Text.Read
import GHC.Prim ((*#), (+#))
import HsBindgen.Runtime.TypeEquality (TyEq)
import Prelude ((<*>), (>>), Eq, Int, Ord, Read, Show, pure, showsPrec)

{-| __C declaration:__ @SOAPY_SDR_TRUE@

    __defined at:__ @SoapySDR\/Types.h:20:9@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
sOAPY_SDR_TRUE :: ((,) (Ptr.Ptr FC.CChar)) Int
sOAPY_SDR_TRUE =
  ((Ptr.Ptr "true"#, 4) :: FC.CStringLen)

{-| __C declaration:__ @SOAPY_SDR_FALSE@

    __defined at:__ @SoapySDR\/Types.h:23:9@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
sOAPY_SDR_FALSE :: ((,) (Ptr.Ptr FC.CChar)) Int
sOAPY_SDR_FALSE =
  ((Ptr.Ptr "false"#, 5) :: FC.CStringLen)

{-| Definition for a min/max numeric range

__C declaration:__ @struct SoapySDRRange@

__defined at:__ @SoapySDR\/Types.h:26:9@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
data SoapySDRRange = SoapySDRRange
  { soapySDRRange_minimum :: FC.CDouble
    {- ^ __C declaration:__ @minimum@

         __defined at:__ @SoapySDR\/Types.h:28:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRRange_maximum :: FC.CDouble
    {- ^ __C declaration:__ @maximum@

         __defined at:__ @SoapySDR\/Types.h:29:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRRange_step :: FC.CDouble
    {- ^ __C declaration:__ @step@

         __defined at:__ @SoapySDR\/Types.h:30:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable SoapySDRRange where

  sizeOf = \_ -> (24 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure SoapySDRRange
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRRange_minimum") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRRange_maximum") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRRange_step") ptr0

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          SoapySDRRange
            soapySDRRange_minimum2
            soapySDRRange_maximum3
            soapySDRRange_step4 ->
                 HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRRange_minimum") ptr0 soapySDRRange_minimum2
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRRange_maximum") ptr0 soapySDRRange_maximum3
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRRange_step") ptr0 soapySDRRange_step4

instance Data.Primitive.Types.Prim SoapySDRRange where

  sizeOf# = \_ -> (24#)

  alignment# = \_ -> (8#)

  indexByteArray# =
    \arr0 ->
      \i1 ->
        SoapySDRRange (Data.Primitive.Types.indexByteArray# arr0 ((+#) ((*#) (3#) i1) (0#))) (Data.Primitive.Types.indexByteArray# arr0 ((+#) ((*#) (3#) i1) (1#))) (Data.Primitive.Types.indexByteArray# arr0 ((+#) ((*#) (3#) i1) (2#)))

  readByteArray# =
    \arr0 ->
      \i1 ->
        \s2 ->
          case Data.Primitive.Types.readByteArray# arr0 ((+#) ((*#) (3#) i1) (0#)) s2 of
            (# s3, v4 #) ->
              case Data.Primitive.Types.readByteArray# arr0 ((+#) ((*#) (3#) i1) (1#)) s3 of
                (# s5, v6 #) ->
                  case Data.Primitive.Types.readByteArray# arr0 ((+#) ((*#) (3#) i1) (2#)) s5 of
                    (# s7, v8 #) -> (# s7, SoapySDRRange v4 v6 v8 #)

  writeByteArray# =
    \arr0 ->
      \i1 ->
        \struct2 ->
          \s3 ->
            case struct2 of
              SoapySDRRange
                soapySDRRange_minimum4
                soapySDRRange_maximum5
                soapySDRRange_step6 ->
                  case Data.Primitive.Types.writeByteArray# arr0 ((+#) ((*#) (3#) i1) (0#)) soapySDRRange_minimum4 s3 of
                    s7 ->
                      case Data.Primitive.Types.writeByteArray# arr0 ((+#) ((*#) (3#) i1) (1#)) soapySDRRange_maximum5 s7 of
                        s8 ->
                          Data.Primitive.Types.writeByteArray# arr0 ((+#) ((*#) (3#) i1) (2#)) soapySDRRange_step6 s8

  indexOffAddr# =
    \addr0 ->
      \i1 ->
        SoapySDRRange (Data.Primitive.Types.indexOffAddr# addr0 ((+#) ((*#) (3#) i1) (0#))) (Data.Primitive.Types.indexOffAddr# addr0 ((+#) ((*#) (3#) i1) (1#))) (Data.Primitive.Types.indexOffAddr# addr0 ((+#) ((*#) (3#) i1) (2#)))

  readOffAddr# =
    \addr0 ->
      \i1 ->
        \s2 ->
          case Data.Primitive.Types.readOffAddr# addr0 ((+#) ((*#) (3#) i1) (0#)) s2 of
            (# s3, v4 #) ->
              case Data.Primitive.Types.readOffAddr# addr0 ((+#) ((*#) (3#) i1) (1#)) s3 of
                (# s5, v6 #) ->
                  case Data.Primitive.Types.readOffAddr# addr0 ((+#) ((*#) (3#) i1) (2#)) s5 of
                    (# s7, v8 #) -> (# s7, SoapySDRRange v4 v6 v8 #)

  writeOffAddr# =
    \addr0 ->
      \i1 ->
        \struct2 ->
          \s3 ->
            case struct2 of
              SoapySDRRange
                soapySDRRange_minimum4
                soapySDRRange_maximum5
                soapySDRRange_step6 ->
                  case Data.Primitive.Types.writeOffAddr# addr0 ((+#) ((*#) (3#) i1) (0#)) soapySDRRange_minimum4 s3 of
                    s7 ->
                      case Data.Primitive.Types.writeOffAddr# addr0 ((+#) ((*#) (3#) i1) (1#)) soapySDRRange_maximum5 s7 of
                        s8 ->
                          Data.Primitive.Types.writeOffAddr# addr0 ((+#) ((*#) (3#) i1) (2#)) soapySDRRange_step6 s8

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRRange "soapySDRRange_minimum" where

  type CFieldType SoapySDRRange "soapySDRRange_minimum" =
    FC.CDouble

  offset# = \_ -> \_ -> 0

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRRange) "soapySDRRange_minimum")
         ) => GHC.Records.HasField "soapySDRRange_minimum" (Ptr.Ptr SoapySDRRange) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRRange_minimum")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRRange "soapySDRRange_maximum" where

  type CFieldType SoapySDRRange "soapySDRRange_maximum" =
    FC.CDouble

  offset# = \_ -> \_ -> 8

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRRange) "soapySDRRange_maximum")
         ) => GHC.Records.HasField "soapySDRRange_maximum" (Ptr.Ptr SoapySDRRange) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRRange_maximum")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRRange "soapySDRRange_step" where

  type CFieldType SoapySDRRange "soapySDRRange_step" =
    FC.CDouble

  offset# = \_ -> \_ -> 16

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRRange) "soapySDRRange_step")
         ) => GHC.Records.HasField "soapySDRRange_step" (Ptr.Ptr SoapySDRRange) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRRange_step")

{-| Definition for a key/value string map

__C declaration:__ @struct SoapySDRKwargs@

__defined at:__ @SoapySDR\/Types.h:34:9@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
data SoapySDRKwargs = SoapySDRKwargs
  { soapySDRKwargs_size :: HsBindgen.Runtime.Prelude.CSize
    {- ^ __C declaration:__ @size@

         __defined at:__ @SoapySDR\/Types.h:36:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRKwargs_keys :: Ptr.Ptr (Ptr.Ptr FC.CChar)
    {- ^ __C declaration:__ @keys@

         __defined at:__ @SoapySDR\/Types.h:37:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRKwargs_vals :: Ptr.Ptr (Ptr.Ptr FC.CChar)
    {- ^ __C declaration:__ @vals@

         __defined at:__ @SoapySDR\/Types.h:38:12@

         __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable SoapySDRKwargs where

  sizeOf = \_ -> (24 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure SoapySDRKwargs
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRKwargs_size") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRKwargs_keys") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRKwargs_vals") ptr0

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          SoapySDRKwargs soapySDRKwargs_size2 soapySDRKwargs_keys3 soapySDRKwargs_vals4 ->
               HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRKwargs_size") ptr0 soapySDRKwargs_size2
            >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRKwargs_keys") ptr0 soapySDRKwargs_keys3
            >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRKwargs_vals") ptr0 soapySDRKwargs_vals4

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRKwargs "soapySDRKwargs_size" where

  type CFieldType SoapySDRKwargs "soapySDRKwargs_size" =
    HsBindgen.Runtime.Prelude.CSize

  offset# = \_ -> \_ -> 0

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRKwargs) "soapySDRKwargs_size")
         ) => GHC.Records.HasField "soapySDRKwargs_size" (Ptr.Ptr SoapySDRKwargs) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRKwargs_size")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRKwargs "soapySDRKwargs_keys" where

  type CFieldType SoapySDRKwargs "soapySDRKwargs_keys" =
    Ptr.Ptr (Ptr.Ptr FC.CChar)

  offset# = \_ -> \_ -> 8

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRKwargs) "soapySDRKwargs_keys")
         ) => GHC.Records.HasField "soapySDRKwargs_keys" (Ptr.Ptr SoapySDRKwargs) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRKwargs_keys")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRKwargs "soapySDRKwargs_vals" where

  type CFieldType SoapySDRKwargs "soapySDRKwargs_vals" =
    Ptr.Ptr (Ptr.Ptr FC.CChar)

  offset# = \_ -> \_ -> 16

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRKwargs) "soapySDRKwargs_vals")
         ) => GHC.Records.HasField "soapySDRKwargs_vals" (Ptr.Ptr SoapySDRKwargs) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRKwargs_vals")

{-| Possible data types for argument info

__C declaration:__ @enum SoapySDRArgInfoType@

__defined at:__ @SoapySDR\/Types.h:54:9@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
newtype SoapySDRArgInfoType = SoapySDRArgInfoType
  { un_SoapySDRArgInfoType :: FC.CUInt
  }
  deriving stock (Eq, Ord)
  deriving newtype (HsBindgen.Runtime.HasBaseForeignType.HasBaseForeignType)

instance F.Storable SoapySDRArgInfoType where

  sizeOf = \_ -> (4 :: Int)

  alignment = \_ -> (4 :: Int)

  peek =
    \ptr0 ->
          pure SoapySDRArgInfoType
      <*> F.peekByteOff ptr0 (0 :: Int)

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          SoapySDRArgInfoType un_SoapySDRArgInfoType2 ->
            F.pokeByteOff ptr0 (0 :: Int) un_SoapySDRArgInfoType2

deriving via FC.CUInt instance Data.Primitive.Types.Prim SoapySDRArgInfoType

instance HsBindgen.Runtime.CEnum.CEnum SoapySDRArgInfoType where

  type CEnumZ SoapySDRArgInfoType = FC.CUInt

  toCEnum = SoapySDRArgInfoType

  fromCEnum = un_SoapySDRArgInfoType

  declaredValues =
    \_ ->
      HsBindgen.Runtime.CEnum.declaredValuesFromList [ (0, Data.List.NonEmpty.singleton "SOAPY_SDR_ARG_INFO_BOOL")
                                                     , (1, Data.List.NonEmpty.singleton "SOAPY_SDR_ARG_INFO_INT")
                                                     , (2, Data.List.NonEmpty.singleton "SOAPY_SDR_ARG_INFO_FLOAT")
                                                     , (3, Data.List.NonEmpty.singleton "SOAPY_SDR_ARG_INFO_STRING")
                                                     ]

  showsUndeclared =
    HsBindgen.Runtime.CEnum.showsWrappedUndeclared "SoapySDRArgInfoType"

  readPrecUndeclared =
    HsBindgen.Runtime.CEnum.readPrecWrappedUndeclared "SoapySDRArgInfoType"

  isDeclared = HsBindgen.Runtime.CEnum.seqIsDeclared

  mkDeclared = HsBindgen.Runtime.CEnum.seqMkDeclared

instance HsBindgen.Runtime.CEnum.SequentialCEnum SoapySDRArgInfoType where

  minDeclaredValue = SOAPY_SDR_ARG_INFO_BOOL

  maxDeclaredValue = SOAPY_SDR_ARG_INFO_STRING

instance Show SoapySDRArgInfoType where

  showsPrec = HsBindgen.Runtime.CEnum.showsCEnum

instance Read SoapySDRArgInfoType where

  readPrec = HsBindgen.Runtime.CEnum.readPrecCEnum

  readList = Text.Read.readListDefault

  readListPrec = Text.Read.readListPrecDefault

{-| __C declaration:__ @SOAPY_SDR_ARG_INFO_BOOL@

    __defined at:__ @SoapySDR\/Types.h:56:5@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
pattern SOAPY_SDR_ARG_INFO_BOOL :: SoapySDRArgInfoType
pattern SOAPY_SDR_ARG_INFO_BOOL = SoapySDRArgInfoType 0

{-| __C declaration:__ @SOAPY_SDR_ARG_INFO_INT@

    __defined at:__ @SoapySDR\/Types.h:57:5@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
pattern SOAPY_SDR_ARG_INFO_INT :: SoapySDRArgInfoType
pattern SOAPY_SDR_ARG_INFO_INT = SoapySDRArgInfoType 1

{-| __C declaration:__ @SOAPY_SDR_ARG_INFO_FLOAT@

    __defined at:__ @SoapySDR\/Types.h:58:5@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
pattern SOAPY_SDR_ARG_INFO_FLOAT :: SoapySDRArgInfoType
pattern SOAPY_SDR_ARG_INFO_FLOAT = SoapySDRArgInfoType 2

{-| __C declaration:__ @SOAPY_SDR_ARG_INFO_STRING@

    __defined at:__ @SoapySDR\/Types.h:59:5@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
pattern SOAPY_SDR_ARG_INFO_STRING :: SoapySDRArgInfoType
pattern SOAPY_SDR_ARG_INFO_STRING = SoapySDRArgInfoType 3

{-| Definition for argument info

__C declaration:__ @struct SoapySDRArgInfo@

__defined at:__ @SoapySDR\/Types.h:63:9@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
data SoapySDRArgInfo = SoapySDRArgInfo
  { soapySDRArgInfo_key :: Ptr.Ptr FC.CChar
    {- ^ The key used to identify the argument (required)

    __C declaration:__ @key@

    __defined at:__ @SoapySDR\/Types.h:66:11@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_value :: Ptr.Ptr FC.CChar
    {- ^ The default value of the argument when not specified (required) Numbers should use standard floating point and integer formats. Boolean values should be represented as "true" and  "false".

    __C declaration:__ @value@

    __defined at:__ @SoapySDR\/Types.h:73:11@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_name :: Ptr.Ptr FC.CChar
    {- ^ The displayable name of the argument (optional, use key if empty)

    __C declaration:__ @name@

    __defined at:__ @SoapySDR\/Types.h:76:11@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_description :: Ptr.Ptr FC.CChar
    {- ^ A brief description about the argument (optional)

    __C declaration:__ @description@

    __defined at:__ @SoapySDR\/Types.h:79:11@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_units :: Ptr.Ptr FC.CChar
    {- ^ The units of the argument: dB, Hz, etc (optional)

    __C declaration:__ @units@

    __defined at:__ @SoapySDR\/Types.h:82:11@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_type :: SoapySDRArgInfoType
    {- ^ The data type of the argument (required)

    __C declaration:__ @type@

    __defined at:__ @SoapySDR\/Types.h:85:25@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_range :: SoapySDRRange
    {- ^ The range of possible numeric values (optional) When specified, the argument should be restricted to this range. The range is only applicable to numeric argument types.

    __C declaration:__ @range@

    __defined at:__ @SoapySDR\/Types.h:92:19@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_numOptions :: HsBindgen.Runtime.Prelude.CSize
    {- ^ The size of the options and optionNames sets, or 0 when not used.

    __C declaration:__ @numOptions@

    __defined at:__ @SoapySDR\/Types.h:95:12@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_options :: Ptr.Ptr (Ptr.Ptr FC.CChar)
    {- ^ A discrete list of possible values (optional) When specified, the argument should be restricted to this options set.

    __C declaration:__ @options@

    __defined at:__ @SoapySDR\/Types.h:101:12@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  , soapySDRArgInfo_optionNames :: Ptr.Ptr (Ptr.Ptr FC.CChar)
    {- ^ A discrete list of displayable names for the enumerated options (optional) When not specified, the respective entry in this list will be NULL, and the option key itself can be used as a display name instead.

    __C declaration:__ @optionNames@

    __defined at:__ @SoapySDR\/Types.h:108:12@

    __exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
    -}
  }
  deriving stock (Eq, Show)

instance F.Storable SoapySDRArgInfo where

  sizeOf = \_ -> (96 :: Int)

  alignment = \_ -> (8 :: Int)

  peek =
    \ptr0 ->
          pure SoapySDRArgInfo
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_key") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_value") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_name") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_description") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_units") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_type") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_range") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_numOptions") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_options") ptr0
      <*> HsBindgen.Runtime.HasCField.peekCField (Data.Proxy.Proxy @"soapySDRArgInfo_optionNames") ptr0

  poke =
    \ptr0 ->
      \s1 ->
        case s1 of
          SoapySDRArgInfo
            soapySDRArgInfo_key2
            soapySDRArgInfo_value3
            soapySDRArgInfo_name4
            soapySDRArgInfo_description5
            soapySDRArgInfo_units6
            soapySDRArgInfo_type7
            soapySDRArgInfo_range8
            soapySDRArgInfo_numOptions9
            soapySDRArgInfo_options10
            soapySDRArgInfo_optionNames11 ->
                 HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_key") ptr0 soapySDRArgInfo_key2
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_value") ptr0 soapySDRArgInfo_value3
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_name") ptr0 soapySDRArgInfo_name4
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_description") ptr0 soapySDRArgInfo_description5
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_units") ptr0 soapySDRArgInfo_units6
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_type") ptr0 soapySDRArgInfo_type7
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_range") ptr0 soapySDRArgInfo_range8
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_numOptions") ptr0 soapySDRArgInfo_numOptions9
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_options") ptr0 soapySDRArgInfo_options10
              >> HsBindgen.Runtime.HasCField.pokeCField (Data.Proxy.Proxy @"soapySDRArgInfo_optionNames") ptr0 soapySDRArgInfo_optionNames11

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_key" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_key" =
    Ptr.Ptr FC.CChar

  offset# = \_ -> \_ -> 0

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_key")
         ) => GHC.Records.HasField "soapySDRArgInfo_key" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_key")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_value" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_value" =
    Ptr.Ptr FC.CChar

  offset# = \_ -> \_ -> 8

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_value")
         ) => GHC.Records.HasField "soapySDRArgInfo_value" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_value")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_name" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_name" =
    Ptr.Ptr FC.CChar

  offset# = \_ -> \_ -> 16

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_name")
         ) => GHC.Records.HasField "soapySDRArgInfo_name" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_name")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_description" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_description" =
    Ptr.Ptr FC.CChar

  offset# = \_ -> \_ -> 24

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_description")
         ) => GHC.Records.HasField "soapySDRArgInfo_description" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_description")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_units" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_units" =
    Ptr.Ptr FC.CChar

  offset# = \_ -> \_ -> 32

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_units")
         ) => GHC.Records.HasField "soapySDRArgInfo_units" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_units")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_type" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_type" =
    SoapySDRArgInfoType

  offset# = \_ -> \_ -> 40

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_type")
         ) => GHC.Records.HasField "soapySDRArgInfo_type" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_type")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_range" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_range" =
    SoapySDRRange

  offset# = \_ -> \_ -> 48

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_range")
         ) => GHC.Records.HasField "soapySDRArgInfo_range" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_range")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_numOptions" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_numOptions" =
    HsBindgen.Runtime.Prelude.CSize

  offset# = \_ -> \_ -> 72

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_numOptions")
         ) => GHC.Records.HasField "soapySDRArgInfo_numOptions" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_numOptions")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_options" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_options" =
    Ptr.Ptr (Ptr.Ptr FC.CChar)

  offset# = \_ -> \_ -> 80

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_options")
         ) => GHC.Records.HasField "soapySDRArgInfo_options" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_options")

instance HsBindgen.Runtime.HasCField.HasCField SoapySDRArgInfo "soapySDRArgInfo_optionNames" where

  type CFieldType SoapySDRArgInfo "soapySDRArgInfo_optionNames" =
    Ptr.Ptr (Ptr.Ptr FC.CChar)

  offset# = \_ -> \_ -> 88

instance ( TyEq ty ((HsBindgen.Runtime.HasCField.CFieldType SoapySDRArgInfo) "soapySDRArgInfo_optionNames")
         ) => GHC.Records.HasField "soapySDRArgInfo_optionNames" (Ptr.Ptr SoapySDRArgInfo) (Ptr.Ptr ty) where

  getField =
    HsBindgen.Runtime.HasCField.ptrToCField (Data.Proxy.Proxy @"soapySDRArgInfo_optionNames")

{-| __C declaration:__ @struct SoapySDRDevice@

    __defined at:__ @SoapySDR\/Device.h:29:16@

    __exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
data SoapySDRDevice

{-| __C declaration:__ @struct SoapySDRStream@

    __defined at:__ @SoapySDR\/Device.h:32:16@

    __exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
data SoapySDRStream
