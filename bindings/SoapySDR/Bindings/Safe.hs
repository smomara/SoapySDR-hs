{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module SoapySDR.Bindings.Safe where

import qualified Foreign.C as FC
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.CAPI
import qualified HsBindgen.Runtime.ConstPtr
import qualified HsBindgen.Runtime.Prelude
import Data.Void (Void)
import Prelude (IO)
import SoapySDR.Bindings

$(HsBindgen.Runtime.Prelude.addCSource (HsBindgen.Runtime.Prelude.unlines
  [ "#include <SoapySDR/Types.h>"
  , "#include <SoapySDR/Device.h>"
  , "void hs_bindgen_8621c7278fa547e4 ("
  , "  char const *arg1,"
  , "  SoapySDRKwargs *arg2"
  , ")"
  , "{"
  , "  *arg2 = SoapySDRKwargs_fromString(arg1);"
  , "}"
  , "char *hs_bindgen_0d0256baeb708c70 ("
  , "  SoapySDRKwargs const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRKwargs_toString(arg1);"
  , "}"
  , "void hs_bindgen_6f0ecdbbc0257f38 ("
  , "  void *arg1"
  , ")"
  , "{"
  , "  SoapySDR_free(arg1);"
  , "}"
  , "void hs_bindgen_d9cfff29cabd8257 ("
  , "  char ***arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  SoapySDRStrings_clear(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_1656b9987ceed8d4 ("
  , "  SoapySDRKwargs *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRKwargs_set(arg1, arg2, arg3);"
  , "}"
  , "char const *hs_bindgen_ee2f9288d900c3b9 ("
  , "  SoapySDRKwargs const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRKwargs_get(arg1, arg2);"
  , "}"
  , "void hs_bindgen_3ccf1e6cc2ef8f32 ("
  , "  SoapySDRKwargs *arg1"
  , ")"
  , "{"
  , "  SoapySDRKwargs_clear(arg1);"
  , "}"
  , "void hs_bindgen_f581360b6c665f83 ("
  , "  SoapySDRKwargs *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  SoapySDRKwargsList_clear(arg1, arg2);"
  , "}"
  , "void hs_bindgen_c4fda78180d6bb80 ("
  , "  SoapySDRArgInfo *arg1"
  , ")"
  , "{"
  , "  SoapySDRArgInfo_clear(arg1);"
  , "}"
  , "void hs_bindgen_6224cfa7209d414f ("
  , "  SoapySDRArgInfo *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  SoapySDRArgInfoList_clear(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_7de6f9b90c2b0fb3 (void)"
  , "{"
  , "  return SoapySDRDevice_lastStatus();"
  , "}"
  , "char const *hs_bindgen_a40d8efcf8592242 (void)"
  , "{"
  , "  return SoapySDRDevice_lastError();"
  , "}"
  , "SoapySDRKwargs *hs_bindgen_7184a568d6ff0802 ("
  , "  SoapySDRKwargs const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_enumerate(arg1, arg2);"
  , "}"
  , "SoapySDRKwargs *hs_bindgen_40ce770d0d9aadb1 ("
  , "  char const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_enumerateStrArgs(arg1, arg2);"
  , "}"
  , "SoapySDRDevice *hs_bindgen_698185c2b25029e9 ("
  , "  SoapySDRKwargs const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_make(arg1);"
  , "}"
  , "SoapySDRDevice *hs_bindgen_367f90cdecedf6dc ("
  , "  char const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_makeStrArgs(arg1);"
  , "}"
  , "signed int hs_bindgen_0e98292e8d2b2fd5 ("
  , "  SoapySDRDevice *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_unmake(arg1);"
  , "}"
  , "SoapySDRDevice **hs_bindgen_6fb15c19b9d212fb ("
  , "  SoapySDRKwargs const *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_make_list(arg1, arg2);"
  , "}"
  , "SoapySDRDevice **hs_bindgen_80dbc4002fc6fd12 ("
  , "  char const *const *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_make_listStrArgs(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_09762d44b8a4fc87 ("
  , "  SoapySDRDevice **arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_unmake_list(arg1, arg2);"
  , "}"
  , "char *hs_bindgen_1b9c293f302720d4 ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getDriverKey(arg1);"
  , "}"
  , "char *hs_bindgen_b959d472dfcbe8c0 ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getHardwareKey(arg1);"
  , "}"
  , "void hs_bindgen_0ce784877aa95844 ("
  , "  SoapySDRDevice const *arg1,"
  , "  SoapySDRKwargs *arg2"
  , ")"
  , "{"
  , "  *arg2 = SoapySDRDevice_getHardwareInfo(arg1);"
  , "}"
  , "signed int hs_bindgen_878d1a0d96cf3d51 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setFrontendMapping(arg1, arg2, arg3);"
  , "}"
  , "char *hs_bindgen_bb5bdf5edabbe4e6 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrontendMapping(arg1, arg2);"
  , "}"
  , "size_t hs_bindgen_8fbb50d6d6983418 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getNumChannels(arg1, arg2);"
  , "}"
  , "void hs_bindgen_143556f6e693a62d ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  SoapySDRKwargs *arg4"
  , ")"
  , "{"
  , "  *arg4 = SoapySDRDevice_getChannelInfo(arg1, arg2, arg3);"
  , "}"
  , "_Bool hs_bindgen_c5904641f0f8322e ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFullDuplex(arg1, arg2, arg3);"
  , "}"
  , "char **hs_bindgen_e8c4433febeda708 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getStreamFormats(arg1, arg2, arg3, arg4);"
  , "}"
  , "char *hs_bindgen_e624ba4cb203f481 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getNativeStreamFormat(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRArgInfo *hs_bindgen_bd368a8462538bc3 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getStreamArgsInfo(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRStream *hs_bindgen_0ffac56649d359dd ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3,"
  , "  size_t const *arg4,"
  , "  size_t const arg5,"
  , "  SoapySDRKwargs const *arg6"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setupStream(arg1, arg2, arg3, arg4, arg5, arg6);"
  , "}"
  , "signed int hs_bindgen_c31eefffa499b76b ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_closeStream(arg1, arg2);"
  , "}"
  , "size_t hs_bindgen_de7b0cb2278315ad ("
  , "  SoapySDRDevice const *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getStreamMTU(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_72daa1234642badf ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  signed int const arg3,"
  , "  signed long long const arg4,"
  , "  size_t const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_activateStream(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "signed int hs_bindgen_7bb9de2f6ac54e5e ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  signed int const arg3,"
  , "  signed long long const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_deactivateStream(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_499eb89b40b083e4 ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  void *const *arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long *arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readStream(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
  , "}"
  , "signed int hs_bindgen_5b1c1c16ec0bcb8c ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  void const *const *arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long const arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeStream(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
  , "}"
  , "signed int hs_bindgen_31f7f1e3321f20bb ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  signed int *arg4,"
  , "  signed long long *arg5,"
  , "  signed long const arg6"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readStreamStatus(arg1, arg2, arg3, arg4, arg5, arg6);"
  , "}"
  , "size_t hs_bindgen_35f84e588b59b0df ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getNumDirectAccessBuffers(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_2044750c2e2e63ab ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3,"
  , "  void **arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getDirectAccessBufferAddrs(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_a3841b91ccd709f9 ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  void const **arg4,"
  , "  signed int *arg5,"
  , "  signed long long *arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return SoapySDRDevice_acquireReadBuffer(arg1, arg2, arg3, arg4, arg5, arg6, arg7);"
  , "}"
  , "void hs_bindgen_9744a88f4109eefb ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  SoapySDRDevice_releaseReadBuffer(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_26b18d1bb25639eb ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  void **arg4,"
  , "  signed long const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_acquireWriteBuffer(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "void hs_bindgen_77d5be79bb6b5112 ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long const arg6"
  , ")"
  , "{"
  , "  SoapySDRDevice_releaseWriteBuffer(arg1, arg2, arg3, arg4, arg5, arg6);"
  , "}"
  , "char **hs_bindgen_6188e7101e9d26bc ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listAntennas(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_7c9a2f56d2b8ca42 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setAntenna(arg1, arg2, arg3, arg4);"
  , "}"
  , "char *hs_bindgen_3afa11406aa64788 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getAntenna(arg1, arg2, arg3);"
  , "}"
  , "_Bool hs_bindgen_f351e0a472412975 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasDCOffsetMode(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_e6ada57702ad1c30 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setDCOffsetMode(arg1, arg2, arg3, arg4);"
  , "}"
  , "_Bool hs_bindgen_e8f78d0e3be6b5fd ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getDCOffsetMode(arg1, arg2, arg3);"
  , "}"
  , "_Bool hs_bindgen_e41b7979c2d9a403 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasDCOffset(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_80f220220aafcefe ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setDCOffset(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "signed int hs_bindgen_417a0256d5a46807 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4,"
  , "  double *arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getDCOffset(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "_Bool hs_bindgen_7f1cdf034703191b ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasIQBalance(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_919a4eb9c2a57219 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setIQBalance(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "signed int hs_bindgen_3d0dca38fc12b8a1 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4,"
  , "  double *arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getIQBalance(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "_Bool hs_bindgen_d0f8a1fca58a8b2e ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasIQBalanceMode(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_1805781bb9baac24 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setIQBalanceMode(arg1, arg2, arg3, arg4);"
  , "}"
  , "_Bool hs_bindgen_fdcee5a5d54a4912 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getIQBalanceMode(arg1, arg2, arg3);"
  , "}"
  , "_Bool hs_bindgen_d7a23913fa3bac71 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasFrequencyCorrection(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_eb93856844f1ae54 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setFrequencyCorrection(arg1, arg2, arg3, arg4);"
  , "}"
  , "double hs_bindgen_7a92c962dfdf4688 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequencyCorrection(arg1, arg2, arg3);"
  , "}"
  , "char **hs_bindgen_4e23ba88e9cd4d33 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listGains(arg1, arg2, arg3, arg4);"
  , "}"
  , "_Bool hs_bindgen_5f0eeb52d7064d8d ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasGainMode(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_69a24f7ed671d064 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setGainMode(arg1, arg2, arg3, arg4);"
  , "}"
  , "_Bool hs_bindgen_fb1d391d2e1c5fdb ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getGainMode(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_9351097a6c781377 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setGain(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_6e71429de5deb948 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setGainElement(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "double hs_bindgen_d7a26503eb383e01 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getGain(arg1, arg2, arg3);"
  , "}"
  , "double hs_bindgen_5d4bc3ca3e892416 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getGainElement(arg1, arg2, arg3, arg4);"
  , "}"
  , "void hs_bindgen_d60bd40b5f5419a0 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  SoapySDRRange *arg4"
  , ")"
  , "{"
  , "  *arg4 = SoapySDRDevice_getGainRange(arg1, arg2, arg3);"
  , "}"
  , "void hs_bindgen_28e99dd4acbe54f6 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  SoapySDRRange *arg5"
  , ")"
  , "{"
  , "  *arg5 = SoapySDRDevice_getGainElementRange(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_48b11435354fc965 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  SoapySDRKwargs const *arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setFrequency(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "signed int hs_bindgen_b7099499a1741321 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  double const arg5,"
  , "  SoapySDRKwargs const *arg6"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setFrequencyComponent(arg1, arg2, arg3, arg4, arg5, arg6);"
  , "}"
  , "double hs_bindgen_d74d2900ae67fe55 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequency(arg1, arg2, arg3);"
  , "}"
  , "double hs_bindgen_4d54796c75cd8d10 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequencyComponent(arg1, arg2, arg3, arg4);"
  , "}"
  , "char **hs_bindgen_36800e494de75b0c ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listFrequencies(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRRange *hs_bindgen_f0677c9a5111069a ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequencyRange(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRRange *hs_bindgen_e84069a0fd4c9bcb ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  size_t *arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequencyRangeComponent(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "SoapySDRArgInfo *hs_bindgen_bdc0845f2de8d930 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getFrequencyArgsInfo(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_3f1293abb17740dc ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setSampleRate(arg1, arg2, arg3, arg4);"
  , "}"
  , "double hs_bindgen_7fc836e95ca08831 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getSampleRate(arg1, arg2, arg3);"
  , "}"
  , "double *hs_bindgen_c551e57fbe6cc748 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listSampleRates(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRRange *hs_bindgen_700e4155fe72c442 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getSampleRateRange(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_6182fa530c523c08 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setBandwidth(arg1, arg2, arg3, arg4);"
  , "}"
  , "double hs_bindgen_93d578453f13f821 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getBandwidth(arg1, arg2, arg3);"
  , "}"
  , "double *hs_bindgen_1570bf7c8a441e1d ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listBandwidths(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRRange *hs_bindgen_96bd0b9d90ffa0ac ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getBandwidthRange(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_e21e6526ce8e0ef7 ("
  , "  SoapySDRDevice *arg1,"
  , "  double const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setMasterClockRate(arg1, arg2);"
  , "}"
  , "double hs_bindgen_446be5c5d9143453 ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getMasterClockRate(arg1);"
  , "}"
  , "SoapySDRRange *hs_bindgen_1c2ec08c1d68a1f7 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getMasterClockRates(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_7052b24583025cb6 ("
  , "  SoapySDRDevice *arg1,"
  , "  double const arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setReferenceClockRate(arg1, arg2);"
  , "}"
  , "double hs_bindgen_a0966be185b827a2 ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getReferenceClockRate(arg1);"
  , "}"
  , "SoapySDRRange *hs_bindgen_3f90e9c6850c3e5f ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getReferenceClockRates(arg1, arg2);"
  , "}"
  , "char **hs_bindgen_9cd97281cd487450 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listClockSources(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_65e3e9be0c62b614 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setClockSource(arg1, arg2);"
  , "}"
  , "char *hs_bindgen_50391651bb7127ab ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getClockSource(arg1);"
  , "}"
  , "char **hs_bindgen_e1d813ec36e29760 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listTimeSources(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_e20aa73b91673d68 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setTimeSource(arg1, arg2);"
  , "}"
  , "char *hs_bindgen_13aa23e61514599b ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getTimeSource(arg1);"
  , "}"
  , "_Bool hs_bindgen_d0cd7d9c4b0b2d65 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_hasHardwareTime(arg1, arg2);"
  , "}"
  , "signed long long hs_bindgen_c29c13cf49ebc76e ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getHardwareTime(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_f945a3ef2aa6f37d ("
  , "  SoapySDRDevice *arg1,"
  , "  signed long long const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setHardwareTime(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_605b0addb9392908 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed long long const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_setCommandTime(arg1, arg2, arg3);"
  , "}"
  , "char **hs_bindgen_61e096838c3f8604 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listSensors(arg1, arg2);"
  , "}"
  , "void hs_bindgen_d98705ca0eed5232 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  SoapySDRArgInfo *arg3"
  , ")"
  , "{"
  , "  *arg3 = SoapySDRDevice_getSensorInfo(arg1, arg2);"
  , "}"
  , "char *hs_bindgen_c01c95f6e3dc8d9a ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readSensor(arg1, arg2);"
  , "}"
  , "char **hs_bindgen_f9fb609a70df7cef ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listChannelSensors(arg1, arg2, arg3, arg4);"
  , "}"
  , "void hs_bindgen_efad186af11557ef ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  SoapySDRArgInfo *arg5"
  , ")"
  , "{"
  , "  *arg5 = SoapySDRDevice_getChannelSensorInfo(arg1, arg2, arg3, arg4);"
  , "}"
  , "char *hs_bindgen_03431827c18b7a3d ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readChannelSensor(arg1, arg2, arg3, arg4);"
  , "}"
  , "char **hs_bindgen_f18f0eaab38fd997 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listRegisterInterfaces(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_26fa6f6f6e3e5622 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeRegister(arg1, arg2, arg3, arg4);"
  , "}"
  , "unsigned int hs_bindgen_41802e8f50d3e899 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readRegister(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_c4ff8c4bffbfbf7a ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const *arg4,"
  , "  size_t const arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeRegisters(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "unsigned int *hs_bindgen_34ae45b873c3aadf ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readRegisters(arg1, arg2, arg3, arg4);"
  , "}"
  , "SoapySDRArgInfo *hs_bindgen_1cc778cd4955c72c ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getSettingInfo(arg1, arg2);"
  , "}"
  , "void hs_bindgen_98b9940edc4aaaf9 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  SoapySDRArgInfo *arg3"
  , ")"
  , "{"
  , "  *arg3 = SoapySDRDevice_getSettingInfoWithKey(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_44024e50546f6e9d ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeSetting(arg1, arg2, arg3);"
  , "}"
  , "char *hs_bindgen_d5524557b6542d81 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readSetting(arg1, arg2);"
  , "}"
  , "SoapySDRArgInfo *hs_bindgen_46720b1ede70044a ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getChannelSettingInfo(arg1, arg2, arg3, arg4);"
  , "}"
  , "void hs_bindgen_f750e50e974ea267 ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  SoapySDRArgInfo *arg5"
  , ")"
  , "{"
  , "  *arg5 = SoapySDRDevice_getChannelSettingInfoWithKey(arg1, arg2, arg3, arg4);"
  , "}"
  , "signed int hs_bindgen_b5fb1901df6cada6 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  char const *arg5"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeChannelSetting(arg1, arg2, arg3, arg4, arg5);"
  , "}"
  , "char *hs_bindgen_534d2ece54d8420d ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readChannelSetting(arg1, arg2, arg3, arg4);"
  , "}"
  , "char **hs_bindgen_18996c4fc8ad7f11 ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listGPIOBanks(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_328ff4a5f06fcc26 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeGPIO(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_8ea5a845f0f46c66 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeGPIOMasked(arg1, arg2, arg3, arg4);"
  , "}"
  , "unsigned int hs_bindgen_a669ee0339774ab6 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readGPIO(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_64ba3ccbf6d506dc ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeGPIODir(arg1, arg2, arg3);"
  , "}"
  , "signed int hs_bindgen_e09614f33e7cc73f ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeGPIODirMasked(arg1, arg2, arg3, arg4);"
  , "}"
  , "unsigned int hs_bindgen_ea50383c5425f4c0 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readGPIODir(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_a585b6779cd75268 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3,"
  , "  size_t const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeI2C(arg1, arg2, arg3, arg4);"
  , "}"
  , "char *hs_bindgen_8341a0f524ad54f1 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readI2C(arg1, arg2, arg3);"
  , "}"
  , "unsigned int hs_bindgen_772a2ef0517726b8 ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  unsigned int const arg3,"
  , "  size_t const arg4"
  , ")"
  , "{"
  , "  return SoapySDRDevice_transactSPI(arg1, arg2, arg3, arg4);"
  , "}"
  , "char **hs_bindgen_47247fa0b208476c ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return SoapySDRDevice_listUARTs(arg1, arg2);"
  , "}"
  , "signed int hs_bindgen_5e92c563c8a54191 ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_writeUART(arg1, arg2, arg3);"
  , "}"
  , "char *hs_bindgen_35a577bc7aa64b81 ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  signed long const arg3"
  , ")"
  , "{"
  , "  return SoapySDRDevice_readUART(arg1, arg2, arg3);"
  , "}"
  , "void *hs_bindgen_0fd4cb1e9819777a ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return SoapySDRDevice_getNativeDeviceHandle(arg1);"
  , "}"
  ]))

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargs_fromString@
foreign import ccall safe "hs_bindgen_8621c7278fa547e4" hs_bindgen_8621c7278fa547e4 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()

{-| Pointer-based API for 'soapySDRKwargs_fromString'
-}
soapySDRKwargs_fromString_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @markup@
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()
soapySDRKwargs_fromString_wrapper =
  hs_bindgen_8621c7278fa547e4

{-| Convert a markup string to a key-value map. The markup format is: "key0=value0, key1=value1"

__C declaration:__ @SoapySDRKwargs_fromString@

__defined at:__ @SoapySDR\/Types.h:45:30@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_fromString ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @markup@
  -> IO SoapySDRKwargs
soapySDRKwargs_fromString =
  \x0 ->
    HsBindgen.Runtime.CAPI.allocaAndPeek (\z1 ->
                                            hs_bindgen_8621c7278fa547e4 x0 z1)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargs_toString@
foreign import ccall safe "hs_bindgen_0d0256baeb708c70" hs_bindgen_0d0256baeb708c70 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> IO (Ptr.Ptr FC.CChar)

{-| Convert a key-value map to a markup string. The markup format is: "key0=value0, key1=value1"

__C declaration:__ @SoapySDRKwargs_toString@

__defined at:__ @SoapySDR\/Types.h:51:21@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_toString ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     -- ^ __C declaration:__ @args@
  -> IO (Ptr.Ptr FC.CChar)
soapySDRKwargs_toString = hs_bindgen_0d0256baeb708c70

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDR_free@
foreign import ccall safe "hs_bindgen_6f0ecdbbc0257f38" hs_bindgen_6f0ecdbbc0257f38 ::
     Ptr.Ptr Void
  -> IO ()

{-| Free a pointer allocated by SoapySDR. For most platforms this is a simple call around free()

__C declaration:__ @SoapySDR_free@

__defined at:__ @SoapySDR\/Types.h:116:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDR_free ::
     Ptr.Ptr Void
     -- ^ __C declaration:__ @ptr@
  -> IO ()
soapySDR_free = hs_bindgen_6f0ecdbbc0257f38

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRStrings_clear@
foreign import ccall safe "hs_bindgen_d9cfff29cabd8257" hs_bindgen_d9cfff29cabd8257 ::
     Ptr.Ptr (Ptr.Ptr (Ptr.Ptr FC.CChar))
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO ()

{-| Clear the contents of a list of string Convenience call to deal with results that return a string list.

__C declaration:__ @SoapySDRStrings_clear@

__defined at:__ @SoapySDR\/Types.h:122:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRStrings_clear ::
     Ptr.Ptr (Ptr.Ptr (Ptr.Ptr FC.CChar))
     -- ^ __C declaration:__ @elems@
  -> HsBindgen.Runtime.Prelude.CSize
     -- ^ __C declaration:__ @length@
  -> IO ()
soapySDRStrings_clear = hs_bindgen_d9cfff29cabd8257

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargs_set@
foreign import ccall safe "hs_bindgen_1656b9987ceed8d4" hs_bindgen_1656b9987ceed8d4 ::
     Ptr.Ptr SoapySDRKwargs
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set a key/value pair in a kwargs structure.

  __post condition:__ If the key exists, the existing entry will be modified; otherwise a new entry will be appended to args. On error, the elements of args will not be modified, and args is guaranteed to be in a good state.

  __returns:__ 0 for success, otherwise allocation error

__C declaration:__ @SoapySDRKwargs_set@

__defined at:__ @SoapySDR\/Types.h:133:19@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_set ::
     Ptr.Ptr SoapySDRKwargs
     -- ^ __C declaration:__ @args@
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @key@
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @val@
  -> IO FC.CInt
soapySDRKwargs_set = hs_bindgen_1656b9987ceed8d4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargs_get@
foreign import ccall safe "hs_bindgen_ee2f9288d900c3b9" hs_bindgen_ee2f9288d900c3b9 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)

{-| Get a value given a key in a kwargs structure.

  __returns:__ the string or NULL if not found

__C declaration:__ @SoapySDRKwargs_get@

__defined at:__ @SoapySDR\/Types.h:139:27@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_get ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     -- ^ __C declaration:__ @args@
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @key@
  -> IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)
soapySDRKwargs_get = hs_bindgen_ee2f9288d900c3b9

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargs_clear@
foreign import ccall safe "hs_bindgen_3ccf1e6cc2ef8f32" hs_bindgen_3ccf1e6cc2ef8f32 ::
     Ptr.Ptr SoapySDRKwargs
  -> IO ()

{-| Clear the contents of a kwargs structure. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRKwargs_clear@

__defined at:__ @SoapySDR\/Types.h:145:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_clear ::
     Ptr.Ptr SoapySDRKwargs
     -- ^ __C declaration:__ @args@
  -> IO ()
soapySDRKwargs_clear = hs_bindgen_3ccf1e6cc2ef8f32

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRKwargsList_clear@
foreign import ccall safe "hs_bindgen_f581360b6c665f83" hs_bindgen_f581360b6c665f83 ::
     Ptr.Ptr SoapySDRKwargs
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO ()

{-| Clear a list of kwargs structures. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRKwargsList_clear@

__defined at:__ @SoapySDR\/Types.h:151:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargsList_clear ::
     Ptr.Ptr SoapySDRKwargs
     -- ^ __C declaration:__ @args@
  -> HsBindgen.Runtime.Prelude.CSize
     -- ^ __C declaration:__ @length@
  -> IO ()
soapySDRKwargsList_clear =
  hs_bindgen_f581360b6c665f83

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRArgInfo_clear@
foreign import ccall safe "hs_bindgen_c4fda78180d6bb80" hs_bindgen_c4fda78180d6bb80 ::
     Ptr.Ptr SoapySDRArgInfo
  -> IO ()

{-| Clear the contents of a argument info structure. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRArgInfo_clear@

__defined at:__ @SoapySDR\/Types.h:157:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRArgInfo_clear ::
     Ptr.Ptr SoapySDRArgInfo
     -- ^ __C declaration:__ @info@
  -> IO ()
soapySDRArgInfo_clear = hs_bindgen_c4fda78180d6bb80

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRArgInfoList_clear@
foreign import ccall safe "hs_bindgen_6224cfa7209d414f" hs_bindgen_6224cfa7209d414f ::
     Ptr.Ptr SoapySDRArgInfo
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO ()

{-| Clear a list of argument info structures. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRArgInfoList_clear@

__defined at:__ @SoapySDR\/Types.h:163:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRArgInfoList_clear ::
     Ptr.Ptr SoapySDRArgInfo
     -- ^ __C declaration:__ @info@
  -> HsBindgen.Runtime.Prelude.CSize
     -- ^ __C declaration:__ @length@
  -> IO ()
soapySDRArgInfoList_clear =
  hs_bindgen_6224cfa7209d414f

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_lastStatus@
foreign import ccall safe "hs_bindgen_7de6f9b90c2b0fb3" hs_bindgen_7de6f9b90c2b0fb3 ::
     IO FC.CInt

{-| Get the last status code after a Device API call. The status code is cleared on entry to each Device call. When an device API call throws, the C bindings catch the exception, and set a non-zero last status code. Use lastStatus() to determine success/failure for Device calls without integer status return codes.

__C declaration:__ @SoapySDRDevice_lastStatus@

__defined at:__ @SoapySDR\/Device.h:42:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_lastStatus :: IO FC.CInt
soapySDRDevice_lastStatus =
  hs_bindgen_7de6f9b90c2b0fb3

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_lastError@
foreign import ccall safe "hs_bindgen_a40d8efcf8592242" hs_bindgen_a40d8efcf8592242 ::
     IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)

{-| Get the last error message after a device call fails. When an device API call throws, the C bindings catch the exception, store its message in thread-safe storage, and return a non-zero status code to indicate failure. Use lastError() to access the exception's error message.

__C declaration:__ @SoapySDRDevice_lastError@

__defined at:__ @SoapySDR\/Device.h:51:27@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_lastError :: IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)
soapySDRDevice_lastError =
  hs_bindgen_a40d8efcf8592242

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_enumerate@
foreign import ccall safe "hs_bindgen_7184a568d6ff0802" hs_bindgen_7184a568d6ff0802 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRKwargs)

{-| Enumerate a list of available devices on the system.

  [__@args@ /(input)/__]: device construction key/value argument filters

  [__@length@ /(output)/__]: the number of elements in the result.

  __returns:__ a list of arguments strings, each unique to a device

__C declaration:__ @SoapySDRDevice_enumerate@

__defined at:__ @SoapySDR\/Device.h:59:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_enumerate ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@args@ /(input)/__]: device construction key/value argument filters

     __C declaration:__ @args@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of elements in the result.

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRKwargs)
soapySDRDevice_enumerate =
  hs_bindgen_7184a568d6ff0802

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_enumerateStrArgs@
foreign import ccall safe "hs_bindgen_40ce770d0d9aadb1" hs_bindgen_40ce770d0d9aadb1 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRKwargs)

{-| Enumerate a list of available devices on the system. Markup format for args: "keyA=valA, keyB=valB".

  [__@args@ /(input)/__]: a markup string of key/value argument filters

  [__@length@ /(output)/__]: the number of elements in the result.

  __returns:__ a list of arguments strings, each unique to a device

__C declaration:__ @SoapySDRDevice_enumerateStrArgs@

__defined at:__ @SoapySDR\/Device.h:68:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_enumerateStrArgs ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@args@ /(input)/__]: a markup string of key/value argument filters

     __C declaration:__ @args@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of elements in the result.

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRKwargs)
soapySDRDevice_enumerateStrArgs =
  hs_bindgen_40ce770d0d9aadb1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_make@
foreign import ccall safe "hs_bindgen_698185c2b25029e9" hs_bindgen_698185c2b25029e9 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> IO (Ptr.Ptr SoapySDRDevice)

{-| Make a new Device object given device construction args. The device pointer will be stored in a table so subsequent calls with the same arguments will produce the same device. For every call to make, there should be a matched call to unmake.

  [__@args@ /(input)/__]: device construction key/value argument map

  __returns:__ a pointer to a new Device object

__C declaration:__ @SoapySDRDevice_make@

__defined at:__ @SoapySDR\/Device.h:79:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@args@ /(input)/__]: device construction key/value argument map

     __C declaration:__ @args@
     -}
  -> IO (Ptr.Ptr SoapySDRDevice)
soapySDRDevice_make = hs_bindgen_698185c2b25029e9

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_makeStrArgs@
foreign import ccall safe "hs_bindgen_367f90cdecedf6dc" hs_bindgen_367f90cdecedf6dc ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (Ptr.Ptr SoapySDRDevice)

{-| Make a new Device object given device construction args. The device pointer will be stored in a table so subsequent calls with the same arguments will produce the same device. For every call to make, there should be a matched call to unmake.

  [__@args@ /(input)/__]: a markup string of key/value arguments

  __returns:__ a pointer to a new Device object or null for error

__C declaration:__ @SoapySDRDevice_makeStrArgs@

__defined at:__ @SoapySDR\/Device.h:90:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_makeStrArgs ::
     HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@args@ /(input)/__]: a markup string of key/value arguments

     __C declaration:__ @args@
     -}
  -> IO (Ptr.Ptr SoapySDRDevice)
soapySDRDevice_makeStrArgs =
  hs_bindgen_367f90cdecedf6dc

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_unmake@
foreign import ccall safe "hs_bindgen_0e98292e8d2b2fd5" hs_bindgen_0e98292e8d2b2fd5 ::
     Ptr.Ptr SoapySDRDevice
  -> IO FC.CInt

{-| Unmake or release a device object handle.

  [__@device@ /(input)/__]: a pointer to a device object

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_unmake@

__defined at:__ @SoapySDR\/Device.h:98:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_unmake ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device object

     __C declaration:__ @device@
     -}
  -> IO FC.CInt
soapySDRDevice_unmake = hs_bindgen_0e98292e8d2b2fd5

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_make_list@
foreign import ccall safe "hs_bindgen_6fb15c19b9d212fb" hs_bindgen_6fb15c19b9d212fb ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))

{-| Create a list of devices from a list of construction arguments. This is a convenience call to parallelize device construction, and is fundamentally a parallel for loop of make(Kwargs).

  [__@argsList@ /(input)/__]: a list of device arguments per each device

  [__@length@ /(input)/__]: the length of the argsList array

  __returns:__ a list of device pointers per each specified argument

__C declaration:__ @SoapySDRDevice_make_list@

__defined at:__ @SoapySDR\/Device.h:113:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make_list ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@argsList@ /(input)/__]: a list of device arguments per each device

     __C declaration:__ @argsList@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(input)/__]: the length of the argsList array

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))
soapySDRDevice_make_list =
  hs_bindgen_6fb15c19b9d212fb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_make_listStrArgs@
foreign import ccall safe "hs_bindgen_80dbc4002fc6fd12" hs_bindgen_80dbc4002fc6fd12 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))

