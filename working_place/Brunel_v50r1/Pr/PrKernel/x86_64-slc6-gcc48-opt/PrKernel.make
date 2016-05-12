#-- start of make_header -----------------

#====================================
#  Library PrKernel
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

cmt_PrKernel_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernel_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrKernel

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernel = $(PrKernel_tag)_PrKernel.make
cmt_local_tagfile_PrKernel = $(bin)$(PrKernel_tag)_PrKernel.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernel = $(PrKernel_tag).make
cmt_local_tagfile_PrKernel = $(bin)$(PrKernel_tag).make

endif

include $(cmt_local_tagfile_PrKernel)
#-include $(cmt_local_tagfile_PrKernel)

ifdef cmt_PrKernel_has_target_tag

cmt_final_setup_PrKernel = $(bin)setup_PrKernel.make
#cmt_final_setup_PrKernel = $(bin)PrKernel_PrKernelsetup.make
cmt_local_PrKernel_makefile = $(bin)PrKernel.make

else

cmt_final_setup_PrKernel = $(bin)setup.make
#cmt_final_setup_PrKernel = $(bin)PrKernelsetup.make
cmt_local_PrKernel_makefile = $(bin)PrKernel.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrKernelsetup.make

#PrKernel :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrKernel'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrKernel/
#PrKernel::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PrKernellibname   = $(bin)$(library_prefix)PrKernel$(library_suffix)
PrKernellib       = $(PrKernellibname).a
PrKernelstamp     = $(bin)PrKernel.stamp
PrKernelshstamp   = $(bin)PrKernel.shstamp

PrKernel :: dirs  PrKernelLIB
	$(echo) "PrKernel ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

PrKernelLIB :: $(PrKernellib) $(PrKernelshstamp)
	$(echo) "PrKernel : library ok"

$(PrKernellib) :: $(bin)PrHitManager.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PrKernellib) $(bin)PrHitManager.o
	$(lib_silent) $(ranlib) $(PrKernellib)
	$(lib_silent) cat /dev/null >$(PrKernelstamp)

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

$(PrKernellibname).$(shlibsuffix) :: $(PrKernellib) requirements $(use_requirements) $(PrKernelstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" PrKernel $(PrKernel_shlibflags)

$(PrKernelshstamp) :: $(PrKernellibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PrKernellibname).$(shlibsuffix) ; then cat /dev/null >$(PrKernelshstamp) ; fi

PrKernelclean ::
	$(cleanup_echo) objects PrKernel
	$(cleanup_silent) /bin/rm -f $(bin)PrHitManager.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PrHitManager.o) $(patsubst %.o,%.dep,$(bin)PrHitManager.o) $(patsubst %.o,%.d.stamp,$(bin)PrHitManager.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PrKernel_deps PrKernel_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PrKernelinstallname = $(library_prefix)PrKernel$(library_suffix).$(shlibsuffix)

PrKernel :: PrKernelinstall

install :: PrKernelinstall

PrKernelinstall :: $(install_dir)/$(PrKernelinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PrKernelinstallname) :: $(bin)$(PrKernelinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrKernelinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PrKernelclean :: PrKerneluninstall

uninstall :: PrKerneluninstall

PrKerneluninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrKernelinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),PrKernelclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)PrKernel_dependencies.make :: dirs

ifndef QUICK
$(bin)PrKernel_dependencies.make : $(src)PrHitManager.cpp $(use_requirements) $(cmt_final_setup_PrKernel)
	$(echo) "(PrKernel.make) Rebuilding $@"; \
	  $(build_dependencies) PrKernel -all_sources -out=$@ $(src)PrHitManager.cpp
endif

#$(PrKernel_dependencies)

-include $(bin)PrKernel_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrKernelclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrHitManager.d
endif
endif


$(bin)$(binobj)PrHitManager.o $(bin)$(binobj)PrHitManager.d : $(src)PrHitManager.cpp  $(use_requirements) $(cmt_final_setup_PrKernel)
	$(cpp_echo) $(src)PrHitManager.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrKernel_pp_cppflags) $(app_PrKernel_pp_cppflags) $(PrHitManager_pp_cppflags) $(use_cppflags) $(PrKernel_cppflags) $(lib_PrKernel_cppflags) $(app_PrKernel_cppflags) $(PrHitManager_cppflags) $(PrHitManager_cpp_cppflags)  -MP -MMD -MT $(bin)$(binobj)PrHitManager.o -MT $(bin)$(binobj)PrHitManager.d -MF $(bin)$(binobj)PrHitManager.d -o $(bin)$(binobj)PrHitManager.o $(src)PrHitManager.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PrKernelclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrKernel.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernel.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrKernel.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernel.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrKernel)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernel.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernel.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernel.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrKernelclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PrKernel
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PrKernel$(library_suffix).a $(library_prefix)PrKernel$(library_suffix).s? PrKernel.stamp PrKernel.shstamp
#-- end of cleanup_library ---------------
