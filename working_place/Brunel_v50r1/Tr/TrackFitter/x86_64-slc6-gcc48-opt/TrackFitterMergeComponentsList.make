#-- start of make_header -----------------

#====================================
#  Document TrackFitterMergeComponentsList
#
#   Generated Wed May 11 14:31:13 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterMergeComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterMergeComponentsList

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterMergeComponentsList = $(TrackFitter_tag)_TrackFitterMergeComponentsList.make
cmt_local_tagfile_TrackFitterMergeComponentsList = $(bin)$(TrackFitter_tag)_TrackFitterMergeComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterMergeComponentsList = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterMergeComponentsList = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterMergeComponentsList)
#-include $(cmt_local_tagfile_TrackFitterMergeComponentsList)

ifdef cmt_TrackFitterMergeComponentsList_has_target_tag

cmt_final_setup_TrackFitterMergeComponentsList = $(bin)setup_TrackFitterMergeComponentsList.make
#cmt_final_setup_TrackFitterMergeComponentsList = $(bin)TrackFitter_TrackFitterMergeComponentsListsetup.make
cmt_local_TrackFitterMergeComponentsList_makefile = $(bin)TrackFitterMergeComponentsList.make

else

cmt_final_setup_TrackFitterMergeComponentsList = $(bin)setup.make
#cmt_final_setup_TrackFitterMergeComponentsList = $(bin)TrackFittersetup.make
cmt_local_TrackFitterMergeComponentsList_makefile = $(bin)TrackFitterMergeComponentsList.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterMergeComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterMergeComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterMergeComponentsList/
#TrackFitterMergeComponentsList::
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


.PHONY: TrackFitterMergeComponentsList TrackFitterMergeComponentsListclean

# default is already '#'
#genmap_comment_char := "'#'"

componentsListRef    := ../$(tag)/TrackFitter.components

ifdef CMTINSTALLAREA
componentsListDir    := ${CMTINSTALLAREA}/$(tag)/lib
mergedComponentsList := $(componentsListDir)/$(project).components
stampComponentsList  := $(componentsListRef).stamp
else
componentsListDir    := ../$(tag)
mergedComponentsList :=
stampComponentsList  :=
endif

TrackFitterMergeComponentsList :: $(stampComponentsList) $(mergedComponentsList)
	@:

.NOTPARALLEL : $(stampComponentsList) $(mergedComponentsList)

$(stampComponentsList) $(mergedComponentsList) :: $(componentsListRef)
	@echo "Running merge_componentslist  TrackFitterMergeComponentsList"
	$(merge_componentslist_cmd) --do-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList)

TrackFitterMergeComponentsListclean ::
	$(cleanup_silent) $(merge_componentslist_cmd) --un-merge \
         --input-file $(componentsListRef) --merged-file $(mergedComponentsList) ;
	$(cleanup_silent) $(remove_command) $(stampComponentsList)
libTrackFitter_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrackFitter.so
#-- start of cleanup_header --------------

clean :: TrackFitterMergeComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterMergeComponentsList.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterMergeComponentsList.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterMergeComponentsList.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterMergeComponentsList.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterMergeComponentsList)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterMergeComponentsList.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterMergeComponentsList.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterMergeComponentsList.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterMergeComponentsListclean ::
#-- end of cleanup_header ---------------