{-| Create a list of devices from a list of construction arguments. This is a convenience call to parallelize device construction, and is fundamentally a parallel for loop of makeStrArgs(args).

  [__@argsList@ /(input)/__]: a list of device arguments per each device

  [__@length@ /(input)/__]: the length of the argsList array

  __returns:__ a list of device pointers per each specified argument

__C declaration:__ @SoapySDRDevice_make_listStrArgs@

__defined at:__ @SoapySDR\/Device.h:124:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make_listStrArgs ::
     HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)
     {- ^

        [__@argsList@ /(input)/__]: a list of device arguments per each device

     __C declaration:__ @argsList@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(input)/__]: the length of the argsList array

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))
soapySDRDevice_make_listStrArgs =
  hs_bindgen_80dbc4002fc6fd12

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_unmake_list@
foreign import ccall safe "hs_bindgen_09762d44b8a4fc87" hs_bindgen_09762d44b8a4fc87 ::
     Ptr.Ptr (Ptr.Ptr SoapySDRDevice)
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| Unmake or release a list of device handles and free the devices array memory as well. This is a convenience call to parallelize device destruction, and is fundamentally a parallel for loop of unmake(Device *).

  [__@devices@ /(input)/__]: a list of pointers to device objects

  [__@length@ /(input)/__]: the length of the devices array

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_unmake_list@

