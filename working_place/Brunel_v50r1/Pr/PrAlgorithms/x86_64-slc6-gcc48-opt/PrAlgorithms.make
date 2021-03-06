#-- start of make_header -----------------

#====================================
#  Library PrAlgorithms
#
#   Generated Wed May 11 14:30:51 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrAlgorithms_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithms_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrAlgorithms

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithms = $(PrAlgorithms_tag)_PrAlgorithms.make
cmt_local_tagfile_PrAlgorithms = $(bin)$(PrAlgorithms_tag)_PrAlgorithms.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithms = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithms = $(bin)$(PrAlgorithms_tag).make

endif

include $(cmt_local_tagfile_PrAlgorithms)
#-include $(cmt_local_tagfile_PrAlgorithms)

ifdef cmt_PrAlgorithms_has_target_tag

cmt_final_setup_PrAlgorithms = $(bin)setup_PrAlgorithms.make
#cmt_final_setup_PrAlgorithms = $(bin)PrAlgorithms_PrAlgorithmssetup.make
cmt_local_PrAlgorithms_makefile = $(bin)PrAlgorithms.make

else

cmt_final_setup_PrAlgorithms = $(bin)setup.make
#cmt_final_setup_PrAlgorithms = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithms_makefile = $(bin)PrAlgorithms.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrAlgorithmssetup.make

#PrAlgorithms :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrAlgorithms'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrAlgorithms/
#PrAlgorithms::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PrAlgorithmslibname   = $(bin)$(library_prefix)PrAlgorithms$(library_suffix)
PrAlgorithmslib       = $(PrAlgorithmslibname).a
PrAlgorithmsstamp     = $(bin)PrAlgorithms.stamp
PrAlgorithmsshstamp   = $(bin)PrAlgorithms.shstamp

PrAlgorithms :: dirs  PrAlgorithmsLIB
	$(echo) "PrAlgorithms ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

PrAlgorithmsLIB :: $(PrAlgorithmslib) $(PrAlgorithmsshstamp)
	$(echo) "PrAlgorithms : library ok"

