{-# LANGUAGE CApiFFI #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK prune #-}

module SoapySDR.Bindings.FunPtr where

import qualified Foreign.C as FC
import qualified GHC.IO.Unsafe
import qualified GHC.Ptr as Ptr
import qualified HsBindgen.Runtime.ConstPtr
import qualified HsBindgen.Runtime.Prelude
import Data.Void (Void)
import Prelude (IO)
import SoapySDR.Bindings

$(HsBindgen.Runtime.Prelude.addCSource (HsBindgen.Runtime.Prelude.unlines
  [ "#include <SoapySDR/Types.h>"
  , "#include <SoapySDR/Device.h>"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_fromString */"
  , "__attribute__ ((const))"
  , "SoapySDRKwargs (*hs_bindgen_ef7d3297713943b6 (void)) ("
  , "  char const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRKwargs_fromString;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_toString */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_3d47ff44a587af25 (void)) ("
  , "  SoapySDRKwargs const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRKwargs_toString;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDR_free */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_151db941908915a1 (void)) ("
  , "  void *arg1"
  , ")"
  , "{"
  , "  return &SoapySDR_free;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRStrings_clear */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_7436edb5304badf2 (void)) ("
  , "  char ***arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRStrings_clear;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_set */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_cc10ec3356775a6f (void)) ("
  , "  SoapySDRKwargs *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRKwargs_set;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_get */"
  , "__attribute__ ((const))"
  , "char const *(*hs_bindgen_a25a06d28e545085 (void)) ("
  , "  SoapySDRKwargs const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRKwargs_get;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_clear */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_10a5f2e8ffc4b467 (void)) ("
  , "  SoapySDRKwargs *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRKwargs_clear;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargsList_clear */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_e4cdedd4a52f62bb (void)) ("
  , "  SoapySDRKwargs *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRKwargsList_clear;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRArgInfo_clear */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_f25af86b58b13edf (void)) ("
  , "  SoapySDRArgInfo *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRArgInfo_clear;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRArgInfoList_clear */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_8b584c3fb5910876 (void)) ("
  , "  SoapySDRArgInfo *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRArgInfoList_clear;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_lastStatus */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_c11b3db0a9822bd0 (void)) (void)"
  , "{"
  , "  return &SoapySDRDevice_lastStatus;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_lastError */"
  , "__attribute__ ((const))"
  , "char const *(*hs_bindgen_f956286bf45bdc64 (void)) (void)"
  , "{"
  , "  return &SoapySDRDevice_lastError;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_enumerate */"
  , "__attribute__ ((const))"
  , "SoapySDRKwargs *(*hs_bindgen_3baf1e9afe1a18ae (void)) ("
  , "  SoapySDRKwargs const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_enumerate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_enumerateStrArgs */"
  , "__attribute__ ((const))"
  , "SoapySDRKwargs *(*hs_bindgen_fa126416a027a04c (void)) ("
  , "  char const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_enumerateStrArgs;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make */"
  , "__attribute__ ((const))"
  , "SoapySDRDevice *(*hs_bindgen_9d0caf2adc2a5703 (void)) ("
  , "  SoapySDRKwargs const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_make;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_makeStrArgs */"
  , "__attribute__ ((const))"
  , "SoapySDRDevice *(*hs_bindgen_a5d44a619e4603c1 (void)) ("
  , "  char const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_makeStrArgs;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_unmake */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_d940e4d66b25f75b (void)) ("
  , "  SoapySDRDevice *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_unmake;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make_list */"
  , "__attribute__ ((const))"
  , "SoapySDRDevice **(*hs_bindgen_7d56e035b7b78638 (void)) ("
  , "  SoapySDRKwargs const *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_make_list;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make_listStrArgs */"
  , "__attribute__ ((const))"
  , "SoapySDRDevice **(*hs_bindgen_44d2ed90a77e9d4b (void)) ("
  , "  char const *const *arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_make_listStrArgs;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_unmake_list */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_a609855a074bb528 (void)) ("
  , "  SoapySDRDevice **arg1,"
  , "  size_t const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_unmake_list;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDriverKey */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_637a1c65076d6b7a (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getDriverKey;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareKey */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_32af63eb60223b67 (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getHardwareKey;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRKwargs (*hs_bindgen_26c9e11b26d0192d (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getHardwareInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrontendMapping */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_b9f390dccc1ceb3b (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setFrontendMapping;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrontendMapping */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_52c7ea8d8f5377fe (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrontendMapping;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNumChannels */"
  , "__attribute__ ((const))"
  , "size_t (*hs_bindgen_f4cb83ba2829066c (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getNumChannels;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRKwargs (*hs_bindgen_fff2bfe97d6007dd (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getChannelInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFullDuplex */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_44193b8ccd1ebbe4 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFullDuplex;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamFormats */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_5fcca7057c790fe9 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getStreamFormats;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNativeStreamFormat */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_da89681fec2dd4e7 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getNativeStreamFormat;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamArgsInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo *(*hs_bindgen_88565a9a7f2bc3a1 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getStreamArgsInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setupStream */"
  , "__attribute__ ((const))"
  , "SoapySDRStream *(*hs_bindgen_268e91f4aca15e74 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3,"
  , "  size_t const *arg4,"
  , "  size_t const arg5,"
  , "  SoapySDRKwargs const *arg6"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setupStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_closeStream */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_c6b8d6eed699c084 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_closeStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamMTU */"
  , "__attribute__ ((const))"
  , "size_t (*hs_bindgen_7ce2089fc9ced311 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getStreamMTU;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_activateStream */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_21475fc49c6909d6 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  signed int const arg3,"
  , "  signed long long const arg4,"
  , "  size_t const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_activateStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_deactivateStream */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_e16a90cbbaef369e (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  signed int const arg3,"
  , "  signed long long const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_deactivateStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readStream */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_df43497931325d67 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  void *const *arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long *arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeStream */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_1ceb331ad3b4b5ac (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  void const *const *arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long const arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeStream;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readStreamStatus */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_3ff80768535889f8 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  signed int *arg4,"
  , "  signed long long *arg5,"
  , "  signed long const arg6"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readStreamStatus;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNumDirectAccessBuffers */"
  , "__attribute__ ((const))"
  , "size_t (*hs_bindgen_23f4e34ed59ee021 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getNumDirectAccessBuffers;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDirectAccessBufferAddrs */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_77173d2e46c7fa98 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3,"
  , "  void **arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getDirectAccessBufferAddrs;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_acquireReadBuffer */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_54cb1e4c0a397b9d (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  void const **arg4,"
  , "  signed int *arg5,"
  , "  signed long long *arg6,"
  , "  signed long const arg7"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_acquireReadBuffer;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_releaseReadBuffer */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_13f53c502340b615 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_releaseReadBuffer;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_acquireWriteBuffer */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_51d7440712c746af (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t *arg3,"
  , "  void **arg4,"
  , "  signed long const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_acquireWriteBuffer;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_releaseWriteBuffer */"
  , "__attribute__ ((const))"
  , "void (*hs_bindgen_28715051767cc96e (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  SoapySDRStream *arg2,"
  , "  size_t const arg3,"
  , "  size_t const arg4,"
  , "  signed int *arg5,"
  , "  signed long long const arg6"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_releaseWriteBuffer;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listAntennas */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_a487de1cdc3aa213 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listAntennas;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setAntenna */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_4823c3f886fcfc79 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setAntenna;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getAntenna */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_2917db609c029f74 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getAntenna;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasDCOffsetMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_ee5f12a1552e20e3 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasDCOffsetMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setDCOffsetMode */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_5f714639c1d18805 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setDCOffsetMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDCOffsetMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_823a19a71ee85865 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getDCOffsetMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasDCOffset */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_d96a9a41374b1670 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasDCOffset;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setDCOffset */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_34f7ea298a6a1649 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setDCOffset;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDCOffset */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_538b07573a10cb8e (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4,"
  , "  double *arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getDCOffset;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasIQBalance */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_2136acc14ab8625c (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasIQBalance;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setIQBalance */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_494858250807859c (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setIQBalance;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getIQBalance */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_7a463a662153c5cb (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double *arg4,"
  , "  double *arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getIQBalance;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasIQBalanceMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_45d34703790d5a8d (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasIQBalanceMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setIQBalanceMode */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_f6ecffc3e0d5fcbe (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setIQBalanceMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getIQBalanceMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_49ad632ce04165e2 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getIQBalanceMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasFrequencyCorrection */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_3d166fef4e14783a (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasFrequencyCorrection;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequencyCorrection */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_20500b97012c159a (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setFrequencyCorrection;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyCorrection */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_2d5a5abdcde5d645 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequencyCorrection;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listGains */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_791dbe9631b234df (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listGains;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasGainMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_6fb42055eb50320b (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasGainMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGainMode */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_5763e46531dea6df (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  _Bool const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setGainMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainMode */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_41a8305c5a1af389 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getGainMode;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGain */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_dea8c759e1230bc9 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setGain;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGainElement */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_22128798206b272b (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  double const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setGainElement;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGain */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_20e0115c6a6ee7a0 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getGain;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainElement */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_74ec0a7126c077f2 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getGainElement;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainRange */"
  , "__attribute__ ((const))"
  , "SoapySDRRange (*hs_bindgen_9f3c0f3d2a34172b (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getGainRange;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainElementRange */"
  , "__attribute__ ((const))"
  , "SoapySDRRange (*hs_bindgen_b4e01ae94a7cd84c (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getGainElementRange;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequency */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_e2abe0632126bd76 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4,"
  , "  SoapySDRKwargs const *arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setFrequency;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequencyComponent */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_fd276cbf675feb04 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  double const arg5,"
  , "  SoapySDRKwargs const *arg6"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setFrequencyComponent;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequency */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_7402bb13fa695203 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequency;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyComponent */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_05e5ae620a7435ef (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequencyComponent;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listFrequencies */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_54304f0137d20823 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listFrequencies;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyRange */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_4197ac2df74f4d6b (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequencyRange;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyRangeComponent */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_dd55f419d5b1d780 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  size_t *arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequencyRangeComponent;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyArgsInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo *(*hs_bindgen_84a51eb960ee1565 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getFrequencyArgsInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setSampleRate */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_a7f514d0c9a80eb7 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setSampleRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSampleRate */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_feb8e23036ee77ae (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getSampleRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listSampleRates */"
  , "__attribute__ ((const))"
  , "double *(*hs_bindgen_704fe2f24eca7a1d (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listSampleRates;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSampleRateRange */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_3118020ba86f88a4 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getSampleRateRange;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setBandwidth */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_35ade2c9bde972e2 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  double const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setBandwidth;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getBandwidth */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_825a69be91ebd08b (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getBandwidth;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listBandwidths */"
  , "__attribute__ ((const))"
  , "double *(*hs_bindgen_f235a17ab2f2c188 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listBandwidths;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getBandwidthRange */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_9eb9d8940ef78b43 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getBandwidthRange;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setMasterClockRate */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_9f3fa9d464695570 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  double const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setMasterClockRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getMasterClockRate */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_80a90d5821e6cf3d (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getMasterClockRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getMasterClockRates */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_495b23ddcce63945 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getMasterClockRates;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setReferenceClockRate */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_6d613771486a1e9a (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  double const arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setReferenceClockRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getReferenceClockRate */"
  , "__attribute__ ((const))"
  , "double (*hs_bindgen_9b2378e242a5eb17 (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getReferenceClockRate;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getReferenceClockRates */"
  , "__attribute__ ((const))"
  , "SoapySDRRange *(*hs_bindgen_0ca27689ad6fcce1 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getReferenceClockRates;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listClockSources */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_380a4d635a8a0ff3 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listClockSources;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setClockSource */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_5823024806211639 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setClockSource;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getClockSource */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_b9ebee7b611c5c99 (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getClockSource;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listTimeSources */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_360d81e302a07db0 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listTimeSources;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setTimeSource */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_ec7e7dc346fa491e (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setTimeSource;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getTimeSource */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_34870e13e6b04674 (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getTimeSource;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasHardwareTime */"
  , "__attribute__ ((const))"
  , "_Bool (*hs_bindgen_7ef9db0480637755 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_hasHardwareTime;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareTime */"
  , "__attribute__ ((const))"
  , "signed long long (*hs_bindgen_e870384319cb178e (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getHardwareTime;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setHardwareTime */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_602bdea01ac1b15d (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed long long const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setHardwareTime;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setCommandTime */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_db6242a4a82ef62b (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed long long const arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_setCommandTime;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listSensors */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_7b42897ccddba16d (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listSensors;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSensorInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo (*hs_bindgen_e4e325408873b676 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getSensorInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readSensor */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_3f4d2e704ce05f72 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readSensor;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listChannelSensors */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_7264b37b0662bc5c (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listChannelSensors;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSensorInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo (*hs_bindgen_2dfe3aac15a0452d (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getChannelSensorInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readChannelSensor */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_0a4eef10673652b2 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readChannelSensor;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listRegisterInterfaces */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_6c440ae03d9a8023 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listRegisterInterfaces;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeRegister */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_07f6d140de923213 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeRegister;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readRegister */"
  , "__attribute__ ((const))"
  , "unsigned int (*hs_bindgen_23189758eeebf8ac (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readRegister;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeRegisters */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_d6475640c8638e3c (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const *arg4,"
  , "  size_t const arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeRegisters;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readRegisters */"
  , "__attribute__ ((const))"
  , "unsigned int *(*hs_bindgen_4c9f843c95c615d8 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readRegisters;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSettingInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo *(*hs_bindgen_4347e4ca2ce5b867 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getSettingInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSettingInfoWithKey */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo (*hs_bindgen_bca43350b18c6bf8 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getSettingInfoWithKey;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeSetting */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_d21f6f7dda5ed04f (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeSetting;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readSetting */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_ab0c722efccc88cc (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readSetting;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSettingInfo */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo *(*hs_bindgen_54cc9384c60be166 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  size_t *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getChannelSettingInfo;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSettingInfoWithKey */"
  , "__attribute__ ((const))"
  , "SoapySDRArgInfo (*hs_bindgen_375107be0548aa29 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getChannelSettingInfoWithKey;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeChannelSetting */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_52cbde967f592aae (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4,"
  , "  char const *arg5"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeChannelSetting;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readChannelSetting */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_c7400e74dc35702d (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  signed int const arg2,"
  , "  size_t const arg3,"
  , "  char const *arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readChannelSetting;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listGPIOBanks */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_0437ca82da468d33 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listGPIOBanks;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIO */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_dee72844a7fcd977 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeGPIO;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIOMasked */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_61c7969c25bc347a (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeGPIOMasked;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readGPIO */"
  , "__attribute__ ((const))"
  , "unsigned int (*hs_bindgen_47e6623f900e48fa (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readGPIO;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIODir */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_41c35c0ce8f0cdfb (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeGPIODir;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIODirMasked */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_f60a2eb4e9a87845 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  unsigned int const arg3,"
  , "  unsigned int const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeGPIODirMasked;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readGPIODir */"
  , "__attribute__ ((const))"
  , "unsigned int (*hs_bindgen_755852d3689807ac (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readGPIODir;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeI2C */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_cf28a804f47feb1d (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  char const *arg3,"
  , "  size_t const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeI2C;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readI2C */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_fce2d8e5ea5b173e (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  size_t *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readI2C;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_transactSPI */"
  , "__attribute__ ((const))"
  , "unsigned int (*hs_bindgen_f3d2045eef9c5c49 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  signed int const arg2,"
  , "  unsigned int const arg3,"
  , "  size_t const arg4"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_transactSPI;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listUARTs */"
  , "__attribute__ ((const))"
  , "char **(*hs_bindgen_b34e060d4d81e006 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  size_t *arg2"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_listUARTs;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeUART */"
  , "__attribute__ ((const))"
  , "signed int (*hs_bindgen_d5c24bcf48342ec4 (void)) ("
  , "  SoapySDRDevice *arg1,"
  , "  char const *arg2,"
  , "  char const *arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_writeUART;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readUART */"
  , "__attribute__ ((const))"
  , "char *(*hs_bindgen_0555f891e964cd17 (void)) ("
  , "  SoapySDRDevice const *arg1,"
  , "  char const *arg2,"
  , "  signed long const arg3"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_readUART;"
  , "}"
  , "/* com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNativeDeviceHandle */"
  , "__attribute__ ((const))"
  , "void *(*hs_bindgen_07c9fa287ee25286 (void)) ("
  , "  SoapySDRDevice const *arg1"
  , ")"
  , "{"
  , "  return &SoapySDRDevice_getNativeDeviceHandle;"
  , "}"
  ]))

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_fromString@
foreign import ccall unsafe "hs_bindgen_ef7d3297713943b6" hs_bindgen_ef7d3297713943b6 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRKwargs))

{-# NOINLINE soapySDRKwargs_fromString #-}
{-| Convert a markup string to a key-value map. The markup format is: "key0=value0, key1=value1"

__C declaration:__ @SoapySDRKwargs_fromString@

__defined at:__ @SoapySDR\/Types.h:45:30@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_fromString :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRKwargs)
soapySDRKwargs_fromString =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ef7d3297713943b6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_toString@
foreign import ccall unsafe "hs_bindgen_3d47ff44a587af25" hs_bindgen_3d47ff44a587af25 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRKwargs_toString #-}
{-| Convert a key-value map to a markup string. The markup format is: "key0=value0, key1=value1"

__C declaration:__ @SoapySDRKwargs_toString@

__defined at:__ @SoapySDR\/Types.h:51:21@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_toString :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr FC.CChar))
soapySDRKwargs_toString =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3d47ff44a587af25

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDR_free@
foreign import ccall unsafe "hs_bindgen_151db941908915a1" hs_bindgen_151db941908915a1 ::
     IO (Ptr.FunPtr ((Ptr.Ptr Void) -> IO ()))

{-# NOINLINE soapySDR_free #-}
{-| Free a pointer allocated by SoapySDR. For most platforms this is a simple call around free()

__C declaration:__ @SoapySDR_free@

__defined at:__ @SoapySDR\/Types.h:116:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDR_free :: Ptr.FunPtr ((Ptr.Ptr Void) -> IO ())
soapySDR_free =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_151db941908915a1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRStrings_clear@
foreign import ccall unsafe "hs_bindgen_7436edb5304badf2" hs_bindgen_7436edb5304badf2 ::
     IO (Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr (Ptr.Ptr FC.CChar))) -> HsBindgen.Runtime.Prelude.CSize -> IO ()))

{-# NOINLINE soapySDRStrings_clear #-}
{-| Clear the contents of a list of string Convenience call to deal with results that return a string list.

__C declaration:__ @SoapySDRStrings_clear@

__defined at:__ @SoapySDR\/Types.h:122:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRStrings_clear :: Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr (Ptr.Ptr FC.CChar))) -> HsBindgen.Runtime.Prelude.CSize -> IO ())
soapySDRStrings_clear =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7436edb5304badf2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_set@
foreign import ccall unsafe "hs_bindgen_cc10ec3356775a6f" hs_bindgen_cc10ec3356775a6f ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRKwargs_set #-}
{-| Set a key/value pair in a kwargs structure.

  __post condition:__ If the key exists, the existing entry will be modified; otherwise a new entry will be appended to args. On error, the elements of args will not be modified, and args is guaranteed to be in a good state.

  __returns:__ 0 for success, otherwise allocation error

__C declaration:__ @SoapySDRKwargs_set@

__defined at:__ @SoapySDR\/Types.h:133:19@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_set :: Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRKwargs_set =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_cc10ec3356775a6f

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_get@
foreign import ccall unsafe "hs_bindgen_a25a06d28e545085" hs_bindgen_a25a06d28e545085 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)))

{-# NOINLINE soapySDRKwargs_get #-}
{-| Get a value given a key in a kwargs structure.

  __returns:__ the string or NULL if not found

__C declaration:__ @SoapySDRKwargs_get@

__defined at:__ @SoapySDR\/Types.h:139:27@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_get :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar))
soapySDRKwargs_get =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a25a06d28e545085

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargs_clear@
foreign import ccall unsafe "hs_bindgen_10a5f2e8ffc4b467" hs_bindgen_10a5f2e8ffc4b467 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> IO ()))

