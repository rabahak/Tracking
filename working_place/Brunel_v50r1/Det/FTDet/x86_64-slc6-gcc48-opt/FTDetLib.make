#-- start of make_header -----------------

#====================================
#  Library FTDetLib
#
#   Generated Wed May 11 14:30:26 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_FTDetLib_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetLib_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDetLib

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetLib = $(FTDet_tag)_FTDetLib.make
cmt_local_tagfile_FTDetLib = $(bin)$(FTDet_tag)_FTDetLib.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetLib = $(FTDet_tag).make
cmt_local_tagfile_FTDetLib = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDetLib)
#-include $(cmt_local_tagfile_FTDetLib)

ifdef cmt_FTDetLib_has_target_tag

cmt_final_setup_FTDetLib = $(bin)setup_FTDetLib.make
#cmt_final_setup_FTDetLib = $(bin)FTDet_FTDetLibsetup.make
cmt_local_FTDetLib_makefile = $(bin)FTDetLib.make

else

cmt_final_setup_FTDetLib = $(bin)setup.make
#cmt_final_setup_FTDetLib = $(bin)FTDetsetup.make
cmt_local_FTDetLib_makefile = $(bin)FTDetLib.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDetLib :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDetLib'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDetLib/
#FTDetLib::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

FTDetLiblibname   = $(bin)$(library_prefix)FTDetLib$(library_suffix)
FTDetLiblib       = $(FTDetLiblibname).a
FTDetLibstamp     = $(bin)FTDetLib.stamp
FTDetLibshstamp   = $(bin)FTDetLib.shstamp

FTDetLib :: dirs  FTDetLibLIB
	$(echo) "FTDetLib ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

FTDetLibLIB :: $(FTDetLiblib) $(FTDetLibshstamp)
	$(echo) "FTDetLib : library ok"