__defined at:__ @SoapySDR\/Device.h:136:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_unmake_list ::
     Ptr.Ptr (Ptr.Ptr SoapySDRDevice)
     {- ^

        [__@devices@ /(input)/__]: a list of pointers to device objects

     __C declaration:__ @devices@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(input)/__]: the length of the devices array

     __C declaration:__ @length@
     -}
  -> IO FC.CInt
soapySDRDevice_unmake_list =
  hs_bindgen_09762d44b8a4fc87

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getDriverKey@
foreign import ccall safe "hs_bindgen_1b9c293f302720d4" hs_bindgen_1b9c293f302720d4 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO (Ptr.Ptr FC.CChar)

{-| A key that uniquely identifies the device driver. This key identifies the underlying implementation. Several variants of a product may share a driver.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getDriverKey@

__defined at:__ @SoapySDR\/Device.h:148:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDriverKey ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getDriverKey =
  hs_bindgen_1b9c293f302720d4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getHardwareKey@
foreign import ccall safe "hs_bindgen_b959d472dfcbe8c0" hs_bindgen_b959d472dfcbe8c0 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO (Ptr.Ptr FC.CChar)

{-| A key that uniquely identifies the hardware. This key should be meaningful to the user to optimize for the underlying hardware.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getHardwareKey@

__defined at:__ @SoapySDR\/Device.h:156:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareKey ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getHardwareKey =
  hs_bindgen_b959d472dfcbe8c0

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getHardwareInfo@
foreign import ccall safe "hs_bindgen_0ce784877aa95844" hs_bindgen_0ce784877aa95844 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getHardwareInfo'
-}
soapySDRDevice_getHardwareInfo_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()
soapySDRDevice_getHardwareInfo_wrapper =
  hs_bindgen_0ce784877aa95844

{-| Query a dictionary of available device information. This dictionary can any number of values like vendor name, product name, revisions, serials... This information can be displayed to the user to help identify the instantiated device.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getHardwareInfo@

__defined at:__ @SoapySDR\/Device.h:166:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO SoapySDRKwargs
soapySDRDevice_getHardwareInfo =
  \x0 ->
    HsBindgen.Runtime.CAPI.allocaAndPeek (\z1 ->
                                            hs_bindgen_0ce784877aa95844 x0 z1)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setFrontendMapping@
foreign import ccall safe "hs_bindgen_878d1a0d96cf3d51" hs_bindgen_878d1a0d96cf3d51 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set the frontend mapping of available DSP units to RF frontends. This mapping controls channel mapping and channel availability.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@mapping@ /(input)/__]: a vendor-specific mapping string

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setFrontendMapping@

__defined at:__ @SoapySDR\/Device.h:180:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setFrontendMapping ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@mapping@ /(input)/__]: a vendor-specific mapping string

     __C declaration:__ @mapping@
     -}
  -> IO FC.CInt
soapySDRDevice_setFrontendMapping =
  hs_bindgen_878d1a0d96cf3d51

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrontendMapping@
foreign import ccall safe "hs_bindgen_bb5bdf5edabbe4e6" hs_bindgen_bb5bdf5edabbe4e6 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> IO (Ptr.Ptr FC.CChar)

{-| Get the mapping configuration string.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  __returns:__ the vendor-specific mapping string

__C declaration:__ @SoapySDRDevice_getFrontendMapping@

__defined at:__ @SoapySDR\/Device.h:188:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrontendMapping ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getFrontendMapping =
  hs_bindgen_bb5bdf5edabbe4e6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getNumChannels@
foreign import ccall safe "hs_bindgen_8fbb50d6d6983418" hs_bindgen_8fbb50d6d6983418 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> IO HsBindgen.Runtime.Prelude.CSize

{-| Get a number of channels given the streaming direction

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  __returns:__ the number of channels

__C declaration:__ @SoapySDRDevice_getNumChannels@

__defined at:__ @SoapySDR\/Device.h:196:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNumChannels ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> IO HsBindgen.Runtime.Prelude.CSize
soapySDRDevice_getNumChannels =
  hs_bindgen_8fbb50d6d6983418

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getChannelInfo@
foreign import ccall safe "hs_bindgen_143556f6e693a62d" hs_bindgen_143556f6e693a62d ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getChannelInfo'
-}
soapySDRDevice_getChannelInfo_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: the channel number to get info for

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr SoapySDRKwargs
  -> IO ()
soapySDRDevice_getChannelInfo_wrapper =
  hs_bindgen_143556f6e693a62d

{-| Get channel info given the streaming direction

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: the channel number to get info for

  __returns:__ channel information

__C declaration:__ @SoapySDRDevice_getChannelInfo@

__defined at:__ @SoapySDR\/Device.h:205:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getChannelInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: the channel number to get info for

     __C declaration:__ @channel@
     -}
  -> IO SoapySDRKwargs
soapySDRDevice_getChannelInfo =
  \x0 ->
    \x1 ->
      \x2 ->
        HsBindgen.Runtime.CAPI.allocaAndPeek (\z3 ->
                                                hs_bindgen_143556f6e693a62d x0 x1 x2 z3)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFullDuplex@
foreign import ccall safe "hs_bindgen_c5904641f0f8322e" hs_bindgen_c5904641f0f8322e ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Find out if the specified channel is full or half duplex.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for full duplex, false for half duplex

__C declaration:__ @SoapySDRDevice_getFullDuplex@

__defined at:__ @SoapySDR\/Device.h:214:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFullDuplex ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_getFullDuplex =
  hs_bindgen_c5904641f0f8322e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getStreamFormats@
foreign import ccall safe "hs_bindgen_e8c4433febeda708" hs_bindgen_e8c4433febeda708 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Query a list of the available stream formats.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of format strings

  __returns:__ a list of allowed format strings. See SoapySDRDevice_setupStream() for the format syntax.

__C declaration:__ @SoapySDRDevice_getStreamFormats@

__defined at:__ @SoapySDR\/Device.h:229:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getStreamFormats ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of format strings

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_getStreamFormats =
  hs_bindgen_e8c4433febeda708

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getNativeStreamFormat@
foreign import ccall safe "hs_bindgen_e624ba4cb203f481" hs_bindgen_e624ba4cb203f481 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CDouble
  -> IO (Ptr.Ptr FC.CChar)

{-| Get the hardware's native stream format for this channel. This is the format used by the underlying transport layer, and the direct buffer access API calls (when available).

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@fullScale@ /(output)/__]: the maximum possible value

  __returns:__ the native stream buffer format string

__C declaration:__ @SoapySDRDevice_getNativeStreamFormat@

__defined at:__ @SoapySDR\/Device.h:241:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNativeStreamFormat ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr FC.CDouble
     {- ^

        [__@fullScale@ /(output)/__]: the maximum possible value

     __C declaration:__ @fullScale@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getNativeStreamFormat =
  hs_bindgen_e624ba4cb203f481

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getStreamArgsInfo@
foreign import ccall safe "hs_bindgen_bd368a8462538bc3" hs_bindgen_bd368a8462538bc3 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRArgInfo)

{-| Query the argument info description for stream args.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of argument infos

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getStreamArgsInfo@

__defined at:__ @SoapySDR\/Device.h:251:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getStreamArgsInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of argument infos

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRArgInfo)
soapySDRDevice_getStreamArgsInfo =
  hs_bindgen_bd368a8462538bc3

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setupStream@
foreign import ccall safe "hs_bindgen_0ffac56649d359dd" hs_bindgen_0ffac56649d359dd ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.ConstPtr.ConstPtr HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> IO (Ptr.Ptr SoapySDRStream)

{-| Initialize a stream given a list of channels and stream arguments. The implementation may change switches or power-up components. All stream API calls should be usable with the new stream object after setupStream() is complete, regardless of the activity state.

  The API allows any number of simultaneous TX and RX streams, but many dual-channel devices are limited to one stream in each direction, using either one or both channels. This call will return an error if an unsupported combination is requested, or if a requested channel in this direction is already in use by another stream.

  When multiple channels are added to a stream, they are typically expected to have the same sample rate. See SoapySDRDevice_setSampleRate().

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction (`SOAPY_SDR_RX` or `SOAPY_SDR_TX`)

  [__@format@ /(input)/__]: A string representing the desired buffer format in `readStream()` / `writeStream()`.

  @

  The first character selects the number type:
  - "C" means complex
  - "F" means floating point
  - "S" means signed integer
  - "U" means unsigned integer

  The type character is followed by the number of bits per number (complex is 2x this size per sample)

  Example format strings:
  - "CF32" -  complex float32 (8 bytes per element)
  - "CS16" -  complex int16 (4 bytes per element)
  - "CS12" -  complex int12 (3 bytes per element)
  - "CS4" -  complex int4 (1 byte per element)
  - "S32" -  int32 (4 bytes per element)
  - "U8" -  uint8 (1 byte per element)

  @

  [__@channels@ /(input)/__]: a list of channels or empty for automatic

  [__@numChans@ /(input)/__]: the number of elements in the channels array

  [__@args@ /(input)/__]: stream args or empty for defaults.

  @

  Recommended keys to use in the args dictionary:
  - "WIRE" - format of the samples between device and host
  @

  __returns:__ the stream pointer or nullptr for failure.

  @

  The returned stream is not required to have internal locking, and may not be used
  concurrently from multiple threads.
  @

__C declaration:__ @SoapySDRDevice_setupStream@

__defined at:__ @SoapySDR\/Device.h:304:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setupStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction (`SOAPY_SDR_RX` or `SOAPY_SDR_TX`)

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@format@ /(input)/__]: A string representing the desired buffer format in `readStream()` / `writeStream()`.

     __C declaration:__ @format@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channels@ /(input)/__]: a list of channels or empty for automatic

     __C declaration:__ @channels@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numChans@ /(input)/__]: the number of elements in the channels array

     __C declaration:__ @numChans@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@args@ /(input)/__]: stream args or empty for defaults.

     __C declaration:__ @args@
     -}
  -> IO (Ptr.Ptr SoapySDRStream)
soapySDRDevice_setupStream =
  hs_bindgen_0ffac56649d359dd

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_closeStream@
foreign import ccall safe "hs_bindgen_c31eefffa499b76b" hs_bindgen_c31eefffa499b76b ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> IO FC.CInt

