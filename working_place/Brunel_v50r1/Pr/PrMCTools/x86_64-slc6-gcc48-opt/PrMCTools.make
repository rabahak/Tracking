#-- start of make_header -----------------

#====================================
#  Library PrMCTools
#
#   Generated Wed May 11 14:30:43 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrMCTools_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrMCTools_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrMCTools

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCTools = $(PrMCTools_tag)_PrMCTools.make
cmt_local_tagfile_PrMCTools = $(bin)$(PrMCTools_tag)_PrMCTools.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCTools = $(PrMCTools_tag).make
cmt_local_tagfile_PrMCTools = $(bin)$(PrMCTools_tag).make

endif

include $(cmt_local_tagfile_PrMCTools)
#-include $(cmt_local_tagfile_PrMCTools)

ifdef cmt_PrMCTools_has_target_tag

cmt_final_setup_PrMCTools = $(bin)setup_PrMCTools.make
#cmt_final_setup_PrMCTools = $(bin)PrMCTools_PrMCToolssetup.make
cmt_local_PrMCTools_makefile = $(bin)PrMCTools.make

else

cmt_final_setup_PrMCTools = $(bin)setup.make
#cmt_final_setup_PrMCTools = $(bin)PrMCToolssetup.make
cmt_local_PrMCTools_makefile = $(bin)PrMCTools.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrMCToolssetup.make

#PrMCTools :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrMCTools'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrMCTools/
#PrMCTools::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PrMCToolslibname   = $(bin)$(library_prefix)PrMCTools$(library_suffix)
PrMCToolslib       = $(PrMCToolslibname).a
PrMCToolsstamp     = $(bin)PrMCTools.stamp
PrMCToolsshstamp   = $(bin)PrMCTools.shstamp

PrMCTools :: dirs  PrMCToolsLIB
	$(echo) "PrMCTools ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

PrMCToolsLIB :: $(PrMCToolslib) $(PrMCToolsshstamp)
	$(echo) "PrMCTools : library ok"