$(FTDetLiblib) :: $(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(FTDetLiblib) $(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o
	$(lib_silent) $(ranlib) $(FTDetLiblib)
	$(lib_silent) cat /dev/null >$(FTDetLibstamp)

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

$(FTDetLiblibname).$(shlibsuffix) :: $(FTDetLiblib) requirements $(use_requirements) $(FTDetLibstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" FTDetLib $(FTDetLib_shlibflags)

$(FTDetLibshstamp) :: $(FTDetLiblibname).$(shlibsuffix)
	$(lib_silent) if test -f $(FTDetLiblibname).$(shlibsuffix) ; then cat /dev/null >$(FTDetLibshstamp) ; fi

FTDetLibclean ::
	$(cleanup_echo) objects FTDetLib
	$(cleanup_silent) /bin/rm -f $(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o) $(patsubst %.o,%.dep,$(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o) $(patsubst %.o,%.d.stamp,$(bin)DeFTLayer.o $(bin)DeFTFibreModule.o $(bin)DeFTStation.o $(bin)DeFTModule.o $(bin)DeFTBiLayer.o $(bin)DeFTDetector.o $(bin)DeFTFibreMat.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf FTDetLib_deps FTDetLib_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
FTDetLibinstallname = $(library_prefix)FTDetLib$(library_suffix).$(shlibsuffix)

FTDetLib :: FTDetLibinstall

install :: FTDetLibinstall

FTDetLibinstall :: $(install_dir)/$(FTDetLibinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(FTDetLibinstallname) :: $(bin)$(FTDetLibinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(FTDetLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##FTDetLibclean :: FTDetLibuninstall

uninstall :: FTDetLibuninstall

FTDetLibuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(FTDetLibinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)FTDetLib_dependencies.make :: dirs

ifndef QUICK
$(bin)FTDetLib_dependencies.make : $(src)Lib/DeFTLayer.cpp $(src)Lib/DeFTFibreModule.cpp $(src)Lib/DeFTStation.cpp $(src)Lib/DeFTModule.cpp $(src)Lib/DeFTBiLayer.cpp $(src)Lib/DeFTDetector.cpp $(src)Lib/DeFTFibreMat.cpp $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(echo) "(FTDetLib.make) Rebuilding $@"; \
	  $(build_dependencies) FTDetLib -all_sources -out=$@ $(src)Lib/DeFTLayer.cpp $(src)Lib/DeFTFibreModule.cpp $(src)Lib/DeFTStation.cpp $(src)Lib/DeFTModule.cpp $(src)Lib/DeFTBiLayer.cpp $(src)Lib/DeFTDetector.cpp $(src)Lib/DeFTFibreMat.cpp
endif

#$(FTDetLib_dependencies)

-include $(bin)FTDetLib_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTLayer.d
endif
endif


$(bin)$(binobj)DeFTLayer.o $(bin)$(binobj)DeFTLayer.d : $(src)Lib/DeFTLayer.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTLayer.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTLayer_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTLayer_cppflags) $(DeFTLayer_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTLayer.o -MT $(bin)$(binobj)DeFTLayer.d -MF $(bin)$(binobj)DeFTLayer.d -o $(bin)$(binobj)DeFTLayer.o $(src)Lib/DeFTLayer.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTFibreModule.d
endif
endif


$(bin)$(binobj)DeFTFibreModule.o $(bin)$(binobj)DeFTFibreModule.d : $(src)Lib/DeFTFibreModule.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTFibreModule.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTFibreModule_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTFibreModule_cppflags) $(DeFTFibreModule_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTFibreModule.o -MT $(bin)$(binobj)DeFTFibreModule.d -MF $(bin)$(binobj)DeFTFibreModule.d -o $(bin)$(binobj)DeFTFibreModule.o $(src)Lib/DeFTFibreModule.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTStation.d
endif
endif


$(bin)$(binobj)DeFTStation.o $(bin)$(binobj)DeFTStation.d : $(src)Lib/DeFTStation.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTStation.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTStation_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTStation_cppflags) $(DeFTStation_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTStation.o -MT $(bin)$(binobj)DeFTStation.d -MF $(bin)$(binobj)DeFTStation.d -o $(bin)$(binobj)DeFTStation.o $(src)Lib/DeFTStation.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTModule.d
endif
endif


$(bin)$(binobj)DeFTModule.o $(bin)$(binobj)DeFTModule.d : $(src)Lib/DeFTModule.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTModule.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTModule_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTModule_cppflags) $(DeFTModule_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTModule.o -MT $(bin)$(binobj)DeFTModule.d -MF $(bin)$(binobj)DeFTModule.d -o $(bin)$(binobj)DeFTModule.o $(src)Lib/DeFTModule.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTBiLayer.d
endif
endif


$(bin)$(binobj)DeFTBiLayer.o $(bin)$(binobj)DeFTBiLayer.d : $(src)Lib/DeFTBiLayer.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTBiLayer.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTBiLayer_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTBiLayer_cppflags) $(DeFTBiLayer_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTBiLayer.o -MT $(bin)$(binobj)DeFTBiLayer.d -MF $(bin)$(binobj)DeFTBiLayer.d -o $(bin)$(binobj)DeFTBiLayer.o $(src)Lib/DeFTBiLayer.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTDetector.d
endif
endif


$(bin)$(binobj)DeFTDetector.o $(bin)$(binobj)DeFTDetector.d : $(src)Lib/DeFTDetector.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTDetector.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTDetector_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTDetector_cppflags) $(DeFTDetector_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTDetector.o -MT $(bin)$(binobj)DeFTDetector.d -MF $(bin)$(binobj)DeFTDetector.d -o $(bin)$(binobj)DeFTDetector.o $(src)Lib/DeFTDetector.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),FTDetLibclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)DeFTFibreMat.d
endif
endif


$(bin)$(binobj)DeFTFibreMat.o $(bin)$(binobj)DeFTFibreMat.d : $(src)Lib/DeFTFibreMat.cpp  $(use_requirements) $(cmt_final_setup_FTDetLib)
	$(cpp_echo) $(src)Lib/DeFTFibreMat.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(FTDetLib_pp_cppflags) $(app_FTDetLib_pp_cppflags) $(DeFTFibreMat_pp_cppflags) $(use_cppflags) $(FTDetLib_cppflags) $(lib_FTDetLib_cppflags) $(app_FTDetLib_cppflags) $(DeFTFibreMat_cppflags) $(DeFTFibreMat_cpp_cppflags) -I../src/Lib -MP -MMD -MT $(bin)$(binobj)DeFTFibreMat.o -MT $(bin)$(binobj)DeFTFibreMat.d -MF $(bin)$(binobj)DeFTFibreMat.d -o $(bin)$(binobj)DeFTFibreMat.o $(src)Lib/DeFTFibreMat.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: FTDetLibclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDetLib.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetLib.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDetLib.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetLib.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDetLib)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetLib.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetLib.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetLib.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetLibclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library FTDetLib
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)FTDetLib$(library_suffix).a $(library_prefix)FTDetLib$(library_suffix).s? FTDetLib.stamp FTDetLib.shstamp
#-- end of cleanup_library ---------------