{-| Close an open stream created by setupStream

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_closeStream@

__defined at:__ @SoapySDR\/Device.h:317:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_closeStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> IO FC.CInt
soapySDRDevice_closeStream =
  hs_bindgen_c31eefffa499b76b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getStreamMTU@
foreign import ccall safe "hs_bindgen_de7b0cb2278315ad" hs_bindgen_de7b0cb2278315ad ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> IO HsBindgen.Runtime.Prelude.CSize

{-| Get the stream's maximum transmission unit (MTU) in number of elements. The MTU specifies the maximum payload transfer in a stream operation. This value can be used as a stream buffer allocation size that can best optimize throughput given the underlying stream implementation.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ the MTU in number of stream elements (never zero)

__C declaration:__ @SoapySDRDevice_getStreamMTU@

__defined at:__ @SoapySDR\/Device.h:329:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getStreamMTU ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> IO HsBindgen.Runtime.Prelude.CSize
soapySDRDevice_getStreamMTU =
  hs_bindgen_de7b0cb2278315ad

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_activateStream@
foreign import ccall safe "hs_bindgen_72daa1234642badf" hs_bindgen_72daa1234642badf ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> FC.CInt
  -> FC.CLLong
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| Activate a stream. Call activate to prepare a stream before using read/write(). The implementation control switches or stimulate data flow.

  The timeNs is only valid when the flags have SOAPY_SDR_HAS_TIME. The numElems count can be used to request a finite burst size. The SOAPY_SDR_END_BURST flag can signal end on the finite burst. Not all implementations will support the full range of options. In this case, the implementation returns SOAPY_SDR_NOT_SUPPORTED.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@flags@ /(input)/__]: optional flag indicators about the stream

  [__@timeNs@ /(input)/__]: optional activation time in nanoseconds

  [__@numElems@ /(input)/__]: optional element count for burst control

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_activateStream@

__defined at:__ @SoapySDR\/Device.h:349:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_activateStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> FC.CInt
     {- ^

        [__@flags@ /(input)/__]: optional flag indicators about the stream

     __C declaration:__ @flags@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: optional activation time in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numElems@ /(input)/__]: optional element count for burst control

     __C declaration:__ @numElems@
     -}
  -> IO FC.CInt
soapySDRDevice_activateStream =
  hs_bindgen_72daa1234642badf

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_deactivateStream@
foreign import ccall safe "hs_bindgen_7bb9de2f6ac54e5e" hs_bindgen_7bb9de2f6ac54e5e ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> FC.CInt
  -> FC.CLLong
  -> IO FC.CInt

{-| Deactivate a stream. Call deactivate when not using using read/write(). The implementation control switches or halt data flow.

  The timeNs is only valid when the flags have SOAPY_SDR_HAS_TIME. Not all implementations will support the full range of options. In this case, the implementation returns SOAPY_SDR_NOT_SUPPORTED.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@flags@ /(input)/__]: optional flag indicators about the stream

  [__@timeNs@ /(input)/__]: optional deactivation time in nanoseconds

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_deactivateStream@

__defined at:__ @SoapySDR\/Device.h:370:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_deactivateStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> FC.CInt
     {- ^

        [__@flags@ /(input)/__]: optional flag indicators about the stream

     __C declaration:__ @flags@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: optional deactivation time in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> IO FC.CInt
soapySDRDevice_deactivateStream =
  hs_bindgen_7bb9de2f6ac54e5e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readStream@
foreign import ccall safe "hs_bindgen_499eb89b40b083e4" hs_bindgen_499eb89b40b083e4 ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> HsBindgen.Runtime.ConstPtr.ConstPtr (Ptr.Ptr Void)
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CInt
  -> Ptr.Ptr FC.CLLong
  -> FC.CLong
  -> IO FC.CInt

{-| Read elements from a stream for reception. This is a multi-channel call, and buffs should be an array of void *, where each pointer will be filled with data from a different channel.

  **Client code compatibility:** The readStream() call should be well defined at all times, including prior to activation and after deactivation. When inactive, readStream() should implement the timeout specified by the caller and return SOAPY_SDR_TIMEOUT.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

  [__@numElems@ /(input)/__]: the number of elements in each buffer

  [__@flags@ /(output)/__]: optional flag indicators about the result

  [__@timeNs@ /(output)/__]: the buffer's timestamp in nanoseconds

  [__@timeoutUs@ /(input)/__]: the timeout in microseconds

  __returns:__ the number of elements read per buffer or error code

__C declaration:__ @SoapySDRDevice_readStream@

__defined at:__ @SoapySDR\/Device.h:395:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr (Ptr.Ptr Void)
     {- ^

        [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

     __C declaration:__ @buffs@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numElems@ /(input)/__]: the number of elements in each buffer

     __C declaration:__ @numElems@
     -}
  -> Ptr.Ptr FC.CInt
     {- ^

        [__@flags@ /(output)/__]: optional flag indicators about the result

     __C declaration:__ @flags@
     -}
  -> Ptr.Ptr FC.CLLong
     {- ^

        [__@timeNs@ /(output)/__]: the buffer's timestamp in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: the timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO FC.CInt
soapySDRDevice_readStream =
  hs_bindgen_499eb89b40b083e4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeStream@
foreign import ccall safe "hs_bindgen_5b1c1c16ec0bcb8c" hs_bindgen_5b1c1c16ec0bcb8c ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CInt
  -> FC.CLLong
  -> FC.CLong
  -> IO FC.CInt

{-| Write elements to a stream for transmission. This is a multi-channel call, and buffs should be an array of void *, where each pointer will be filled with data for a different channel.

  **Client code compatibility:** Client code relies on writeStream() for proper back-pressure. The writeStream() implementation must enforce the timeout such that the call blocks until space becomes available or timeout expiration.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

  [__@numElems@ /(input)/__]: the number of elements in each buffer

  [__@flags@ /(input,output)/__]: optional input flags and output flags

  [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

  [__@timeoutUs@ /(input)/__]: the timeout in microseconds

  __returns:__ the number of elements written per buffer or error

__C declaration:__ @SoapySDRDevice_writeStream@

__defined at:__ @SoapySDR\/Device.h:423:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeStream ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)
     {- ^

        [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

     __C declaration:__ @buffs@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numElems@ /(input)/__]: the number of elements in each buffer

     __C declaration:__ @numElems@
     -}
  -> Ptr.Ptr FC.CInt
     {- ^

        [__@flags@ /(input,output)/__]: optional input flags and output flags

     __C declaration:__ @flags@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: the timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO FC.CInt
soapySDRDevice_writeStream =
  hs_bindgen_5b1c1c16ec0bcb8c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readStreamStatus@
foreign import ccall safe "hs_bindgen_31f7f1e3321f20bb" hs_bindgen_31f7f1e3321f20bb ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CInt
  -> Ptr.Ptr FC.CLLong
  -> FC.CLong
  -> IO FC.CInt

{-| Readback status information about a stream. This call is typically used on a transmit stream to report time errors, underflows, and burst completion.

  **Client code compatibility:** Client code may continually poll readStreamStatus() in a loop. Implementations of readStreamStatus() should wait in the call for a status change event or until the timeout expiration. When stream status is not implemented on a particular stream, readStreamStatus() should return SOAPY_SDR_NOT_SUPPORTED. Client code may use this indication to disable a polling loop.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@chanMask@ /(input)/__]: to which channels this status applies

  [__@flags@ /(input)/__]: optional input flags and output flags

  [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

  [__@timeoutUs@ /(input)/__]: the timeout in microseconds

  __returns:__ 0 for success or error code like timeout

__C declaration:__ @SoapySDRDevice_readStreamStatus@

__defined at:__ @SoapySDR\/Device.h:452:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readStreamStatus ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@chanMask@ /(input)/__]: to which channels this status applies

     __C declaration:__ @chanMask@
     -}
  -> Ptr.Ptr FC.CInt
     {- ^

        [__@flags@ /(input)/__]: optional input flags and output flags

     __C declaration:__ @flags@
     -}
  -> Ptr.Ptr FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: the timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO FC.CInt
soapySDRDevice_readStreamStatus =
  hs_bindgen_31f7f1e3321f20bb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getNumDirectAccessBuffers@
foreign import ccall safe "hs_bindgen_35f84e588b59b0df" hs_bindgen_35f84e588b59b0df ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> IO HsBindgen.Runtime.Prelude.CSize

{-| How many direct access buffers can the stream provide? This is the number of times the user can call acquire() on a stream without making subsequent calls to release(). A return value of 0 means that direct access is not supported.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ the number of direct access buffers or 0

__C declaration:__ @SoapySDRDevice_getNumDirectAccessBuffers@

__defined at:__ @SoapySDR\/Device.h:473:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNumDirectAccessBuffers ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> IO HsBindgen.Runtime.Prelude.CSize
soapySDRDevice_getNumDirectAccessBuffers =
  hs_bindgen_35f84e588b59b0df

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getDirectAccessBufferAddrs@
foreign import ccall safe "hs_bindgen_2044750c2e2e63ab" hs_bindgen_2044750c2e2e63ab ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr (Ptr.Ptr Void)
  -> IO FC.CInt

{-| Get the buffer addresses for a scatter/gather table entry. When the underlying DMA implementation uses scatter/gather then this call provides the user addresses for that table.

  Example: The caller may query the DMA memory addresses once after stream creation to pre-allocate a re-usable ring-buffer.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: an index value between 0 and num direct buffers - 1

  [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

  __returns:__ 0 for success or error code when not supported

__C declaration:__ @SoapySDRDevice_getDirectAccessBufferAddrs@

__defined at:__ @SoapySDR\/Device.h:489:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDirectAccessBufferAddrs ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@handle@ /(input)/__]: an index value between 0 and num direct buffers - 1

     __C declaration:__ @handle@
     -}
  -> Ptr.Ptr (Ptr.Ptr Void)
     {- ^

        [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

     __C declaration:__ @buffs@
     -}
  -> IO FC.CInt
soapySDRDevice_getDirectAccessBufferAddrs =
  hs_bindgen_2044750c2e2e63ab

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_acquireReadBuffer@
foreign import ccall safe "hs_bindgen_a3841b91ccd709f9" hs_bindgen_a3841b91ccd709f9 ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)
  -> Ptr.Ptr FC.CInt
  -> Ptr.Ptr FC.CLLong
  -> FC.CLong
  -> IO FC.CInt

{-| Acquire direct buffers from a receive stream. This call is part of the direct buffer access API.

  The buffs array will be filled with a stream pointer for each channel. Each pointer can be read up to the number of return value elements.

  The handle will be set by the implementation so that the caller may later release access to the buffers with releaseReadBuffer(). Handle represents an index into the internal scatter/gather table such that handle is between 0 and num direct buffers - 1.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: an index value used in the release() call

  [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

  [__@flags@ /(input)/__]: optional flag indicators about the result

  [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

  [__@timeoutUs@ /(input)/__]: the timeout in microseconds

  __returns:__ the number of elements read per buffer or error code

__C declaration:__ @SoapySDRDevice_acquireReadBuffer@

__defined at:__ @SoapySDR\/Device.h:512:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_acquireReadBuffer ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@handle@ /(input)/__]: an index value used in the release() call

     __C declaration:__ @handle@
     -}
  -> Ptr.Ptr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)
     {- ^

        [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

     __C declaration:__ @buffs@
     -}
  -> Ptr.Ptr FC.CInt
     {- ^

        [__@flags@ /(input)/__]: optional flag indicators about the result

     __C declaration:__ @flags@
     -}
  -> Ptr.Ptr FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: the timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO FC.CInt
soapySDRDevice_acquireReadBuffer =
  hs_bindgen_a3841b91ccd709f9

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_releaseReadBuffer@
foreign import ccall safe "hs_bindgen_9744a88f4109eefb" hs_bindgen_9744a88f4109eefb ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO ()

{-| Release an acquired buffer back to the receive stream. This call is part of the direct buffer access API.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: the opaque handle from the acquire() call

__C declaration:__ @SoapySDRDevice_releaseReadBuffer@

__defined at:__ @SoapySDR\/Device.h:528:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_releaseReadBuffer ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@handle@ /(input)/__]: the opaque handle from the acquire() call

     __C declaration:__ @handle@
     -}
  -> IO ()
soapySDRDevice_releaseReadBuffer =
  hs_bindgen_9744a88f4109eefb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_acquireWriteBuffer@
foreign import ccall safe "hs_bindgen_26b18d1bb25639eb" hs_bindgen_26b18d1bb25639eb ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr (Ptr.Ptr Void)
  -> FC.CLong
  -> IO FC.CInt

{-| Acquire direct buffers from a transmit stream. This call is part of the direct buffer access API.

  The buffs array will be filled with a stream pointer for each channel. Each pointer can be written up to the number of return value elements.

  The handle will be set by the implementation so that the caller may later release access to the buffers with releaseWriteBuffer(). Handle represents an index into the internal scatter/gather table such that handle is between 0 and num direct buffers - 1.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: an index value used in the release() call

  [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

  [__@timeoutUs@ /(input)/__]: the timeout in microseconds

  __returns:__ the number of available elements per buffer or error

__C declaration:__ @SoapySDRDevice_acquireWriteBuffer@

__defined at:__ @SoapySDR\/Device.h:551:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_acquireWriteBuffer ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@handle@ /(input)/__]: an index value used in the release() call

     __C declaration:__ @handle@
     -}
  -> Ptr.Ptr (Ptr.Ptr Void)
     {- ^

        [__@buffs@ /(input)/__]: an array of void* buffers num chans in size

     __C declaration:__ @buffs@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: the timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO FC.CInt
soapySDRDevice_acquireWriteBuffer =
  hs_bindgen_26b18d1bb25639eb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_releaseWriteBuffer@
foreign import ccall safe "hs_bindgen_77d5be79bb6b5112" hs_bindgen_77d5be79bb6b5112 ::
     Ptr.Ptr SoapySDRDevice
  -> Ptr.Ptr SoapySDRStream
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CInt
  -> FC.CLLong
  -> IO ()

{-| Release an acquired buffer back to the transmit stream. This call is part of the direct buffer access API.

  Stream meta-data is provided as part of the release call, and not the acquire call so that the caller may acquire buffers without committing to the contents of the meta-data, which can be determined by the user as the buffers are filled.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: the opaque handle from the acquire() call

  [__@numElems@ /(input)/__]: the number of elements written to each buffer

  [__@flags@ /(input)/__]: optional input flags and output flags

  [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

__C declaration:__ @SoapySDRDevice_releaseWriteBuffer@

__defined at:__ @SoapySDR\/Device.h:573:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_releaseWriteBuffer ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr SoapySDRStream
     {- ^

        [__@stream@ /(input)/__]: the opaque pointer to a stream handle

     __C declaration:__ @stream@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@handle@ /(input)/__]: the opaque handle from the acquire() call

     __C declaration:__ @handle@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numElems@ /(input)/__]: the number of elements written to each buffer

     __C declaration:__ @numElems@
     -}
  -> Ptr.Ptr FC.CInt
     {- ^

        [__@flags@ /(input)/__]: optional input flags and output flags

     __C declaration:__ @flags@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: the buffer's timestamp in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> IO ()
soapySDRDevice_releaseWriteBuffer =
  hs_bindgen_77d5be79bb6b5112

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listAntennas@
foreign import ccall safe "hs_bindgen_6188e7101e9d26bc" hs_bindgen_6188e7101e9d26bc ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Get a list of available antennas to select on a given chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of antenna names

  __returns:__ a list of available antenna names

__C declaration:__ @SoapySDRDevice_listAntennas@

__defined at:__ @SoapySDR\/Device.h:592:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listAntennas ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of antenna names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listAntennas =
  hs_bindgen_6188e7101e9d26bc

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setAntenna@
foreign import ccall safe "hs_bindgen_7c9a2f56d2b8ca42" hs_bindgen_7c9a2f56d2b8ca42 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set the selected antenna on a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of an available antenna

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setAntenna@

__defined at:__ @SoapySDR\/Device.h:602:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setAntenna ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of an available antenna

     __C declaration:__ @name@
     -}
  -> IO FC.CInt
soapySDRDevice_setAntenna =
  hs_bindgen_7c9a2f56d2b8ca42

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getAntenna@
foreign import ccall safe "hs_bindgen_3afa11406aa64788" hs_bindgen_3afa11406aa64788 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr FC.CChar)

{-| Get the selected antenna on a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the name of an available antenna

__C declaration:__ @SoapySDRDevice_getAntenna@

__defined at:__ @SoapySDR\/Device.h:611:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getAntenna ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getAntenna =
  hs_bindgen_3afa11406aa64788

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasDCOffsetMode@
foreign import ccall safe "hs_bindgen_f351e0a472412975" hs_bindgen_f351e0a472412975 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support automatic DC offset corrections?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if automatic corrections are supported

__C declaration:__ @SoapySDRDevice_hasDCOffsetMode@

__defined at:__ @SoapySDR\/Device.h:624:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasDCOffsetMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasDCOffsetMode =
  hs_bindgen_f351e0a472412975

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setDCOffsetMode@
foreign import ccall safe "hs_bindgen_e6ada57702ad1c30" hs_bindgen_e6ada57702ad1c30 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CBool
  -> IO FC.CInt

{-| Set the automatic DC offset corrections mode.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@automatic@ /(input)/__]: true for automatic offset correction

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setDCOffsetMode@

__defined at:__ @SoapySDR\/Device.h:634:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setDCOffsetMode ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CBool
     {- ^

        [__@automatic@ /(input)/__]: true for automatic offset correction

     __C declaration:__ @automatic@
     -}
  -> IO FC.CInt
soapySDRDevice_setDCOffsetMode =
  hs_bindgen_e6ada57702ad1c30

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getDCOffsetMode@
foreign import ccall safe "hs_bindgen_e8f78d0e3be6b5fd" hs_bindgen_e8f78d0e3be6b5fd ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Get the automatic DC offset corrections mode.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic offset correction

__C declaration:__ @SoapySDRDevice_getDCOffsetMode@

__defined at:__ @SoapySDR\/Device.h:643:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDCOffsetMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_getDCOffsetMode =
  hs_bindgen_e8f78d0e3be6b5fd

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasDCOffset@
foreign import ccall safe "hs_bindgen_e41b7979c2d9a403" hs_bindgen_e41b7979c2d9a403 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support frontend DC offset correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if DC offset corrections are supported

__C declaration:__ @SoapySDRDevice_hasDCOffset@

__defined at:__ @SoapySDR\/Device.h:652:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasDCOffset ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasDCOffset =
  hs_bindgen_e41b7979c2d9a403

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setDCOffset@
foreign import ccall safe "hs_bindgen_80f220220aafcefe" hs_bindgen_80f220220aafcefe ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the frontend DC offset correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@offsetI@ /(input)/__]: the relative correction (1.0 max)

  [__@offsetQ@ /(input)/__]: the relative correction (1.0 max)

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setDCOffset@

__defined at:__ @SoapySDR\/Device.h:663:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setDCOffset ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@offsetI@ /(input)/__]: the relative correction (1.0 max)

     __C declaration:__ @offsetI@
     -}
  -> FC.CDouble
     {- ^

        [__@offsetQ@ /(input)/__]: the relative correction (1.0 max)

     __C declaration:__ @offsetQ@
     -}
  -> IO FC.CInt
soapySDRDevice_setDCOffset =
  hs_bindgen_80f220220aafcefe

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getDCOffset@
foreign import ccall safe "hs_bindgen_417a0256d5a46807" hs_bindgen_417a0256d5a46807 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CDouble
  -> Ptr.Ptr FC.CDouble
  -> IO FC.CInt

{-| Get the frontend DC offset correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@offsetI@ /(output)/__]: the relative correction (1.0 max)

  [__@offsetQ@ /(output)/__]: the relative correction (1.0 max)

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_getDCOffset@

__defined at:__ @SoapySDR\/Device.h:674:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDCOffset ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr FC.CDouble
     {- ^

        [__@offsetI@ /(output)/__]: the relative correction (1.0 max)

     __C declaration:__ @offsetI@
     -}
  -> Ptr.Ptr FC.CDouble
     {- ^

        [__@offsetQ@ /(output)/__]: the relative correction (1.0 max)

     __C declaration:__ @offsetQ@
     -}
  -> IO FC.CInt
soapySDRDevice_getDCOffset =
  hs_bindgen_417a0256d5a46807

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasIQBalance@
foreign import ccall safe "hs_bindgen_7f1cdf034703191b" hs_bindgen_7f1cdf034703191b ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support frontend IQ balance correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if IQ balance corrections are supported

__C declaration:__ @SoapySDRDevice_hasIQBalance@

__defined at:__ @SoapySDR\/Device.h:683:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasIQBalance ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasIQBalance =
  hs_bindgen_7f1cdf034703191b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setIQBalance@
foreign import ccall safe "hs_bindgen_919a4eb9c2a57219" hs_bindgen_919a4eb9c2a57219 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the frontend IQ balance correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@balanceI@ /(input)/__]: the relative correction (1.0 max)

  [__@balanceQ@ /(input)/__]: the relative correction (1.0 max)

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setIQBalance@

__defined at:__ @SoapySDR\/Device.h:694:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setIQBalance ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@balanceI@ /(input)/__]: the relative correction (1.0 max)

     __C declaration:__ @balanceI@
     -}
  -> FC.CDouble
     {- ^

        [__@balanceQ@ /(input)/__]: the relative correction (1.0 max)

     __C declaration:__ @balanceQ@
     -}
  -> IO FC.CInt
