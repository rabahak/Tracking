// Do NOT change. Changes will be lost next time file is generated

#define R__DICTIONARY_FILENAME dOdOdIx86_64mIslc6mIgcc49mIoptdIdictdIFTDetdIFTDetDict

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
#include "/afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/dict/FTDetDict.h"

// Header files passed via #pragma extra_include

namespace ROOT {
   static TClass *DeFTDetector_Dictionary();
   static void DeFTDetector_TClassManip(TClass*);
   static void *new_DeFTDetector(void *p = 0);
   static void *newArray_DeFTDetector(Long_t size, void *p);
   static void delete_DeFTDetector(void *p);
   static void deleteArray_DeFTDetector(void *p);
   static void destruct_DeFTDetector(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTDetector*)
   {
      ::DeFTDetector *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTDetector));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTDetector", "FTDet/DeFTDetector.h", 41,
                  typeid(::DeFTDetector), DefineBehavior(ptr, ptr),
                  &DeFTDetector_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTDetector) );
      instance.SetNew(&new_DeFTDetector);
      instance.SetNewArray(&newArray_DeFTDetector);
      instance.SetDelete(&delete_DeFTDetector);
      instance.SetDeleteArray(&deleteArray_DeFTDetector);
      instance.SetDestructor(&destruct_DeFTDetector);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTDetector*)
   {
      return GenerateInitInstanceLocal((::DeFTDetector*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTDetector*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTDetector_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTDetector*)0x0)->GetClass();
      DeFTDetector_TClassManip(theClass);
   return theClass;
   }

   static void DeFTDetector_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTStation_Dictionary();
   static void DeFTStation_TClassManip(TClass*);
   static void *new_DeFTStation(void *p = 0);
   static void *newArray_DeFTStation(Long_t size, void *p);
   static void delete_DeFTStation(void *p);
   static void deleteArray_DeFTStation(void *p);
   static void destruct_DeFTStation(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTStation*)
   {
      ::DeFTStation *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTStation));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTStation", "FTDet/DeFTStation.h", 22,
                  typeid(::DeFTStation), DefineBehavior(ptr, ptr),
                  &DeFTStation_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTStation) );
      instance.SetNew(&new_DeFTStation);
      instance.SetNewArray(&newArray_DeFTStation);
      instance.SetDelete(&delete_DeFTStation);
      instance.SetDeleteArray(&deleteArray_DeFTStation);
      instance.SetDestructor(&destruct_DeFTStation);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTStation*)
   {
      return GenerateInitInstanceLocal((::DeFTStation*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTStation*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTStation_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTStation*)0x0)->GetClass();
      DeFTStation_TClassManip(theClass);
   return theClass;
   }

   static void DeFTStation_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTBiLayer_Dictionary();
   static void DeFTBiLayer_TClassManip(TClass*);
   static void *new_DeFTBiLayer(void *p = 0);
   static void *newArray_DeFTBiLayer(Long_t size, void *p);
   static void delete_DeFTBiLayer(void *p);
   static void deleteArray_DeFTBiLayer(void *p);
   static void destruct_DeFTBiLayer(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTBiLayer*)
   {
      ::DeFTBiLayer *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTBiLayer));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTBiLayer", "FTDet/DeFTBiLayer.h", 22,
                  typeid(::DeFTBiLayer), DefineBehavior(ptr, ptr),
                  &DeFTBiLayer_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTBiLayer) );
      instance.SetNew(&new_DeFTBiLayer);
      instance.SetNewArray(&newArray_DeFTBiLayer);
      instance.SetDelete(&delete_DeFTBiLayer);
      instance.SetDeleteArray(&deleteArray_DeFTBiLayer);
      instance.SetDestructor(&destruct_DeFTBiLayer);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTBiLayer*)
   {
      return GenerateInitInstanceLocal((::DeFTBiLayer*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTBiLayer*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTBiLayer_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTBiLayer*)0x0)->GetClass();
      DeFTBiLayer_TClassManip(theClass);
   return theClass;
   }

   static void DeFTBiLayer_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTLayer_Dictionary();
   static void DeFTLayer_TClassManip(TClass*);
   static void *new_DeFTLayer(void *p = 0);
   static void *newArray_DeFTLayer(Long_t size, void *p);
   static void delete_DeFTLayer(void *p);
   static void deleteArray_DeFTLayer(void *p);
   static void destruct_DeFTLayer(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTLayer*)
   {
      ::DeFTLayer *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTLayer));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTLayer", "FTDet/DeFTLayer.h", 12,
                  typeid(::DeFTLayer), DefineBehavior(ptr, ptr),
                  &DeFTLayer_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTLayer) );
      instance.SetNew(&new_DeFTLayer);
      instance.SetNewArray(&newArray_DeFTLayer);
      instance.SetDelete(&delete_DeFTLayer);
      instance.SetDeleteArray(&deleteArray_DeFTLayer);
      instance.SetDestructor(&destruct_DeFTLayer);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTLayer*)
   {
      return GenerateInitInstanceLocal((::DeFTLayer*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTLayer*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTLayer_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTLayer*)0x0)->GetClass();
      DeFTLayer_TClassManip(theClass);
   return theClass;
   }

   static void DeFTLayer_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTModule_Dictionary();
   static void DeFTModule_TClassManip(TClass*);
   static void *new_DeFTModule(void *p = 0);
   static void *newArray_DeFTModule(Long_t size, void *p);
   static void delete_DeFTModule(void *p);
   static void deleteArray_DeFTModule(void *p);
   static void destruct_DeFTModule(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTModule*)
   {
      ::DeFTModule *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTModule));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTModule", "FTDet/DeFTModule.h", 22,
                  typeid(::DeFTModule), DefineBehavior(ptr, ptr),
                  &DeFTModule_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTModule) );
      instance.SetNew(&new_DeFTModule);
      instance.SetNewArray(&newArray_DeFTModule);
      instance.SetDelete(&delete_DeFTModule);
      instance.SetDeleteArray(&deleteArray_DeFTModule);
      instance.SetDestructor(&destruct_DeFTModule);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTModule*)
   {
      return GenerateInitInstanceLocal((::DeFTModule*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTModule*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTModule_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTModule*)0x0)->GetClass();
      DeFTModule_TClassManip(theClass);
   return theClass;
   }

   static void DeFTModule_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTFibreModule_Dictionary();
   static void DeFTFibreModule_TClassManip(TClass*);
   static void *new_DeFTFibreModule(void *p = 0);
   static void *newArray_DeFTFibreModule(Long_t size, void *p);
   static void delete_DeFTFibreModule(void *p);
   static void deleteArray_DeFTFibreModule(void *p);
   static void destruct_DeFTFibreModule(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTFibreModule*)
   {
      ::DeFTFibreModule *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTFibreModule));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTFibreModule", "FTDet/DeFTFibreModule.h", 22,
                  typeid(::DeFTFibreModule), DefineBehavior(ptr, ptr),
                  &DeFTFibreModule_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTFibreModule) );
      instance.SetNew(&new_DeFTFibreModule);
      instance.SetNewArray(&newArray_DeFTFibreModule);
      instance.SetDelete(&delete_DeFTFibreModule);
      instance.SetDeleteArray(&deleteArray_DeFTFibreModule);
      instance.SetDestructor(&destruct_DeFTFibreModule);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTFibreModule*)
   {
      return GenerateInitInstanceLocal((::DeFTFibreModule*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTFibreModule*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTFibreModule_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTFibreModule*)0x0)->GetClass();
      DeFTFibreModule_TClassManip(theClass);
   return theClass;
   }

   static void DeFTFibreModule_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   static TClass *DeFTFibreMat_Dictionary();
   static void DeFTFibreMat_TClassManip(TClass*);
   static void *new_DeFTFibreMat(void *p = 0);
   static void *newArray_DeFTFibreMat(Long_t size, void *p);
   static void delete_DeFTFibreMat(void *p);
   static void deleteArray_DeFTFibreMat(void *p);
   static void destruct_DeFTFibreMat(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const ::DeFTFibreMat*)
   {
      ::DeFTFibreMat *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(::DeFTFibreMat));
      static ::ROOT::TGenericClassInfo 
         instance("DeFTFibreMat", "FTDet/DeFTFibreMat.h", 91,
                  typeid(::DeFTFibreMat), DefineBehavior(ptr, ptr),
                  &DeFTFibreMat_Dictionary, isa_proxy, 0,
                  sizeof(::DeFTFibreMat) );
      instance.SetNew(&new_DeFTFibreMat);
      instance.SetNewArray(&newArray_DeFTFibreMat);
      instance.SetDelete(&delete_DeFTFibreMat);
      instance.SetDeleteArray(&deleteArray_DeFTFibreMat);
      instance.SetDestructor(&destruct_DeFTFibreMat);
      return &instance;
   }
   TGenericClassInfo *GenerateInitInstance(const ::DeFTFibreMat*)
   {
      return GenerateInitInstanceLocal((::DeFTFibreMat*)0);
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const ::DeFTFibreMat*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *DeFTFibreMat_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const ::DeFTFibreMat*)0x0)->GetClass();
      DeFTFibreMat_TClassManip(theClass);
   return theClass;
   }

   static void DeFTFibreMat_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTDetector(void *p) {
      return  p ? new(p) ::DeFTDetector : new ::DeFTDetector;
   }
   static void *newArray_DeFTDetector(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTDetector[nElements] : new ::DeFTDetector[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTDetector(void *p) {
      delete ((::DeFTDetector*)p);
   }
   static void deleteArray_DeFTDetector(void *p) {
      delete [] ((::DeFTDetector*)p);
   }
   static void destruct_DeFTDetector(void *p) {
      typedef ::DeFTDetector current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTDetector

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTStation(void *p) {
      return  p ? new(p) ::DeFTStation : new ::DeFTStation;
   }
   static void *newArray_DeFTStation(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTStation[nElements] : new ::DeFTStation[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTStation(void *p) {
      delete ((::DeFTStation*)p);
   }
   static void deleteArray_DeFTStation(void *p) {
      delete [] ((::DeFTStation*)p);
   }
   static void destruct_DeFTStation(void *p) {
      typedef ::DeFTStation current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTStation

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTBiLayer(void *p) {
      return  p ? new(p) ::DeFTBiLayer : new ::DeFTBiLayer;
   }
   static void *newArray_DeFTBiLayer(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTBiLayer[nElements] : new ::DeFTBiLayer[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTBiLayer(void *p) {
      delete ((::DeFTBiLayer*)p);
   }
   static void deleteArray_DeFTBiLayer(void *p) {
      delete [] ((::DeFTBiLayer*)p);
   }
   static void destruct_DeFTBiLayer(void *p) {
      typedef ::DeFTBiLayer current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTBiLayer

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTLayer(void *p) {
      return  p ? new(p) ::DeFTLayer : new ::DeFTLayer;
   }
   static void *newArray_DeFTLayer(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTLayer[nElements] : new ::DeFTLayer[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTLayer(void *p) {
      delete ((::DeFTLayer*)p);
   }
   static void deleteArray_DeFTLayer(void *p) {
      delete [] ((::DeFTLayer*)p);
   }
   static void destruct_DeFTLayer(void *p) {
      typedef ::DeFTLayer current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTLayer

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTModule(void *p) {
      return  p ? new(p) ::DeFTModule : new ::DeFTModule;
   }
   static void *newArray_DeFTModule(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTModule[nElements] : new ::DeFTModule[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTModule(void *p) {
      delete ((::DeFTModule*)p);
   }
   static void deleteArray_DeFTModule(void *p) {
      delete [] ((::DeFTModule*)p);
   }
   static void destruct_DeFTModule(void *p) {
      typedef ::DeFTModule current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTModule

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTFibreModule(void *p) {
      return  p ? new(p) ::DeFTFibreModule : new ::DeFTFibreModule;
   }
   static void *newArray_DeFTFibreModule(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTFibreModule[nElements] : new ::DeFTFibreModule[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTFibreModule(void *p) {
      delete ((::DeFTFibreModule*)p);
   }
   static void deleteArray_DeFTFibreModule(void *p) {
      delete [] ((::DeFTFibreModule*)p);
   }
   static void destruct_DeFTFibreModule(void *p) {
      typedef ::DeFTFibreModule current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTFibreModule

namespace ROOT {
   // Wrappers around operator new
   static void *new_DeFTFibreMat(void *p) {
      return  p ? new(p) ::DeFTFibreMat : new ::DeFTFibreMat;
   }
   static void *newArray_DeFTFibreMat(Long_t nElements, void *p) {
      return p ? new(p) ::DeFTFibreMat[nElements] : new ::DeFTFibreMat[nElements];
   }
   // Wrapper around operator delete
   static void delete_DeFTFibreMat(void *p) {
      delete ((::DeFTFibreMat*)p);
   }
   static void deleteArray_DeFTFibreMat(void *p) {
      delete [] ((::DeFTFibreMat*)p);
   }
   static void destruct_DeFTFibreMat(void *p) {
      typedef ::DeFTFibreMat current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class ::DeFTFibreMat

namespace ROOT {
   static TClass *vectorlEDeFTStationmUgR_Dictionary();
   static void vectorlEDeFTStationmUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTStationmUgR(void *p = 0);
   static void *newArray_vectorlEDeFTStationmUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTStationmUgR(void *p);
   static void deleteArray_vectorlEDeFTStationmUgR(void *p);
   static void destruct_vectorlEDeFTStationmUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTStation*>*)
   {
      vector<DeFTStation*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTStation*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTStation*>", -2, "vector", 214,
                  typeid(vector<DeFTStation*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTStationmUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTStation*>) );
      instance.SetNew(&new_vectorlEDeFTStationmUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTStationmUgR);
      instance.SetDelete(&delete_vectorlEDeFTStationmUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTStationmUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTStationmUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTStation*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTStation*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTStationmUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTStation*>*)0x0)->GetClass();
      vectorlEDeFTStationmUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTStationmUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTStationmUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTStation*> : new vector<DeFTStation*>;
   }
   static void *newArray_vectorlEDeFTStationmUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTStation*>[nElements] : new vector<DeFTStation*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTStationmUgR(void *p) {
      delete ((vector<DeFTStation*>*)p);
   }
   static void deleteArray_vectorlEDeFTStationmUgR(void *p) {
      delete [] ((vector<DeFTStation*>*)p);
   }
   static void destruct_vectorlEDeFTStationmUgR(void *p) {
      typedef vector<DeFTStation*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTStation*>

namespace ROOT {
   static TClass *vectorlEDeFTModulemUgR_Dictionary();
   static void vectorlEDeFTModulemUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTModulemUgR(void *p = 0);
   static void *newArray_vectorlEDeFTModulemUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTModulemUgR(void *p);
   static void deleteArray_vectorlEDeFTModulemUgR(void *p);
   static void destruct_vectorlEDeFTModulemUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTModule*>*)
   {
      vector<DeFTModule*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTModule*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTModule*>", -2, "vector", 214,
                  typeid(vector<DeFTModule*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTModulemUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTModule*>) );
      instance.SetNew(&new_vectorlEDeFTModulemUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTModulemUgR);
      instance.SetDelete(&delete_vectorlEDeFTModulemUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTModulemUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTModulemUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTModule*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTModule*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTModulemUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTModule*>*)0x0)->GetClass();
      vectorlEDeFTModulemUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTModulemUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTModulemUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTModule*> : new vector<DeFTModule*>;
   }
   static void *newArray_vectorlEDeFTModulemUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTModule*>[nElements] : new vector<DeFTModule*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTModulemUgR(void *p) {
      delete ((vector<DeFTModule*>*)p);
   }
   static void deleteArray_vectorlEDeFTModulemUgR(void *p) {
      delete [] ((vector<DeFTModule*>*)p);
   }
   static void destruct_vectorlEDeFTModulemUgR(void *p) {
      typedef vector<DeFTModule*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTModule*>

namespace ROOT {
   static TClass *vectorlEDeFTLayermUgR_Dictionary();
   static void vectorlEDeFTLayermUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTLayermUgR(void *p = 0);
   static void *newArray_vectorlEDeFTLayermUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTLayermUgR(void *p);
   static void deleteArray_vectorlEDeFTLayermUgR(void *p);
   static void destruct_vectorlEDeFTLayermUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTLayer*>*)
   {
      vector<DeFTLayer*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTLayer*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTLayer*>", -2, "vector", 214,
                  typeid(vector<DeFTLayer*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTLayermUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTLayer*>) );
      instance.SetNew(&new_vectorlEDeFTLayermUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTLayermUgR);
      instance.SetDelete(&delete_vectorlEDeFTLayermUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTLayermUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTLayermUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTLayer*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTLayer*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTLayermUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTLayer*>*)0x0)->GetClass();
      vectorlEDeFTLayermUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTLayermUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTLayermUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTLayer*> : new vector<DeFTLayer*>;
   }
   static void *newArray_vectorlEDeFTLayermUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTLayer*>[nElements] : new vector<DeFTLayer*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTLayermUgR(void *p) {
      delete ((vector<DeFTLayer*>*)p);
   }
   static void deleteArray_vectorlEDeFTLayermUgR(void *p) {
      delete [] ((vector<DeFTLayer*>*)p);
   }
   static void destruct_vectorlEDeFTLayermUgR(void *p) {
      typedef vector<DeFTLayer*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTLayer*>

namespace ROOT {
   static TClass *vectorlEDeFTFibreModulemUgR_Dictionary();
   static void vectorlEDeFTFibreModulemUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTFibreModulemUgR(void *p = 0);
   static void *newArray_vectorlEDeFTFibreModulemUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTFibreModulemUgR(void *p);
   static void deleteArray_vectorlEDeFTFibreModulemUgR(void *p);
   static void destruct_vectorlEDeFTFibreModulemUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTFibreModule*>*)
   {
      vector<DeFTFibreModule*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTFibreModule*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTFibreModule*>", -2, "vector", 214,
                  typeid(vector<DeFTFibreModule*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTFibreModulemUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTFibreModule*>) );
      instance.SetNew(&new_vectorlEDeFTFibreModulemUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTFibreModulemUgR);
      instance.SetDelete(&delete_vectorlEDeFTFibreModulemUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTFibreModulemUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTFibreModulemUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTFibreModule*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTFibreModule*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTFibreModulemUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTFibreModule*>*)0x0)->GetClass();
      vectorlEDeFTFibreModulemUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTFibreModulemUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTFibreModulemUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTFibreModule*> : new vector<DeFTFibreModule*>;
   }
   static void *newArray_vectorlEDeFTFibreModulemUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTFibreModule*>[nElements] : new vector<DeFTFibreModule*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTFibreModulemUgR(void *p) {
      delete ((vector<DeFTFibreModule*>*)p);
   }
   static void deleteArray_vectorlEDeFTFibreModulemUgR(void *p) {
      delete [] ((vector<DeFTFibreModule*>*)p);
   }
   static void destruct_vectorlEDeFTFibreModulemUgR(void *p) {
      typedef vector<DeFTFibreModule*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTFibreModule*>

namespace ROOT {
   static TClass *vectorlEDeFTFibreMatmUgR_Dictionary();
   static void vectorlEDeFTFibreMatmUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTFibreMatmUgR(void *p = 0);
   static void *newArray_vectorlEDeFTFibreMatmUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTFibreMatmUgR(void *p);
   static void deleteArray_vectorlEDeFTFibreMatmUgR(void *p);
   static void destruct_vectorlEDeFTFibreMatmUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTFibreMat*>*)
   {
      vector<DeFTFibreMat*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTFibreMat*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTFibreMat*>", -2, "vector", 214,
                  typeid(vector<DeFTFibreMat*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTFibreMatmUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTFibreMat*>) );
      instance.SetNew(&new_vectorlEDeFTFibreMatmUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTFibreMatmUgR);
      instance.SetDelete(&delete_vectorlEDeFTFibreMatmUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTFibreMatmUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTFibreMatmUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTFibreMat*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTFibreMat*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTFibreMatmUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTFibreMat*>*)0x0)->GetClass();
      vectorlEDeFTFibreMatmUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTFibreMatmUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTFibreMatmUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTFibreMat*> : new vector<DeFTFibreMat*>;
   }
   static void *newArray_vectorlEDeFTFibreMatmUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTFibreMat*>[nElements] : new vector<DeFTFibreMat*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTFibreMatmUgR(void *p) {
      delete ((vector<DeFTFibreMat*>*)p);
   }
   static void deleteArray_vectorlEDeFTFibreMatmUgR(void *p) {
      delete [] ((vector<DeFTFibreMat*>*)p);
   }
   static void destruct_vectorlEDeFTFibreMatmUgR(void *p) {
      typedef vector<DeFTFibreMat*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTFibreMat*>

namespace ROOT {
   static TClass *vectorlEDeFTBiLayermUgR_Dictionary();
   static void vectorlEDeFTBiLayermUgR_TClassManip(TClass*);
   static void *new_vectorlEDeFTBiLayermUgR(void *p = 0);
   static void *newArray_vectorlEDeFTBiLayermUgR(Long_t size, void *p);
   static void delete_vectorlEDeFTBiLayermUgR(void *p);
   static void deleteArray_vectorlEDeFTBiLayermUgR(void *p);
   static void destruct_vectorlEDeFTBiLayermUgR(void *p);

   // Function generating the singleton type initializer
   static TGenericClassInfo *GenerateInitInstanceLocal(const vector<DeFTBiLayer*>*)
   {
      vector<DeFTBiLayer*> *ptr = 0;
      static ::TVirtualIsAProxy* isa_proxy = new ::TIsAProxy(typeid(vector<DeFTBiLayer*>));
      static ::ROOT::TGenericClassInfo 
         instance("vector<DeFTBiLayer*>", -2, "vector", 214,
                  typeid(vector<DeFTBiLayer*>), DefineBehavior(ptr, ptr),
                  &vectorlEDeFTBiLayermUgR_Dictionary, isa_proxy, 4,
                  sizeof(vector<DeFTBiLayer*>) );
      instance.SetNew(&new_vectorlEDeFTBiLayermUgR);
      instance.SetNewArray(&newArray_vectorlEDeFTBiLayermUgR);
      instance.SetDelete(&delete_vectorlEDeFTBiLayermUgR);
      instance.SetDeleteArray(&deleteArray_vectorlEDeFTBiLayermUgR);
      instance.SetDestructor(&destruct_vectorlEDeFTBiLayermUgR);
      instance.AdoptCollectionProxyInfo(TCollectionProxyInfo::Generate(TCollectionProxyInfo::Pushback< vector<DeFTBiLayer*> >()));
      return &instance;
   }
   // Static variable to force the class initialization
   static ::ROOT::TGenericClassInfo *_R__UNIQUE_(Init) = GenerateInitInstanceLocal((const vector<DeFTBiLayer*>*)0x0); R__UseDummy(_R__UNIQUE_(Init));

   // Dictionary for non-ClassDef classes
   static TClass *vectorlEDeFTBiLayermUgR_Dictionary() {
      TClass* theClass =::ROOT::GenerateInitInstanceLocal((const vector<DeFTBiLayer*>*)0x0)->GetClass();
      vectorlEDeFTBiLayermUgR_TClassManip(theClass);
   return theClass;
   }

   static void vectorlEDeFTBiLayermUgR_TClassManip(TClass* ){
   }

} // end of namespace ROOT

namespace ROOT {
   // Wrappers around operator new
   static void *new_vectorlEDeFTBiLayermUgR(void *p) {
      return  p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTBiLayer*> : new vector<DeFTBiLayer*>;
   }
   static void *newArray_vectorlEDeFTBiLayermUgR(Long_t nElements, void *p) {
      return p ? ::new((::ROOT::TOperatorNewHelper*)p) vector<DeFTBiLayer*>[nElements] : new vector<DeFTBiLayer*>[nElements];
   }
   // Wrapper around operator delete
   static void delete_vectorlEDeFTBiLayermUgR(void *p) {
      delete ((vector<DeFTBiLayer*>*)p);
   }
   static void deleteArray_vectorlEDeFTBiLayermUgR(void *p) {
      delete [] ((vector<DeFTBiLayer*>*)p);
   }
   static void destruct_vectorlEDeFTBiLayermUgR(void *p) {
      typedef vector<DeFTBiLayer*> current_t;
      ((current_t*)p)->~current_t();
   }
} // end of namespace ROOT for class vector<DeFTBiLayer*>

namespace {
  void TriggerDictionaryInitialization_FTDetDict_Impl() {
    static const char* headers[] = {
0    };
    static const char* includePaths[] = {
"/afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet",
"/afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/lhcb/software/releases/BRUNEL/BRUNEL_v49r1/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/lhcb/software/releases/REC/REC_v18r3/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/lhcb/software/releases/LBCOM/LBCOM_v17r2/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/lhcb/software/releases/LHCB/LHCB_v39r2/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/lhcb/software/releases/GAUDI/GAUDI_v26r4/InstallArea/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/ROOT/6.04.02/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/ROOT/6.04.02/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/Boost/1.55.0_python2.7/x86_64-slc6-gcc49-opt/include/boost-1_55",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/Python/2.7.9.p1/x86_64-slc6-gcc49-opt/include/python2.7",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/xrootd/3.3.6/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/XercesC/3.1.1p1/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/GSL/1.10/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/vdt/0.3.6/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/eigen/3.2.4/x86_64-slc6-gcc49-opt/include/eigen3",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/clhep/1.9.4.7/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Settings/../../../LCG_79/mysql/5.5.27/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/sw/lcg/releases/LCGCMT/LCGCMT_79/LCG_Platforms/src",
"/afs/cern.ch/sw/lcg/releases/ROOT/6.04.02-a6f71/x86_64-slc6-gcc49-opt/include",
"/afs/cern.ch/work/r/rquaglia/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/cmt/",
0
    };
    static const char* fwdDeclCode = 
R"DICTFWDDCLS(
#pragma clang diagnostic ignored "-Wkeyword-compat"
#pragma clang diagnostic ignored "-Wignored-attributes"
#pragma clang diagnostic ignored "-Wreturn-type-c-linkage"
extern int __Cling_Autoloading_Map;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTDetector;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTStation;
namespace std{template <typename _Tp> class __attribute__((annotate("$clingAutoload$string")))  allocator;
}
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTBiLayer;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTLayer;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTModule;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTFibreModule;
class __attribute__((annotate("$clingAutoload$FTDet/DeFTDetector.h")))  DeFTFibreMat;
)DICTFWDDCLS";
    static const char* payloadCode = R"DICTPAYLOAD(
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
  #define _Instantiations FTDet_Instantiations
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
// $Id: $
// ============================================================================
#ifndef DICT_FTDETDICT_H 
#define DICT_FTDETDICT_H 1

#include "FTDet/DeFTDetector.h"
#include "FTDet/DeFTStation.h"
#include "FTDet/DeFTBiLayer.h"
#include "FTDet/DeFTLayer.h"
#include "FTDet/DeFTModule.h"
#include "FTDet/DeFTFibreModule.h"
#include "FTDet/DeFTFibreMat.h"

#endif // DICT_FTDETDICT_H

#undef  _BACKWARD_BACKWARD_WARNING_H
)DICTPAYLOAD";
    static const char* classesHeaders[]={
"DeFTBiLayer", payloadCode, "@",
"DeFTDetector", payloadCode, "@",
"DeFTFibreMat", payloadCode, "@",
"DeFTFibreModule", payloadCode, "@",
"DeFTLayer", payloadCode, "@",
"DeFTModule", payloadCode, "@",
"DeFTStation", payloadCode, "@",
nullptr};

    static bool isInitialized = false;
    if (!isInitialized) {
      TROOT::RegisterModule("FTDetDict",
        headers, includePaths, payloadCode, fwdDeclCode,
        TriggerDictionaryInitialization_FTDetDict_Impl, {}, classesHeaders);
      isInitialized = true;
    }
  }
  static struct DictInit {
    DictInit() {
      TriggerDictionaryInitialization_FTDetDict_Impl();
    }
  } __TheDictionaryInitializer;
}
void TriggerDictionaryInitialization_FTDetDict() {
  TriggerDictionaryInitialization_FTDetDict_Impl();
}
