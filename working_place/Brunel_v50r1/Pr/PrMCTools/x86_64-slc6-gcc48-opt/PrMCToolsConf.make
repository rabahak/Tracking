#-- start of make_header -----------------

#====================================
#  Document PrMCToolsConf
#
#   Generated Wed May 11 14:30:45 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrMCToolsConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrMCToolsConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrMCToolsConf

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCToolsConf = $(PrMCTools_tag)_PrMCToolsConf.make
cmt_local_tagfile_PrMCToolsConf = $(bin)$(PrMCTools_tag)_PrMCToolsConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCToolsConf = $(PrMCTools_tag).make
cmt_local_tagfile_PrMCToolsConf = $(bin)$(PrMCTools_tag).make

endif

include $(cmt_local_tagfile_PrMCToolsConf)
#-include $(cmt_local_tagfile_PrMCToolsConf)

ifdef cmt_PrMCToolsConf_has_target_tag

cmt_final_setup_PrMCToolsConf = $(bin)setup_PrMCToolsConf.make
#cmt_final_setup_PrMCToolsConf = $(bin)PrMCTools_PrMCToolsConfsetup.make
cmt_local_PrMCToolsConf_makefile = $(bin)PrMCToolsConf.make

else

cmt_final_setup_PrMCToolsConf = $(bin)setup.make
#cmt_final_setup_PrMCToolsConf = $(bin)PrMCToolssetup.make
cmt_local_PrMCToolsConf_makefile = $(bin)PrMCToolsConf.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrMCToolssetup.make

#PrMCToolsConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrMCToolsConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrMCToolsConf/
#PrMCToolsConf::
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

.PHONY: PrMCToolsConf PrMCToolsConfclean

confpy  := PrMCToolsConf.py
conflib := $(bin)$(library_prefix)PrMCTools.$(shlibsuffix)
confdb  := PrMCTools.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

PrMCToolsConf :: PrMCToolsConfinstall

install :: PrMCToolsConfinstall

PrMCToolsConfinstall : /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools/$(confpy)
	@echo "Installing /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools in /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python ; \

/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools/$(confpy) : $(conflib) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools
	$(genconf_silent) $(genconfig_cmd)   -o /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)PrMCTools.$(shlibsuffix)

/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools:
	@ if [ ! -d /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools ] ; then mkdir -p /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools ; fi ;

PrMCToolsConfclean :: PrMCToolsConfuninstall
	$(cleanup_silent) $(remove_command) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools/$(confpy) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrMCTools/x86_64-slc6-gcc48-opt/genConf/PrMCTools/$(confdb)

uninstall :: PrMCToolsConfuninstall

PrMCToolsConfuninstall ::
	@$(uninstall_command) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/InstallArea/x86_64-slc6-gcc48-opt/python
libPrMCTools_so_dependencies = ../x86_64-slc6-gcc48-opt/libPrMCTools.so
#-- start of cleanup_header --------------

clean :: PrMCToolsConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrMCToolsConf.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsConf.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrMCToolsConf.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsConf.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrMCToolsConf)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsConf.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsConf.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsConf.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrMCToolsConfclean ::
#-- end of cleanup_header ---------------