soapySDRDevice_setIQBalance =
  hs_bindgen_919a4eb9c2a57219

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getIQBalance@
foreign import ccall safe "hs_bindgen_3d0dca38fc12b8a1" hs_bindgen_3d0dca38fc12b8a1 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr FC.CDouble
  -> Ptr.Ptr FC.CDouble
  -> IO FC.CInt

{-| Get the frontend IQ balance correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@balanceI@ /(output)/__]: the relative correction (1.0 max)

  [__@balanceQ@ /(output)/__]: the relative correction (1.0 max)

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_getIQBalance@

__defined at:__ @SoapySDR\/Device.h:705:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getIQBalance ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr FC.CDouble
     {- ^

        [__@balanceI@ /(output)/__]: the relative correction (1.0 max)

     __C declaration:__ @balanceI@
     -}
  -> Ptr.Ptr FC.CDouble
     {- ^

        [__@balanceQ@ /(output)/__]: the relative correction (1.0 max)

     __C declaration:__ @balanceQ@
     -}
  -> IO FC.CInt
soapySDRDevice_getIQBalance =
  hs_bindgen_3d0dca38fc12b8a1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasIQBalanceMode@
foreign import ccall safe "hs_bindgen_d0f8a1fca58a8b2e" hs_bindgen_d0f8a1fca58a8b2e ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support automatic frontend IQ balance correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if automatic IQ balance corrections are supported

__C declaration:__ @SoapySDRDevice_hasIQBalanceMode@

__defined at:__ @SoapySDR\/Device.h:714:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasIQBalanceMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasIQBalanceMode =
  hs_bindgen_d0f8a1fca58a8b2e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setIQBalanceMode@
foreign import ccall safe "hs_bindgen_1805781bb9baac24" hs_bindgen_1805781bb9baac24 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CBool
  -> IO FC.CInt

{-| Set the automatic frontend IQ balance correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@automatic@ /(input)/__]: true for automatic correction

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_setIQBalanceMode@

__defined at:__ @SoapySDR\/Device.h:724:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setIQBalanceMode ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CBool
     {- ^

        [__@automatic@ /(input)/__]: true for automatic correction

     __C declaration:__ @automatic@
     -}
  -> IO FC.CInt
soapySDRDevice_setIQBalanceMode =
  hs_bindgen_1805781bb9baac24

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getIQBalanceMode@
foreign import ccall safe "hs_bindgen_fdcee5a5d54a4912" hs_bindgen_fdcee5a5d54a4912 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Get the automatic frontend IQ balance corrections mode.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic correction

__C declaration:__ @SoapySDRDevice_getIQBalanceMode@

__defined at:__ @SoapySDR\/Device.h:733:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getIQBalanceMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_getIQBalanceMode =
  hs_bindgen_fdcee5a5d54a4912

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasFrequencyCorrection@
foreign import ccall safe "hs_bindgen_d7a23913fa3bac71" hs_bindgen_d7a23913fa3bac71 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support frontend frequency correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if frequency corrections are supported

__C declaration:__ @SoapySDRDevice_hasFrequencyCorrection@

__defined at:__ @SoapySDR\/Device.h:742:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasFrequencyCorrection ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasFrequencyCorrection =
  hs_bindgen_d7a23913fa3bac71

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setFrequencyCorrection@
foreign import ccall safe "hs_bindgen_eb93856844f1ae54" hs_bindgen_eb93856844f1ae54 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> IO FC.CInt

{-| Fine tune the frontend frequency correction.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@value@ /(input)/__]: the correction in PPM

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setFrequencyCorrection@

__defined at:__ @SoapySDR\/Device.h:752:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setFrequencyCorrection ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@value@ /(input)/__]: the correction in PPM

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_setFrequencyCorrection =
  hs_bindgen_eb93856844f1ae54

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequencyCorrection@
foreign import ccall safe "hs_bindgen_7a92c962dfdf4688" hs_bindgen_7a92c962dfdf4688 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CDouble

{-| Get the frontend frequency correction value.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the correction value in PPM

__C declaration:__ @SoapySDRDevice_getFrequencyCorrection@

__defined at:__ @SoapySDR\/Device.h:761:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyCorrection ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CDouble
soapySDRDevice_getFrequencyCorrection =
  hs_bindgen_7a92c962dfdf4688

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listGains@
foreign import ccall safe "hs_bindgen_4e23ba88e9cd4d33" hs_bindgen_4e23ba88e9cd4d33 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| List available amplification elements. Elements should be in order RF to baseband.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel

  [__@length@ /(output)/__]: the number of gain names

  __returns:__ a list of gain string names

__C declaration:__ @SoapySDRDevice_listGains@

__defined at:__ @SoapySDR\/Device.h:776:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listGains ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of gain names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listGains =
  hs_bindgen_4e23ba88e9cd4d33

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasGainMode@
foreign import ccall safe "hs_bindgen_5f0eeb52d7064d8d" hs_bindgen_5f0eeb52d7064d8d ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Does the device support automatic gain control?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic gain control

__C declaration:__ @SoapySDRDevice_hasGainMode@

__defined at:__ @SoapySDR\/Device.h:785:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasGainMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_hasGainMode =
  hs_bindgen_5f0eeb52d7064d8d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setGainMode@
foreign import ccall safe "hs_bindgen_69a24f7ed671d064" hs_bindgen_69a24f7ed671d064 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CBool
  -> IO FC.CInt

{-| Set the automatic gain mode on the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@automatic@ /(input)/__]: true for automatic gain setting

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setGainMode@

__defined at:__ @SoapySDR\/Device.h:795:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setGainMode ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CBool
     {- ^

        [__@automatic@ /(input)/__]: true for automatic gain setting

     __C declaration:__ @automatic@
     -}
  -> IO FC.CInt
soapySDRDevice_setGainMode =
  hs_bindgen_69a24f7ed671d064

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getGainMode@
foreign import ccall safe "hs_bindgen_fb1d391d2e1c5fdb" hs_bindgen_fb1d391d2e1c5fdb ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CBool

{-| Get the automatic gain mode on the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic gain setting

__C declaration:__ @SoapySDRDevice_getGainMode@

__defined at:__ @SoapySDR\/Device.h:804:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainMode ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CBool
soapySDRDevice_getGainMode =
  hs_bindgen_fb1d391d2e1c5fdb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setGain@
foreign import ccall safe "hs_bindgen_9351097a6c781377" hs_bindgen_9351097a6c781377 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the overall amplification in a chain. The gain will be distributed automatically across available element.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@value@ /(input)/__]: the new amplification value in dB

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setGain@

__defined at:__ @SoapySDR\/Device.h:815:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setGain ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@value@ /(input)/__]: the new amplification value in dB

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_setGain = hs_bindgen_9351097a6c781377

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setGainElement@
foreign import ccall safe "hs_bindgen_6e71429de5deb948" hs_bindgen_6e71429de5deb948 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the value of a amplification element in a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of an amplification element

  [__@value@ /(input)/__]: the new amplification value in dB

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setGainElement@

__defined at:__ @SoapySDR\/Device.h:826:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setGainElement ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of an amplification element

     __C declaration:__ @name@
     -}
  -> FC.CDouble
     {- ^

        [__@value@ /(input)/__]: the new amplification value in dB

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_setGainElement =
  hs_bindgen_6e71429de5deb948

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getGain@
foreign import ccall safe "hs_bindgen_d7a26503eb383e01" hs_bindgen_d7a26503eb383e01 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CDouble

{-| Get the overall value of the gain elements in a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the value of the gain in dB

__C declaration:__ @SoapySDRDevice_getGain@

__defined at:__ @SoapySDR\/Device.h:835:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGain ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CDouble
soapySDRDevice_getGain = hs_bindgen_d7a26503eb383e01

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getGainElement@
foreign import ccall safe "hs_bindgen_5d4bc3ca3e892416" hs_bindgen_5d4bc3ca3e892416 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CDouble

{-| Get the value of an individual amplification element in a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of an amplification element

  __returns:__ the value of the gain in dB

__C declaration:__ @SoapySDRDevice_getGainElement@

__defined at:__ @SoapySDR\/Device.h:845:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainElement ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of an amplification element

     __C declaration:__ @name@
     -}
  -> IO FC.CDouble
soapySDRDevice_getGainElement =
  hs_bindgen_5d4bc3ca3e892416

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getGainRange@
foreign import ccall safe "hs_bindgen_d60bd40b5f5419a0" hs_bindgen_d60bd40b5f5419a0 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr SoapySDRRange
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getGainRange'
-}
soapySDRDevice_getGainRange_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr SoapySDRRange
  -> IO ()
soapySDRDevice_getGainRange_wrapper =
  hs_bindgen_d60bd40b5f5419a0

{-| Get the overall range of possible gain values.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the range of possible gain values for this channel in dB

__C declaration:__ @SoapySDRDevice_getGainRange@

__defined at:__ @SoapySDR\/Device.h:854:29@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainRange ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO SoapySDRRange
soapySDRDevice_getGainRange =
  \x0 ->
    \x1 ->
      \x2 ->
        HsBindgen.Runtime.CAPI.allocaAndPeek (\z3 ->
                                                hs_bindgen_d60bd40b5f5419a0 x0 x1 x2 z3)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getGainElementRange@
foreign import ccall safe "hs_bindgen_28e99dd4acbe54f6" hs_bindgen_28e99dd4acbe54f6 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRRange
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getGainElementRange'
-}
soapySDRDevice_getGainElementRange_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of an amplification element

     __C declaration:__ @name@
     -}
  -> Ptr.Ptr SoapySDRRange
  -> IO ()