{-# NOINLINE soapySDRKwargs_clear #-}
{-| Clear the contents of a kwargs structure. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRKwargs_clear@

__defined at:__ @SoapySDR\/Types.h:145:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargs_clear :: Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> IO ())
soapySDRKwargs_clear =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_10a5f2e8ffc4b467

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRKwargsList_clear@
foreign import ccall unsafe "hs_bindgen_e4cdedd4a52f62bb" hs_bindgen_e4cdedd4a52f62bb ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> HsBindgen.Runtime.Prelude.CSize -> IO ()))

{-# NOINLINE soapySDRKwargsList_clear #-}
{-| Clear a list of kwargs structures. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRKwargsList_clear@

__defined at:__ @SoapySDR\/Types.h:151:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRKwargsList_clear :: Ptr.FunPtr ((Ptr.Ptr SoapySDRKwargs) -> HsBindgen.Runtime.Prelude.CSize -> IO ())
soapySDRKwargsList_clear =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e4cdedd4a52f62bb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRArgInfo_clear@
foreign import ccall unsafe "hs_bindgen_f25af86b58b13edf" hs_bindgen_f25af86b58b13edf ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRArgInfo) -> IO ()))

{-# NOINLINE soapySDRArgInfo_clear #-}
{-| Clear the contents of a argument info structure. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRArgInfo_clear@

__defined at:__ @SoapySDR\/Types.h:157:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRArgInfo_clear :: Ptr.FunPtr ((Ptr.Ptr SoapySDRArgInfo) -> IO ())
soapySDRArgInfo_clear =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f25af86b58b13edf

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRArgInfoList_clear@
foreign import ccall unsafe "hs_bindgen_8b584c3fb5910876" hs_bindgen_8b584c3fb5910876 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRArgInfo) -> HsBindgen.Runtime.Prelude.CSize -> IO ()))

