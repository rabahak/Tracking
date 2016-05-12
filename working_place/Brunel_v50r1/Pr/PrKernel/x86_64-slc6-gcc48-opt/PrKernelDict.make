#-- start of make_header -----------------

#====================================
#  Library PrKernelDict
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

cmt_PrKernelDict_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernelDict_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrKernelDict

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernelDict = $(PrKernel_tag)_PrKernelDict.make
cmt_local_tagfile_PrKernelDict = $(bin)$(PrKernel_tag)_PrKernelDict.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernelDict = $(PrKernel_tag).make
cmt_local_tagfile_PrKernelDict = $(bin)$(PrKernel_tag).make

endif

include $(cmt_local_tagfile_PrKernelDict)
#-include $(cmt_local_tagfile_PrKernelDict)

ifdef cmt_PrKernelDict_has_target_tag

cmt_final_setup_PrKernelDict = $(bin)setup_PrKernelDict.make
#cmt_final_setup_PrKernelDict = $(bin)PrKernel_PrKernelDictsetup.make
cmt_local_PrKernelDict_makefile = $(bin)PrKernelDict.make

else

cmt_final_setup_PrKernelDict = $(bin)setup.make
#cmt_final_setup_PrKernelDict = $(bin)PrKernelsetup.make
cmt_local_PrKernelDict_makefile = $(bin)PrKernelDict.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrKernelsetup.make

#PrKernelDict :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrKernelDict'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrKernelDict/
#PrKernelDict::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of libary_header ---------------

PrKernelDictlibname   = $(bin)$(library_prefix)PrKernelDict$(library_suffix)
PrKernelDictlib       = $(PrKernelDictlibname).a
PrKernelDictstamp     = $(bin)PrKernelDict.stamp
PrKernelDictshstamp   = $(bin)PrKernelDict.shstamp

PrKernelDict :: dirs  PrKernelDictLIB
	$(echo) "PrKernelDict ok"

#-- end of libary_header ----------------
#-- start of libary ----------------------

PrKernelDictLIB :: $(PrKernelDictlib) $(PrKernelDictshstamp)
	$(echo) "PrKernelDict : library ok"

$(PrKernelDictlib) :: $(bin)PrKernelDict.o
	$(lib_echo) "static library $@"
	$(lib_silent) [ ! -f $@ ] || \rm -f $@
	$(lib_silent) $(ar) $(PrKernelDictlib) $(bin)PrKernelDict.o
	$(lib_silent) $(ranlib) $(PrKernelDictlib)
	$(lib_silent) cat /dev/null >$(PrKernelDictstamp)

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

$(PrKernelDictlibname).$(shlibsuffix) :: $(PrKernelDictlib) requirements $(use_requirements) $(PrKernelDictstamps)
	$(lib_echo) "shared library $@"
	$(lib_silent) if test "$(makecmd)"; then QUIET=; else QUIET=1; fi; QUIET=$${QUIET} bin=$(bin) $(make_shlib) "$(tags)" PrKernelDict $(PrKernelDict_shlibflags)

$(PrKernelDictshstamp) :: $(PrKernelDictlibname).$(shlibsuffix)
	$(lib_silent) if test -f $(PrKernelDictlibname).$(shlibsuffix) ; then cat /dev/null >$(PrKernelDictshstamp) ; fi

PrKernelDictclean ::
	$(cleanup_echo) objects PrKernelDict
	$(cleanup_silent) /bin/rm -f $(bin)PrKernelDict.o
	$(cleanup_silent) /bin/rm -f $(patsubst %.o,%.d,$(bin)PrKernelDict.o) $(patsubst %.o,%.dep,$(bin)PrKernelDict.o) $(patsubst %.o,%.d.stamp,$(bin)PrKernelDict.o)
	$(cleanup_silent) cd $(bin); /bin/rm -rf PrKernelDict_deps PrKernelDict_dependencies.make

#-----------------------------------------------------------------
#
#  New section for automatic installation
#
#-----------------------------------------------------------------

install_dir = ${CMTINSTALLAREA}/$(tag)/lib
PrKernelDictinstallname = $(library_prefix)PrKernelDict$(library_suffix).$(shlibsuffix)

