#-- start of make_header -----------------

#====================================
#  Library FTDet
#
#   Generated Wed May 11 14:30:31 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_FTDet_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDet_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDet

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDet = $(FTDet_tag)_FTDet.make
cmt_local_tagfile_FTDet = $(bin)$(FTDet_tag)_FTDet.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDet = $(FTDet_tag).make
cmt_local_tagfile_FTDet = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDet)
#-include $(cmt_local_tagfile_FTDet)

ifdef cmt_FTDet_has_target_tag

cmt_final_setup_FTDet = $(bin)setup_FTDet.make
#cmt_final_setup_FTDet = $(bin)FTDet_FTDetsetup.make
cmt_local_FTDet_makefile = $(bin)FTDet.make

else

cmt_final_setup_FTDet = $(bin)setup.make
#cmt_final_setup_FTDet = $(bin)FTDetsetup.make
cmt_local_FTDet_makefile = $(bin)FTDet.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDet :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDet'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDet/
#FTDet::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

FTDetlibname   = $(bin)$(library_prefix)FTDet$(library_suffix)
FTDetlib       = $(FTDetlibname).a
FTDetstamp     = $(bin)FTDet.stamp
FTDetshstamp   = $(bin)FTDet.shstamp

FTDet :: dirs  FTDetLIB
	$(echo) "FTDet ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

FTDetLIB :: $(FTDetlib) $(FTDetshstamp)
	$(echo) "FTDet : library ok"