{-# NOINLINE soapySDRArgInfoList_clear #-}
{-| Clear a list of argument info structures. This frees all the underlying memory and clears the members.

__C declaration:__ @SoapySDRArgInfoList_clear@

__defined at:__ @SoapySDR\/Types.h:163:20@

__exported by:__ @SoapySDR\/Types.h@, @SoapySDR\/Device.h@
-}
soapySDRArgInfoList_clear :: Ptr.FunPtr ((Ptr.Ptr SoapySDRArgInfo) -> HsBindgen.Runtime.Prelude.CSize -> IO ())
soapySDRArgInfoList_clear =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_8b584c3fb5910876

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_lastStatus@
foreign import ccall unsafe "hs_bindgen_c11b3db0a9822bd0" hs_bindgen_c11b3db0a9822bd0 ::
     IO (Ptr.FunPtr (IO FC.CInt))

{-# NOINLINE soapySDRDevice_lastStatus #-}
{-| Get the last status code after a Device API call. The status code is cleared on entry to each Device call. When an device API call throws, the C bindings catch the exception, and set a non-zero last status code. Use lastStatus() to determine success/failure for Device calls without integer status return codes.

__C declaration:__ @SoapySDRDevice_lastStatus@

__defined at:__ @SoapySDR\/Device.h:42:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_lastStatus :: Ptr.FunPtr (IO FC.CInt)
soapySDRDevice_lastStatus =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_c11b3db0a9822bd0

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_lastError@
foreign import ccall unsafe "hs_bindgen_f956286bf45bdc64" hs_bindgen_f956286bf45bdc64 ::
     IO (Ptr.FunPtr (IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)))

{-# NOINLINE soapySDRDevice_lastError #-}
{-| Get the last error message after a device call fails. When an device API call throws, the C bindings catch the exception, store its message in thread-safe storage, and return a non-zero status code to indicate failure. Use lastError() to access the exception's error message.

__C declaration:__ @SoapySDRDevice_lastError@

__defined at:__ @SoapySDR\/Device.h:51:27@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_lastError :: Ptr.FunPtr (IO (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar))
soapySDRDevice_lastError =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f956286bf45bdc64

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_enumerate@
foreign import ccall unsafe "hs_bindgen_3baf1e9afe1a18ae" hs_bindgen_3baf1e9afe1a18ae ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRKwargs)))

{-# NOINLINE soapySDRDevice_enumerate #-}
{-| Enumerate a list of available devices on the system.

  [__@args@ /(input)/__]: device construction key/value argument filters

  [__@length@ /(output)/__]: the number of elements in the result.

  __returns:__ a list of arguments strings, each unique to a device

__C declaration:__ @SoapySDRDevice_enumerate@

__defined at:__ @SoapySDR\/Device.h:59:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_enumerate :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRKwargs))
soapySDRDevice_enumerate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3baf1e9afe1a18ae

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_enumerateStrArgs@
foreign import ccall unsafe "hs_bindgen_fa126416a027a04c" hs_bindgen_fa126416a027a04c ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRKwargs)))

{-# NOINLINE soapySDRDevice_enumerateStrArgs #-}
{-| Enumerate a list of available devices on the system. Markup format for args: "keyA=valA, keyB=valB".

  [__@args@ /(input)/__]: a markup string of key/value argument filters

  [__@length@ /(output)/__]: the number of elements in the result.

  __returns:__ a list of arguments strings, each unique to a device

__C declaration:__ @SoapySDRDevice_enumerateStrArgs@

__defined at:__ @SoapySDR\/Device.h:68:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_enumerateStrArgs :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRKwargs))
soapySDRDevice_enumerateStrArgs =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fa126416a027a04c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make@
foreign import ccall unsafe "hs_bindgen_9d0caf2adc2a5703" hs_bindgen_9d0caf2adc2a5703 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr SoapySDRDevice)))

{-# NOINLINE soapySDRDevice_make #-}
{-| Make a new Device object given device construction args. The device pointer will be stored in a table so subsequent calls with the same arguments will produce the same device. For every call to make, there should be a matched call to unmake.

  [__@args@ /(input)/__]: device construction key/value argument map

  __returns:__ a pointer to a new Device object

__C declaration:__ @SoapySDRDevice_make@

__defined at:__ @SoapySDR\/Device.h:79:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr SoapySDRDevice))
soapySDRDevice_make =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9d0caf2adc2a5703

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_makeStrArgs@
foreign import ccall unsafe "hs_bindgen_a5d44a619e4603c1" hs_bindgen_a5d44a619e4603c1 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr SoapySDRDevice)))

{-# NOINLINE soapySDRDevice_makeStrArgs #-}
{-| Make a new Device object given device construction args. The device pointer will be stored in a table so subsequent calls with the same arguments will produce the same device. For every call to make, there should be a matched call to unmake.

  [__@args@ /(input)/__]: a markup string of key/value arguments

  __returns:__ a pointer to a new Device object or null for error

__C declaration:__ @SoapySDRDevice_makeStrArgs@

__defined at:__ @SoapySDR\/Device.h:90:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_makeStrArgs :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr SoapySDRDevice))
soapySDRDevice_makeStrArgs =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a5d44a619e4603c1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_unmake@
foreign import ccall unsafe "hs_bindgen_d940e4d66b25f75b" hs_bindgen_d940e4d66b25f75b ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_unmake #-}
{-| Unmake or release a device object handle.

  [__@device@ /(input)/__]: a pointer to a device object

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_unmake@

__defined at:__ @SoapySDR\/Device.h:98:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_unmake :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> IO FC.CInt)
soapySDRDevice_unmake =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d940e4d66b25f75b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make_list@
foreign import ccall unsafe "hs_bindgen_7d56e035b7b78638" hs_bindgen_7d56e035b7b78638 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))))

{-# NOINLINE soapySDRDevice_make_list #-}
{-| Create a list of devices from a list of construction arguments. This is a convenience call to parallelize device construction, and is fundamentally a parallel for loop of make(Kwargs).

  [__@argsList@ /(input)/__]: a list of device arguments per each device

  [__@length@ /(input)/__]: the length of the argsList array

  __returns:__ a list of device pointers per each specified argument

__C declaration:__ @SoapySDRDevice_make_list@

__defined at:__ @SoapySDR\/Device.h:113:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make_list :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice)))
soapySDRDevice_make_list =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7d56e035b7b78638

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_make_listStrArgs@
foreign import ccall unsafe "hs_bindgen_44d2ed90a77e9d4b" hs_bindgen_44d2ed90a77e9d4b ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)) -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice))))

{-# NOINLINE soapySDRDevice_make_listStrArgs #-}
{-| Create a list of devices from a list of construction arguments. This is a convenience call to parallelize device construction, and is fundamentally a parallel for loop of makeStrArgs(args).

  [__@argsList@ /(input)/__]: a list of device arguments per each device

  [__@length@ /(input)/__]: the length of the argsList array

  __returns:__ a list of device pointers per each specified argument

__C declaration:__ @SoapySDRDevice_make_listStrArgs@

__defined at:__ @SoapySDR\/Device.h:124:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_make_listStrArgs :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar)) -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr (Ptr.Ptr SoapySDRDevice)))
soapySDRDevice_make_listStrArgs =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_44d2ed90a77e9d4b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_unmake_list@
foreign import ccall unsafe "hs_bindgen_a609855a074bb528" hs_bindgen_a609855a074bb528 ::
     IO (Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr SoapySDRDevice)) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_unmake_list #-}
{-| Unmake or release a list of device handles and free the devices array memory as well. This is a convenience call to parallelize device destruction, and is fundamentally a parallel for loop of unmake(Device *).

  [__@devices@ /(input)/__]: a list of pointers to device objects

  [__@length@ /(input)/__]: the length of the devices array

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_unmake_list@

__defined at:__ @SoapySDR\/Device.h:136:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_unmake_list :: Ptr.FunPtr ((Ptr.Ptr (Ptr.Ptr SoapySDRDevice)) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt)
soapySDRDevice_unmake_list =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a609855a074bb528

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDriverKey@
foreign import ccall unsafe "hs_bindgen_637a1c65076d6b7a" hs_bindgen_637a1c65076d6b7a ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getDriverKey #-}
{-| A key that uniquely identifies the device driver. This key identifies the underlying implementation. Several variants of a product may share a driver.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getDriverKey@

__defined at:__ @SoapySDR\/Device.h:148:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDriverKey :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getDriverKey =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_637a1c65076d6b7a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareKey@
foreign import ccall unsafe "hs_bindgen_32af63eb60223b67" hs_bindgen_32af63eb60223b67 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getHardwareKey #-}
{-| A key that uniquely identifies the hardware. This key should be meaningful to the user to optimize for the underlying hardware.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getHardwareKey@

__defined at:__ @SoapySDR\/Device.h:156:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareKey :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getHardwareKey =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_32af63eb60223b67

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareInfo@
foreign import ccall unsafe "hs_bindgen_26c9e11b26d0192d" hs_bindgen_26c9e11b26d0192d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO SoapySDRKwargs))

{-# NOINLINE soapySDRDevice_getHardwareInfo #-}
{-| Query a dictionary of available device information. This dictionary can any number of values like vendor name, product name, revisions, serials... This information can be displayed to the user to help identify the instantiated device.

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_getHardwareInfo@

__defined at:__ @SoapySDR\/Device.h:166:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO SoapySDRKwargs)
soapySDRDevice_getHardwareInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_26c9e11b26d0192d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrontendMapping@
foreign import ccall unsafe "hs_bindgen_b9f390dccc1ceb3b" hs_bindgen_b9f390dccc1ceb3b ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setFrontendMapping #-}
{-| Set the frontend mapping of available DSP units to RF frontends. This mapping controls channel mapping and channel availability.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@mapping@ /(input)/__]: a vendor-specific mapping string

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setFrontendMapping@

__defined at:__ @SoapySDR\/Device.h:180:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setFrontendMapping :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setFrontendMapping =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b9f390dccc1ceb3b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrontendMapping@
foreign import ccall unsafe "hs_bindgen_52c7ea8d8f5377fe" hs_bindgen_52c7ea8d8f5377fe ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getFrontendMapping #-}
{-| Get the mapping configuration string.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  __returns:__ the vendor-specific mapping string

__C declaration:__ @SoapySDRDevice_getFrontendMapping@

__defined at:__ @SoapySDR\/Device.h:188:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrontendMapping :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getFrontendMapping =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_52c7ea8d8f5377fe

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNumChannels@
foreign import ccall unsafe "hs_bindgen_f4cb83ba2829066c" hs_bindgen_f4cb83ba2829066c ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> IO HsBindgen.Runtime.Prelude.CSize))

{-# NOINLINE soapySDRDevice_getNumChannels #-}
{-| Get a number of channels given the streaming direction

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  __returns:__ the number of channels

__C declaration:__ @SoapySDRDevice_getNumChannels@

__defined at:__ @SoapySDR\/Device.h:196:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNumChannels :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> IO HsBindgen.Runtime.Prelude.CSize)
soapySDRDevice_getNumChannels =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f4cb83ba2829066c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelInfo@
foreign import ccall unsafe "hs_bindgen_fff2bfe97d6007dd" hs_bindgen_fff2bfe97d6007dd ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO SoapySDRKwargs))

