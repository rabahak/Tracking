#-- start of make_header -----------------

#====================================
#  Document PrMCToolsMergeComponentsList
#
#   Generated Wed May 11 14:30:46 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrMCToolsMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrMCToolsMergeComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrMCToolsMergeComponentsList

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCToolsMergeComponentsList = $(PrMCTools_tag)_PrMCToolsMergeComponentsList.make
cmt_local_tagfile_PrMCToolsMergeComponentsList = $(bin)$(PrMCTools_tag)_PrMCToolsMergeComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrMCTools_tag = $(tag)

#cmt_local_tagfile_PrMCToolsMergeComponentsList = $(PrMCTools_tag).make
cmt_local_tagfile_PrMCToolsMergeComponentsList = $(bin)$(PrMCTools_tag).make

endif

include $(cmt_local_tagfile_PrMCToolsMergeComponentsList)
#-include $(cmt_local_tagfile_PrMCToolsMergeComponentsList)

ifdef cmt_PrMCToolsMergeComponentsList_has_target_tag

cmt_final_setup_PrMCToolsMergeComponentsList = $(bin)setup_PrMCToolsMergeComponentsList.make
#cmt_final_setup_PrMCToolsMergeComponentsList = $(bin)PrMCTools_PrMCToolsMergeComponentsListsetup.make
cmt_local_PrMCToolsMergeComponentsList_makefile = $(bin)PrMCToolsMergeComponentsList.make

else

cmt_final_setup_PrMCToolsMergeComponentsList = $(bin)setup.make
#cmt_final_setup_PrMCToolsMergeComponentsList = $(bin)PrMCToolssetup.make
cmt_local_PrMCToolsMergeComponentsList_makefile = $(bin)PrMCToolsMergeComponentsList.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrMCToolssetup.make

#PrMCToolsMergeComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrMCToolsMergeComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrMCToolsMergeComponentsList/
#PrMCToolsMergeComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_componentslist_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.components file into a single
# <project>.components file in the (lib) install area
# If no InstallArea is present the fragment is dummy


.PHONY: PrMCToolsMergeComponentsList PrMCToolsMergeComponentsListclean

# default is already '#'
#genmap_comment_char := "'#'"

componentsListRef    := ../$(tag)/PrMCTools.components

ifdef CMTINSTALLAREA
componentsListDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedComponentsList := $(componentsListDir)/$(project).components
stampComponentsList  := $(componentsListRef).stamp
else
componentsListDir    := ../$(tag)
mergedComponentsList :=
stampComponentsList  :=
endif

PrMCToolsMergeComponentsList :: $(stampComponentsList) $(mergedComponentsList)
	@:

.NOTPARALLEL : $(stampComponentsList) $(mergedComponentsList)

$(stampComponentsList) $(mergedComponentsList) :: $(componentsListRef)
	@echo "Running merge_componentslist  PrMCToolsMergeComponentsList"
	$(merge_componentslist_cmd) --do-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList)

PrMCToolsMergeComponentsListclean ::
	$(cleanup_silent) $(merge_componentslist_cmd) --un-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList) ;
	$(cleanup_silent) $(remove_command) $(stampComponentsList)
libPrMCTools_so_dependencies = ../x86_64-slc6-gcc48-opt/libPrMCTools.so
#-- start of cleanup_header --------------

clean :: PrMCToolsMergeComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrMCToolsMergeComponentsList.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsMergeComponentsList.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrMCToolsMergeComponentsList.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsMergeComponentsList.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrMCToolsMergeComponentsList)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsMergeComponentsList.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsMergeComponentsList.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrMCToolsMergeComponentsList.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrMCToolsMergeComponentsListclean ::
#-- end of cleanup_header ---------------