soapySDRDevice_getGainElementRange_wrapper =
  hs_bindgen_28e99dd4acbe54f6

{-| Get the range of possible gain values for a specific element.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of an amplification element

  __returns:__ the range of possible gain values for the specified amplification element in dB

__C declaration:__ @SoapySDRDevice_getGainElementRange@

__defined at:__ @SoapySDR\/Device.h:864:29@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainElementRange ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of an amplification element

     __C declaration:__ @name@
     -}
  -> IO SoapySDRRange
soapySDRDevice_getGainElementRange =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          HsBindgen.Runtime.CAPI.allocaAndPeek (\z4 ->
                                                  hs_bindgen_28e99dd4acbe54f6 x0 x1 x2 x3 z4)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setFrequency@
foreign import ccall safe "hs_bindgen_48b11435354fc965" hs_bindgen_48b11435354fc965 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> IO FC.CInt

{-| Set the center frequency of the chain. - For RX, this specifies the down-conversion frequency. - For TX, this specifies the up-conversion frequency.

  The default implementation of setFrequency() will tune the "RF" component as close as possible to the requested center frequency. Tuning inaccuracies will be compensated for with the "BB" component.

  The args can be used to augment the tuning algorithm.

  * Use "OFFSET" to specify an "RF" tuning offset, usually with the intention of moving the LO out of the passband. The offset will be compensated for using the "BB" component.

  * Use the name of a component for the key and a frequency in Hz as the value (any format) to enforce a specific frequency. The other components will be tuned with compensation to achieve the specified overall frequency.

  * Use the name of a component for the key and the value "IGNORE" so that the tuning algorithm will avoid altering the component.

  * Vendor specific implementations can also use the same args to augment tuning in other ways such as specifying fractional vs integer N tuning.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@frequency@ /(input)/__]: the center frequency in Hz

  [__@args@ /(input)/__]: optional tuner arguments

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setFrequency@

__defined at:__ @SoapySDR\/Device.h:899:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setFrequency ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@frequency@ /(input)/__]: the center frequency in Hz

     __C declaration:__ @frequency@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@args@ /(input)/__]: optional tuner arguments

     __C declaration:__ @args@
     -}
  -> IO FC.CInt
soapySDRDevice_setFrequency =
  hs_bindgen_48b11435354fc965

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setFrequencyComponent@
foreign import ccall safe "hs_bindgen_b7099499a1741321" hs_bindgen_b7099499a1741321 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CDouble
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
  -> IO FC.CInt

{-| Tune the center frequency of the specified element. - For RX, this specifies the down-conversion frequency. - For TX, this specifies the up-conversion frequency.

  Recommended names used to represent tunable components:

  * "CORR" - freq error correction in PPM

  * "RF" - frequency of the RF frontend

  * "BB" - frequency of the baseband DSP

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of a tunable element

  [__@frequency@ /(input)/__]: the center frequency in Hz

  [__@args@ /(input)/__]: optional tuner arguments

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setFrequencyComponent@

__defined at:__ @SoapySDR\/Device.h:919:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setFrequencyComponent ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a tunable element

     __C declaration:__ @name@
     -}
  -> FC.CDouble
     {- ^

        [__@frequency@ /(input)/__]: the center frequency in Hz

     __C declaration:__ @frequency@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs
     {- ^

        [__@args@ /(input)/__]: optional tuner arguments

     __C declaration:__ @args@
     -}
  -> IO FC.CInt
soapySDRDevice_setFrequencyComponent =
  hs_bindgen_b7099499a1741321

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequency@
foreign import ccall safe "hs_bindgen_d74d2900ae67fe55" hs_bindgen_d74d2900ae67fe55 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CDouble

{-| Get the overall center frequency of the chain. - For RX, this specifies the down-conversion frequency. - For TX, this specifies the up-conversion frequency.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the center frequency in Hz

__C declaration:__ @SoapySDRDevice_getFrequency@

__defined at:__ @SoapySDR\/Device.h:930:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequency ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CDouble
soapySDRDevice_getFrequency =
  hs_bindgen_d74d2900ae67fe55

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequencyComponent@
foreign import ccall safe "hs_bindgen_4d54796c75cd8d10" hs_bindgen_4d54796c75cd8d10 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CDouble

{-| Get the frequency of a tunable element in the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of a tunable element

  __returns:__ the tunable element's frequency in Hz

__C declaration:__ @SoapySDRDevice_getFrequencyComponent@

__defined at:__ @SoapySDR\/Device.h:940:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyComponent ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a tunable element

     __C declaration:__ @name@
     -}
  -> IO FC.CDouble
soapySDRDevice_getFrequencyComponent =
  hs_bindgen_4d54796c75cd8d10

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listFrequencies@
foreign import ccall safe "hs_bindgen_36800e494de75b0c" hs_bindgen_36800e494de75b0c ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| List available tunable elements in the chain. Elements should be in order RF to baseband.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel

  [__@length@ /(output)/__]: the number names

  __returns:__ a list of tunable elements by name

__C declaration:__ @SoapySDRDevice_listFrequencies@

__defined at:__ @SoapySDR\/Device.h:951:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listFrequencies ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listFrequencies =
  hs_bindgen_36800e494de75b0c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequencyRange@
foreign import ccall safe "hs_bindgen_f0677c9a5111069a" hs_bindgen_f0677c9a5111069a ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of overall frequency values.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of ranges

  __returns:__ a list of frequency ranges in Hz

__C declaration:__ @SoapySDRDevice_getFrequencyRange@

__defined at:__ @SoapySDR\/Device.h:961:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyRange ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of ranges

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getFrequencyRange =
  hs_bindgen_f0677c9a5111069a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequencyRangeComponent@
foreign import ccall safe "hs_bindgen_e84069a0fd4c9bcb" hs_bindgen_e84069a0fd4c9bcb ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of tunable values for the specified element.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@name@ /(input)/__]: the name of a tunable element

  [__@length@ /(output)/__]: the number of ranges

  __returns:__ a list of frequency ranges in Hz

__C declaration:__ @SoapySDRDevice_getFrequencyRangeComponent@

__defined at:__ @SoapySDR\/Device.h:972:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyRangeComponent ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a tunable element

     __C declaration:__ @name@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of ranges

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getFrequencyRangeComponent =
  hs_bindgen_e84069a0fd4c9bcb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getFrequencyArgsInfo@
foreign import ccall safe "hs_bindgen_bdc0845f2de8d930" hs_bindgen_bdc0845f2de8d930 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRArgInfo)

{-| Query the argument info description for tune args.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of argument infos

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getFrequencyArgsInfo@

__defined at:__ @SoapySDR\/Device.h:982:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyArgsInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of argument infos

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRArgInfo)
soapySDRDevice_getFrequencyArgsInfo =
  hs_bindgen_bdc0845f2de8d930

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setSampleRate@
foreign import ccall safe "hs_bindgen_3f1293abb17740dc" hs_bindgen_3f1293abb17740dc ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the baseband sample rate of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@rate@ /(input)/__]: the sample rate in samples per second

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setSampleRate@

__defined at:__ @SoapySDR\/Device.h:996:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setSampleRate ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@rate@ /(input)/__]: the sample rate in samples per second

     __C declaration:__ @rate@
     -}
  -> IO FC.CInt
soapySDRDevice_setSampleRate =
  hs_bindgen_3f1293abb17740dc

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getSampleRate@
foreign import ccall safe "hs_bindgen_7fc836e95ca08831" hs_bindgen_7fc836e95ca08831 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CDouble

{-| Get the baseband sample rate of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the sample rate in samples per second

__C declaration:__ @SoapySDRDevice_getSampleRate@

__defined at:__ @SoapySDR\/Device.h:1005:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSampleRate ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CDouble
soapySDRDevice_getSampleRate =
  hs_bindgen_7fc836e95ca08831

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listSampleRates@
foreign import ccall safe "hs_bindgen_c551e57fbe6cc748" hs_bindgen_c551e57fbe6cc748 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr FC.CDouble)

{-| Get the range of possible baseband sample rates.

  __deprecated:__ replaced by getSampleRateRange()

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of sample rates

  __returns:__ a list of possible rates in samples per second

__C declaration:__ @SoapySDRDevice_listSampleRates@

__defined at:__ @SoapySDR\/Device.h:1016:23@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listSampleRates ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sample rates

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr FC.CDouble)
soapySDRDevice_listSampleRates =
  hs_bindgen_c551e57fbe6cc748

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getSampleRateRange@
foreign import ccall safe "hs_bindgen_700e4155fe72c442" hs_bindgen_700e4155fe72c442 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of possible baseband sample rates.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of sample rates

  __returns:__ a list of sample rate ranges in samples per second

__C declaration:__ @SoapySDRDevice_getSampleRateRange@

__defined at:__ @SoapySDR\/Device.h:1026:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSampleRateRange ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sample rates

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getSampleRateRange =
  hs_bindgen_700e4155fe72c442

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setBandwidth@
foreign import ccall safe "hs_bindgen_6182fa530c523c08" hs_bindgen_6182fa530c523c08 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the baseband filter width of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@bw@ /(input)/__]: the baseband filter width in Hz

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setBandwidth@

__defined at:__ @SoapySDR\/Device.h:1040:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setBandwidth ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> FC.CDouble
     {- ^

        [__@bw@ /(input)/__]: the baseband filter width in Hz

     __C declaration:__ @bw@
     -}
  -> IO FC.CInt
soapySDRDevice_setBandwidth =
  hs_bindgen_6182fa530c523c08

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getBandwidth@
foreign import ccall safe "hs_bindgen_93d578453f13f821" hs_bindgen_93d578453f13f821 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CDouble

{-| Get the baseband filter width of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the baseband filter width in Hz

__C declaration:__ @SoapySDRDevice_getBandwidth@

__defined at:__ @SoapySDR\/Device.h:1049:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getBandwidth ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> IO FC.CDouble
soapySDRDevice_getBandwidth =
  hs_bindgen_93d578453f13f821

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listBandwidths@
foreign import ccall safe "hs_bindgen_1570bf7c8a441e1d" hs_bindgen_1570bf7c8a441e1d ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr FC.CDouble)

{-| Get the range of possible baseband filter widths.

  __deprecated:__ replaced by getBandwidthRange()

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of bandwidths

  __returns:__ a list of possible bandwidths in Hz

__C declaration:__ @SoapySDRDevice_listBandwidths@

__defined at:__ @SoapySDR\/Device.h:1060:23@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listBandwidths ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of bandwidths

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr FC.CDouble)
soapySDRDevice_listBandwidths =
  hs_bindgen_1570bf7c8a441e1d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getBandwidthRange@
foreign import ccall safe "hs_bindgen_96bd0b9d90ffa0ac" hs_bindgen_96bd0b9d90ffa0ac ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of possible baseband filter widths.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of ranges

  __returns:__ a list of bandwidth ranges in Hz

__C declaration:__ @SoapySDRDevice_getBandwidthRange@

__defined at:__ @SoapySDR\/Device.h:1070:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getBandwidthRange ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of ranges

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getBandwidthRange =
  hs_bindgen_96bd0b9d90ffa0ac

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setMasterClockRate@
foreign import ccall safe "hs_bindgen_e21e6526ce8e0ef7" hs_bindgen_e21e6526ce8e0ef7 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the master clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@rate@ /(input)/__]: the clock rate in Hz

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setMasterClockRate@

__defined at:__ @SoapySDR\/Device.h:1082:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setMasterClockRate ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CDouble
     {- ^

        [__@rate@ /(input)/__]: the clock rate in Hz

     __C declaration:__ @rate@
     -}
  -> IO FC.CInt
soapySDRDevice_setMasterClockRate =
  hs_bindgen_e21e6526ce8e0ef7

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getMasterClockRate@
foreign import ccall safe "hs_bindgen_446be5c5d9143453" hs_bindgen_446be5c5d9143453 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO FC.CDouble

{-| Get the master clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the clock rate in Hz

__C declaration:__ @SoapySDRDevice_getMasterClockRate@

__defined at:__ @SoapySDR\/Device.h:1089:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getMasterClockRate ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO FC.CDouble
soapySDRDevice_getMasterClockRate =
  hs_bindgen_446be5c5d9143453

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getMasterClockRates@
foreign import ccall safe "hs_bindgen_1c2ec08c1d68a1f7" hs_bindgen_1c2ec08c1d68a1f7 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of available master clock rates.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of ranges

  __returns:__ a list of clock rate ranges in Hz

__C declaration:__ @SoapySDRDevice_getMasterClockRates@

__defined at:__ @SoapySDR\/Device.h:1097:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getMasterClockRates ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of ranges

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getMasterClockRates =
  hs_bindgen_1c2ec08c1d68a1f7

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setReferenceClockRate@
foreign import ccall safe "hs_bindgen_7052b24583025cb6" hs_bindgen_7052b24583025cb6 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CDouble
  -> IO FC.CInt

{-| Set the reference clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@rate@ /(input)/__]: the clock rate in Hz

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setReferenceClockRate@

__defined at:__ @SoapySDR\/Device.h:1105:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setReferenceClockRate ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CDouble
     {- ^

        [__@rate@ /(input)/__]: the clock rate in Hz

     __C declaration:__ @rate@
     -}
  -> IO FC.CInt
soapySDRDevice_setReferenceClockRate =
  hs_bindgen_7052b24583025cb6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getReferenceClockRate@
foreign import ccall safe "hs_bindgen_a0966be185b827a2" hs_bindgen_a0966be185b827a2 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO FC.CDouble

{-| Get the reference clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the clock rate in Hz

__C declaration:__ @SoapySDRDevice_getReferenceClockRate@

__defined at:__ @SoapySDR\/Device.h:1112:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getReferenceClockRate ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO FC.CDouble
soapySDRDevice_getReferenceClockRate =
  hs_bindgen_a0966be185b827a2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getReferenceClockRates@
foreign import ccall safe "hs_bindgen_3f90e9c6850c3e5f" hs_bindgen_3f90e9c6850c3e5f ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRRange)

{-| Get the range of available reference clock rates.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of clock rate ranges in Hz

__C declaration:__ @SoapySDRDevice_getReferenceClockRates@

__defined at:__ @SoapySDR\/Device.h:1120:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getReferenceClockRates ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sources

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRRange)
soapySDRDevice_getReferenceClockRates =
  hs_bindgen_3f90e9c6850c3e5f

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listClockSources@
foreign import ccall safe "hs_bindgen_9cd97281cd487450" hs_bindgen_9cd97281cd487450 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Get the list of available clock sources.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of clock source names

__C declaration:__ @SoapySDRDevice_listClockSources@

__defined at:__ @SoapySDR\/Device.h:1128:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listClockSources ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sources

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listClockSources =
  hs_bindgen_9cd97281cd487450

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setClockSource@
foreign import ccall safe "hs_bindgen_65e3e9be0c62b614" hs_bindgen_65e3e9be0c62b614 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set the clock source on the device

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@source@ /(input)/__]: the name of a clock source

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setClockSource@