{-# NOINLINE soapySDRDevice_getChannelInfo #-}
{-| Get channel info given the streaming direction

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: the channel number to get info for

  __returns:__ channel information

__C declaration:__ @SoapySDRDevice_getChannelInfo@

__defined at:__ @SoapySDR\/Device.h:205:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getChannelInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO SoapySDRKwargs)
soapySDRDevice_getChannelInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fff2bfe97d6007dd

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFullDuplex@
foreign import ccall unsafe "hs_bindgen_44193b8ccd1ebbe4" hs_bindgen_44193b8ccd1ebbe4 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_getFullDuplex #-}
{-| Find out if the specified channel is full or half duplex.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for full duplex, false for half duplex

__C declaration:__ @SoapySDRDevice_getFullDuplex@

__defined at:__ @SoapySDR\/Device.h:214:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFullDuplex :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_getFullDuplex =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_44193b8ccd1ebbe4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamFormats@
foreign import ccall unsafe "hs_bindgen_5fcca7057c790fe9" hs_bindgen_5fcca7057c790fe9 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_getStreamFormats #-}
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
soapySDRDevice_getStreamFormats :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_getStreamFormats =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5fcca7057c790fe9

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNativeStreamFormat@
foreign import ccall unsafe "hs_bindgen_da89681fec2dd4e7" hs_bindgen_da89681fec2dd4e7 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getNativeStreamFormat #-}
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
soapySDRDevice_getNativeStreamFormat :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getNativeStreamFormat =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_da89681fec2dd4e7

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamArgsInfo@
foreign import ccall unsafe "hs_bindgen_88565a9a7f2bc3a1" hs_bindgen_88565a9a7f2bc3a1 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo)))

{-# NOINLINE soapySDRDevice_getStreamArgsInfo #-}
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
soapySDRDevice_getStreamArgsInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo))
soapySDRDevice_getStreamArgsInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_88565a9a7f2bc3a1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setupStream@
foreign import ccall unsafe "hs_bindgen_268e91f4aca15e74" hs_bindgen_268e91f4aca15e74 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr HsBindgen.Runtime.Prelude.CSize) -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr SoapySDRStream)))

{-# NOINLINE soapySDRDevice_setupStream #-}
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
soapySDRDevice_setupStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr HsBindgen.Runtime.Prelude.CSize) -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO (Ptr.Ptr SoapySDRStream))
soapySDRDevice_setupStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_268e91f4aca15e74

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_closeStream@
foreign import ccall unsafe "hs_bindgen_c6b8d6eed699c084" hs_bindgen_c6b8d6eed699c084 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_closeStream #-}
{-| Close an open stream created by setupStream

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_closeStream@

__defined at:__ @SoapySDR\/Device.h:317:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_closeStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO FC.CInt)
soapySDRDevice_closeStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_c6b8d6eed699c084

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getStreamMTU@
foreign import ccall unsafe "hs_bindgen_7ce2089fc9ced311" hs_bindgen_7ce2089fc9ced311 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO HsBindgen.Runtime.Prelude.CSize))

{-# NOINLINE soapySDRDevice_getStreamMTU #-}
{-| Get the stream's maximum transmission unit (MTU) in number of elements. The MTU specifies the maximum payload transfer in a stream operation. This value can be used as a stream buffer allocation size that can best optimize throughput given the underlying stream implementation.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ the MTU in number of stream elements (never zero)

__C declaration:__ @SoapySDRDevice_getStreamMTU@

__defined at:__ @SoapySDR\/Device.h:329:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getStreamMTU :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO HsBindgen.Runtime.Prelude.CSize)
soapySDRDevice_getStreamMTU =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7ce2089fc9ced311

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_activateStream@
foreign import ccall unsafe "hs_bindgen_21475fc49c6909d6" hs_bindgen_21475fc49c6909d6 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> FC.CInt -> FC.CLLong -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_activateStream #-}
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
soapySDRDevice_activateStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> FC.CInt -> FC.CLLong -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt)
soapySDRDevice_activateStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_21475fc49c6909d6

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_deactivateStream@
foreign import ccall unsafe "hs_bindgen_e16a90cbbaef369e" hs_bindgen_e16a90cbbaef369e ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> FC.CInt -> FC.CLLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_deactivateStream #-}
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
soapySDRDevice_deactivateStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> FC.CInt -> FC.CLLong -> IO FC.CInt)
soapySDRDevice_deactivateStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e16a90cbbaef369e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readStream@
foreign import ccall unsafe "hs_bindgen_df43497931325d67" hs_bindgen_df43497931325d67 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (HsBindgen.Runtime.ConstPtr.ConstPtr (Ptr.Ptr Void)) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_readStream #-}
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
soapySDRDevice_readStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (HsBindgen.Runtime.ConstPtr.ConstPtr (Ptr.Ptr Void)) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt)
soapySDRDevice_readStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_df43497931325d67

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeStream@
foreign import ccall unsafe "hs_bindgen_1ceb331ad3b4b5ac" hs_bindgen_1ceb331ad3b4b5ac ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> FC.CLLong -> FC.CLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeStream #-}
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
soapySDRDevice_writeStream :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (HsBindgen.Runtime.ConstPtr.ConstPtr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> FC.CLLong -> FC.CLong -> IO FC.CInt)
soapySDRDevice_writeStream =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_1ceb331ad3b4b5ac

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readStreamStatus@
foreign import ccall unsafe "hs_bindgen_3ff80768535889f8" hs_bindgen_3ff80768535889f8 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_readStreamStatus #-}
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
soapySDRDevice_readStreamStatus :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt)
soapySDRDevice_readStreamStatus =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3ff80768535889f8

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNumDirectAccessBuffers@
foreign import ccall unsafe "hs_bindgen_23f4e34ed59ee021" hs_bindgen_23f4e34ed59ee021 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO HsBindgen.Runtime.Prelude.CSize))

{-# NOINLINE soapySDRDevice_getNumDirectAccessBuffers #-}
{-| How many direct access buffers can the stream provide? This is the number of times the user can call acquire() on a stream without making subsequent calls to release(). A return value of 0 means that direct access is not supported.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  __returns:__ the number of direct access buffers or 0

__C declaration:__ @SoapySDRDevice_getNumDirectAccessBuffers@

__defined at:__ @SoapySDR\/Device.h:473:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNumDirectAccessBuffers :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> IO HsBindgen.Runtime.Prelude.CSize)
soapySDRDevice_getNumDirectAccessBuffers =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_23f4e34ed59ee021

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDirectAccessBufferAddrs@
foreign import ccall unsafe "hs_bindgen_77173d2e46c7fa98" hs_bindgen_77173d2e46c7fa98 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr (Ptr.Ptr Void)) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_getDirectAccessBufferAddrs #-}
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
soapySDRDevice_getDirectAccessBufferAddrs :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr (Ptr.Ptr Void)) -> IO FC.CInt)
soapySDRDevice_getDirectAccessBufferAddrs =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_77173d2e46c7fa98

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_acquireReadBuffer@
foreign import ccall unsafe "hs_bindgen_54cb1e4c0a397b9d" hs_bindgen_54cb1e4c0a397b9d ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)) -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_acquireReadBuffer #-}
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
soapySDRDevice_acquireReadBuffer :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr (HsBindgen.Runtime.ConstPtr.ConstPtr Void)) -> (Ptr.Ptr FC.CInt) -> (Ptr.Ptr FC.CLLong) -> FC.CLong -> IO FC.CInt)
soapySDRDevice_acquireReadBuffer =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_54cb1e4c0a397b9d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_releaseReadBuffer@
foreign import ccall unsafe "hs_bindgen_13f53c502340b615" hs_bindgen_13f53c502340b615 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> IO ()))

{-# NOINLINE soapySDRDevice_releaseReadBuffer #-}
{-| Release an acquired buffer back to the receive stream. This call is part of the direct buffer access API.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@stream@ /(input)/__]: the opaque pointer to a stream handle

  [__@handle@ /(input)/__]: the opaque handle from the acquire() call

__C declaration:__ @SoapySDRDevice_releaseReadBuffer@

__defined at:__ @SoapySDR\/Device.h:528:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_releaseReadBuffer :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> IO ())
soapySDRDevice_releaseReadBuffer =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_13f53c502340b615

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_acquireWriteBuffer@
foreign import ccall unsafe "hs_bindgen_51d7440712c746af" hs_bindgen_51d7440712c746af ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr (Ptr.Ptr Void)) -> FC.CLong -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_acquireWriteBuffer #-}
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
soapySDRDevice_acquireWriteBuffer :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> (Ptr.Ptr (Ptr.Ptr Void)) -> FC.CLong -> IO FC.CInt)
soapySDRDevice_acquireWriteBuffer =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_51d7440712c746af

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_releaseWriteBuffer@
foreign import ccall unsafe "hs_bindgen_28715051767cc96e" hs_bindgen_28715051767cc96e ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> FC.CLLong -> IO ()))

