#-- start of make_header -----------------

#====================================
#  Document FTDetComponentsList
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

cmt_FTDetComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDetComponentsList

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetComponentsList = $(FTDet_tag)_FTDetComponentsList.make
cmt_local_tagfile_FTDetComponentsList = $(bin)$(FTDet_tag)_FTDetComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetComponentsList = $(FTDet_tag).make
cmt_local_tagfile_FTDetComponentsList = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDetComponentsList)
#-include $(cmt_local_tagfile_FTDetComponentsList)

ifdef cmt_FTDetComponentsList_has_target_tag

cmt_final_setup_FTDetComponentsList = $(bin)setup_FTDetComponentsList.make
#cmt_final_setup_FTDetComponentsList = $(bin)FTDet_FTDetComponentsListsetup.make
cmt_local_FTDetComponentsList_makefile = $(bin)FTDetComponentsList.make

else

cmt_final_setup_FTDetComponentsList = $(bin)setup.make
#cmt_final_setup_FTDetComponentsList = $(bin)FTDetsetup.make
cmt_local_FTDetComponentsList_makefile = $(bin)FTDetComponentsList.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDetComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDetComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDetComponentsList/
#FTDetComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = FTDet.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libFTDet.$(shlibsuffix)

FTDetComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: FTDetComponentsListinstall
FTDetComponentsListinstall :: FTDetComponentsList

uninstall :: FTDetComponentsListuninstall
FTDetComponentsListuninstall :: FTDetComponentsListclean

FTDetComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: FTDetComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDetComponentsList.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetComponentsList.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDetComponentsList.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetComponentsList.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDetComponentsList)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetComponentsList.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetComponentsList.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetComponentsList.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetComponentsListclean ::
#-- end of cleanup_header ---------------