$(FTDetlib) :: $(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(FTDetlib) $(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o
	$(lib_silent) $(ranlib) $(FTDetlib)
	$(lib_silent) cat /dev/null >$(FTDetstamp)

#------------------------------------------------------------------
#  Future improvement? to empty the object files after
#  storing in the library
#
##	  for f in $?; do \
##	    rm $${f}; touch $${f}; \
##	  done
#------------------------------------------------------------------

#
# We add one level of dependency upon the true shared library 
# (rather than simply upon the stamp file)
# this is for cases where the shared library has not been built
# while the stamp was created (error??) 
#

$(FTDetlibname).$(shlibsuffix) :: $(FTDetlib) requirements $(use_requirements) $(FTDetstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" FTDet $(FTDet_shlibflags)

$(FTDetshstamp) :: $(FTDetlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(FTDetlibname).$(shlibsuffix) ; then cat /dev/null >$(FTDetshstamp) ; fi

FTDetclean ::
	$(cleanup_echo) objects FTDet
	$(cleanup_silent) /bin/rm -f $(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o) $(patsubst %.o,%.dep,$(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o) $(patsubst %.o,%.d.stamp,$(bin)XmlDeFTModuleCnv.o $(bin)XmlDeFTBiLayerCnv.o $(bin)XmlDeFTDetectorCnv.o $(bin)XmlDeFTFibreMatCnv.o $(bin)DeFTTestAlg.o $(bin)XmlDeFTLayerCnv.o $(bin)XmlDeFTFibreModuleCnv.o $(bin)XmlDeFTStationCnv.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf FTDet_deps FTDet_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
FTDetinstallname = $(library_prefix)FTDet$(library_suffix).$(shlibsuffix)

FTDet :: FTDetinstall

install :: FTDetinstall

FTDetinstall :: $(install_dir)/$(FTDetinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(FTDetinstallname) :: $(bin)$(FTDetinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(FTDetinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##FTDetclean :: FTDetuninstall

uninstall :: FTDetuninstall

FTDetuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(FTDetinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)FTDet_dependencies.make :: dirs

ifndef QUICK
$(bin)FTDet_dependencies.make : $(src)component/XmlDeFTModuleCnv.cpp $(src)component/XmlDeFTBiLayerCnv.cpp $(src)component/XmlDeFTDetectorCnv.cpp $(src)component/XmlDeFTFibreMatCnv.cpp $(src)component/DeFTTestAlg.cpp $(src)component/XmlDeFTLayerCnv.cpp $(src)component/XmlDeFTFibreModuleCnv.cpp $(src)component/XmlDeFTStationCnv.cpp $(use_requirements) $(cmt_final_setup_FTDet)
	$(echo) "(FTDet.make) Rebuilding $@"; \
	  $(build_dependencies) FTDet -all_sources -out=$@ $(src)component/XmlDeFTModuleCnv.cpp $(src)component/XmlDeFTBiLayerCnv.cpp $(src)component/XmlDeFTDetectorCnv.cpp $(src)component/XmlDeFTFibreMatCnv.cpp $(src)component/DeFTTestAlg.cpp $(src)component/XmlDeFTLayerCnv.cpp $(src)component/XmlDeFTFibreModuleCnv.cpp $(src)component/XmlDeFTStationCnv.cpp
endif

#$(FTDet_dependencies)

-include $(bin)FTDet_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTModuleCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTModuleCnv.o $(bin)$(binobj)XmlDeFTModuleCnv.d : $(src)component/XmlDeFTModuleCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTModuleCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTModuleCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTModuleCnv_cppflags) $(XmlDeFTModuleCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTModuleCnv.o -MT $(bin)$(binobj)XmlDeFTModuleCnv.d -MF $(bin)$(binobj)XmlDeFTModuleCnv.d -o $(bin)$(binobj)XmlDeFTModuleCnv.o $(src)component/XmlDeFTModuleCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTBiLayerCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTBiLayerCnv.o $(bin)$(binobj)XmlDeFTBiLayerCnv.d : $(src)component/XmlDeFTBiLayerCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTBiLayerCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTBiLayerCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTBiLayerCnv_cppflags) $(XmlDeFTBiLayerCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTBiLayerCnv.o -MT $(bin)$(binobj)XmlDeFTBiLayerCnv.d -MF $(bin)$(binobj)XmlDeFTBiLayerCnv.d -o $(bin)$(binobj)XmlDeFTBiLayerCnv.o $(src)component/XmlDeFTBiLayerCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTDetectorCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTDetectorCnv.o $(bin)$(binobj)XmlDeFTDetectorCnv.d : $(src)component/XmlDeFTDetectorCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTDetectorCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTDetectorCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTDetectorCnv_cppflags) $(XmlDeFTDetectorCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTDetectorCnv.o -MT $(bin)$(binobj)XmlDeFTDetectorCnv.d -MF $(bin)$(binobj)XmlDeFTDetectorCnv.d -o $(bin)$(binobj)XmlDeFTDetectorCnv.o $(src)component/XmlDeFTDetectorCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTFibreMatCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTFibreMatCnv.o $(bin)$(binobj)XmlDeFTFibreMatCnv.d : $(src)component/XmlDeFTFibreMatCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTFibreMatCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTFibreMatCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTFibreMatCnv_cppflags) $(XmlDeFTFibreMatCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTFibreMatCnv.o -MT $(bin)$(binobj)XmlDeFTFibreMatCnv.d -MF $(bin)$(binobj)XmlDeFTFibreMatCnv.d -o $(bin)$(binobj)XmlDeFTFibreMatCnv.o $(src)component/XmlDeFTFibreMatCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTTestAlg.d
endif
endif


$(bin)$(binobj)DeFTTestAlg.o $(bin)$(binobj)DeFTTestAlg.d : $(src)component/DeFTTestAlg.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/DeFTTestAlg.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(DeFTTestAlg_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(DeFTTestAlg_cppflags) $(DeFTTestAlg_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)DeFTTestAlg.o -MT $(bin)$(binobj)DeFTTestAlg.d -MF $(bin)$(binobj)DeFTTestAlg.d -o $(bin)$(binobj)DeFTTestAlg.o $(src)component/DeFTTestAlg.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTLayerCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTLayerCnv.o $(bin)$(binobj)XmlDeFTLayerCnv.d : $(src)component/XmlDeFTLayerCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTLayerCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTLayerCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTLayerCnv_cppflags) $(XmlDeFTLayerCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTLayerCnv.o -MT $(bin)$(binobj)XmlDeFTLayerCnv.d -MF $(bin)$(binobj)XmlDeFTLayerCnv.d -o $(bin)$(binobj)XmlDeFTLayerCnv.o $(src)component/XmlDeFTLayerCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTFibreModuleCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTFibreModuleCnv.o $(bin)$(binobj)XmlDeFTFibreModuleCnv.d : $(src)component/XmlDeFTFibreModuleCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTFibreModuleCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTFibreModuleCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTFibreModuleCnv_cppflags) $(XmlDeFTFibreModuleCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTFibreModuleCnv.o -MT $(bin)$(binobj)XmlDeFTFibreModuleCnv.d -MF $(bin)$(binobj)XmlDeFTFibreModuleCnv.d -o $(bin)$(binobj)XmlDeFTFibreModuleCnv.o $(src)component/XmlDeFTFibreModuleCnv.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)XmlDeFTStationCnv.d
endif
endif


$(bin)$(binobj)XmlDeFTStationCnv.o $(bin)$(binobj)XmlDeFTStationCnv.d : $(src)component/XmlDeFTStationCnv.cpp  $(use_requirements) $(cmt_final_setup_FTDet)
	$(cpp_echo) $(src)component/XmlDeFTStationCnv.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDet_pp_cppflags) $(app_FTDet_pp_cppflags) $(XmlDeFTStationCnv_pp_cppflags) $(use_cppflags) $(FTDet_cppflags) $(lib_FTDet_cppflags) $(app_FTDet_cppflags) $(XmlDeFTStationCnv_cppflags) $(XmlDeFTStationCnv_cpp_cppflags) -I../src/component -MP -MMD -MT $(bin)$(binobj)XmlDeFTStationCnv.o -MT $(bin)$(binobj)XmlDeFTStationCnv.d -MF $(bin)$(binobj)XmlDeFTStationCnv.d -o $(bin)$(binobj)XmlDeFTStationCnv.o $(src)component/XmlDeFTStationCnv.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: FTDetclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDet.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDet.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDet.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDet.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDet)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDet.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDet.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDet.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library FTDet
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)FTDet$(library_suffix).a $(library_prefix)FTDet$(library_suffix).s? FTDet.stamp FTDet.shstamp
#-- end of cleanup_library ---------------