{-# NOINLINE soapySDRDevice_releaseWriteBuffer #-}
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
soapySDRDevice_releaseWriteBuffer :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (Ptr.Ptr SoapySDRStream) -> HsBindgen.Runtime.Prelude.CSize -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CInt) -> FC.CLLong -> IO ())
soapySDRDevice_releaseWriteBuffer =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_28715051767cc96e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listAntennas@
foreign import ccall unsafe "hs_bindgen_a487de1cdc3aa213" hs_bindgen_a487de1cdc3aa213 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listAntennas #-}
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
soapySDRDevice_listAntennas :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listAntennas =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a487de1cdc3aa213

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setAntenna@
foreign import ccall unsafe "hs_bindgen_4823c3f886fcfc79" hs_bindgen_4823c3f886fcfc79 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setAntenna #-}
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
soapySDRDevice_setAntenna :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setAntenna =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4823c3f886fcfc79

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getAntenna@
foreign import ccall unsafe "hs_bindgen_2917db609c029f74" hs_bindgen_2917db609c029f74 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getAntenna #-}
{-| Get the selected antenna on a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the name of an available antenna

__C declaration:__ @SoapySDRDevice_getAntenna@

__defined at:__ @SoapySDR\/Device.h:611:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getAntenna :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getAntenna =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2917db609c029f74

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasDCOffsetMode@
foreign import ccall unsafe "hs_bindgen_ee5f12a1552e20e3" hs_bindgen_ee5f12a1552e20e3 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasDCOffsetMode #-}
{-| Does the device support automatic DC offset corrections?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if automatic corrections are supported

__C declaration:__ @SoapySDRDevice_hasDCOffsetMode@

__defined at:__ @SoapySDR\/Device.h:624:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasDCOffsetMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasDCOffsetMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ee5f12a1552e20e3

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setDCOffsetMode@
foreign import ccall unsafe "hs_bindgen_5f714639c1d18805" hs_bindgen_5f714639c1d18805 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setDCOffsetMode #-}
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
soapySDRDevice_setDCOffsetMode :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt)
soapySDRDevice_setDCOffsetMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5f714639c1d18805

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDCOffsetMode@
foreign import ccall unsafe "hs_bindgen_823a19a71ee85865" hs_bindgen_823a19a71ee85865 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_getDCOffsetMode #-}
{-| Get the automatic DC offset corrections mode.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic offset correction

__C declaration:__ @SoapySDRDevice_getDCOffsetMode@

__defined at:__ @SoapySDR\/Device.h:643:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getDCOffsetMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_getDCOffsetMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_823a19a71ee85865

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasDCOffset@
foreign import ccall unsafe "hs_bindgen_d96a9a41374b1670" hs_bindgen_d96a9a41374b1670 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasDCOffset #-}
{-| Does the device support frontend DC offset correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if DC offset corrections are supported

__C declaration:__ @SoapySDRDevice_hasDCOffset@

__defined at:__ @SoapySDR\/Device.h:652:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasDCOffset :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasDCOffset =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d96a9a41374b1670

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setDCOffset@
foreign import ccall unsafe "hs_bindgen_34f7ea298a6a1649" hs_bindgen_34f7ea298a6a1649 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setDCOffset #-}
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
soapySDRDevice_setDCOffset :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setDCOffset =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_34f7ea298a6a1649

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getDCOffset@
foreign import ccall unsafe "hs_bindgen_538b07573a10cb8e" hs_bindgen_538b07573a10cb8e ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> (Ptr.Ptr FC.CDouble) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_getDCOffset #-}
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
soapySDRDevice_getDCOffset :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> (Ptr.Ptr FC.CDouble) -> IO FC.CInt)
soapySDRDevice_getDCOffset =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_538b07573a10cb8e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasIQBalance@
foreign import ccall unsafe "hs_bindgen_2136acc14ab8625c" hs_bindgen_2136acc14ab8625c ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasIQBalance #-}
{-| Does the device support frontend IQ balance correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if IQ balance corrections are supported

__C declaration:__ @SoapySDRDevice_hasIQBalance@

__defined at:__ @SoapySDR\/Device.h:683:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasIQBalance :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasIQBalance =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2136acc14ab8625c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setIQBalance@
foreign import ccall unsafe "hs_bindgen_494858250807859c" hs_bindgen_494858250807859c ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setIQBalance #-}
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
soapySDRDevice_setIQBalance :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setIQBalance =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_494858250807859c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getIQBalance@
foreign import ccall unsafe "hs_bindgen_7a463a662153c5cb" hs_bindgen_7a463a662153c5cb ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> (Ptr.Ptr FC.CDouble) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_getIQBalance #-}
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
soapySDRDevice_getIQBalance :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr FC.CDouble) -> (Ptr.Ptr FC.CDouble) -> IO FC.CInt)
soapySDRDevice_getIQBalance =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7a463a662153c5cb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasIQBalanceMode@
foreign import ccall unsafe "hs_bindgen_45d34703790d5a8d" hs_bindgen_45d34703790d5a8d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasIQBalanceMode #-}
{-| Does the device support automatic frontend IQ balance correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if automatic IQ balance corrections are supported

__C declaration:__ @SoapySDRDevice_hasIQBalanceMode@

__defined at:__ @SoapySDR\/Device.h:714:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasIQBalanceMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasIQBalanceMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_45d34703790d5a8d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setIQBalanceMode@
foreign import ccall unsafe "hs_bindgen_f6ecffc3e0d5fcbe" hs_bindgen_f6ecffc3e0d5fcbe ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setIQBalanceMode #-}
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
soapySDRDevice_setIQBalanceMode :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt)
soapySDRDevice_setIQBalanceMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f6ecffc3e0d5fcbe

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getIQBalanceMode@
foreign import ccall unsafe "hs_bindgen_49ad632ce04165e2" hs_bindgen_49ad632ce04165e2 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_getIQBalanceMode #-}
{-| Get the automatic frontend IQ balance corrections mode.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic correction

__C declaration:__ @SoapySDRDevice_getIQBalanceMode@

__defined at:__ @SoapySDR\/Device.h:733:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getIQBalanceMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_getIQBalanceMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_49ad632ce04165e2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasFrequencyCorrection@
foreign import ccall unsafe "hs_bindgen_3d166fef4e14783a" hs_bindgen_3d166fef4e14783a ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasFrequencyCorrection #-}
{-| Does the device support frontend frequency correction?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true if frequency corrections are supported

__C declaration:__ @SoapySDRDevice_hasFrequencyCorrection@

__defined at:__ @SoapySDR\/Device.h:742:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasFrequencyCorrection :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasFrequencyCorrection =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3d166fef4e14783a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequencyCorrection@
foreign import ccall unsafe "hs_bindgen_20500b97012c159a" hs_bindgen_20500b97012c159a ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setFrequencyCorrection #-}
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
soapySDRDevice_setFrequencyCorrection :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setFrequencyCorrection =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_20500b97012c159a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyCorrection@
foreign import ccall unsafe "hs_bindgen_2d5a5abdcde5d645" hs_bindgen_2d5a5abdcde5d645 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getFrequencyCorrection #-}
{-| Get the frontend frequency correction value.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the correction value in PPM

__C declaration:__ @SoapySDRDevice_getFrequencyCorrection@

__defined at:__ @SoapySDR\/Device.h:761:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequencyCorrection :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble)
soapySDRDevice_getFrequencyCorrection =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2d5a5abdcde5d645

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listGains@
foreign import ccall unsafe "hs_bindgen_791dbe9631b234df" hs_bindgen_791dbe9631b234df ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listGains #-}
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
soapySDRDevice_listGains :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listGains =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_791dbe9631b234df

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasGainMode@
foreign import ccall unsafe "hs_bindgen_6fb42055eb50320b" hs_bindgen_6fb42055eb50320b ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasGainMode #-}
{-| Does the device support automatic gain control?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic gain control

__C declaration:__ @SoapySDRDevice_hasGainMode@

__defined at:__ @SoapySDR\/Device.h:785:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasGainMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_hasGainMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6fb42055eb50320b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGainMode@
foreign import ccall unsafe "hs_bindgen_5763e46531dea6df" hs_bindgen_5763e46531dea6df ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setGainMode #-}
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
soapySDRDevice_setGainMode :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CBool -> IO FC.CInt)
soapySDRDevice_setGainMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5763e46531dea6df

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainMode@
foreign import ccall unsafe "hs_bindgen_41a8305c5a1af389" hs_bindgen_41a8305c5a1af389 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_getGainMode #-}
{-| Get the automatic gain mode on the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ true for automatic gain setting

__C declaration:__ @SoapySDRDevice_getGainMode@

__defined at:__ @SoapySDR\/Device.h:804:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainMode :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CBool)
soapySDRDevice_getGainMode =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_41a8305c5a1af389

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGain@
foreign import ccall unsafe "hs_bindgen_dea8c759e1230bc9" hs_bindgen_dea8c759e1230bc9 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setGain #-}
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
soapySDRDevice_setGain :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setGain =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_dea8c759e1230bc9

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setGainElement@
foreign import ccall unsafe "hs_bindgen_22128798206b272b" hs_bindgen_22128798206b272b ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setGainElement #-}
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
soapySDRDevice_setGainElement :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setGainElement =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_22128798206b272b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGain@
foreign import ccall unsafe "hs_bindgen_20e0115c6a6ee7a0" hs_bindgen_20e0115c6a6ee7a0 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getGain #-}
{-| Get the overall value of the gain elements in a chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the value of the gain in dB

__C declaration:__ @SoapySDRDevice_getGain@

__defined at:__ @SoapySDR\/Device.h:835:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGain :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble)
soapySDRDevice_getGain =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_20e0115c6a6ee7a0

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainElement@
foreign import ccall unsafe "hs_bindgen_74ec0a7126c077f2" hs_bindgen_74ec0a7126c077f2 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getGainElement #-}
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
soapySDRDevice_getGainElement :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CDouble)
soapySDRDevice_getGainElement =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_74ec0a7126c077f2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainRange@
foreign import ccall unsafe "hs_bindgen_9f3c0f3d2a34172b" hs_bindgen_9f3c0f3d2a34172b ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO SoapySDRRange))

