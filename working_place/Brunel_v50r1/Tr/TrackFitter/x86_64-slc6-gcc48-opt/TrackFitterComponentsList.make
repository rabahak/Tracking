#-- start of make_header -----------------

#====================================
#  Document TrackFitterComponentsList
#
#   Generated Wed May 11 14:31:12 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterComponentsList_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterComponentsList

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterComponentsList = $(TrackFitter_tag)_TrackFitterComponentsList.make
cmt_local_tagfile_TrackFitterComponentsList = $(bin)$(TrackFitter_tag)_TrackFitterComponentsList.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterComponentsList = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterComponentsList = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterComponentsList)
#-include $(cmt_local_tagfile_TrackFitterComponentsList)

ifdef cmt_TrackFitterComponentsList_has_target_tag

cmt_final_setup_TrackFitterComponentsList = $(bin)setup_TrackFitterComponentsList.make
#cmt_final_setup_TrackFitterComponentsList = $(bin)TrackFitter_TrackFitterComponentsListsetup.make
cmt_local_TrackFitterComponentsList_makefile = $(bin)TrackFitterComponentsList.make

else

cmt_final_setup_TrackFitterComponentsList = $(bin)setup.make
#cmt_final_setup_TrackFitterComponentsList = $(bin)TrackFittersetup.make
cmt_local_TrackFitterComponentsList_makefile = $(bin)TrackFitterComponentsList.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterComponentsList :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterComponentsList'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterComponentsList/
#TrackFitterComponentsList::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
##
componentslistfile = TrackFitter.components
COMPONENTSLIST_DIR = ../$(tag)
fulllibname = libTrackFitter.$(shlibsuffix)

TrackFitterComponentsList :: ${COMPONENTSLIST_DIR}/$(componentslistfile)
	@:

${COMPONENTSLIST_DIR}/$(componentslistfile) :: $(bin)$(fulllibname)
	@echo 'Generating componentslist file for $(fulllibname)'
	cd ../$(tag);$(listcomponents_cmd) --output ${COMPONENTSLIST_DIR}/$(componentslistfile) $(fulllibname)

install :: TrackFitterComponentsListinstall
TrackFitterComponentsListinstall :: TrackFitterComponentsList

uninstall :: TrackFitterComponentsListuninstall
TrackFitterComponentsListuninstall :: TrackFitterComponentsListclean

TrackFitterComponentsListclean ::
	@echo 'Deleting $(componentslistfile)'
	@rm -f ${COMPONENTSLIST_DIR}/$(componentslistfile)

#-- start of cleanup_header --------------

clean :: TrackFitterComponentsListclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterComponentsList.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterComponentsList.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterComponentsList.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterComponentsList.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterComponentsList)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterComponentsList.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterComponentsList.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterComponentsList.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterComponentsListclean ::
#-- end of cleanup_header ---------------