$(PrMCToolslib) :: $(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PrMCToolslib) $(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o
	$(lib_silent) $(ranlib) $(PrMCToolslib)
	$(lib_silent) cat /dev/null >$(PrMCToolsstamp)

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

$(PrMCToolslibname).$(shlibsuffix) :: $(PrMCToolslib) requirements $(use_requirements) $(PrMCToolsstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" PrMCTools $(PrMCTools_shlibflags)

$(PrMCToolsshstamp) :: $(PrMCToolslibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PrMCToolslibname).$(shlibsuffix) ; then cat /dev/null >$(PrMCToolsshstamp) ; fi

PrMCToolsclean ::
	$(cleanup_echo) objects PrMCTools
	$(cleanup_silent) /bin/rm -f $(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o) $(patsubst %.o,%.dep,$(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o) $(patsubst %.o,%.d.stamp,$(bin)PrTrackAssociator.o $(bin)PrClustersResidual.o $(bin)PrCheatedSciFiTracking.o $(bin)PrCounter2.o $(bin)PrDebugTrackingLosses.o $(bin)PrCheatedVP.o $(bin)PrFitPolinomial.o $(bin)PrCounter.o $(bin)PrPixelDebugTool.o $(bin)PrPlotFTHits.o $(bin)PrVeloUTChecker.o $(bin)PrChecker.o $(bin)PrTStationDebugTool.o $(bin)PrLHCbID2MCParticle.o $(bin)PrCheatedVelo.o $(bin)PrChecker2.o $(bin)PrTTCounter.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PrMCTools_deps PrMCTools_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PrMCToolsinstallname = $(library_prefix)PrMCTools$(library_suffix).$(shlibsuffix)

PrMCTools :: PrMCToolsinstall

install :: PrMCToolsinstall

PrMCToolsinstall :: $(install_dir)/$(PrMCToolsinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PrMCToolsinstallname) :: $(bin)$(PrMCToolsinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrMCToolsinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PrMCToolsclean :: PrMCToolsuninstall

uninstall :: PrMCToolsuninstall

PrMCToolsuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrMCToolsinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)PrMCTools_dependencies.make :: dirs

ifndef QUICK
$(bin)PrMCTools_dependencies.make : $(src)PrTrackAssociator.cpp $(src)PrClustersResidual.cpp $(src)PrCheatedSciFiTracking.cpp $(src)PrCounter2.cpp $(src)PrDebugTrackingLosses.cpp $(src)PrCheatedVP.cpp $(src)PrFitPolinomial.cpp $(src)PrCounter.cpp $(src)PrPixelDebugTool.cpp $(src)PrPlotFTHits.cpp $(src)PrVeloUTChecker.cpp $(src)PrChecker.cpp $(src)PrTStationDebugTool.cpp $(src)PrLHCbID2MCParticle.cpp $(src)PrCheatedVelo.cpp $(src)PrChecker2.cpp $(src)PrTTCounter.cpp $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(echo) "(PrMCTools.make) Rebuilding $@"; \
	  $(build_dependencies) PrMCTools -all_sources -out=$@ $(src)PrTrackAssociator.cpp $(src)PrClustersResidual.cpp $(src)PrCheatedSciFiTracking.cpp $(src)PrCounter2.cpp $(src)PrDebugTrackingLosses.cpp $(src)PrCheatedVP.cpp $(src)PrFitPolinomial.cpp $(src)PrCounter.cpp $(src)PrPixelDebugTool.cpp $(src)PrPlotFTHits.cpp $(src)PrVeloUTChecker.cpp $(src)PrChecker.cpp $(src)PrTStationDebugTool.cpp $(src)PrLHCbID2MCParticle.cpp $(src)PrCheatedVelo.cpp $(src)PrChecker2.cpp $(src)PrTTCounter.cpp
endif

#$(PrMCTools_dependencies)

-include $(bin)PrMCTools_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrTrackAssociator.d
endif
endif


$(bin)$(binobj)PrTrackAssociator.o $(bin)$(binobj)PrTrackAssociator.d : $(src)PrTrackAssociator.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrTrackAssociator.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrTrackAssociator_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrTrackAssociator_cppflags) $(PrTrackAssociator_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrTrackAssociator.o -MT $(bin)$(binobj)PrTrackAssociator.d -MF $(bin)$(binobj)PrTrackAssociator.d -o $(bin)$(binobj)PrTrackAssociator.o $(src)PrTrackAssociator.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrClustersResidual.d
endif
endif


$(bin)$(binobj)PrClustersResidual.o $(bin)$(binobj)PrClustersResidual.d : $(src)PrClustersResidual.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrClustersResidual.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrClustersResidual_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrClustersResidual_cppflags) $(PrClustersResidual_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrClustersResidual.o -MT $(bin)$(binobj)PrClustersResidual.d -MF $(bin)$(binobj)PrClustersResidual.d -o $(bin)$(binobj)PrClustersResidual.o $(src)PrClustersResidual.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrCheatedSciFiTracking.d
endif
endif


$(bin)$(binobj)PrCheatedSciFiTracking.o $(bin)$(binobj)PrCheatedSciFiTracking.d : $(src)PrCheatedSciFiTracking.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrCheatedSciFiTracking.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrCheatedSciFiTracking_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrCheatedSciFiTracking_cppflags) $(PrCheatedSciFiTracking_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrCheatedSciFiTracking.o -MT $(bin)$(binobj)PrCheatedSciFiTracking.d -MF $(bin)$(binobj)PrCheatedSciFiTracking.d -o $(bin)$(binobj)PrCheatedSciFiTracking.o $(src)PrCheatedSciFiTracking.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrCounter2.d
endif
endif


$(bin)$(binobj)PrCounter2.o $(bin)$(binobj)PrCounter2.d : $(src)PrCounter2.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrCounter2.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrCounter2_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrCounter2_cppflags) $(PrCounter2_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrCounter2.o -MT $(bin)$(binobj)PrCounter2.d -MF $(bin)$(binobj)PrCounter2.d -o $(bin)$(binobj)PrCounter2.o $(src)PrCounter2.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrDebugTrackingLosses.d
endif
endif


$(bin)$(binobj)PrDebugTrackingLosses.o $(bin)$(binobj)PrDebugTrackingLosses.d : $(src)PrDebugTrackingLosses.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrDebugTrackingLosses.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrDebugTrackingLosses_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrDebugTrackingLosses_cppflags) $(PrDebugTrackingLosses_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrDebugTrackingLosses.o -MT $(bin)$(binobj)PrDebugTrackingLosses.d -MF $(bin)$(binobj)PrDebugTrackingLosses.d -o $(bin)$(binobj)PrDebugTrackingLosses.o $(src)PrDebugTrackingLosses.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrCheatedVP.d
endif
endif


$(bin)$(binobj)PrCheatedVP.o $(bin)$(binobj)PrCheatedVP.d : $(src)PrCheatedVP.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrCheatedVP.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrCheatedVP_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrCheatedVP_cppflags) $(PrCheatedVP_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrCheatedVP.o -MT $(bin)$(binobj)PrCheatedVP.d -MF $(bin)$(binobj)PrCheatedVP.d -o $(bin)$(binobj)PrCheatedVP.o $(src)PrCheatedVP.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrFitPolinomial.d
endif
endif


$(bin)$(binobj)PrFitPolinomial.o $(bin)$(binobj)PrFitPolinomial.d : $(src)PrFitPolinomial.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrFitPolinomial.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrFitPolinomial_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrFitPolinomial_cppflags) $(PrFitPolinomial_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrFitPolinomial.o -MT $(bin)$(binobj)PrFitPolinomial.d -MF $(bin)$(binobj)PrFitPolinomial.d -o $(bin)$(binobj)PrFitPolinomial.o $(src)PrFitPolinomial.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrCounter.d
endif
endif


$(bin)$(binobj)PrCounter.o $(bin)$(binobj)PrCounter.d : $(src)PrCounter.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrCounter.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrCounter_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrCounter_cppflags) $(PrCounter_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrCounter.o -MT $(bin)$(binobj)PrCounter.d -MF $(bin)$(binobj)PrCounter.d -o $(bin)$(binobj)PrCounter.o $(src)PrCounter.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrPixelDebugTool.d
endif
endif


$(bin)$(binobj)PrPixelDebugTool.o $(bin)$(binobj)PrPixelDebugTool.d : $(src)PrPixelDebugTool.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrPixelDebugTool.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrPixelDebugTool_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrPixelDebugTool_cppflags) $(PrPixelDebugTool_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrPixelDebugTool.o -MT $(bin)$(binobj)PrPixelDebugTool.d -MF $(bin)$(binobj)PrPixelDebugTool.d -o $(bin)$(binobj)PrPixelDebugTool.o $(src)PrPixelDebugTool.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrPlotFTHits.d
endif
endif


$(bin)$(binobj)PrPlotFTHits.o $(bin)$(binobj)PrPlotFTHits.d : $(src)PrPlotFTHits.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrPlotFTHits.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrPlotFTHits_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrPlotFTHits_cppflags) $(PrPlotFTHits_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrPlotFTHits.o -MT $(bin)$(binobj)PrPlotFTHits.d -MF $(bin)$(binobj)PrPlotFTHits.d -o $(bin)$(binobj)PrPlotFTHits.o $(src)PrPlotFTHits.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrVeloUTChecker.d
endif
endif


$(bin)$(binobj)PrVeloUTChecker.o $(bin)$(binobj)PrVeloUTChecker.d : $(src)PrVeloUTChecker.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrVeloUTChecker.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrVeloUTChecker_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrVeloUTChecker_cppflags) $(PrVeloUTChecker_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrVeloUTChecker.o -MT $(bin)$(binobj)PrVeloUTChecker.d -MF $(bin)$(binobj)PrVeloUTChecker.d -o $(bin)$(binobj)PrVeloUTChecker.o $(src)PrVeloUTChecker.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrChecker.d
endif
endif


$(bin)$(binobj)PrChecker.o $(bin)$(binobj)PrChecker.d : $(src)PrChecker.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrChecker.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrChecker_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrChecker_cppflags) $(PrChecker_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrChecker.o -MT $(bin)$(binobj)PrChecker.d -MF $(bin)$(binobj)PrChecker.d -o $(bin)$(binobj)PrChecker.o $(src)PrChecker.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrTStationDebugTool.d
endif
endif


$(bin)$(binobj)PrTStationDebugTool.o $(bin)$(binobj)PrTStationDebugTool.d : $(src)PrTStationDebugTool.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrTStationDebugTool.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrTStationDebugTool_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrTStationDebugTool_cppflags) $(PrTStationDebugTool_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrTStationDebugTool.o -MT $(bin)$(binobj)PrTStationDebugTool.d -MF $(bin)$(binobj)PrTStationDebugTool.d -o $(bin)$(binobj)PrTStationDebugTool.o $(src)PrTStationDebugTool.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrLHCbID2MCParticle.d
endif
endif


$(bin)$(binobj)PrLHCbID2MCParticle.o $(bin)$(binobj)PrLHCbID2MCParticle.d : $(src)PrLHCbID2MCParticle.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrLHCbID2MCParticle.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrLHCbID2MCParticle_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrLHCbID2MCParticle_cppflags) $(PrLHCbID2MCParticle_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrLHCbID2MCParticle.o -MT $(bin)$(binobj)PrLHCbID2MCParticle.d -MF $(bin)$(binobj)PrLHCbID2MCParticle.d -o $(bin)$(binobj)PrLHCbID2MCParticle.o $(src)PrLHCbID2MCParticle.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrCheatedVelo.d
endif
endif


$(bin)$(binobj)PrCheatedVelo.o $(bin)$(binobj)PrCheatedVelo.d : $(src)PrCheatedVelo.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrCheatedVelo.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrCheatedVelo_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrCheatedVelo_cppflags) $(PrCheatedVelo_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrCheatedVelo.o -MT $(bin)$(binobj)PrCheatedVelo.d -MF $(bin)$(binobj)PrCheatedVelo.d -o $(bin)$(binobj)PrCheatedVelo.o $(src)PrCheatedVelo.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrChecker2.d
endif
endif


$(bin)$(binobj)PrChecker2.o $(bin)$(binobj)PrChecker2.d : $(src)PrChecker2.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrChecker2.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrChecker2_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrChecker2_cppflags) $(PrChecker2_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrChecker2.o -MT $(bin)$(binobj)PrChecker2.d -MF $(bin)$(binobj)PrChecker2.d -o $(bin)$(binobj)PrChecker2.o $(src)PrChecker2.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrMCToolsclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrTTCounter.d
endif
endif


$(bin)$(binobj)PrTTCounter.o $(bin)$(binobj)PrTTCounter.d : $(src)PrTTCounter.cpp  $(use_requirements) $(cmt_final_setup_PrMCTools)
	$(cpp_echo) $(src)PrTTCounter.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrMCTools_pp_cppflags) $(app_PrMCTools_pp_cppflags) $(PrTTCounter_pp_cppflags) $(use_cppflags) $(PrMCTools_cppflags) $(lib_PrMCTools_cppflags) $(app_PrMCTools_cppflags) $(PrTTCounter_cppflags) $(PrTTCounter_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrTTCounter.o -MT $(bin)$(binobj)PrTTCounter.d -MF $(bin)$(binobj)PrTTCounter.d -o $(bin)$(binobj)PrTTCounter.o $(src)PrTTCounter.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PrMCToolsclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrMCTools.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCTools.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrMCTools.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCTools.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrMCTools)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCTools.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCTools.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCTools.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrMCToolsclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PrMCTools
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PrMCTools$(library_suffix).a $(library_prefix)PrMCTools$(library_suffix).s? PrMCTools.stamp PrMCTools.shstamp
#-- end of cleanup_library ---------------
