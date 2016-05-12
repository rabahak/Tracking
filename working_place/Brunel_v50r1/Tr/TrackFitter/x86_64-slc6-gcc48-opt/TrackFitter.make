#-- start of make_header -----------------

#====================================
#  Library TrackFitter
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

cmt_TrackFitter_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitter_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitter

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitter = $(TrackFitter_tag)_TrackFitter.make
cmt_local_tagfile_TrackFitter = $(bin)$(TrackFitter_tag)_TrackFitter.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitter = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitter = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitter)
#-include $(cmt_local_tagfile_TrackFitter)

ifdef cmt_TrackFitter_has_target_tag

cmt_final_setup_TrackFitter = $(bin)setup_TrackFitter.make
#cmt_final_setup_TrackFitter = $(bin)TrackFitter_TrackFittersetup.make
cmt_local_TrackFitter_makefile = $(bin)TrackFitter.make

else

cmt_final_setup_TrackFitter = $(bin)setup.make
#cmt_final_setup_TrackFitter = $(bin)TrackFittersetup.make
cmt_local_TrackFitter_makefile = $(bin)TrackFitter.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitter :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitter'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitter/
#TrackFitter::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

TrackFitterlibname   = $(bin)$(library_prefix)TrackFitter$(library_suffix)
TrackFitterlib       = $(TrackFitterlibname).a
TrackFitterstamp     = $(bin)TrackFitter.stamp
TrackFittershstamp   = $(bin)TrackFitter.shstamp

TrackFitter :: dirs  TrackFitterLIB
	$(echo) "TrackFitter ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

TrackFitterLIB :: $(TrackFitterlib) $(TrackFittershstamp)
	$(echo) "TrackFitter : library ok"

$(TrackFitterlib) :: $(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(TrackFitterlib) $(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o
	$(lib_silent) $(ranlib) $(TrackFitterlib)
	$(lib_silent) cat /dev/null >$(TrackFitterstamp)

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

$(TrackFitterlibname).$(shlibsuffix) :: $(TrackFitterlib) requirements $(use_requirements) $(TrackFitterstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" TrackFitter $(TrackFitter_shlibflags)

$(TrackFittershstamp) :: $(TrackFitterlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(TrackFitterlibname).$(shlibsuffix) ; then cat /dev/null >$(TrackFittershstamp) ; fi

TrackFitterclean ::
	$(cleanup_echo) objects TrackFitter
	$(cleanup_silent) /bin/rm -f $(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o) $(patsubst %.o,%.dep,$(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o) $(patsubst %.o,%.d.stamp,$(bin)TrackEventFitter.o $(bin)TrackKalmanFilter.o $(bin)TrackMasterFitter.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf TrackFitter_deps TrackFitter_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
TrackFitterinstallname = $(library_prefix)TrackFitter$(library_suffix).$(shlibsuffix)

TrackFitter :: TrackFitterinstall

install :: TrackFitterinstall

TrackFitterinstall :: $(install_dir)/$(TrackFitterinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(TrackFitterinstallname) :: $(bin)$(TrackFitterinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrackFitterinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##TrackFitterclean :: TrackFitteruninstall

uninstall :: TrackFitteruninstall

TrackFitteruninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(TrackFitterinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),TrackFitterclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)TrackFitter_dependencies.make :: dirs

ifndef QUICK
$(bin)TrackFitter_dependencies.make : $(src)TrackEventFitter.cpp $(src)TrackKalmanFilter.cpp $(src)TrackMasterFitter.cpp $(use_requirements) $(cmt_final_setup_TrackFitter)
	$(echo) "(TrackFitter.make) Rebuilding $@"; \
	  $(build_dependencies) TrackFitter -all_sources -out=$@ $(src)TrackEventFitter.cpp $(src)TrackKalmanFilter.cpp $(src)TrackMasterFitter.cpp
endif

#$(TrackFitter_dependencies)

-include $(bin)TrackFitter_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),TrackFitterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrackEventFitter.d
endif
endif


$(bin)$(binobj)TrackEventFitter.o $(bin)$(binobj)TrackEventFitter.d : $(src)TrackEventFitter.cpp  $(use_requirements) $(cmt_final_setup_TrackFitter)
	$(cpp_echo) $(src)TrackEventFitter.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(TrackFitter_pp_cppflags) $(app_TrackFitter_pp_cppflags) $(TrackEventFitter_pp_cppflags) $(use_cppflags) $(TrackFitter_cppflags) $(lib_TrackFitter_cppflags) $(app_TrackFitter_cppflags) $(TrackEventFitter_cppflags) $(TrackEventFitter_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)TrackEventFitter.o -MT $(bin)$(binobj)TrackEventFitter.d -MF $(bin)$(binobj)TrackEventFitter.d -o $(bin)$(binobj)TrackEventFitter.o $(src)TrackEventFitter.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),TrackFitterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrackKalmanFilter.d
endif
endif


$(bin)$(binobj)TrackKalmanFilter.o $(bin)$(binobj)TrackKalmanFilter.d : $(src)TrackKalmanFilter.cpp  $(use_requirements) $(cmt_final_setup_TrackFitter)
	$(cpp_echo) $(src)TrackKalmanFilter.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(TrackFitter_pp_cppflags) $(app_TrackFitter_pp_cppflags) $(TrackKalmanFilter_pp_cppflags) $(use_cppflags) $(TrackFitter_cppflags) $(lib_TrackFitter_cppflags) $(app_TrackFitter_cppflags) $(TrackKalmanFilter_cppflags) $(TrackKalmanFilter_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)TrackKalmanFilter.o -MT $(bin)$(binobj)TrackKalmanFilter.d -MF $(bin)$(binobj)TrackKalmanFilter.d -o $(bin)$(binobj)TrackKalmanFilter.o $(src)TrackKalmanFilter.cpp


#-- end of cpp_library ------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),TrackFitterclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)TrackMasterFitter.d
endif
endif


$(bin)$(binobj)TrackMasterFitter.o $(bin)$(binobj)TrackMasterFitter.d : $(src)TrackMasterFitter.cpp  $(use_requirements) $(cmt_final_setup_TrackFitter)
	$(cpp_echo) $(src)TrackMasterFitter.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(TrackFitter_pp_cppflags) $(app_TrackFitter_pp_cppflags) $(TrackMasterFitter_pp_cppflags) $(use_cppflags) $(TrackFitter_cppflags) $(lib_TrackFitter_cppflags) $(app_TrackFitter_cppflags) $(TrackMasterFitter_cppflags) $(TrackMasterFitter_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)TrackMasterFitter.o -MT $(bin)$(binobj)TrackMasterFitter.d -MF $(bin)$(binobj)TrackMasterFitter.d -o $(bin)$(binobj)TrackMasterFitter.o $(src)TrackMasterFitter.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: TrackFitterclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitter.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitter.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitter.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitter.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitter)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitter.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitter.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitter.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library TrackFitter
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)TrackFitter$(library_suffix).a $(library_prefix)TrackFitter$(library_suffix).s? TrackFitter.stamp TrackFitter.shstamp
#-- end of cleanup_library ---------------
