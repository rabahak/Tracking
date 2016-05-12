#-- start of make_header -----------------

#====================================
#  Document TrackFitterGenConfUser
#
#   Generated Wed May 11 14:30:52 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_TrackFitterGenConfUser_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterGenConfUser_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_TrackFitterGenConfUser

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterGenConfUser = $(TrackFitter_tag)_TrackFitterGenConfUser.make
cmt_local_tagfile_TrackFitterGenConfUser = $(bin)$(TrackFitter_tag)_TrackFitterGenConfUser.make

else

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile_TrackFitterGenConfUser = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterGenConfUser = $(bin)$(TrackFitter_tag).make

endif

include $(cmt_local_tagfile_TrackFitterGenConfUser)
#-include $(cmt_local_tagfile_TrackFitterGenConfUser)

ifdef cmt_TrackFitterGenConfUser_has_target_tag

cmt_final_setup_TrackFitterGenConfUser = $(bin)setup_TrackFitterGenConfUser.make
#cmt_final_setup_TrackFitterGenConfUser = $(bin)TrackFitter_TrackFitterGenConfUsersetup.make
cmt_local_TrackFitterGenConfUser_makefile = $(bin)TrackFitterGenConfUser.make

else

cmt_final_setup_TrackFitterGenConfUser = $(bin)setup.make
#cmt_final_setup_TrackFitterGenConfUser = $(bin)TrackFittersetup.make
cmt_local_TrackFitterGenConfUser_makefile = $(bin)TrackFitterGenConfUser.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)TrackFittersetup.make

#TrackFitterGenConfUser :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'TrackFitterGenConfUser'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = TrackFitterGenConfUser/
#TrackFitterGenConfUser::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
# ============= call_command_header:begin =============
deps        = $(TrackFitterGenConfUser_deps)
command     = $(TrackFitterGenConfUser_command)
output      = $(TrackFitterGenConfUser_output)

.PHONY: TrackFitterGenConfUser TrackFitterGenConfUserclean

TrackFitterGenConfUser :: $(output)

TrackFitterGenConfUserclean ::
	$(cmt_uninstallarea_command) $(output)

$(output):: $(deps)
	$(command)

FORCE:
# ============= call_command_header:end =============
#-- start of cleanup_header --------------

clean :: TrackFitterGenConfUserclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(TrackFitterGenConfUser.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterGenConfUser.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(TrackFitterGenConfUser.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterGenConfUser.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_TrackFitterGenConfUser)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterGenConfUser.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterGenConfUser.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(TrackFitterGenConfUser.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

TrackFitterGenConfUserclean ::
#-- end of cleanup_header ---------------