{-# NOINLINE soapySDRDevice_getGainRange #-}
{-| Get the overall range of possible gain values.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the range of possible gain values for this channel in dB

__C declaration:__ @SoapySDRDevice_getGainRange@

__defined at:__ @SoapySDR\/Device.h:854:29@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getGainRange :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO SoapySDRRange)
soapySDRDevice_getGainRange =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9f3c0f3d2a34172b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getGainElementRange@
foreign import ccall unsafe "hs_bindgen_b4e01ae94a7cd84c" hs_bindgen_b4e01ae94a7cd84c ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRRange))

{-# NOINLINE soapySDRDevice_getGainElementRange #-}
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
soapySDRDevice_getGainElementRange :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRRange)
soapySDRDevice_getGainElementRange =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b4e01ae94a7cd84c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequency@
foreign import ccall unsafe "hs_bindgen_e2abe0632126bd76" hs_bindgen_e2abe0632126bd76 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setFrequency #-}
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
soapySDRDevice_setFrequency :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO FC.CInt)
soapySDRDevice_setFrequency =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e2abe0632126bd76

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setFrequencyComponent@
foreign import ccall unsafe "hs_bindgen_fd276cbf675feb04" hs_bindgen_fd276cbf675feb04 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CDouble -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setFrequencyComponent #-}
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
soapySDRDevice_setFrequencyComponent :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CDouble -> (HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRKwargs) -> IO FC.CInt)
soapySDRDevice_setFrequencyComponent =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fd276cbf675feb04

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequency@
foreign import ccall unsafe "hs_bindgen_7402bb13fa695203" hs_bindgen_7402bb13fa695203 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getFrequency #-}
{-| Get the overall center frequency of the chain. - For RX, this specifies the down-conversion frequency. - For TX, this specifies the up-conversion frequency.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the center frequency in Hz

__C declaration:__ @SoapySDRDevice_getFrequency@

__defined at:__ @SoapySDR\/Device.h:930:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getFrequency :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble)
soapySDRDevice_getFrequency =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7402bb13fa695203

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyComponent@
foreign import ccall unsafe "hs_bindgen_05e5ae620a7435ef" hs_bindgen_05e5ae620a7435ef ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getFrequencyComponent #-}
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
soapySDRDevice_getFrequencyComponent :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CDouble)
soapySDRDevice_getFrequencyComponent =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_05e5ae620a7435ef

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listFrequencies@
foreign import ccall unsafe "hs_bindgen_54304f0137d20823" hs_bindgen_54304f0137d20823 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listFrequencies #-}
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
soapySDRDevice_listFrequencies :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listFrequencies =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_54304f0137d20823

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyRange@
foreign import ccall unsafe "hs_bindgen_4197ac2df74f4d6b" hs_bindgen_4197ac2df74f4d6b ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getFrequencyRange #-}
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
soapySDRDevice_getFrequencyRange :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getFrequencyRange =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4197ac2df74f4d6b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyRangeComponent@
foreign import ccall unsafe "hs_bindgen_dd55f419d5b1d780" hs_bindgen_dd55f419d5b1d780 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getFrequencyRangeComponent #-}
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
soapySDRDevice_getFrequencyRangeComponent :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getFrequencyRangeComponent =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_dd55f419d5b1d780

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getFrequencyArgsInfo@
foreign import ccall unsafe "hs_bindgen_84a51eb960ee1565" hs_bindgen_84a51eb960ee1565 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo)))

{-# NOINLINE soapySDRDevice_getFrequencyArgsInfo #-}
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
soapySDRDevice_getFrequencyArgsInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo))
soapySDRDevice_getFrequencyArgsInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_84a51eb960ee1565

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setSampleRate@
foreign import ccall unsafe "hs_bindgen_a7f514d0c9a80eb7" hs_bindgen_a7f514d0c9a80eb7 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setSampleRate #-}
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
soapySDRDevice_setSampleRate :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setSampleRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_a7f514d0c9a80eb7

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSampleRate@
foreign import ccall unsafe "hs_bindgen_feb8e23036ee77ae" hs_bindgen_feb8e23036ee77ae ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getSampleRate #-}
{-| Get the baseband sample rate of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the sample rate in samples per second

__C declaration:__ @SoapySDRDevice_getSampleRate@

__defined at:__ @SoapySDR\/Device.h:1005:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSampleRate :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble)
soapySDRDevice_getSampleRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_feb8e23036ee77ae

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listSampleRates@
foreign import ccall unsafe "hs_bindgen_704fe2f24eca7a1d" hs_bindgen_704fe2f24eca7a1d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CDouble)))

{-# NOINLINE soapySDRDevice_listSampleRates #-}
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
soapySDRDevice_listSampleRates :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CDouble))
soapySDRDevice_listSampleRates =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_704fe2f24eca7a1d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSampleRateRange@
foreign import ccall unsafe "hs_bindgen_3118020ba86f88a4" hs_bindgen_3118020ba86f88a4 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getSampleRateRange #-}
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
soapySDRDevice_getSampleRateRange :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getSampleRateRange =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3118020ba86f88a4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setBandwidth@
foreign import ccall unsafe "hs_bindgen_35ade2c9bde972e2" hs_bindgen_35ade2c9bde972e2 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setBandwidth #-}
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
soapySDRDevice_setBandwidth :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setBandwidth =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_35ade2c9bde972e2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getBandwidth@
foreign import ccall unsafe "hs_bindgen_825a69be91ebd08b" hs_bindgen_825a69be91ebd08b ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getBandwidth #-}
{-| Get the baseband filter width of the chain.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@direction@ /(input)/__]: the channel direction RX or TX

  [__@channel@ /(input)/__]: an available channel on the device

  __returns:__ the baseband filter width in Hz

__C declaration:__ @SoapySDRDevice_getBandwidth@

__defined at:__ @SoapySDR\/Device.h:1049:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getBandwidth :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CDouble)
soapySDRDevice_getBandwidth =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_825a69be91ebd08b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listBandwidths@
foreign import ccall unsafe "hs_bindgen_f235a17ab2f2c188" hs_bindgen_f235a17ab2f2c188 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CDouble)))

{-# NOINLINE soapySDRDevice_listBandwidths #-}
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
soapySDRDevice_listBandwidths :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CDouble))
soapySDRDevice_listBandwidths =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f235a17ab2f2c188

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getBandwidthRange@
foreign import ccall unsafe "hs_bindgen_9eb9d8940ef78b43" hs_bindgen_9eb9d8940ef78b43 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getBandwidthRange #-}
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
soapySDRDevice_getBandwidthRange :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getBandwidthRange =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9eb9d8940ef78b43

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setMasterClockRate@
foreign import ccall unsafe "hs_bindgen_9f3fa9d464695570" hs_bindgen_9f3fa9d464695570 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setMasterClockRate #-}
{-| Set the master clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@rate@ /(input)/__]: the clock rate in Hz

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setMasterClockRate@

__defined at:__ @SoapySDR\/Device.h:1082:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setMasterClockRate :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setMasterClockRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9f3fa9d464695570

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getMasterClockRate@
foreign import ccall unsafe "hs_bindgen_80a90d5821e6cf3d" hs_bindgen_80a90d5821e6cf3d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getMasterClockRate #-}
{-| Get the master clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the clock rate in Hz

__C declaration:__ @SoapySDRDevice_getMasterClockRate@

__defined at:__ @SoapySDR\/Device.h:1089:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getMasterClockRate :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO FC.CDouble)
soapySDRDevice_getMasterClockRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_80a90d5821e6cf3d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getMasterClockRates@
foreign import ccall unsafe "hs_bindgen_495b23ddcce63945" hs_bindgen_495b23ddcce63945 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getMasterClockRates #-}
{-| Get the range of available master clock rates.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of ranges

  __returns:__ a list of clock rate ranges in Hz

__C declaration:__ @SoapySDRDevice_getMasterClockRates@

__defined at:__ @SoapySDR\/Device.h:1097:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getMasterClockRates :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getMasterClockRates =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_495b23ddcce63945

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setReferenceClockRate@
foreign import ccall unsafe "hs_bindgen_6d613771486a1e9a" hs_bindgen_6d613771486a1e9a ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CDouble -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setReferenceClockRate #-}
{-| Set the reference clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@rate@ /(input)/__]: the clock rate in Hz

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setReferenceClockRate@

__defined at:__ @SoapySDR\/Device.h:1105:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setReferenceClockRate :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CDouble -> IO FC.CInt)
soapySDRDevice_setReferenceClockRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6d613771486a1e9a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getReferenceClockRate@
foreign import ccall unsafe "hs_bindgen_9b2378e242a5eb17" hs_bindgen_9b2378e242a5eb17 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO FC.CDouble))

{-# NOINLINE soapySDRDevice_getReferenceClockRate #-}
{-| Get the reference clock rate of the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the clock rate in Hz

__C declaration:__ @SoapySDRDevice_getReferenceClockRate@

__defined at:__ @SoapySDR\/Device.h:1112:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getReferenceClockRate :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO FC.CDouble)
soapySDRDevice_getReferenceClockRate =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_9b2378e242a5eb17

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getReferenceClockRates@
foreign import ccall unsafe "hs_bindgen_0ca27689ad6fcce1" hs_bindgen_0ca27689ad6fcce1 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange)))