PrKernelDict :: PrKernelDictinstall

install :: PrKernelDictinstall

PrKernelDictinstall :: $(install_dir)/$(PrKernelDictinstallname)
ifdef CMTINSTALLAREA
	$(echo) "installation done"
endif

$(install_dir)/$(PrKernelDictinstallname) :: $(bin)$(PrKernelDictinstallname)
ifdef CMTINSTALLAREA
	$(install_silent) $(cmt_install_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrKernelDictinstallname)" \
	    -out "$(install_dir)" \
	    -cmd "$(cmt_installarea_command)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

##PrKernelDictclean :: PrKernelDictuninstall

uninstall :: PrKernelDictuninstall

PrKernelDictuninstall ::
ifdef CMTINSTALLAREA
	$(cleanup_silent) $(cmt_uninstall_action) \
	    -source "`(cd $(bin); pwd)`" \
	    -name "$(PrKernelDictinstallname)" \
	    -out "$(install_dir)" \
	    -cmtpath "$($(package)_cmtpath)"
endif

#-- end of libary -----------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),PrKernelDictclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)PrKernelDict_dependencies.make :: dirs

ifndef QUICK
$(bin)PrKernelDict_dependencies.make : ../x86_64-slc6-gcc48-opt/dict/PrKernel/PrKernelDict.cpp $(use_requirements) $(cmt_final_setup_PrKernelDict)
	$(echo) "(PrKernelDict.make) Rebuilding $@"; \
	  $(build_dependencies) PrKernelDict -all_sources -out=$@ ../x86_64-slc6-gcc48-opt/dict/PrKernel/PrKernelDict.cpp
endif

#$(PrKernelDict_dependencies)

-include $(bin)PrKernelDict_dependencies.make

endif
endif
#-- end of dependency -------------------
#-- start of cpp_library -----------------

ifneq ($(MAKECMDGOALS),PrKernelDictclean)
ifneq ($(MAKECMDGOALS),uninstall)
-include $(bin)$(binobj)PrKernelDict.d
endif
endif


$(bin)$(binobj)PrKernelDict.o $(bin)$(binobj)PrKernelDict.d : ../x86_64-slc6-gcc48-opt/dict/PrKernel/PrKernelDict.cpp  $(use_requirements) $(cmt_final_setup_PrKernelDict)
	$(cpp_echo) ../x86_64-slc6-gcc48-opt/dict/PrKernel/PrKernelDict.cpp
	@mkdir -p $(@D)
	$(cpp_silent) $(cppcomp) $(use_pp_cppflags) $(PrKernelDict_pp_cppflags) $(app_PrKernelDict_pp_cppflags) $(PrKernelDict_pp_cppflags) $(use_cppflags) $(PrKernelDict_cppflags) $(lib_PrKernelDict_cppflags) $(app_PrKernelDict_cppflags) $(PrKernelDict_cppflags) $(PrKernelDict_cpp_cppflags) -I../x86_64-slc6-gcc48-opt/dict/PrKernel -MP -MMD -MT $(bin)$(binobj)PrKernelDict.o -MT $(bin)$(binobj)PrKernelDict.d -MF $(bin)$(binobj)PrKernelDict.d -o $(bin)$(binobj)PrKernelDict.o ../x86_64-slc6-gcc48-opt/dict/PrKernel/PrKernelDict.cpp


#-- end of cpp_library ------------------
#-- start of cleanup_header --------------

clean :: PrKernelDictclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrKernelDict.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernelDict.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrKernelDict.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernelDict.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrKernelDict)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelDict.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelDict.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelDict.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrKernelDictclean ::
#-- end of cleanup_header ---------------
#-- start of cleanup_library -------------
	$(cleanup_echo) library PrKernelDict
	-$(cleanup_silent) cd $(bin); /bin/rm -f $(library_prefix)PrKernelDict$(library_suffix).a $(library_prefix)PrKernelDict$(library_suffix).s? PrKernelDict.stamp PrKernelDict.shstamp
#-- end of cleanup_library ---------------