$(PrAlgorithmslib) :: $(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PrAlgorithmslib) $(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o
	$(lib_silent) $(ranlib) $(PrAlgorithmslib)
	$(lib_silent) cat /dev/null >$(PrAlgorithmsstamp)

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

$(PrAlgorithmslibname).$(shlibsuffix) :: $(PrAlgorithmslib) requirements $(use_requirements) $(PrAlgorithmsstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" PrAlgorithms $(PrAlgorithms_shlibflags)

$(PrAlgorithmsshstamp) :: $(PrAlgorithmslibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PrAlgorithmslibname).$(shlibsuffix) ; then cat /dev/null >$(PrAlgorithmsshstamp) ; fi

PrAlgorithmsclean ::
	$(cleanup_echo) objects PrAlgorithms
	$(cleanup_silent) /bin/rm -f $(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o) $(patsubst %.o,%.dep,$(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o) $(patsubst %.o,%.d.stamp,$(bin)PrDownstream.o $(bin)PrDownTrack.o $(bin)PrForwardTool.o $(bin)PrForwardTracking.o $(bin)PrFTHitManager.o $(bin)PrGeometryTool.o $(bin)PrHybridSeeding.o $(bin)PrMatch.o $(bin)PrMatchNN.o $(bin)PrMatchTool.o $(bin)PrMatchToolNN.o $(bin)SIMDLine.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PrAlgorithms_deps PrAlgorithms_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PrAlgorithmsinstallname = $(library_prefix)PrAlgorithms$(library_suffix).$(shlibsuffix)

PrAlgorithms :: PrAlgorithmsinstall

install :: PrAlgorithmsinstall

PrAlgorithmsinstall :: $(install_dir)/$(PrAlgorithmsinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PrAlgorithmsinstallname) :: $(bin)$(PrAlgorithmsinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrAlgorithmsinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PrAlgorithmsclean :: PrAlgorithmsuninstall

uninstall :: PrAlgorithmsuninstall

PrAlgorithmsuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrAlgorithmsinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)PrAlgorithms_dependencies.make :: dirs

ifndef QUICK
$(bin)PrAlgorithms_dependencies.make : $(src)PrDownstream.cpp $(src)PrDownTrack.cpp $(src)PrForwardTool.cpp $(src)PrForwardTracking.cpp $(src)PrFTHitManager.cpp $(src)PrGeometryTool.cpp $(src)PrHybridSeeding.cpp $(src)PrMatch.cpp $(src)PrMatchNN.cpp $(src)PrMatchTool.cpp $(src)PrMatchToolNN.cpp $(src)SIMDLine.cpp $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(echo) "(PrAlgorithms.make) Rebuilding $@"; \
	  $(build_dependencies) PrAlgorithms -all_sources -out=$@ $(src)PrDownstream.cpp $(src)PrDownTrack.cpp $(src)PrForwardTool.cpp $(src)PrForwardTracking.cpp $(src)PrFTHitManager.cpp $(src)PrGeometryTool.cpp $(src)PrHybridSeeding.cpp $(src)PrMatch.cpp $(src)PrMatchNN.cpp $(src)PrMatchTool.cpp $(src)PrMatchToolNN.cpp $(src)SIMDLine.cpp
endif

#$(PrAlgorithms_dependencies)

-include $(bin)PrAlgorithms_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrDownstream.d
endif
endif


$(bin)$(binobj)PrDownstream.o $(bin)$(binobj)PrDownstream.d : $(src)PrDownstream.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrDownstream.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrDownstream_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrDownstream_cppflags) $(PrDownstream_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrDownstream.o -MT $(bin)$(binobj)PrDownstream.d -MF $(bin)$(binobj)PrDownstream.d -o $(bin)$(binobj)PrDownstream.o $(src)PrDownstream.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrDownTrack.d
endif
endif


$(bin)$(binobj)PrDownTrack.o $(bin)$(binobj)PrDownTrack.d : $(src)PrDownTrack.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrDownTrack.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrDownTrack_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrDownTrack_cppflags) $(PrDownTrack_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrDownTrack.o -MT $(bin)$(binobj)PrDownTrack.d -MF $(bin)$(binobj)PrDownTrack.d -o $(bin)$(binobj)PrDownTrack.o $(src)PrDownTrack.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrForwardTool.d
endif
endif


$(bin)$(binobj)PrForwardTool.o $(bin)$(binobj)PrForwardTool.d : $(src)PrForwardTool.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrForwardTool.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrForwardTool_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrForwardTool_cppflags) $(PrForwardTool_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrForwardTool.o -MT $(bin)$(binobj)PrForwardTool.d -MF $(bin)$(binobj)PrForwardTool.d -o $(bin)$(binobj)PrForwardTool.o $(src)PrForwardTool.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrForwardTracking.d
endif
endif


$(bin)$(binobj)PrForwardTracking.o $(bin)$(binobj)PrForwardTracking.d : $(src)PrForwardTracking.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrForwardTracking.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrForwardTracking_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrForwardTracking_cppflags) $(PrForwardTracking_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrForwardTracking.o -MT $(bin)$(binobj)PrForwardTracking.d -MF $(bin)$(binobj)PrForwardTracking.d -o $(bin)$(binobj)PrForwardTracking.o $(src)PrForwardTracking.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrFTHitManager.d
endif
endif


$(bin)$(binobj)PrFTHitManager.o $(bin)$(binobj)PrFTHitManager.d : $(src)PrFTHitManager.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrFTHitManager.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrFTHitManager_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrFTHitManager_cppflags) $(PrFTHitManager_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrFTHitManager.o -MT $(bin)$(binobj)PrFTHitManager.d -MF $(bin)$(binobj)PrFTHitManager.d -o $(bin)$(binobj)PrFTHitManager.o $(src)PrFTHitManager.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrGeometryTool.d
endif
endif


$(bin)$(binobj)PrGeometryTool.o $(bin)$(binobj)PrGeometryTool.d : $(src)PrGeometryTool.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrGeometryTool.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrGeometryTool_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrGeometryTool_cppflags) $(PrGeometryTool_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrGeometryTool.o -MT $(bin)$(binobj)PrGeometryTool.d -MF $(bin)$(binobj)PrGeometryTool.d -o $(bin)$(binobj)PrGeometryTool.o $(src)PrGeometryTool.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrHybridSeeding.d
endif
endif


$(bin)$(binobj)PrHybridSeeding.o $(bin)$(binobj)PrHybridSeeding.d : $(src)PrHybridSeeding.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrHybridSeeding.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrHybridSeeding_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrHybridSeeding_cppflags) $(PrHybridSeeding_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrHybridSeeding.o -MT $(bin)$(binobj)PrHybridSeeding.d -MF $(bin)$(binobj)PrHybridSeeding.d -o $(bin)$(binobj)PrHybridSeeding.o $(src)PrHybridSeeding.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrMatch.d
endif
endif


$(bin)$(binobj)PrMatch.o $(bin)$(binobj)PrMatch.d : $(src)PrMatch.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrMatch.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrMatch_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrMatch_cppflags) $(PrMatch_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrMatch.o -MT $(bin)$(binobj)PrMatch.d -MF $(bin)$(binobj)PrMatch.d -o $(bin)$(binobj)PrMatch.o $(src)PrMatch.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrMatchNN.d
endif
endif


$(bin)$(binobj)PrMatchNN.o $(bin)$(binobj)PrMatchNN.d : $(src)PrMatchNN.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrMatchNN.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrMatchNN_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrMatchNN_cppflags) $(PrMatchNN_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrMatchNN.o -MT $(bin)$(binobj)PrMatchNN.d -MF $(bin)$(binobj)PrMatchNN.d -o $(bin)$(binobj)PrMatchNN.o $(src)PrMatchNN.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrMatchTool.d
endif
endif


$(bin)$(binobj)PrMatchTool.o $(bin)$(binobj)PrMatchTool.d : $(src)PrMatchTool.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrMatchTool.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrMatchTool_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrMatchTool_cppflags) $(PrMatchTool_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrMatchTool.o -MT $(bin)$(binobj)PrMatchTool.d -MF $(bin)$(binobj)PrMatchTool.d -o $(bin)$(binobj)PrMatchTool.o $(src)PrMatchTool.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrMatchToolNN.d
endif
endif


$(bin)$(binobj)PrMatchToolNN.o $(bin)$(binobj)PrMatchToolNN.d : $(src)PrMatchToolNN.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)PrMatchToolNN.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(PrMatchToolNN_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(PrMatchToolNN_cppflags) $(PrMatchToolNN_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrMatchToolNN.o -MT $(bin)$(binobj)PrMatchToolNN.d -MF $(bin)$(binobj)PrMatchToolNN.d -o $(bin)$(binobj)PrMatchToolNN.o $(src)PrMatchToolNN.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrAlgorithmsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)SIMDLine.d
endif
endif


$(bin)$(binobj)SIMDLine.o $(bin)$(binobj)SIMDLine.d : $(src)SIMDLine.cpp  $(use_requirements) $(cmt_final_setup_PrAlgorithms)
	$(cpp_echo) $(src)SIMDLine.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrAlgorithms_pp_cppflags) $(app_PrAlgorithms_pp_cppflags) $(SIMDLine_pp_cppflags) $(use_cppflags) $(PrAlgorithms_cppflags) $(lib_PrAlgorithms_cppflags) $(app_PrAlgorithms_cppflags) $(SIMDLine_cppflags) $(SIMDLine_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)SIMDLine.o -MT $(bin)$(binobj)SIMDLine.d -MF $(bin)$(binobj)SIMDLine.d -o $(bin)$(binobj)SIMDLine.o $(src)SIMDLine.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PrAlgorithmsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrAlgorithms.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithms.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrAlgorithms.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithms.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrAlgorithms)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithms.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithms.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithms.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrAlgorithmsclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PrAlgorithms
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PrAlgorithms$(library_suffix).a $(library_prefix)PrAlgorithms$(library_suffix).s? PrAlgorithms.stamp PrAlgorithms.shstamp
#-- end of cleanup_library ---------------