{-# NOINLINE soapySDRDevice_getReferenceClockRates #-}
{-| Get the range of available reference clock rates.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of clock rate ranges in Hz

__C declaration:__ @SoapySDRDevice_getReferenceClockRates@

__defined at:__ @SoapySDR\/Device.h:1120:30@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getReferenceClockRates :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRRange))
soapySDRDevice_getReferenceClockRates =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0ca27689ad6fcce1

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listClockSources@
foreign import ccall unsafe "hs_bindgen_380a4d635a8a0ff3" hs_bindgen_380a4d635a8a0ff3 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listClockSources #-}
{-| Get the list of available clock sources.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of clock source names

__C declaration:__ @SoapySDRDevice_listClockSources@

__defined at:__ @SoapySDR\/Device.h:1128:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listClockSources :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listClockSources =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_380a4d635a8a0ff3

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setClockSource@
foreign import ccall unsafe "hs_bindgen_5823024806211639" hs_bindgen_5823024806211639 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setClockSource #-}
{-| Set the clock source on the device

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@source@ /(input)/__]: the name of a clock source

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setClockSource@

__defined at:__ @SoapySDR\/Device.h:1136:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setClockSource :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setClockSource =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_5823024806211639

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getClockSource@
foreign import ccall unsafe "hs_bindgen_b9ebee7b611c5c99" hs_bindgen_b9ebee7b611c5c99 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getClockSource #-}
{-| Get the clock source of the device

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the name of a clock source

__C declaration:__ @SoapySDRDevice_getClockSource@

__defined at:__ @SoapySDR\/Device.h:1143:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getClockSource :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getClockSource =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b9ebee7b611c5c99

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listTimeSources@
foreign import ccall unsafe "hs_bindgen_360d81e302a07db0" hs_bindgen_360d81e302a07db0 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listTimeSources #-}
{-| Get the list of available time sources.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sources

  __returns:__ a list of time source names

__C declaration:__ @SoapySDRDevice_listTimeSources@

__defined at:__ @SoapySDR\/Device.h:1155:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listTimeSources :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listTimeSources =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_360d81e302a07db0

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setTimeSource@
foreign import ccall unsafe "hs_bindgen_ec7e7dc346fa491e" hs_bindgen_ec7e7dc346fa491e ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setTimeSource #-}
{-| Set the time source on the device

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@source@ /(input)/__]: the name of a time source

  __returns:__ an error code or 0 for success

__C declaration:__ @SoapySDRDevice_setTimeSource@

__defined at:__ @SoapySDR\/Device.h:1163:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setTimeSource :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setTimeSource =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ec7e7dc346fa491e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getTimeSource@
foreign import ccall unsafe "hs_bindgen_34870e13e6b04674" hs_bindgen_34870e13e6b04674 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_getTimeSource #-}
{-| Get the time source of the device

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ the name of a time source

__C declaration:__ @SoapySDRDevice_getTimeSource@

__defined at:__ @SoapySDR\/Device.h:1170:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getTimeSource :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_getTimeSource =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_34870e13e6b04674

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_hasHardwareTime@
foreign import ccall unsafe "hs_bindgen_7ef9db0480637755" hs_bindgen_7ef9db0480637755 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CBool))

{-# NOINLINE soapySDRDevice_hasHardwareTime #-}
{-| Does this device have a hardware clock?

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@what@ /(input)/__]: optional argument

  __returns:__ true if the hardware clock exists

__C declaration:__ @SoapySDRDevice_hasHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1178:20@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_hasHardwareTime :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CBool)
soapySDRDevice_hasHardwareTime =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7ef9db0480637755

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getHardwareTime@
foreign import ccall unsafe "hs_bindgen_e870384319cb178e" hs_bindgen_e870384319cb178e ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CLLong))

{-# NOINLINE soapySDRDevice_getHardwareTime #-}
{-| Read the time from the hardware clock on the device. The what argument can refer to a specific time counter.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@what@ /(input)/__]: optional argument

  __returns:__ the time in nanoseconds

__C declaration:__ @SoapySDRDevice_getHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1187:25@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getHardwareTime :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CLLong)
soapySDRDevice_getHardwareTime =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e870384319cb178e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setHardwareTime@
foreign import ccall unsafe "hs_bindgen_602bdea01ac1b15d" hs_bindgen_602bdea01ac1b15d ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CLLong -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setHardwareTime #-}
{-| Write the time to the hardware clock on the device. The what argument can refer to a specific time counter.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@timeNs@ /(input)/__]: time in nanoseconds

  [__@what@ /(input)/__]: optional argument

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_setHardwareTime@

__defined at:__ @SoapySDR\/Device.h:1197:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_setHardwareTime :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CLLong -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setHardwareTime =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_602bdea01ac1b15d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_setCommandTime@
foreign import ccall unsafe "hs_bindgen_db6242a4a82ef62b" hs_bindgen_db6242a4a82ef62b ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CLLong -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_setCommandTime #-}
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
soapySDRDevice_setCommandTime :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CLLong -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_setCommandTime =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_db6242a4a82ef62b

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listSensors@
foreign import ccall unsafe "hs_bindgen_7b42897ccddba16d" hs_bindgen_7b42897ccddba16d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listSensors #-}
{-| List the available global readback sensors. A sensor can represent a reference lock, RSSI, temperature.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of available sensor string names

__C declaration:__ @SoapySDRDevice_listSensors@

__defined at:__ @SoapySDR\/Device.h:1222:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listSensors :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listSensors =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7b42897ccddba16d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSensorInfo@
foreign import ccall unsafe "hs_bindgen_e4e325408873b676" hs_bindgen_e4e325408873b676 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo))

{-# NOINLINE soapySDRDevice_getSensorInfo #-}
{-| Get meta-information about a sensor. Example: displayable name, type, range.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ meta-information about a sensor

__C declaration:__ @SoapySDRDevice_getSensorInfo@

__defined at:__ @SoapySDR\/Device.h:1231:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSensorInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo)
soapySDRDevice_getSensorInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_e4e325408873b676

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readSensor@
foreign import ccall unsafe "hs_bindgen_3f4d2e704ce05f72" hs_bindgen_3f4d2e704ce05f72 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readSensor #-}
{-| Readback a global sensor given the name. The value returned is a string which can represent a boolean ("true"/"false"), an integer, or float.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the ID name of an available sensor

  __returns:__ the current value of the sensor

__C declaration:__ @SoapySDRDevice_readSensor@

__defined at:__ @SoapySDR\/Device.h:1241:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readSensor :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readSensor =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_3f4d2e704ce05f72

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listChannelSensors@
foreign import ccall unsafe "hs_bindgen_7264b37b0662bc5c" hs_bindgen_7264b37b0662bc5c ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listChannelSensors #-}
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
soapySDRDevice_listChannelSensors :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listChannelSensors =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_7264b37b0662bc5c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSensorInfo@
foreign import ccall unsafe "hs_bindgen_2dfe3aac15a0452d" hs_bindgen_2dfe3aac15a0452d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo))

{-# NOINLINE soapySDRDevice_getChannelSensorInfo #-}
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
soapySDRDevice_getChannelSensorInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo)
soapySDRDevice_getChannelSensorInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_2dfe3aac15a0452d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readChannelSensor@
foreign import ccall unsafe "hs_bindgen_0a4eef10673652b2" hs_bindgen_0a4eef10673652b2 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readChannelSensor #-}
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
soapySDRDevice_readChannelSensor :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readChannelSensor =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0a4eef10673652b2

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listRegisterInterfaces@
foreign import ccall unsafe "hs_bindgen_6c440ae03d9a8023" hs_bindgen_6c440ae03d9a8023 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listRegisterInterfaces #-}
{-| Get a list of available register interfaces by name.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of interfaces

  __returns:__ a list of available register interfaces

__C declaration:__ @SoapySDRDevice_listRegisterInterfaces@

__defined at:__ @SoapySDR\/Device.h:1287:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listRegisterInterfaces :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listRegisterInterfaces =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_6c440ae03d9a8023

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeRegister@
foreign import ccall unsafe "hs_bindgen_07f6d140de923213" hs_bindgen_07f6d140de923213 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeRegister #-}
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
soapySDRDevice_writeRegister :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt)
soapySDRDevice_writeRegister =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_07f6d140de923213

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readRegister@
foreign import ccall unsafe "hs_bindgen_23189758eeebf8ac" hs_bindgen_23189758eeebf8ac ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CUInt))

{-# NOINLINE soapySDRDevice_readRegister #-}
{-| Read a register on the device given the interface name.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@name@ /(input)/__]: the name of a available register interface

  [__@addr@ /(input)/__]: the register address

  __returns:__ the register value

__C declaration:__ @SoapySDRDevice_readRegister@

__defined at:__ @SoapySDR\/Device.h:1308:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readRegister :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CUInt)
soapySDRDevice_readRegister =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_23189758eeebf8ac

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeRegisters@
foreign import ccall unsafe "hs_bindgen_d6475640c8638e3c" hs_bindgen_d6475640c8638e3c ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CUInt) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeRegisters #-}
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
soapySDRDevice_writeRegisters :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CUInt) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt)
soapySDRDevice_writeRegisters =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d6475640c8638e3c

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readRegisters@
foreign import ccall unsafe "hs_bindgen_4c9f843c95c615d8" hs_bindgen_4c9f843c95c615d8 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CUInt)))

{-# NOINLINE soapySDRDevice_readRegisters #-}
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
soapySDRDevice_readRegisters :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CUInt))
soapySDRDevice_readRegisters =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4c9f843c95c615d8

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSettingInfo@
foreign import ccall unsafe "hs_bindgen_4347e4ca2ce5b867" hs_bindgen_4347e4ca2ce5b867 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo)))

{-# NOINLINE soapySDRDevice_getSettingInfo #-}
{-| Describe the allowed keys and values used for settings.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of sensor names

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getSettingInfo@

__defined at:__ @SoapySDR\/Device.h:1345:32@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSettingInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo))
soapySDRDevice_getSettingInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_4347e4ca2ce5b867

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getSettingInfoWithKey@
foreign import ccall unsafe "hs_bindgen_bca43350b18c6bf8" hs_bindgen_bca43350b18c6bf8 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo))

{-# NOINLINE soapySDRDevice_getSettingInfoWithKey #-}
{-| Get information on a specific setting.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ a list of argument info structures

__C declaration:__ @SoapySDRDevice_getSettingInfoWithKey@

__defined at:__ @SoapySDR\/Device.h:1353:31@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getSettingInfoWithKey :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo)
soapySDRDevice_getSettingInfoWithKey =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_bca43350b18c6bf8

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeSetting@
foreign import ccall unsafe "hs_bindgen_d21f6f7dda5ed04f" hs_bindgen_d21f6f7dda5ed04f ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeSetting #-}
{-| Write an arbitrary setting on the device. The interpretation is up the implementation.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  [__@value@ /(input)/__]: the setting value

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeSetting@

__defined at:__ @SoapySDR\/Device.h:1363:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeSetting :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_writeSetting =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d21f6f7dda5ed04f

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readSetting@
foreign import ccall unsafe "hs_bindgen_ab0c722efccc88cc" hs_bindgen_ab0c722efccc88cc ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readSetting #-}
{-| Read an arbitrary setting on the device.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@key@ /(input)/__]: the setting identifier

  __returns:__ the setting value

__C declaration:__ @SoapySDRDevice_readSetting@

__defined at:__ @SoapySDR\/Device.h:1371:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readSetting :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readSetting =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_ab0c722efccc88cc

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSettingInfo@
foreign import ccall unsafe "hs_bindgen_54cc9384c60be166" hs_bindgen_54cc9384c60be166 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo)))

