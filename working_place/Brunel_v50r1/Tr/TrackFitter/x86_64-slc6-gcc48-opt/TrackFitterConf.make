#-- start of make_header -----------------

#====================================
#  Document TrackFitterConf
#
#   Generated Wed May 11 14:31:12 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterConf

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConf = $(TrackFitter_tag)_TrackFitterConf.make
cmt_local_tagfile_TrackFitterConf = $(bin)$(TrackFitter_tag)_TrackFitterConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConf = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConf = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterConf)
#-include $(cmt_local_tagfile_TrackFitterConf)

ifdef cmt_TrackFitterConf_has_target_tag

cmt_final_setup_TrackFitterConf = $(bin)setup_TrackFitterConf.make
#cmt_final_setup_TrackFitterConf = $(bin)TrackFitter_TrackFitterConfsetup.make
cmt_local_TrackFitterConf_makefile = $(bin)TrackFitterConf.make

else

cmt_final_setup_TrackFitterConf = $(bin)setup.make
#cmt_final_setup_TrackFitterConf = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConf_makefile = $(bin)TrackFitterConf.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterConf/
#TrackFitterConf::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/genconfig_header
# Author: Wim Lavrijsen (WLavrijsen@lbl.gov)

# Use genconf.exe to create configurables python modules, then have the
# normal python install procedure take over.

.PHONY: TrackFitterConf TrackFitterConfclean

confpy  := TrackFitterConf.py
conflib := $(bin)$(library_prefix)TrackFitter.$(shlibsuffix)
confdb  := TrackFitter.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

TrackFitterConf :: TrackFitterConfinstall

install :: TrackFitterConfinstall

TrackFitterConfinstall : /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/$(confpy)
	@echo "Installing /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter in /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python ; \

/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/$(confpy) : $(conflib) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter
	$(genconf_silent) $(genconfig_cmd)   -o /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)TrackFitter.$(shlibsuffix)

/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter:
	@ if [ ! -d /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter ] ; then mkdir -p /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter ; fi ;

TrackFitterConfclean :: TrackFitterConfuninstall
	$(cleanup_silent) $(remove_command) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/$(confpy) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/$(confdb)

uninstall :: TrackFitterConfuninstall

TrackFitterConfuninstall ::
	@$(uninstall_command) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python
libTrackFitter_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrackFitter.so
#-- start of cleanup_header --------------

clean :: TrackFitterConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterConf.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConf.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterConf.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConf.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterConf)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConf.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConf.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConf.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterConfclean ::
#-- end of cleanup_header ---------------
