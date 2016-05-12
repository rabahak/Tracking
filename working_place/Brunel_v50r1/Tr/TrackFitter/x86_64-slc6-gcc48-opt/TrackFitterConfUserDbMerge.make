#-- start of make_header -----------------

#====================================
#  Document TrackFitterConfUserDbMerge
#
#   Generated Wed May 11 14:31:09 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterConfUserDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConfUserDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterConfUserDbMerge

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConfUserDbMerge = $(TrackFitter_tag)_TrackFitterConfUserDbMerge.make
cmt_local_tagfile_TrackFitterConfUserDbMerge = $(bin)$(TrackFitter_tag)_TrackFitterConfUserDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterConfUserDbMerge = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConfUserDbMerge = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterConfUserDbMerge)
#-include $(cmt_local_tagfile_TrackFitterConfUserDbMerge)

ifdef cmt_TrackFitterConfUserDbMerge_has_target_tag

cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)setup_TrackFitterConfUserDbMerge.make
#cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)TrackFitter_TrackFitterConfUserDbMergesetup.make
cmt_local_TrackFitterConfUserDbMerge_makefile = $(bin)TrackFitterConfUserDbMerge.make

else

cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)setup.make
#cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConfUserDbMerge_makefile = $(bin)TrackFitterConfUserDbMerge.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterConfUserDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterConfUserDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterConfUserDbMerge/
#TrackFitterConfUserDbMerge::
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

.PHONY: TrackFitterConfUserDbMerge TrackFitterConfUserDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Tr/TrackFitter/x86_64-slc6-gcc48-opt/genConf/TrackFitter/TrackFitter_user.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

TrackFitterConfUserDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  TrackFitterConfUserDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

TrackFitterConfUserDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
#-- start of cleanup_header --------------

clean :: TrackFitterConfUserDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterConfUserDbMerge.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfUserDbMerge.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterConfUserDbMerge.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfUserDbMerge.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterConfUserDbMerge)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfUserDbMerge.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfUserDbMerge.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterConfUserDbMerge.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterConfUserDbMergeclean ::
#-- end of cleanup_header ---------------