__defined at:__ @SoapySDR\/Device.h:1136:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setClockSource ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@source@ /(input)/__]: the name of a clock source

     __C declaration:__ @source@
     -}
  -> IO FC.CInt
soapySDRDevice_setClockSource =
  hs_bindgen_65e3e9be0c62b614

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getClockSource@
foreign import ccall safe "hs_bindgen_50391651bb7127ab" hs_bindgen_50391651bb7127ab ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO (Ptr.Ptr FC.CChar)

{-| Get the clock source of the device

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the name of a clock source

__C declaration:__ @SoapySDRDevice_getClockSource@

__defined at:__ @SoapySDR\/Device.h:1143:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getClockSource ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getClockSource =
  hs_bindgen_50391651bb7127ab

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listTimeSources@
foreign import ccall safe "hs_bindgen_e1d813ec36e29760" hs_bindgen_e1d813ec36e29760 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Get the list of available time sources.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of time source names

__C declaration:__ @SoapySDRDevice_listTimeSources@

__defined at:__ @SoapySDR\/Device.h:1155:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listTimeSources ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sources

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listTimeSources =
  hs_bindgen_e1d813ec36e29760

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setTimeSource@
foreign import ccall safe "hs_bindgen_e20aa73b91673d68" hs_bindgen_e20aa73b91673d68 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set the time source on the device

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@source@ /(input)/__]: the name of a time source

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setTimeSource@

__defined at:__ @SoapySDR\/Device.h:1163:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setTimeSource ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@source@ /(input)/__]: the name of a time source

     __C declaration:__ @source@
     -}
  -> IO FC.CInt
soapySDRDevice_setTimeSource =
  hs_bindgen_e20aa73b91673d68

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getTimeSource@
foreign import ccall safe "hs_bindgen_13aa23e61514599b" hs_bindgen_13aa23e61514599b ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO (Ptr.Ptr FC.CChar)

{-| Get the time source of the device

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the name of a time source

__C declaration:__ @SoapySDRDevice_getTimeSource@

__defined at:__ @SoapySDR\/Device.h:1170:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getTimeSource ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_getTimeSource =
  hs_bindgen_13aa23e61514599b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_hasHardwareTime@
foreign import ccall safe "hs_bindgen_d0cd7d9c4b0b2d65" hs_bindgen_d0cd7d9c4b0b2d65 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CBool

{-| Does this device have a hardware clock?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@what@ /(input)/__]: optional argument

  __returns:__ true if the hardware clock exists

__C declaration:__ @SoapySDRDevice_hasHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1178:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasHardwareTime ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@what@ /(input)/__]: optional argument

     __C declaration:__ @what@
     -}
  -> IO FC.CBool
soapySDRDevice_hasHardwareTime =
  hs_bindgen_d0cd7d9c4b0b2d65

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getHardwareTime@
foreign import ccall safe "hs_bindgen_c29c13cf49ebc76e" hs_bindgen_c29c13cf49ebc76e ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CLLong

{-| Read the time from the hardware clock on the device. The what argument can refer to a specific time counter.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@what@ /(input)/__]: optional argument

  __returns:__ the time in nanoseconds

__C declaration:__ @SoapySDRDevice_getHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1187:25@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareTime ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@what@ /(input)/__]: optional argument

     __C declaration:__ @what@
     -}
  -> IO FC.CLLong
soapySDRDevice_getHardwareTime =
  hs_bindgen_c29c13cf49ebc76e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setHardwareTime@
foreign import ccall safe "hs_bindgen_f945a3ef2aa6f37d" hs_bindgen_f945a3ef2aa6f37d ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CLLong
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Write the time to the hardware clock on the device. The what argument can refer to a specific time counter.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@timeNs@ /(input)/__]: time in nanoseconds

  [__@what@ /(input)/__]: optional argument

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_setHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1197:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setHardwareTime ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: time in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@what@ /(input)/__]: optional argument

     __C declaration:__ @what@
     -}
  -> IO FC.CInt
soapySDRDevice_setHardwareTime =
  hs_bindgen_f945a3ef2aa6f37d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_setCommandTime@
foreign import ccall safe "hs_bindgen_605b0addb9392908" hs_bindgen_605b0addb9392908 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CLLong
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Set the time of subsequent configuration calls. The what argument can refer to a specific command queue. Implementations may use a time of 0 to clear.

  __deprecated:__ replaced by setHardwareTime()

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@timeNs@ /(input)/__]: time in nanoseconds

  [__@what@ /(input)/__]: optional argument

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_setCommandTime@

__defined at:__ @SoapySDR\/Device.h:1209:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setCommandTime ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CLLong
     {- ^

        [__@timeNs@ /(input)/__]: time in nanoseconds

     __C declaration:__ @timeNs@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@what@ /(input)/__]: optional argument

     __C declaration:__ @what@
     -}
  -> IO FC.CInt
soapySDRDevice_setCommandTime =
  hs_bindgen_605b0addb9392908

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listSensors@
foreign import ccall safe "hs_bindgen_61e096838c3f8604" hs_bindgen_61e096838c3f8604 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| List the available global readback sensors. A sensor can represent a reference lock, RSSI, temperature.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of available sensor string names

__C declaration:__ @SoapySDRDevice_listSensors@

__defined at:__ @SoapySDR\/Device.h:1222:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listSensors ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sensor names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listSensors =
  hs_bindgen_61e096838c3f8604

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getSensorInfo@
foreign import ccall safe "hs_bindgen_d98705ca0eed5232" hs_bindgen_d98705ca0eed5232 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getSensorInfo'
-}
soapySDRDevice_getSensorInfo_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()
soapySDRDevice_getSensorInfo_wrapper =
  hs_bindgen_d98705ca0eed5232

{-| Get meta-information about a sensor. Example: displayable name, type, range.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ meta-information about a sensor

__C declaration:__ @SoapySDRDevice_getSensorInfo@

__defined at:__ @SoapySDR\/Device.h:1231:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSensorInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> IO SoapySDRArgInfo
soapySDRDevice_getSensorInfo =
  \x0 ->
    \x1 ->
      HsBindgen.Runtime.CAPI.allocaAndPeek (\z2 ->
                                              hs_bindgen_d98705ca0eed5232 x0 x1 z2)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readSensor@
foreign import ccall safe "hs_bindgen_c01c95f6e3dc8d9a" hs_bindgen_c01c95f6e3dc8d9a ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (Ptr.Ptr FC.CChar)

{-| Readback a global sensor given the name. The value returned is a string which can represent a boolean ("true"/"false"), an integer, or float.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ the current value of the sensor

__C declaration:__ @SoapySDRDevice_readSensor@

__defined at:__ @SoapySDR\/Device.h:1241:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readSensor ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readSensor =
  hs_bindgen_c01c95f6e3dc8d9a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listChannelSensors@
foreign import ccall safe "hs_bindgen_f9fb609a70df7cef" hs_bindgen_f9fb609a70df7cef ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| List the available channel readback sensors. A sensor can represent a reference lock, RSSI, temperature.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of available sensor string names

__C declaration:__ @SoapySDRDevice_listChannelSensors@

__defined at:__ @SoapySDR\/Device.h:1252:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listChannelSensors ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sensor names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listChannelSensors =
  hs_bindgen_f9fb609a70df7cef

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getChannelSensorInfo@
foreign import ccall safe "hs_bindgen_efad186af11557ef" hs_bindgen_efad186af11557ef ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getChannelSensorInfo'
-}
soapySDRDevice_getChannelSensorInfo_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()
soapySDRDevice_getChannelSensorInfo_wrapper =
  hs_bindgen_efad186af11557ef

{-| Get meta-information about a channel sensor. Example: displayable name, type, range.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ meta-information about a sensor

__C declaration:__ @SoapySDRDevice_getChannelSensorInfo@

__defined at:__ @SoapySDR\/Device.h:1263:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getChannelSensorInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> IO SoapySDRArgInfo
soapySDRDevice_getChannelSensorInfo =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          HsBindgen.Runtime.CAPI.allocaAndPeek (\z4 ->
                                                  hs_bindgen_efad186af11557ef x0 x1 x2 x3 z4)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readChannelSensor@
foreign import ccall safe "hs_bindgen_03431827c18b7a3d" hs_bindgen_03431827c18b7a3d ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (Ptr.Ptr FC.CChar)

{-| Readback a channel sensor given the name. The value returned is a string which can represent a boolean ("true"/"false"), an integer, or float.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ the current value of the sensor

__C declaration:__ @SoapySDRDevice_readChannelSensor@

__defined at:__ @SoapySDR\/Device.h:1275:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readChannelSensor ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the ID name of an available sensor

     __C declaration:__ @key@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readChannelSensor =
  hs_bindgen_03431827c18b7a3d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listRegisterInterfaces@
foreign import ccall safe "hs_bindgen_f18f0eaab38fd997" hs_bindgen_f18f0eaab38fd997 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Get a list of available register interfaces by name.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of interfaces

  __returns:__ a list of available register interfaces

__C declaration:__ @SoapySDRDevice_listRegisterInterfaces@

__defined at:__ @SoapySDR\/Device.h:1287:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listRegisterInterfaces ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of interfaces

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listRegisterInterfaces =
  hs_bindgen_f18f0eaab38fd997

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeRegister@
foreign import ccall safe "hs_bindgen_26fa6f6f6e3e5622" hs_bindgen_26fa6f6f6e3e5622 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> FC.CUInt
  -> IO FC.CInt

{-| Write a register on the device given the interface name. This can represent a register on a soft CPU, FPGA, IC; the interpretation is up the implementation to decide.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@name@ /(input)/__]: the name of a available register interface

  [__@addr@ /(input)/__]: the register address

  [__@value@ /(input)/__]: the register value

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeRegister@

__defined at:__ @SoapySDR\/Device.h:1299:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeRegister ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a available register interface

     __C declaration:__ @name@
     -}
  -> FC.CUInt
     {- ^

        [__@addr@ /(input)/__]: the register address

     __C declaration:__ @addr@
     -}
  -> FC.CUInt
     {- ^

        [__@value@ /(input)/__]: the register value

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_writeRegister =
  hs_bindgen_26fa6f6f6e3e5622

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readRegister@
foreign import ccall safe "hs_bindgen_41802e8f50d3e899" hs_bindgen_41802e8f50d3e899 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> IO FC.CUInt

{-| Read a register on the device given the interface name.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@name@ /(input)/__]: the name of a available register interface

  [__@addr@ /(input)/__]: the register address

  __returns:__ the register value

__C declaration:__ @SoapySDRDevice_readRegister@

__defined at:__ @SoapySDR\/Device.h:1308:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readRegister ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a available register interface

     __C declaration:__ @name@
     -}
  -> FC.CUInt
     {- ^

        [__@addr@ /(input)/__]: the register address

     __C declaration:__ @addr@
     -}
  -> IO FC.CUInt
soapySDRDevice_readRegister =
  hs_bindgen_41802e8f50d3e899

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeRegisters@
foreign import ccall safe "hs_bindgen_c4ff8c4bffbfbf7a" hs_bindgen_c4ff8c4bffbfbf7a ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CUInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| Write a memory block on the device given the interface name. This can represent a memory block on a soft CPU, FPGA, IC; the interpretation is up the implementation to decide.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@name@ /(input)/__]: the name of a available memory block interface

  [__@addr@ /(input)/__]: the memory block start address

  [__@value@ /(input)/__]: the memory block content

  [__@length@ /(input)/__]: the number of words in the block

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeRegisters@

__defined at:__ @SoapySDR\/Device.h:1321:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeRegisters ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a available memory block interface

     __C declaration:__ @name@
     -}
  -> FC.CUInt
     {- ^

        [__@addr@ /(input)/__]: the memory block start address

     __C declaration:__ @addr@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CUInt
     {- ^

        [__@value@ /(input)/__]: the memory block content

     __C declaration:__ @value@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(input)/__]: the number of words in the block

     __C declaration:__ @length@
     -}
  -> IO FC.CInt
soapySDRDevice_writeRegisters =
  hs_bindgen_c4ff8c4bffbfbf7a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readRegisters@
foreign import ccall safe "hs_bindgen_34ae45b873c3aadf" hs_bindgen_34ae45b873c3aadf ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr FC.CUInt)

{-| Read a memory block on the device given the interface name. Pass the number of words to be read in via length; length will be set to the number of actual words read.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@name@ /(input)/__]: the name of a available memory block interface

  [__@addr@ /(input)/__]: the memory block start address

  [__@length@ /(input,output)/__]: number of words to be read from memory block

  __returns:__ the memory block content

__C declaration:__ @SoapySDRDevice_readRegisters@

__defined at:__ @SoapySDR\/Device.h:1333:25@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readRegisters ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@name@ /(input)/__]: the name of a available memory block interface

     __C declaration:__ @name@
     -}
  -> FC.CUInt
     {- ^

        [__@addr@ /(input)/__]: the memory block start address

     __C declaration:__ @addr@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(input,output)/__]: number of words to be read from memory block

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr FC.CUInt)
soapySDRDevice_readRegisters =
  hs_bindgen_34ae45b873c3aadf

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getSettingInfo@
foreign import ccall safe "hs_bindgen_1cc778cd4955c72c" hs_bindgen_1cc778cd4955c72c ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRArgInfo)

{-| Describe the allowed keys and values used for settings.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getSettingInfo@

__defined at:__ @SoapySDR\/Device.h:1345:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSettingInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sensor names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRArgInfo)
soapySDRDevice_getSettingInfo =
  hs_bindgen_1cc778cd4955c72c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getSettingInfoWithKey@
foreign import ccall safe "hs_bindgen_98b9940edc4aaaf9" hs_bindgen_98b9940edc4aaaf9 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getSettingInfoWithKey'
-}
soapySDRDevice_getSettingInfoWithKey_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()
soapySDRDevice_getSettingInfoWithKey_wrapper =
  hs_bindgen_98b9940edc4aaaf9

{-| Get information on a specific setting.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getSettingInfoWithKey@

__defined at:__ @SoapySDR\/Device.h:1353:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSettingInfoWithKey ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> IO SoapySDRArgInfo
soapySDRDevice_getSettingInfoWithKey =
  \x0 ->
    \x1 ->
      HsBindgen.Runtime.CAPI.allocaAndPeek (\z2 ->
                                              hs_bindgen_98b9940edc4aaaf9 x0 x1 z2)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeSetting@
foreign import ccall safe "hs_bindgen_44024e50546f6e9d" hs_bindgen_44024e50546f6e9d ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Write an arbitrary setting on the device. The interpretation is up the implementation.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  [__@value@ /(input)/__]: the setting value

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeSetting@

__defined at:__ @SoapySDR\/Device.h:1363:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeSetting ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@value@ /(input)/__]: the setting value

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_writeSetting =
  hs_bindgen_44024e50546f6e9d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readSetting@
