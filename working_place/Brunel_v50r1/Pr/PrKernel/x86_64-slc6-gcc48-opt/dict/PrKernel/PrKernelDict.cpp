// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME dOdOdIx86_64mIslc6mIgcc48mIoptdIdictdIPrKerneldIPrKernelDict

/*******************************************************************/
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <assert.h>
#define G__DICTIONARY
#include "RConfig.h"
#include "TClass.h"
#include "TDictAttributeMap.h"
#include "TInterpreter.h"
#include "TROOT.h"
#include "TBuffer.h"
#include "TMemberInspector.h"
#include "TInterpreter.h"
#include "TVirtualMutex.h"
#include "TError.h"

#ifndef G__ROOT
#define G__ROOT
#endif

#include "RtypesImp.h"
#include "TIsAProxy.h"
#include "TFileMergeInfo.h"
#include <algorithm>
#include "TCollectionProxyInfo.h"
/*******************************************************************/

#include "TDataMember.h"

// Since CINT ignores the std namespace, we need to do so in this file.
namespace std {} using namespace std;

// Header files passed as explicit arguments
#include "/users/LHCb/abdulkhalek/working_place/Brunel_v50r1/Pr/PrKernel/dict/PrKernelDict.h"

// Header files passed via #pragma extra_include

namespace ROOT {
   static TClass *IPrDebugTool_Dictionary();
   static void IPrDebugTool_TClassManip(TClass*);
   static void delete_IPrDebugTool(void *p);
   static void deleteArray_IPrDebugTool(void *p);
   static void destruct_IPrDebugTool(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::IPrDebugTool*)
   {
      ::IPrDebugTool *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::IPrDebugTool));
      static ::ROOT::TGenericClassInfo 
         instance("IPrDebugTool", "PrKernel/IPrDebugTool.h", 21,
                  typeid(::IPrDebugTool), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &IPrDebugTool_Dictionary, isa_proxy, 0,
                  sizeof(::IPrDebugTool) );
      instance.SetDelete(&delete_IPrDebugTool);
      instance.SetDeleteArray(&deleteArray_IPrDebugTool);
      instance.SetDestructor(&destruct_IPrDebugTool);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::IPrDebugTool*)
   {
      return GenerateInitInstanceLocal((::IPrDebugTool*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::IPrDebugTool*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *IPrDebugTool_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::IPrDebugTool*)0x0)->GetClass();
      IPrDebugTool_TClassManip(theClass);
   return theClass;
   }

   static void IPrDebugTool_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *IPrDebugUTTool_Dictionary();
   static void IPrDebugUTTool_TClassManip(TClass*);
   static void delete_IPrDebugUTTool(void *p);
   static void deleteArray_IPrDebugUTTool(void *p);
   static void destruct_IPrDebugUTTool(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::IPrDebugUTTool*)
   {
      ::IPrDebugUTTool *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::IPrDebugUTTool));
      static ::ROOT::TGenericClassInfo 
         instance("IPrDebugUTTool", "PrKernel/IPrDebugUTTool.h", 28,
                  typeid(::IPrDebugUTTool), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &IPrDebugUTTool_Dictionary, isa_proxy, 0,
                  sizeof(::IPrDebugUTTool) );
      instance.SetDelete(&delete_IPrDebugUTTool);
      instance.SetDeleteArray(&deleteArray_IPrDebugUTTool);
      instance.SetDestructor(&destruct_IPrDebugUTTool);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::IPrDebugUTTool*)
   {
      return GenerateInitInstanceLocal((::IPrDebugUTTool*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::IPrDebugUTTool*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *IPrDebugUTTool_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::IPrDebugUTTool*)0x0)->GetClass();
      IPrDebugUTTool_TClassManip(theClass);
   return theClass;
   }

   static void IPrDebugUTTool_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *IPrUTCounter_Dictionary();
   static void IPrUTCounter_TClassManip(TClass*);
   static void delete_IPrUTCounter(void *p);
   static void deleteArray_IPrUTCounter(void *p);
   static void destruct_IPrUTCounter(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::IPrUTCounter*)
   {
      ::IPrUTCounter *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::IPrUTCounter));
      static ::ROOT::TGenericClassInfo 
         instance("IPrUTCounter", "PrKernel/IPrUTCounter.h", 25,
                  typeid(::IPrUTCounter), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &IPrUTCounter_Dictionary, isa_proxy, 0,
                  sizeof(::IPrUTCounter) );
      instance.SetDelete(&delete_IPrUTCounter);
      instance.SetDeleteArray(&deleteArray_IPrUTCounter);
      instance.SetDestructor(&destruct_IPrUTCounter);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::IPrUTCounter*)
   {
      return GenerateInitInstanceLocal((::IPrUTCounter*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::IPrUTCounter*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *IPrUTCounter_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::IPrUTCounter*)0x0)->GetClass();
      IPrUTCounter_TClassManip(theClass);
   return theClass;
   }

   static void IPrUTCounter_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *IPrCounter_Dictionary();
   static void IPrCounter_TClassManip(TClass*);
   static void delete_IPrCounter(void *p);
   static void deleteArray_IPrCounter(void *p);
   static void destruct_IPrCounter(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::IPrCounter*)
   {
      ::IPrCounter *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::IPrCounter));
      static ::ROOT::TGenericClassInfo 
         instance("IPrCounter", "PrKernel/IPrCounter.h", 29,
                  typeid(::IPrCounter), ::ROOT::Internal::DefineBehavior(ptr, ptr),
                  &IPrCounter_Dictionary, isa_proxy, 0,
                  sizeof(::IPrCounter) );
      instance.SetDelete(&delete_IPrCounter);
      instance.SetDeleteArray(&deleteArray_IPrCounter);
      instance.SetDestructor(&destruct_IPrCounter);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::IPrCounter*)
   {
      return GenerateInitInstanceLocal((::IPrCounter*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::IPrCounter*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *IPrCounter_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::IPrCounter*)0x0)->GetClass();
      IPrCounter_TClassManip(theClass);
   return theClass;
   }

   static void IPrCounter_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrapper around operator delete
   static void delete_IPrDebugTool(void *p) {
      delete ((::IPrDebugTool*)p);
   }
   static void deleteArray_IPrDebugTool(void *p) {
      delete [] ((::IPrDebugTool*)p);
   }
   static void destruct_IPrDebugTool(void *p) {
      typedef ::IPrDebugTool current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::IPrDebugTool

namespace ROOT {
   // Wrapper around operator delete
   static void delete_IPrDebugUTTool(void *p) {
      delete ((::IPrDebugUTTool*)p);
   }
   static void deleteArray_IPrDebugUTTool(void *p) {
      delete [] ((::IPrDebugUTTool*)p);
   }
   static void destruct_IPrDebugUTTool(void *p) {
      typedef ::IPrDebugUTTool current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::IPrDebugUTTool

namespace ROOT {
   // Wrapper around operator delete
   static void delete_IPrUTCounter(void *p) {
      delete ((::IPrUTCounter*)p);
   }
   static void deleteArray_IPrUTCounter(void *p) {
      delete [] ((::IPrUTCounter*)p);
   }
   static void destruct_IPrUTCounter(void *p) {
      typedef ::IPrUTCounter current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::IPrUTCounter

namespace ROOT {
   // Wrapper around operator delete
   static void delete_IPrCounter(void *p) {
      delete ((::IPrCounter*)p);
   }
   static void deleteArray_IPrCounter(void *p) {
      delete [] ((::IPrCounter*)p);
   }
   static void destruct_IPrCounter(void *p) {
      typedef ::IPrCounter current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::IPrCounter

namespace {
  void TriggerDictionaryInitialization_PrKernelDict_Impl() {
    static const char* headers[] = {
0    };
    static const char* includePaths[] = {
"/users/LHCb/abdulkhalek/working_place/Brunel_v50r1/Pr/PrKernel",
"/users/LHCb/abdulkhalek/working_place/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/lhcb/software/releases/BRUNEL/BRUNEL_v50r1/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/lhcb/software/releases/REC/REC_v19r2/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/lhcb/software/releases/LBCOM/LBCOM_v18r1/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/lhcb/software/releases/LHCB/LHCB_v40r1/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/lhcb/software/releases/GAUDI/GAUDI_v27r1/InstallArea/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/ROOT/6.06.02/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/ROOT/6.06.02/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/Boost/1.59.0_python2.7/x86_64-slc6-gcc48-opt/include/boost-1_59",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/Python/2.7.10/x86_64-slc6-gcc48-opt/include/python2.7",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/xrootd/4.2.3/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/tbb/42_20140122/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/GSL/1.10/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/vdt/0.3.6/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/eigen/3.2.7/x86_64-slc6-gcc48-opt/include/eigen3",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/XercesC/3.1.1p1/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/clhep/2.3.1.1/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Settings/../../../LCG_84/mysql/5.5.30/x86_64-slc6-gcc48-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_84/LCG_Platforms/src",
"/afs/cern.ch/sw/lcg/releases/ROOT/6.06.02-6cc9c/x86_64-slc6-gcc48-opt/include",
"/users/LHCb/abdulkhalek/working_place/Brunel_v50r1/Pr/PrKernel/cmt/",
0
    };
    static const char* fwdDeclCode = R"DICTFWDDCLS(
#line 1 "PrKernelDict dictionary forward declarations' payload"
#pragma clang diagnostic ignored "-Wkeyword-compat"
#pragma clang diagnostic ignored "-Wignored-attributes"
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern int __Cling_Autoloading_Map;
class __attribute__((annotate("$clingAutoload$PrKernel/IPrDebugTool.h")))  IPrDebugTool;
class __attribute__((annotate("$clingAutoload$PrKernel/IPrDebugUTTool.h")))  IPrDebugUTTool;
class __attribute__((annotate("$clingAutoload$PrKernel/IPrUTCounter.h")))  IPrUTCounter;
class __attribute__((annotate("$clingAutoload$PrKernel/IPrCounter.h")))  IPrCounter;
)DICTFWDDCLS";
    static const char* payloadCode = R"DICTPAYLOAD(
#line 1 "PrKernelDict dictionary payload"
#ifdef __MINGW32__
  #undef __MINGW32__
#endif
#ifdef _Instantiations
  #undef _Instantiations
#endif

#ifndef G__VECTOR_HAS_CLASS_ITERATOR
  #define G__VECTOR_HAS_CLASS_ITERATOR 1
#endif
#ifndef _Instantiations
  #define _Instantiations PrKernel_Instantiations
#endif
#ifndef _GNU_SOURCE
  #define _GNU_SOURCE 1
#endif
#ifndef GAUDI_V20_COMPAT
  #define GAUDI_V20_COMPAT 1
#endif
#ifndef BOOST_FILESYSTEM_VERSION
  #define BOOST_FILESYSTEM_VERSION 3
#endif
#ifndef BOOST_SPIRIT_USE_PHOENIX_V3
  #define BOOST_SPIRIT_USE_PHOENIX_V3 1
#endif
#ifndef HAVE_GAUDI_PLUGINSVC
  #define HAVE_GAUDI_PLUGINSVC 1
#endif

#define _BACKWARD_BACKWARD_WARNING_H
#ifndef DICT_PRKERNELDICT_H 
#define DICT_PRKERNELDICT_H 1

#include "PrKernel/IPrDebugTool.h"
#include "PrKernel/IPrDebugUTTool.h"
#include "PrKernel/IPrUTCounter.h"
#include "PrKernel/IPrCounter.h"


#endif // DICT_PRKERNELDICT_H


#undef  _BACKWARD_BACKWARD_WARNING_H
)DICTPAYLOAD";
    static const char* classesHeaders[]={
"IPrCounter", payloadCode, "@",
"IPrDebugTool", payloadCode, "@",
"IPrDebugUTTool", payloadCode, "@",
"IPrUTCounter", payloadCode, "@",
nullptr};

    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("PrKernelDict",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_PrKernelDict_Impl, {}, classesHeaders);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_PrKernelDict_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_PrKernelDict() {
  TriggerDictionaryInitialization_PrKernelDict_Impl();
}
