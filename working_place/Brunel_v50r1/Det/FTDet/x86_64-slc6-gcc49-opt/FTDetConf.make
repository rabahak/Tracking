#-- start of make_header -----------------

#====================================
#  Document FTDetConf
#
#   Generated Fri Apr 22 11:33:33 2016  by rquaglia
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_FTDetConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetConf_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDetConf

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetConf = $(FTDet_tag)_FTDetConf.make
cmt_local_tagfile_FTDetConf = $(bin)$(FTDet_tag)_FTDetConf.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetConf = $(FTDet_tag).make
cmt_local_tagfile_FTDetConf = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDetConf)
#-include $(cmt_local_tagfile_FTDetConf)

ifdef cmt_FTDetConf_has_target_tag

cmt_final_setup_FTDetConf = $(bin)setup_FTDetConf.make
#cmt_final_setup_FTDetConf = $(bin)FTDet_FTDetConfsetup.make
cmt_local_FTDetConf_makefile = $(bin)FTDetConf.make

else

cmt_final_setup_FTDetConf = $(bin)setup.make
#cmt_final_setup_FTDetConf = $(bin)FTDetsetup.make
cmt_local_FTDetConf_makefile = $(bin)FTDetConf.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDetConf :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDetConf'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDetConf/
#FTDetConf::
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

.PHONY: FTDetConf FTDetConfclean

confpy  := FTDetConf.py
conflib := $(bin)$(library_prefix)FTDet.$(shlibsuffix)
confdb  := FTDet.confdb
instdir := $(CMTINSTALLAREA)$(shared_install_subdir)/python/$(package)
product := $(instdir)/$(confpy)
initpy  := $(instdir)/__init__.py

ifdef GENCONF_ECHO
genconf_silent =
else
genconf_silent = $(silent)
endif

FTDetConf :: FTDetConfinstall

install :: FTDetConfinstall

FTDetConfinstall : /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet/$(confpy)
	@echo "Installing /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet in /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/InstallArea/x86_64-slc6-gcc49-opt/python" ; \
	 $(install_command) --exclude="*.py?" --exclude="__init__.py" --exclude="*.confdb" /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/InstallArea/x86_64-slc6-gcc49-opt/python ; \

/afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet/$(confpy) : $(conflib) /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet
	$(genconf_silent) $(genconfig_cmd)   -o /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet -p $(package) \
	  --configurable-module=GaudiKernel.Proxy \
	  --configurable-default-name=Configurable.DefaultName \
	  --configurable-algorithm=ConfigurableAlgorithm \
	  --configurable-algtool=ConfigurableAlgTool \
	  --configurable-auditor=ConfigurableAuditor \
          --configurable-service=ConfigurableService \
	  -i ../$(tag)/$(library_prefix)FTDet.$(shlibsuffix)

/afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet:
	@ if [ ! -d /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet ] ; then mkdir -p /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet ; fi ;

FTDetConfclean :: FTDetConfuninstall
	$(cleanup_silent) $(remove_command) /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet/$(confpy) /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/x86_64-slc6-gcc49-opt/genConf/FTDet/$(confdb)

uninstall :: FTDetConfuninstall

FTDetConfuninstall ::
	@$(uninstall_command) /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/InstallArea/x86_64-slc6-gcc49-opt/python
libFTDet_so_dependencies = ../x86_64-slc6-gcc49-opt/libFTDet.so
#-- start of cleanup_header --------------

clean :: FTDetConfclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDetConf.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetConf.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDetConf.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetConf.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDetConf)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConf.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConf.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConf.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetConfclean ::
#-- end of cleanup_header ---------------