{-# NOINLINE soapySDRDevice_getChannelSettingInfo #-}
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
soapySDRDevice_getChannelSettingInfo :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr SoapySDRArgInfo))
soapySDRDevice_getChannelSettingInfo =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_54cc9384c60be166

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getChannelSettingInfoWithKey@
foreign import ccall unsafe "hs_bindgen_375107be0548aa29" hs_bindgen_375107be0548aa29 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo))

{-# NOINLINE soapySDRDevice_getChannelSettingInfoWithKey #-}
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
soapySDRDevice_getChannelSettingInfoWithKey :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO SoapySDRArgInfo)
soapySDRDevice_getChannelSettingInfoWithKey =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_375107be0548aa29

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeChannelSetting@
foreign import ccall unsafe "hs_bindgen_52cbde967f592aae" hs_bindgen_52cbde967f592aae ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeChannelSetting #-}
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
soapySDRDevice_writeChannelSetting :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_writeChannelSetting =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_52cbde967f592aae

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readChannelSetting@
foreign import ccall unsafe "hs_bindgen_c7400e74dc35702d" hs_bindgen_c7400e74dc35702d ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readChannelSetting #-}
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
soapySDRDevice_readChannelSetting :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> FC.CInt -> HsBindgen.Runtime.Prelude.CSize -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readChannelSetting =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_c7400e74dc35702d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listGPIOBanks@
foreign import ccall unsafe "hs_bindgen_0437ca82da468d33" hs_bindgen_0437ca82da468d33 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listGPIOBanks #-}
{-| Get a list of available GPIO banks by name.

  [__@length@ /(output)/__]: the number of GPIO banks

  [__@device@ /(input)/__]: a pointer to a device instance

__C declaration:__ @SoapySDRDevice_listGPIOBanks@

__defined at:__ @SoapySDR\/Device.h:1424:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listGPIOBanks :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listGPIOBanks =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0437ca82da468d33

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIO@
foreign import ccall unsafe "hs_bindgen_dee72844a7fcd977" hs_bindgen_dee72844a7fcd977 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeGPIO #-}
{-| Write the value of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@value@ /(input)/__]: an integer representing GPIO bits

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIO@

__defined at:__ @SoapySDR\/Device.h:1433:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIO :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CInt)
soapySDRDevice_writeGPIO =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_dee72844a7fcd977

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIOMasked@
foreign import ccall unsafe "hs_bindgen_61c7969c25bc347a" hs_bindgen_61c7969c25bc347a ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeGPIOMasked #-}
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
soapySDRDevice_writeGPIOMasked :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt)
soapySDRDevice_writeGPIOMasked =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_61c7969c25bc347a

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readGPIO@
foreign import ccall unsafe "hs_bindgen_47e6623f900e48fa" hs_bindgen_47e6623f900e48fa ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CUInt))

{-# NOINLINE soapySDRDevice_readGPIO #-}
{-| Readback the value of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  __returns:__ an integer representing GPIO bits

__C declaration:__ @SoapySDRDevice_readGPIO@

__defined at:__ @SoapySDR\/Device.h:1451:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readGPIO :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CUInt)
soapySDRDevice_readGPIO =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_47e6623f900e48fa

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIODir@
foreign import ccall unsafe "hs_bindgen_41c35c0ce8f0cdfb" hs_bindgen_41c35c0ce8f0cdfb ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeGPIODir #-}
{-| Write the data direction of a GPIO bank. 1 bits represent outputs, 0 bits represent inputs.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@bank@ /(input)/__]: the name of an available bank

  [__@dir@ /(input)/__]: an integer representing data direction bits

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeGPIODir@

__defined at:__ @SoapySDR\/Device.h:1461:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeGPIODir :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> IO FC.CInt)
soapySDRDevice_writeGPIODir =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_41c35c0ce8f0cdfb

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeGPIODirMasked@
foreign import ccall unsafe "hs_bindgen_f60a2eb4e9a87845" hs_bindgen_f60a2eb4e9a87845 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeGPIODirMasked #-}
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
soapySDRDevice_writeGPIODirMasked :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CUInt -> FC.CUInt -> IO FC.CInt)
soapySDRDevice_writeGPIODirMasked =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f60a2eb4e9a87845

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readGPIODir@
foreign import ccall unsafe "hs_bindgen_755852d3689807ac" hs_bindgen_755852d3689807ac ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CUInt))

{-# NOINLINE soapySDRDevice_readGPIODir #-}
{-| Read the data direction of a GPIO bank.

  [__@device@ /(input)/__]: a pointer to a device instance 1 bits represent outputs, 0 bits represent inputs.

  [__@bank@ /(input)/__]: the name of an available bank

  __returns:__ an integer representing data direction bits

__C declaration:__ @SoapySDRDevice_readGPIODir@

__defined at:__ @SoapySDR\/Device.h:1481:24@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readGPIODir :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CUInt)
soapySDRDevice_readGPIODir =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_755852d3689807ac

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeI2C@
foreign import ccall unsafe "hs_bindgen_cf28a804f47feb1d" hs_bindgen_cf28a804f47feb1d ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeI2C #-}
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
soapySDRDevice_writeI2C :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CInt)
soapySDRDevice_writeI2C =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_cf28a804f47feb1d

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readI2C@
foreign import ccall unsafe "hs_bindgen_fce2d8e5ea5b173e" hs_bindgen_fce2d8e5ea5b173e ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readI2C #-}
{-| Read from an available I2C slave. If the device contains multiple I2C masters, the address bits can encode which master. Pass the number of bytes to be read in via numBytes; numBytes will be set to the number of actual bytes read.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@addr@ /(input)/__]: the address of the slave

  [__@numBytes@ /(input,output)/__]: the number of bytes to read

  __returns:__ an array of bytes read from the slave

__C declaration:__ @SoapySDRDevice_readI2C@

__defined at:__ @SoapySDR\/Device.h:1510:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readI2C :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readI2C =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_fce2d8e5ea5b173e

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_transactSPI@
foreign import ccall unsafe "hs_bindgen_f3d2045eef9c5c49" hs_bindgen_f3d2045eef9c5c49 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> FC.CUInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CUInt))

{-# NOINLINE soapySDRDevice_transactSPI #-}
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
soapySDRDevice_transactSPI :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> FC.CInt -> FC.CUInt -> HsBindgen.Runtime.Prelude.CSize -> IO FC.CUInt)
soapySDRDevice_transactSPI =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_f3d2045eef9c5c49

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_listUARTs@
foreign import ccall unsafe "hs_bindgen_b34e060d4d81e006" hs_bindgen_b34e060d4d81e006 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar))))

{-# NOINLINE soapySDRDevice_listUARTs #-}
{-| Enumerate the available UART devices.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@length@ /(output)/__]: the number of UART names

  __returns:__ a list of names of available UARTs

__C declaration:__ @SoapySDRDevice_listUARTs@

__defined at:__ @SoapySDR\/Device.h:1543:22@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_listUARTs :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (Ptr.Ptr HsBindgen.Runtime.Prelude.CSize) -> IO (Ptr.Ptr (Ptr.Ptr FC.CChar)))
soapySDRDevice_listUARTs =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_b34e060d4d81e006

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_writeUART@
foreign import ccall unsafe "hs_bindgen_d5c24bcf48342ec4" hs_bindgen_d5c24bcf48342ec4 ::
     IO (Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt))

{-# NOINLINE soapySDRDevice_writeUART #-}
{-| Write data to a UART device. Its up to the implementation to set the baud rate, carriage return settings, flushing on newline.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@which@ /(input)/__]: the name of an available UART

  [__@data@ /(input)/__]: a null terminated array of bytes

  __returns:__ 0 for success or error code on failure

__C declaration:__ @SoapySDRDevice_writeUART@

__defined at:__ @SoapySDR\/Device.h:1554:19@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_writeUART :: Ptr.FunPtr ((Ptr.Ptr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> IO FC.CInt)
soapySDRDevice_writeUART =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_d5c24bcf48342ec4

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_readUART@
foreign import ccall unsafe "hs_bindgen_0555f891e964cd17" hs_bindgen_0555f891e964cd17 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CLong -> IO (Ptr.Ptr FC.CChar)))

{-# NOINLINE soapySDRDevice_readUART #-}
{-| Read bytes from a UART until timeout or newline. Its up to the implementation to set the baud rate, carriage return settings, flushing on newline.

  [__@device@ /(input)/__]: a pointer to a device instance

  [__@which@ /(input)/__]: the name of an available UART

  [__@timeoutUs@ /(input)/__]: a timeout in microseconds

  __returns:__ a null terminated array of bytes

__C declaration:__ @SoapySDRDevice_readUART@

__defined at:__ @SoapySDR\/Device.h:1565:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_readUART :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> (HsBindgen.Runtime.ConstPtr.ConstPtr FC.CChar) -> FC.CLong -> IO (Ptr.Ptr FC.CChar))
soapySDRDevice_readUART =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_0555f891e964cd17

-- __unique:__ @com_soapysdr_bindings_SoapySDR.Bindings_get_SoapySDRDevice_getNativeDeviceHandle@
foreign import ccall unsafe "hs_bindgen_07c9fa287ee25286" hs_bindgen_07c9fa287ee25286 ::
     IO (Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr Void)))

{-# NOINLINE soapySDRDevice_getNativeDeviceHandle #-}
{-| A handle to the native device used by the driver. The implementation may return a null value if it does not support or does not wish to provide access to the native handle.

  [__@device@ /(input)/__]: a pointer to a device instance

  __returns:__ a handle to the native device or null

__C declaration:__ @SoapySDRDevice_getNativeDeviceHandle@

__defined at:__ @SoapySDR\/Device.h:1579:21@

__exported by:__ @SoapySDR\/Device.h@, @SoapySDR\/Device.h@
-}
soapySDRDevice_getNativeDeviceHandle :: Ptr.FunPtr ((HsBindgen.Runtime.ConstPtr.ConstPtr SoapySDRDevice) -> IO (Ptr.Ptr Void))
soapySDRDevice_getNativeDeviceHandle =
  GHC.IO.Unsafe.unsafePerformIO hs_bindgen_07c9fa287ee25286
