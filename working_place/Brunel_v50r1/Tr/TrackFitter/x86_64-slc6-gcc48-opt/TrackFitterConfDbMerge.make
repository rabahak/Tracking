#-- start of make_header -----------------

#====================================
#  Document TrackFitterConfDbMerge
#
#   Generated Wed May 11 14:31:14 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterConfDbMerge

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConfDbMerge = $(TrackFitter_tag)_TrackFitterConfDbMerge.make
cmt_local_tagfile_TrackFitterConfDbMerge = $(bin)$(TrackFitter_tag)_TrackFitterConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConfDbMerge = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConfDbMerge = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterConfDbMerge)
#-include $(cmt_local_tagfile_TrackFitterConfDbMerge)

ifdef cmt_TrackFitterConfDbMerge_has_target_tag

cmt_final_setup_TrackFitterConfDbMerge = $(bin)setup_TrackFitterConfDbMerge.make
#cmt_final_setup_TrackFitterConfDbMerge = $(bin)TrackFitter_TrackFitterConfDbMergesetup.make
cmt_local_TrackFitterConfDbMerge_makefile = $(bin)TrackFitterConfDbMerge.make

else

cmt_final_setup_TrackFitterConfDbMerge = $(bin)setup.make
#cmt_final_setup_TrackFitterConfDbMerge = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConfDbMerge_makefile = $(bin)TrackFitterConfDbMerge.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterConfDbMerge/
#TrackFitterConfDbMerge::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# File: cmt/fragments/merge_genconfDb_header
# Author: Sebastien Binet (binet@cern.ch)

# Makefile fragment to merge a <library>.confdb file into a single
# <project>.confdb file in the (lib) install area

.PHONY: TrackFitterConfDbMerge TrackFitterConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/TrackFitter.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

TrackFitterConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  TrackFitterConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

TrackFitterConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libTrackFitter_so_dependencies = ../x86_64-slc6-gcc48-opt/libTrackFitter.so
#-- start of cleanup_header --------------

clean :: TrackFitterConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterConfDbMerge.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfDbMerge.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterConfDbMerge.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfDbMerge.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterConfDbMerge)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfDbMerge.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfDbMerge.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfDbMerge.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterConfDbMergeclean ::
#-- end of cleanup_header ---------------
