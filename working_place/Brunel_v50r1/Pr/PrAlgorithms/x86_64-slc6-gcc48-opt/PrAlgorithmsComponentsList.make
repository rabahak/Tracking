#-- start of make_header -----------------

#====================================
#  Document PrAlgorithmsComponentsList
#
#   Generated Wed May 11 14:30:55 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrAlgorithmsComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrAlgorithmsComponentsList

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithmsComponentsList = $(PrAlgorithms_tag)_PrAlgorithmsComponentsList.make
cmt_local_tagfile_PrAlgorithmsComponentsList = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile_PrAlgorithmsComponentsList = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsComponentsList = $(bin)$(PrAlgorithms_tag).make

endif

include $(cmt_local_tagfile_PrAlgorithmsComponentsList)
#-include $(cmt_local_tagfile_PrAlgorithmsComponentsList)

ifdef cmt_PrAlgorithmsComponentsList_has_target_tag

cmt_final_setup_PrAlgorithmsComponentsList = $(bin)setup_PrAlgorithmsComponentsList.make
#cmt_final_setup_PrAlgorithmsComponentsList = $(bin)PrAlgorithms_PrAlgorithmsComponentsListsetup.make
cmt_local_PrAlgorithmsComponentsList_makefile = $(bin)PrAlgorithmsComponentsList.make

else

cmt_final_setup_PrAlgorithmsComponentsList = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsComponentsList = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsComponentsList_makefile = $(bin)PrAlgorithmsComponentsList.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrAlgorithmssetup.make

#PrAlgorithmsComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrAlgorithmsComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrAlgorithmsComponentsList/
#PrAlgorithmsComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = PrAlgorithms.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libPrAlgorithms.$(shlibsuffix)

PrAlgorithmsComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: PrAlgorithmsComponentsListinstall
PrAlgorithmsComponentsListinstall :: PrAlgorithmsComponentsList

uninstall :: PrAlgorithmsComponentsListuninstall
PrAlgorithmsComponentsListuninstall :: PrAlgorithmsComponentsListclean

PrAlgorithmsComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: PrAlgorithmsComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrAlgorithmsComponentsList.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsComponentsList.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrAlgorithmsComponentsList.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsComponentsList.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrAlgorithmsComponentsList)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsComponentsList.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsComponentsList.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrAlgorithmsComponentsList.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrAlgorithmsComponentsListclean ::
#-- end of cleanup_header ---------------
