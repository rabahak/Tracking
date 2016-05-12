#-- start of make_header -----------------

#====================================
#  Document FTDetConfDbMerge
#
#   Generated Wed May 11 14:30:37 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_FTDetConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDetConfDbMerge

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetConfDbMerge = $(FTDet_tag)_FTDetConfDbMerge.make
cmt_local_tagfile_FTDetConfDbMerge = $(bin)$(FTDet_tag)_FTDetConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetConfDbMerge = $(FTDet_tag).make
cmt_local_tagfile_FTDetConfDbMerge = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDetConfDbMerge)
#-include $(cmt_local_tagfile_FTDetConfDbMerge)

ifdef cmt_FTDetConfDbMerge_has_target_tag

cmt_final_setup_FTDetConfDbMerge = $(bin)setup_FTDetConfDbMerge.make
#cmt_final_setup_FTDetConfDbMerge = $(bin)FTDet_FTDetConfDbMergesetup.make
cmt_local_FTDetConfDbMerge_makefile = $(bin)FTDetConfDbMerge.make

else

cmt_final_setup_FTDetConfDbMerge = $(bin)setup.make
#cmt_final_setup_FTDetConfDbMerge = $(bin)FTDetsetup.make
cmt_local_FTDetConfDbMerge_makefile = $(bin)FTDetConfDbMerge.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDetConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDetConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDetConfDbMerge/
#FTDetConfDbMerge::
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

.PHONY: FTDetConfDbMerge FTDetConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Det/FTDet/x86_64-slc6-gcc48-opt/genConf/FTDet/FTDet.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

FTDetConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  FTDetConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

FTDetConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libFTDet_so_dependencies = ../x86_64-slc6-gcc48-opt/libFTDet.so
#-- start of cleanup_header --------------

clean :: FTDetConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDetConfDbMerge.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetConfDbMerge.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDetConfDbMerge.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetConfDbMerge.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDetConfDbMerge)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConfDbMerge.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConfDbMerge.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetConfDbMerge.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetConfDbMergeclean ::
#-- end of cleanup_header ---------------
