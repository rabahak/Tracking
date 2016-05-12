#-- start of make_header -----------------

#====================================
#  Document PrAlgorithmsConfDbMerge
#
#   Generated Wed May 11 14:30:57 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrAlgorithmsConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsConfDbMerge_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrAlgorithmsConfDbMerge

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(PrAlgorithms_tag)_PrAlgorithmsConfDbMerge.make
cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsConfDbMerge.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(bin)$(PrAlgorithms_tag).make

endif

include $(cmt_local_tagfile_PrAlgorithmsConfDbMerge)
#-include $(cmt_local_tagfile_PrAlgorithmsConfDbMerge)

ifdef cmt_PrAlgorithmsConfDbMerge_has_target_tag

cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)setup_PrAlgorithmsConfDbMerge.make
#cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)PrAlgorithms_PrAlgorithmsConfDbMergesetup.make
cmt_local_PrAlgorithmsConfDbMerge_makefile = $(bin)PrAlgorithmsConfDbMerge.make

else

cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsConfDbMerge_makefile = $(bin)PrAlgorithmsConfDbMerge.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrAlgorithmssetup.make

#PrAlgorithmsConfDbMerge :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrAlgorithmsConfDbMerge'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrAlgorithmsConfDbMerge/
#PrAlgorithmsConfDbMerge::
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

.PHONY: PrAlgorithmsConfDbMerge PrAlgorithmsConfDbMergeclean

# default is already '#'
#genconfDb_comment_char := "'#'"

instdir      := ${CMTINSTALLAREA}/$(tag)
confDbRef    := /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrAlgorithms/x86_64-slc6-gcc48-opt/genConf/PrAlgorithms/PrAlgorithms.confdb
stampConfDb  := $(confDbRef).stamp
mergedConfDb := $(instdir)/lib/$(project).confdb

PrAlgorithmsConfDbMerge :: $(stampConfDb) $(mergedConfDb)
	@:

.NOTPARALLEL : $(stampConfDb) $(mergedConfDb)

$(stampConfDb) $(mergedConfDb) :: $(confDbRef)
	@echo "Running merge_genconfDb  PrAlgorithmsConfDbMerge"
	$(merge_genconfDb_cmd) \
          --do-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)

PrAlgorithmsConfDbMergeclean ::
	$(cleanup_silent) $(merge_genconfDb_cmd) \
          --un-merge \
          --input-file $(confDbRef) \
          --merged-file $(mergedConfDb)	;
	$(cleanup_silent) $(remove_command) $(stampConfDb)
libPrAlgorithms_so_dependencies = ../x86_64-slc6-gcc48-opt/libPrAlgorithms.so
#-- start of cleanup_header --------------

clean :: PrAlgorithmsConfDbMergeclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrAlgorithmsConfDbMerge.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsConfDbMerge.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrAlgorithmsConfDbMerge.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsConfDbMerge.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrAlgorithmsConfDbMerge)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsConfDbMerge.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsConfDbMerge.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsConfDbMerge.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrAlgorithmsConfDbMergeclean ::
#-- end of cleanup_header ---------------