foreign import ccall safe "hs_bindgen_d5524557b6542d81" hs_bindgen_d5524557b6542d81 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (Ptr.Ptr FC.CChar)

{-| Read an arbitrary setting on the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ the setting value

__C declaration:__ @SoapySDRDevice_readSetting@

__defined at:__ @SoapySDR\/Device.h:1371:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readSetting ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readSetting =
  hs_bindgen_d5524557b6542d81

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getChannelSettingInfo@
foreign import ccall safe "hs_bindgen_46720b1ede70044a" hs_bindgen_46720b1ede70044a ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr SoapySDRArgInfo)

{-| Describe the allowed keys and values used for channel settings.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getChannelSettingInfo@

__defined at:__ @SoapySDR\/Device.h:1381:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getChannelSettingInfo ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of sensor names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr SoapySDRArgInfo)
soapySDRDevice_getChannelSettingInfo =
  hs_bindgen_46720b1ede70044a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getChannelSettingInfoWithKey@
foreign import ccall safe "hs_bindgen_f750e50e974ea267" hs_bindgen_f750e50e974ea267 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()

{-| Pointer-based API for 'soapySDRDevice_getChannelSettingInfoWithKey'
-}
soapySDRDevice_getChannelSettingInfoWithKey_wrapper ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> Ptr.Ptr SoapySDRArgInfo
  -> IO ()
soapySDRDevice_getChannelSettingInfoWithKey_wrapper =
  hs_bindgen_f750e50e974ea267

{-| Get information on a specific channel setting.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getChannelSettingInfoWithKey@

__defined at:__ @SoapySDR\/Device.h:1391:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getChannelSettingInfoWithKey ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> IO SoapySDRArgInfo
soapySDRDevice_getChannelSettingInfoWithKey =
  \x0 ->
    \x1 ->
      \x2 ->
        \x3 ->
          HsBindgen.Runtime.CAPI.allocaAndPeek (\z4 ->
                                                  hs_bindgen_f750e50e974ea267 x0 x1 x2 x3 z4)

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeChannelSetting@
foreign import ccall safe "hs_bindgen_b5fb1901df6cada6" hs_bindgen_b5fb1901df6cada6 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Write an arbitrary channel setting on the device. The interpretation is up the implementation.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@key@ /(input)/__]: the setting identifier

  [__@value@ /(input)/__]: the setting value

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeChannelSetting@

__defined at:__ @SoapySDR\/Device.h:1403:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeChannelSetting ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@value@ /(input)/__]: the setting value

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_writeChannelSetting =
  hs_bindgen_b5fb1901df6cada6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readChannelSetting@
foreign import ccall safe "hs_bindgen_534d2ece54d8420d" hs_bindgen_534d2ece54d8420d ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO (Ptr.Ptr FC.CChar)

{-| Read an arbitrary channel setting on the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ the setting value

__C declaration:__ @SoapySDRDevice_readChannelSetting@

__defined at:__ @SoapySDR\/Device.h:1413:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readChannelSetting ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@direction@ /(input)/__]: the channel direction RX or TX

     __C declaration:__ @direction@
     -}
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@channel@ /(input)/__]: an available channel on the device

     __C declaration:__ @channel@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@key@ /(input)/__]: the setting identifier

     __C declaration:__ @key@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readChannelSetting =
  hs_bindgen_534d2ece54d8420d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listGPIOBanks@
foreign import ccall safe "hs_bindgen_18996c4fc8ad7f11" hs_bindgen_18996c4fc8ad7f11 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Get a list of available GPIO banks by name.

  [__@length@ /(output)/__]: the number of GPIO banks

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_listGPIOBanks@

__defined at:__ @SoapySDR\/Device.h:1424:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listGPIOBanks ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of GPIO banks

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listGPIOBanks =
  hs_bindgen_18996c4fc8ad7f11

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeGPIO@
foreign import ccall safe "hs_bindgen_328ff4a5f06fcc26" hs_bindgen_328ff4a5f06fcc26 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> IO FC.CInt

{-| Write the value of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@value@ /(input)/__]: an integer representing GPIO bits

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIO@

__defined at:__ @SoapySDR\/Device.h:1433:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIO ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> FC.CUInt
     {- ^

        [__@value@ /(input)/__]: an integer representing GPIO bits

     __C declaration:__ @value@
     -}
  -> IO FC.CInt
soapySDRDevice_writeGPIO =
  hs_bindgen_328ff4a5f06fcc26

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeGPIOMasked@
foreign import ccall safe "hs_bindgen_8ea5a845f0f46c66" hs_bindgen_8ea5a845f0f46c66 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> FC.CUInt
  -> IO FC.CInt

{-| Write the value of a GPIO bank with modification mask.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@value@ /(input)/__]: an integer representing GPIO bits

  [__@mask@ /(input)/__]: a modification mask where 1 = modify

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIOMasked@

__defined at:__ @SoapySDR\/Device.h:1443:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIOMasked ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> FC.CUInt
     {- ^

        [__@value@ /(input)/__]: an integer representing GPIO bits

     __C declaration:__ @value@
     -}
  -> FC.CUInt
     {- ^

        [__@mask@ /(input)/__]: a modification mask where 1 = modify

     __C declaration:__ @mask@
     -}
  -> IO FC.CInt
soapySDRDevice_writeGPIOMasked =
  hs_bindgen_8ea5a845f0f46c66

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readGPIO@
foreign import ccall safe "hs_bindgen_a669ee0339774ab6" hs_bindgen_a669ee0339774ab6 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CUInt

{-| Readback the value of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  __returns:__ an integer representing GPIO bits

__C declaration:__ @SoapySDRDevice_readGPIO@

__defined at:__ @SoapySDR\/Device.h:1451:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readGPIO ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> IO FC.CUInt
soapySDRDevice_readGPIO = hs_bindgen_a669ee0339774ab6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeGPIODir@
foreign import ccall safe "hs_bindgen_64ba3ccbf6d506dc" hs_bindgen_64ba3ccbf6d506dc ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> IO FC.CInt

{-| Write the data direction of a GPIO bank. 1 bits represent outputs, 0 bits represent inputs.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@dir@ /(input)/__]: an integer representing data direction bits

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIODir@

__defined at:__ @SoapySDR\/Device.h:1461:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIODir ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> FC.CUInt
     {- ^

        [__@dir@ /(input)/__]: an integer representing data direction bits

     __C declaration:__ @dir@
     -}
  -> IO FC.CInt
soapySDRDevice_writeGPIODir =
  hs_bindgen_64ba3ccbf6d506dc

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeGPIODirMasked@
foreign import ccall safe "hs_bindgen_e09614f33e7cc73f" hs_bindgen_e09614f33e7cc73f ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CUInt
  -> FC.CUInt
  -> IO FC.CInt

{-| Write the data direction of a GPIO bank with modification mask. 1 bits represent outputs, 0 bits represent inputs.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@dir@ /(input)/__]: an integer representing data direction bits

  [__@mask@ /(input)/__]: a modification mask where 1 = modify

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIODirMasked@

__defined at:__ @SoapySDR\/Device.h:1472:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIODirMasked ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> FC.CUInt
     {- ^

        [__@dir@ /(input)/__]: an integer representing data direction bits

     __C declaration:__ @dir@
     -}
  -> FC.CUInt
     {- ^

        [__@mask@ /(input)/__]: a modification mask where 1 = modify

     __C declaration:__ @mask@
     -}
  -> IO FC.CInt
soapySDRDevice_writeGPIODirMasked =
  hs_bindgen_e09614f33e7cc73f

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readGPIODir@
foreign import ccall safe "hs_bindgen_ea50383c5425f4c0" hs_bindgen_ea50383c5425f4c0 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CUInt

{-| Read the data direction of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance 1 bits represent outputs, 0 bits represent inputs.

  [__@bank@ /(input)/__]: the name of an available bank

  __returns:__ an integer representing data direction bits

__C declaration:__ @SoapySDRDevice_readGPIODir@

__defined at:__ @SoapySDR\/Device.h:1481:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readGPIODir ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance 1 bits represent outputs, 0 bits represent inputs.

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@bank@ /(input)/__]: the name of an available bank

     __C declaration:__ @bank@
     -}
  -> IO FC.CUInt
soapySDRDevice_readGPIODir =
  hs_bindgen_ea50383c5425f4c0

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeI2C@
foreign import ccall safe "hs_bindgen_a585b6779cd75268" hs_bindgen_a585b6779cd75268 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CInt

{-| Write to an available I2C slave. If the device contains multiple I2C masters, the address bits can encode which master.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@addr@ /(input)/__]: the address of the slave

  [__@data@ /(input)/__]: an array of bytes write out

  [__@numBytes@ /(input)/__]: the number of bytes to write

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeI2C@

__defined at:__ @SoapySDR\/Device.h:1497:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeI2C ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@addr@ /(input)/__]: the address of the slave

     __C declaration:__ @addr@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @data'@
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numBytes@ /(input)/__]: the number of bytes to write

     __C declaration:__ @numBytes@
     -}
  -> IO FC.CInt
soapySDRDevice_writeI2C = hs_bindgen_a585b6779cd75268

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readI2C@
foreign import ccall safe "hs_bindgen_8341a0f524ad54f1" hs_bindgen_8341a0f524ad54f1 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr FC.CChar)

{-| Read from an available I2C slave. If the device contains multiple I2C masters, the address bits can encode which master. Pass the number of bytes to be read in via numBytes; numBytes will be set to the number of actual bytes read.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@addr@ /(input)/__]: the address of the slave

  [__@numBytes@ /(input,output)/__]: the number of bytes to read

  __returns:__ an array of bytes read from the slave

__C declaration:__ @SoapySDRDevice_readI2C@

__defined at:__ @SoapySDR\/Device.h:1510:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readI2C ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@addr@ /(input)/__]: the address of the slave

     __C declaration:__ @addr@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numBytes@ /(input,output)/__]: the number of bytes to read

     __C declaration:__ @numBytes@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readI2C = hs_bindgen_8341a0f524ad54f1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_transactSPI@
foreign import ccall safe "hs_bindgen_772a2ef0517726b8" hs_bindgen_772a2ef0517726b8 ::
     Ptr.Ptr SoapySDRDevice
  -> FC.CInt
  -> FC.CUInt
  -> HsBindgen.Runtime.Prelude.CSize
  -> IO FC.CUInt

{-| Perform a SPI transaction and return the result. Its up to the implementation to set the clock rate, and read edge, and the write edge of the SPI core. SPI slaves without a readback pin will return 0.

  If the device contains multiple SPI masters, the address bits can encode which master.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@addr@ /(input)/__]: an address of an available SPI slave

  [__@data@ /(input)/__]: the SPI data, numBits-1 is first out

  [__@numBits@ /(input)/__]: the number of bits to clock out

  __returns:__ the readback data, numBits-1 is first in

__C declaration:__ @SoapySDRDevice_transactSPI@

__defined at:__ @SoapySDR\/Device.h:1531:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_transactSPI ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> FC.CInt
     {- ^

        [__@addr@ /(input)/__]: an address of an available SPI slave

     __C declaration:__ @addr@
     -}
  -> FC.CUInt
     -- ^ __C declaration:__ @data'@
  -> HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@numBits@ /(input)/__]: the number of bits to clock out

     __C declaration:__ @numBits@
     -}
  -> IO FC.CUInt
soapySDRDevice_transactSPI =
  hs_bindgen_772a2ef0517726b8

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_listUARTs@
foreign import ccall safe "hs_bindgen_47247fa0b208476c" hs_bindgen_47247fa0b208476c ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))

{-| Enumerate the available UART devices.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of UART names

  __returns:__ a list of names of available UARTs

__C declaration:__ @SoapySDRDevice_listUARTs@

__defined at:__ @SoapySDR\/Device.h:1543:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listUARTs ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> Ptr.Ptr HsBindgen.Runtime.Prelude.CSize
     {- ^

        [__@length@ /(output)/__]: the number of UART names

     __C declaration:__ @length@
     -}
  -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))
soapySDRDevice_listUARTs =
  hs_bindgen_47247fa0b208476c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_writeUART@
foreign import ccall safe "hs_bindgen_5e92c563c8a54191" hs_bindgen_5e92c563c8a54191 ::
     Ptr.Ptr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> IO FC.CInt

{-| Write data to a UART device. Its up to the implementation to set the baud rate, carriage return settings, flushing on newline.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@which@ /(input)/__]: the name of an available UART

  [__@data@ /(input)/__]: a null terminated array of bytes

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeUART@

__defined at:__ @SoapySDR\/Device.h:1554:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeUART ::
     Ptr.Ptr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@which@ /(input)/__]: the name of an available UART

     __C declaration:__ @which@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     -- ^ __C declaration:__ @data'@
  -> IO FC.CInt
soapySDRDevice_writeUART =
  hs_bindgen_5e92c563c8a54191

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_readUART@
foreign import ccall safe "hs_bindgen_35a577bc7aa64b81" hs_bindgen_35a577bc7aa64b81 ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
  -> FC.CLong
  -> IO (Ptr.Ptr FC.CChar)

{-| Read bytes from a UART until timeout or newline. Its up to the implementation to set the baud rate, carriage return settings, flushing on newline.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@which@ /(input)/__]: the name of an available UART

  [__@timeoutUs@ /(input)/__]: a timeout in microseconds

  __returns:__ a null terminated array of bytes

__C declaration:__ @SoapySDRDevice_readUART@

__defined at:__ @SoapySDR\/Device.h:1565:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readUART ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar
     {- ^

        [__@which@ /(input)/__]: the name of an available UART

     __C declaration:__ @which@
     -}
  -> FC.CLong
     {- ^

        [__@timeoutUs@ /(input)/__]: a timeout in microseconds

     __C declaration:__ @timeoutUs@
     -}
  -> IO (Ptr.Ptr FC.CChar)
soapySDRDevice_readUART = hs_bindgen_35a577bc7aa64b81

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_Safe_SoapySDRDevice_getNativeDeviceHandle@
foreign import ccall safe "hs_bindgen_0fd4cb1e9819777a" hs_bindgen_0fd4cb1e9819777a ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
  -> IO (Ptr.Ptr Void)

{-| A handle to the native device used by the driver. The implementation may return a null value if it does not support or does not wish to provide access to the native handle.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ a handle to the native device or null

__C declaration:__ @SoapySDRDevice_getNativeDeviceHandle@

__defined at:__ @SoapySDR\/Device.h:1579:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNativeDeviceHandle ::
     HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice
     {- ^

        [__@device@ /(input)/__]: a pointer to a device instance

     __C declaration:__ @device@
     -}
  -> IO (Ptr.Ptr Void)
soapySDRDevice_getNativeDeviceHandle =
  hs_bindgen_0fd4cb1e9819777a
