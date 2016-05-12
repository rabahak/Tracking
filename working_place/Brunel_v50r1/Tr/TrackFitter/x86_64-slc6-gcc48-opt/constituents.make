
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

TrackFitter_tag = $(tag)

#cmt_local_tagfile = $(TrackFitter_tag).make
cmt_local_tagfile = $(bin)$(TrackFitter_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)TrackFittersetup.make
cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)$(package)setup.make

#--------------------------------------------------------

#cmt_lock_setup = /tmp/lock$(cmt_lock_pid).make
#cmt_temp_tag = /tmp/tag$(cmt_lock_pid).make

#first :: $(cmt_local_tagfile)
#	@echo $(cmt_local_tagfile) ok
#ifndef QUICK
#first :: $(cmt_final_setup) ;
#else
#first :: ;
#endif

##	@bin=`$(cmtexe) show macro_value bin`

#$(cmt_local_tagfile) : $(cmt_lock_setup)
#	@echo "#CMT> Error: $@: No such file" >&2; exit 1
#$(cmt_local_tagfile) :
#	@echo "#CMT> Warning: $@: No such file" >&2; exit
#	@echo "#CMT> Info: $@: No need to rebuild file" >&2; exit

#$(cmt_final_setup) : $(cmt_local_tagfile) 
#	$(echo) "(constituents.make) Rebuilding $@"
#	@if test ! -d $(@D); then $(mkdir) -p $(@D); fi; \
#	  if test -f $(cmt_local_setup); then /bin/rm -f $(cmt_local_setup); fi; \
#	  trap '/bin/rm -f $(cmt_local_setup)' 0 1 2 15; \
#	  $(cmtexe) -tag=$(tags) show setup >>$(cmt_local_setup); \
#	  if test ! -f $@; then \
#	    mv $(cmt_local_setup) $@; \
#	  else \
#	    if /usr/bin/diff $(cmt_local_setup) $@ >/dev/null ; then \
#	      : ; \
#	    else \
#	      mv $(cmt_local_setup) $@; \
#	    fi; \
#	  fi

#	@/bin/echo $@ ok   

#config :: checkuses
#	@exit 0
#checkuses : ;

env.make ::
	printenv >env.make.tmp; $(cmtexe) check files env.make.tmp env.make

ifndef QUICK
all :: build_library_links
	$(echo) "(constituents.make) all done"
endif

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

dirs :: requirements
	@if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi
#	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
#	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

requirements :
	@if test ! -r requirements ; then echo "No requirements file" ; fi

build_library_links : dirs
	$(echo) "(constituents.make) Rebuilding library links"; \
	 $(build_library_links)
#	if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi; \
#	$(build_library_links)

makefiles : ;

.DEFAULT ::
	$(echo) "(constituents.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: Using default commands" >&2; exit

#	@if test "$@" = "$(cmt_lock_setup)"; then \
	#  /bin/rm -f $(cmt_lock_setup); \
	 # touch $(cmt_lock_setup); \
	#fi

#-- end of constituents_header ------
#-- start of group ------

all_groups :: all

all :: $(all_dependencies)  $(all_pre_constituents) $(all_constituents)  $(all_post_constituents)
	$(echo) "all ok."

#	@/bin/echo " all ok."

clean :: allclean

allclean ::  $(all_constituentsclean)
	$(echo) $(all_constituentsclean)
	$(echo) "allclean ok."

#	@echo $(all_constituentsclean)
#	@/bin/echo " allclean ok."

allclean :: makefilesclean

#-- end of group ------
#-- start of group ------

all_groups :: cmt_actions

cmt_actions :: $(cmt_actions_dependencies)  $(cmt_actions_pre_constituents) $(cmt_actions_constituents)  $(cmt_actions_post_constituents)
	$(echo) "cmt_actions ok."

#	@/bin/echo " cmt_actions ok."

clean :: allclean

cmt_actionsclean ::  $(cmt_actions_constituentsclean)
	$(echo) $(cmt_actions_constituentsclean)
	$(echo) "cmt_actionsclean ok."

#	@echo $(cmt_actions_constituentsclean)
#	@/bin/echo " cmt_actionsclean ok."

cmt_actionsclean :: makefilesclean

#-- end of group ------
#-- start of constituent ------

cmt_TrackFitter_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitter_has_target_tag

#cmt_local_tagfile_TrackFitter = $(TrackFitter_tag)_TrackFitter.make
cmt_local_tagfile_TrackFitter = $(bin)$(TrackFitter_tag)_TrackFitter.make
cmt_local_setup_TrackFitter = $(bin)setup_TrackFitter$$$$.make
cmt_final_setup_TrackFitter = $(bin)setup_TrackFitter.make
#cmt_final_setup_TrackFitter = $(bin)TrackFitter_TrackFittersetup.make
cmt_local_TrackFitter_makefile = $(bin)TrackFitter.make

TrackFitter_extratags = -tag_add=target_TrackFitter

#$(cmt_local_tagfile_TrackFitter) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitter) ::
else
$(cmt_local_tagfile_TrackFitter) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitter); then /bin/rm -f $(cmt_local_tagfile_TrackFitter); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitter)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitter)"; \
	  test ! -f $(cmt_local_setup_TrackFitter) || \rm -f $(cmt_local_setup_TrackFitter); \
	  trap '\rm -f $(cmt_local_setup_TrackFitter)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_extratags) show setup >$(cmt_local_setup_TrackFitter) && \
	  if [ -f $(cmt_final_setup_TrackFitter) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitter) $(cmt_local_setup_TrackFitter); then \
	    \rm $(cmt_local_setup_TrackFitter); else \
	    \mv -f $(cmt_local_setup_TrackFitter) $(cmt_final_setup_TrackFitter); fi

else

#cmt_local_tagfile_TrackFitter = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitter = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitter = $(bin)setup.make
#cmt_final_setup_TrackFitter = $(bin)TrackFittersetup.make
cmt_local_TrackFitter_makefile = $(bin)TrackFitter.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterdirs :
	@if test ! -d $(bin)TrackFitter; then $(mkdir) -p $(bin)TrackFitter; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter
else
TrackFitterdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterdirs ::
#	@if test ! -d $(bin)TrackFitter; then $(mkdir) -p $(bin)TrackFitter; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter
#
#$(cmt_local_TrackFitter_makefile) :: $(TrackFitter_dependencies) $(cmt_local_tagfile_TrackFitter) build_library_links dirs TrackFitterdirs
#else
#$(cmt_local_TrackFitter_makefile) :: $(TrackFitter_dependencies) $(cmt_local_tagfile_TrackFitter) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitter_makefile) :: $(cmt_local_tagfile_TrackFitter)
#endif

makefiles : $(cmt_local_TrackFitter_makefile)

ifndef QUICK
$(cmt_local_TrackFitter_makefile) : $(TrackFitter_dependencies) $(cmt_local_tagfile_TrackFitter) build_library_links
else
$(cmt_local_TrackFitter_makefile) : $(cmt_local_tagfile_TrackFitter)
endif
	$(echo) "(constituents.make) Building TrackFitter.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_extratags) build constituent_makefile -out=$(cmt_local_TrackFitter_makefile) TrackFitter

TrackFitter :: $(TrackFitter_dependencies) $(cmt_local_TrackFitter_makefile) dirs TrackFitterdirs
	$(echo) "(constituents.make) Starting TrackFitter"
	@$(MAKE) -f $(cmt_local_TrackFitter_makefile) TrackFitter
	$(echo) "(constituents.make) TrackFitter done"

clean :: TrackFitterclean

TrackFitterclean :: $(TrackFitterclean_dependencies) ##$(cmt_local_TrackFitter_makefile)
	$(echo) "(constituents.make) Starting TrackFitterclean"
	@-if test -f $(cmt_local_TrackFitter_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitter_makefile) TrackFitterclean; \
	fi
	$(echo) "(constituents.make) TrackFitterclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitter_makefile) TrackFitterclean

##	  /bin/rm -f $(cmt_local_TrackFitter_makefile) $(bin)TrackFitter_dependencies.make

install :: TrackFitterinstall

TrackFitterinstall :: $(TrackFitter_dependencies) $(cmt_local_TrackFitter_makefile)
	$(echo) "(constituents.make) Starting install TrackFitter"
	@-$(MAKE) -f $(cmt_local_TrackFitter_makefile) install
	$(echo) "(constituents.make) install TrackFitter done"

uninstall :: TrackFitteruninstall

$(foreach d,$(TrackFitter_dependencies),$(eval $(d)uninstall_dependencies += TrackFitteruninstall))

TrackFitteruninstall :: $(TrackFitteruninstall_dependencies) $(cmt_local_TrackFitter_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitter"
	@$(MAKE) -f $(cmt_local_TrackFitter_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitter done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitter"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitter done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_TrackFitterComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterComponentsList_has_target_tag

#cmt_local_tagfile_TrackFitterComponentsList = $(TrackFitter_tag)_TrackFitterComponentsList.make
cmt_local_tagfile_TrackFitterComponentsList = $(bin)$(TrackFitter_tag)_TrackFitterComponentsList.make
cmt_local_setup_TrackFitterComponentsList = $(bin)setup_TrackFitterComponentsList$$$$.make
cmt_final_setup_TrackFitterComponentsList = $(bin)setup_TrackFitterComponentsList.make
#cmt_final_setup_TrackFitterComponentsList = $(bin)TrackFitter_TrackFitterComponentsListsetup.make
cmt_local_TrackFitterComponentsList_makefile = $(bin)TrackFitterComponentsList.make

TrackFitterComponentsList_extratags = -tag_add=target_TrackFitterComponentsList

#$(cmt_local_tagfile_TrackFitterComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterComponentsList) ::
else
$(cmt_local_tagfile_TrackFitterComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterComponentsList); then /bin/rm -f $(cmt_local_tagfile_TrackFitterComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterComponentsList)"; \
	  test ! -f $(cmt_local_setup_TrackFitterComponentsList) || \rm -f $(cmt_local_setup_TrackFitterComponentsList); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterComponentsList_extratags) show setup >$(cmt_local_setup_TrackFitterComponentsList) && \
	  if [ -f $(cmt_final_setup_TrackFitterComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterComponentsList) $(cmt_local_setup_TrackFitterComponentsList); then \
	    \rm $(cmt_local_setup_TrackFitterComponentsList); else \
	    \mv -f $(cmt_local_setup_TrackFitterComponentsList) $(cmt_final_setup_TrackFitterComponentsList); fi

else

#cmt_local_tagfile_TrackFitterComponentsList = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterComponentsList = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterComponentsList = $(bin)setup.make
#cmt_final_setup_TrackFitterComponentsList = $(bin)TrackFittersetup.make
cmt_local_TrackFitterComponentsList_makefile = $(bin)TrackFitterComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterComponentsListdirs :
	@if test ! -d $(bin)TrackFitterComponentsList; then $(mkdir) -p $(bin)TrackFitterComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterComponentsList
else
TrackFitterComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterComponentsListdirs ::
#	@if test ! -d $(bin)TrackFitterComponentsList; then $(mkdir) -p $(bin)TrackFitterComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterComponentsList
#
#$(cmt_local_TrackFitterComponentsList_makefile) :: $(TrackFitterComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterComponentsList) build_library_links dirs TrackFitterComponentsListdirs
#else
#$(cmt_local_TrackFitterComponentsList_makefile) :: $(TrackFitterComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterComponentsList_makefile) :: $(cmt_local_tagfile_TrackFitterComponentsList)
#endif

makefiles : $(cmt_local_TrackFitterComponentsList_makefile)

ifndef QUICK
$(cmt_local_TrackFitterComponentsList_makefile) : $(TrackFitterComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterComponentsList) build_library_links
else
$(cmt_local_TrackFitterComponentsList_makefile) : $(cmt_local_tagfile_TrackFitterComponentsList)
endif
	$(echo) "(constituents.make) Building TrackFitterComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterComponentsList_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterComponentsList_makefile) TrackFitterComponentsList

TrackFitterComponentsList :: $(TrackFitterComponentsList_dependencies) $(cmt_local_TrackFitterComponentsList_makefile) dirs TrackFitterComponentsListdirs
	$(echo) "(constituents.make) Creating TrackFitterComponentsList${lock_suffix} and Starting TrackFitterComponentsList"
	@${lock_command} TrackFitterComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterComponentsList_makefile) TrackFitterComponentsList; \
	  retval=$$?; ${unlock_command} TrackFitterComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterComponentsList done"

clean :: TrackFitterComponentsListclean

TrackFitterComponentsListclean :: $(TrackFitterComponentsListclean_dependencies) ##$(cmt_local_TrackFitterComponentsList_makefile)
	$(echo) "(constituents.make) Starting TrackFitterComponentsListclean"
	@-if test -f $(cmt_local_TrackFitterComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterComponentsList_makefile) TrackFitterComponentsListclean; \
	fi
	$(echo) "(constituents.make) TrackFitterComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterComponentsList_makefile) TrackFitterComponentsListclean

##	  /bin/rm -f $(cmt_local_TrackFitterComponentsList_makefile) $(bin)TrackFitterComponentsList_dependencies.make

install :: TrackFitterComponentsListinstall

TrackFitterComponentsListinstall :: $(TrackFitterComponentsList_dependencies) $(cmt_local_TrackFitterComponentsList_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterComponentsList"
	@-$(MAKE) -f $(cmt_local_TrackFitterComponentsList_makefile) install
	$(echo) "(constituents.make) install TrackFitterComponentsList done"

uninstall :: TrackFitterComponentsListuninstall

$(foreach d,$(TrackFitterComponentsList_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterComponentsListuninstall))

TrackFitterComponentsListuninstall :: $(TrackFitterComponentsListuninstall_dependencies) $(cmt_local_TrackFitterComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterComponentsList"
	@$(MAKE) -f $(cmt_local_TrackFitterComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitterMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterMergeComponentsList_has_target_tag

#cmt_local_tagfile_TrackFitterMergeComponentsList = $(TrackFitter_tag)_TrackFitterMergeComponentsList.make
cmt_local_tagfile_TrackFitterMergeComponentsList = $(bin)$(TrackFitter_tag)_TrackFitterMergeComponentsList.make
cmt_local_setup_TrackFitterMergeComponentsList = $(bin)setup_TrackFitterMergeComponentsList$$$$.make
cmt_final_setup_TrackFitterMergeComponentsList = $(bin)setup_TrackFitterMergeComponentsList.make
#cmt_final_setup_TrackFitterMergeComponentsList = $(bin)TrackFitter_TrackFitterMergeComponentsListsetup.make
cmt_local_TrackFitterMergeComponentsList_makefile = $(bin)TrackFitterMergeComponentsList.make

TrackFitterMergeComponentsList_extratags = -tag_add=target_TrackFitterMergeComponentsList

#$(cmt_local_tagfile_TrackFitterMergeComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterMergeComponentsList) ::
else
$(cmt_local_tagfile_TrackFitterMergeComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterMergeComponentsList); then /bin/rm -f $(cmt_local_tagfile_TrackFitterMergeComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterMergeComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterMergeComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterMergeComponentsList)"; \
	  test ! -f $(cmt_local_setup_TrackFitterMergeComponentsList) || \rm -f $(cmt_local_setup_TrackFitterMergeComponentsList); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterMergeComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterMergeComponentsList_extratags) show setup >$(cmt_local_setup_TrackFitterMergeComponentsList) && \
	  if [ -f $(cmt_final_setup_TrackFitterMergeComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterMergeComponentsList) $(cmt_local_setup_TrackFitterMergeComponentsList); then \
	    \rm $(cmt_local_setup_TrackFitterMergeComponentsList); else \
	    \mv -f $(cmt_local_setup_TrackFitterMergeComponentsList) $(cmt_final_setup_TrackFitterMergeComponentsList); fi

else

#cmt_local_tagfile_TrackFitterMergeComponentsList = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterMergeComponentsList = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterMergeComponentsList = $(bin)setup.make
#cmt_final_setup_TrackFitterMergeComponentsList = $(bin)TrackFittersetup.make
cmt_local_TrackFitterMergeComponentsList_makefile = $(bin)TrackFitterMergeComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterMergeComponentsListdirs :
	@if test ! -d $(bin)TrackFitterMergeComponentsList; then $(mkdir) -p $(bin)TrackFitterMergeComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterMergeComponentsList
else
TrackFitterMergeComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterMergeComponentsListdirs ::
#	@if test ! -d $(bin)TrackFitterMergeComponentsList; then $(mkdir) -p $(bin)TrackFitterMergeComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterMergeComponentsList
#
#$(cmt_local_TrackFitterMergeComponentsList_makefile) :: $(TrackFitterMergeComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterMergeComponentsList) build_library_links dirs TrackFitterMergeComponentsListdirs
#else
#$(cmt_local_TrackFitterMergeComponentsList_makefile) :: $(TrackFitterMergeComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterMergeComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterMergeComponentsList_makefile) :: $(cmt_local_tagfile_TrackFitterMergeComponentsList)
#endif

makefiles : $(cmt_local_TrackFitterMergeComponentsList_makefile)

ifndef QUICK
$(cmt_local_TrackFitterMergeComponentsList_makefile) : $(TrackFitterMergeComponentsList_dependencies) $(cmt_local_tagfile_TrackFitterMergeComponentsList) build_library_links
else
$(cmt_local_TrackFitterMergeComponentsList_makefile) : $(cmt_local_tagfile_TrackFitterMergeComponentsList)
endif
	$(echo) "(constituents.make) Building TrackFitterMergeComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterMergeComponentsList_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterMergeComponentsList_makefile) TrackFitterMergeComponentsList

TrackFitterMergeComponentsList :: $(TrackFitterMergeComponentsList_dependencies) $(cmt_local_TrackFitterMergeComponentsList_makefile) dirs TrackFitterMergeComponentsListdirs
	$(echo) "(constituents.make) Creating TrackFitterMergeComponentsList${lock_suffix} and Starting TrackFitterMergeComponentsList"
	@${lock_command} TrackFitterMergeComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterMergeComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterMergeComponentsList_makefile) TrackFitterMergeComponentsList; \
	  retval=$$?; ${unlock_command} TrackFitterMergeComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterMergeComponentsList done"

clean :: TrackFitterMergeComponentsListclean

TrackFitterMergeComponentsListclean :: $(TrackFitterMergeComponentsListclean_dependencies) ##$(cmt_local_TrackFitterMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting TrackFitterMergeComponentsListclean"
	@-if test -f $(cmt_local_TrackFitterMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterMergeComponentsList_makefile) TrackFitterMergeComponentsListclean; \
	fi
	$(echo) "(constituents.make) TrackFitterMergeComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterMergeComponentsList_makefile) TrackFitterMergeComponentsListclean

##	  /bin/rm -f $(cmt_local_TrackFitterMergeComponentsList_makefile) $(bin)TrackFitterMergeComponentsList_dependencies.make

install :: TrackFitterMergeComponentsListinstall

TrackFitterMergeComponentsListinstall :: $(TrackFitterMergeComponentsList_dependencies) $(cmt_local_TrackFitterMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterMergeComponentsList"
	@-$(MAKE) -f $(cmt_local_TrackFitterMergeComponentsList_makefile) install
	$(echo) "(constituents.make) install TrackFitterMergeComponentsList done"

uninstall :: TrackFitterMergeComponentsListuninstall

$(foreach d,$(TrackFitterMergeComponentsList_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterMergeComponentsListuninstall))

TrackFitterMergeComponentsListuninstall :: $(TrackFitterMergeComponentsListuninstall_dependencies) $(cmt_local_TrackFitterMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterMergeComponentsList"
	@$(MAKE) -f $(cmt_local_TrackFitterMergeComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterMergeComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterMergeComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterMergeComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitterConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConf_has_target_tag

#cmt_local_tagfile_TrackFitterConf = $(TrackFitter_tag)_TrackFitterConf.make
cmt_local_tagfile_TrackFitterConf = $(bin)$(TrackFitter_tag)_TrackFitterConf.make
cmt_local_setup_TrackFitterConf = $(bin)setup_TrackFitterConf$$$$.make
cmt_final_setup_TrackFitterConf = $(bin)setup_TrackFitterConf.make
#cmt_final_setup_TrackFitterConf = $(bin)TrackFitter_TrackFitterConfsetup.make
cmt_local_TrackFitterConf_makefile = $(bin)TrackFitterConf.make

TrackFitterConf_extratags = -tag_add=target_TrackFitterConf

#$(cmt_local_tagfile_TrackFitterConf) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterConf) ::
else
$(cmt_local_tagfile_TrackFitterConf) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterConf); then /bin/rm -f $(cmt_local_tagfile_TrackFitterConf); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConf_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterConf)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterConf)"; \
	  test ! -f $(cmt_local_setup_TrackFitterConf) || \rm -f $(cmt_local_setup_TrackFitterConf); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterConf)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConf_extratags) show setup >$(cmt_local_setup_TrackFitterConf) && \
	  if [ -f $(cmt_final_setup_TrackFitterConf) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterConf) $(cmt_local_setup_TrackFitterConf); then \
	    \rm $(cmt_local_setup_TrackFitterConf); else \
	    \mv -f $(cmt_local_setup_TrackFitterConf) $(cmt_final_setup_TrackFitterConf); fi

else

#cmt_local_tagfile_TrackFitterConf = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConf = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterConf = $(bin)setup.make
#cmt_final_setup_TrackFitterConf = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConf_makefile = $(bin)TrackFitterConf.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterConfdirs :
	@if test ! -d $(bin)TrackFitterConf; then $(mkdir) -p $(bin)TrackFitterConf; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConf
else
TrackFitterConfdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterConfdirs ::
#	@if test ! -d $(bin)TrackFitterConf; then $(mkdir) -p $(bin)TrackFitterConf; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConf
#
#$(cmt_local_TrackFitterConf_makefile) :: $(TrackFitterConf_dependencies) $(cmt_local_tagfile_TrackFitterConf) build_library_links dirs TrackFitterConfdirs
#else
#$(cmt_local_TrackFitterConf_makefile) :: $(TrackFitterConf_dependencies) $(cmt_local_tagfile_TrackFitterConf) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterConf_makefile) :: $(cmt_local_tagfile_TrackFitterConf)
#endif

makefiles : $(cmt_local_TrackFitterConf_makefile)

ifndef QUICK
$(cmt_local_TrackFitterConf_makefile) : $(TrackFitterConf_dependencies) $(cmt_local_tagfile_TrackFitterConf) build_library_links
else
$(cmt_local_TrackFitterConf_makefile) : $(cmt_local_tagfile_TrackFitterConf)
endif
	$(echo) "(constituents.make) Building TrackFitterConf.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConf_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterConf_makefile) TrackFitterConf

TrackFitterConf :: $(TrackFitterConf_dependencies) $(cmt_local_TrackFitterConf_makefile) dirs TrackFitterConfdirs
	$(echo) "(constituents.make) Creating TrackFitterConf${lock_suffix} and Starting TrackFitterConf"
	@${lock_command} TrackFitterConf${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterConf${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterConf_makefile) TrackFitterConf; \
	  retval=$$?; ${unlock_command} TrackFitterConf${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterConf done"

clean :: TrackFitterConfclean

TrackFitterConfclean :: $(TrackFitterConfclean_dependencies) ##$(cmt_local_TrackFitterConf_makefile)
	$(echo) "(constituents.make) Starting TrackFitterConfclean"
	@-if test -f $(cmt_local_TrackFitterConf_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterConf_makefile) TrackFitterConfclean; \
	fi
	$(echo) "(constituents.make) TrackFitterConfclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterConf_makefile) TrackFitterConfclean

##	  /bin/rm -f $(cmt_local_TrackFitterConf_makefile) $(bin)TrackFitterConf_dependencies.make

install :: TrackFitterConfinstall

TrackFitterConfinstall :: $(TrackFitterConf_dependencies) $(cmt_local_TrackFitterConf_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterConf"
	@-$(MAKE) -f $(cmt_local_TrackFitterConf_makefile) install
	$(echo) "(constituents.make) install TrackFitterConf done"

uninstall :: TrackFitterConfuninstall

$(foreach d,$(TrackFitterConf_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterConfuninstall))

TrackFitterConfuninstall :: $(TrackFitterConfuninstall_dependencies) $(cmt_local_TrackFitterConf_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterConf"
	@$(MAKE) -f $(cmt_local_TrackFitterConf_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterConf done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterConf"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterConf done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitter_python_init_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitter_python_init_has_target_tag

#cmt_local_tagfile_TrackFitter_python_init = $(TrackFitter_tag)_TrackFitter_python_init.make
cmt_local_tagfile_TrackFitter_python_init = $(bin)$(TrackFitter_tag)_TrackFitter_python_init.make
cmt_local_setup_TrackFitter_python_init = $(bin)setup_TrackFitter_python_init$$$$.make
cmt_final_setup_TrackFitter_python_init = $(bin)setup_TrackFitter_python_init.make
#cmt_final_setup_TrackFitter_python_init = $(bin)TrackFitter_TrackFitter_python_initsetup.make
cmt_local_TrackFitter_python_init_makefile = $(bin)TrackFitter_python_init.make

TrackFitter_python_init_extratags = -tag_add=target_TrackFitter_python_init

#$(cmt_local_tagfile_TrackFitter_python_init) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitter_python_init) ::
else
$(cmt_local_tagfile_TrackFitter_python_init) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitter_python_init); then /bin/rm -f $(cmt_local_tagfile_TrackFitter_python_init); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_init_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitter_python_init)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitter_python_init)"; \
	  test ! -f $(cmt_local_setup_TrackFitter_python_init) || \rm -f $(cmt_local_setup_TrackFitter_python_init); \
	  trap '\rm -f $(cmt_local_setup_TrackFitter_python_init)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_init_extratags) show setup >$(cmt_local_setup_TrackFitter_python_init) && \
	  if [ -f $(cmt_final_setup_TrackFitter_python_init) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitter_python_init) $(cmt_local_setup_TrackFitter_python_init); then \
	    \rm $(cmt_local_setup_TrackFitter_python_init); else \
	    \mv -f $(cmt_local_setup_TrackFitter_python_init) $(cmt_final_setup_TrackFitter_python_init); fi

else

#cmt_local_tagfile_TrackFitter_python_init = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitter_python_init = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitter_python_init = $(bin)setup.make
#cmt_final_setup_TrackFitter_python_init = $(bin)TrackFittersetup.make
cmt_local_TrackFitter_python_init_makefile = $(bin)TrackFitter_python_init.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitter_python_initdirs :
	@if test ! -d $(bin)TrackFitter_python_init; then $(mkdir) -p $(bin)TrackFitter_python_init; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter_python_init
else
TrackFitter_python_initdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitter_python_initdirs ::
#	@if test ! -d $(bin)TrackFitter_python_init; then $(mkdir) -p $(bin)TrackFitter_python_init; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter_python_init
#
#$(cmt_local_TrackFitter_python_init_makefile) :: $(TrackFitter_python_init_dependencies) $(cmt_local_tagfile_TrackFitter_python_init) build_library_links dirs TrackFitter_python_initdirs
#else
#$(cmt_local_TrackFitter_python_init_makefile) :: $(TrackFitter_python_init_dependencies) $(cmt_local_tagfile_TrackFitter_python_init) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitter_python_init_makefile) :: $(cmt_local_tagfile_TrackFitter_python_init)
#endif

makefiles : $(cmt_local_TrackFitter_python_init_makefile)

ifndef QUICK
$(cmt_local_TrackFitter_python_init_makefile) : $(TrackFitter_python_init_dependencies) $(cmt_local_tagfile_TrackFitter_python_init) build_library_links
else
$(cmt_local_TrackFitter_python_init_makefile) : $(cmt_local_tagfile_TrackFitter_python_init)
endif
	$(echo) "(constituents.make) Building TrackFitter_python_init.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_init_extratags) build constituent_makefile -out=$(cmt_local_TrackFitter_python_init_makefile) TrackFitter_python_init

TrackFitter_python_init :: $(TrackFitter_python_init_dependencies) $(cmt_local_TrackFitter_python_init_makefile) dirs TrackFitter_python_initdirs
	$(echo) "(constituents.make) Creating TrackFitter_python_init${lock_suffix} and Starting TrackFitter_python_init"
	@${lock_command} TrackFitter_python_init${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitter_python_init${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitter_python_init_makefile) TrackFitter_python_init; \
	  retval=$$?; ${unlock_command} TrackFitter_python_init${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitter_python_init done"

clean :: TrackFitter_python_initclean

TrackFitter_python_initclean :: $(TrackFitter_python_initclean_dependencies) ##$(cmt_local_TrackFitter_python_init_makefile)
	$(echo) "(constituents.make) Starting TrackFitter_python_initclean"
	@-if test -f $(cmt_local_TrackFitter_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitter_python_init_makefile) TrackFitter_python_initclean; \
	fi
	$(echo) "(constituents.make) TrackFitter_python_initclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitter_python_init_makefile) TrackFitter_python_initclean

##	  /bin/rm -f $(cmt_local_TrackFitter_python_init_makefile) $(bin)TrackFitter_python_init_dependencies.make

install :: TrackFitter_python_initinstall

TrackFitter_python_initinstall :: $(TrackFitter_python_init_dependencies) $(cmt_local_TrackFitter_python_init_makefile)
	$(echo) "(constituents.make) Starting install TrackFitter_python_init"
	@-$(MAKE) -f $(cmt_local_TrackFitter_python_init_makefile) install
	$(echo) "(constituents.make) install TrackFitter_python_init done"

uninstall :: TrackFitter_python_inituninstall

$(foreach d,$(TrackFitter_python_init_dependencies),$(eval $(d)uninstall_dependencies += TrackFitter_python_inituninstall))

TrackFitter_python_inituninstall :: $(TrackFitter_python_inituninstall_dependencies) $(cmt_local_TrackFitter_python_init_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitter_python_init"
	@$(MAKE) -f $(cmt_local_TrackFitter_python_init_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitter_python_init done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitter_python_init"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitter_python_init done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_zip_TrackFitter_python_modules_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_zip_TrackFitter_python_modules_has_target_tag

#cmt_local_tagfile_zip_TrackFitter_python_modules = $(TrackFitter_tag)_zip_TrackFitter_python_modules.make
cmt_local_tagfile_zip_TrackFitter_python_modules = $(bin)$(TrackFitter_tag)_zip_TrackFitter_python_modules.make
cmt_local_setup_zip_TrackFitter_python_modules = $(bin)setup_zip_TrackFitter_python_modules$$$$.make
cmt_final_setup_zip_TrackFitter_python_modules = $(bin)setup_zip_TrackFitter_python_modules.make
#cmt_final_setup_zip_TrackFitter_python_modules = $(bin)TrackFitter_zip_TrackFitter_python_modulessetup.make
cmt_local_zip_TrackFitter_python_modules_makefile = $(bin)zip_TrackFitter_python_modules.make

zip_TrackFitter_python_modules_extratags = -tag_add=target_zip_TrackFitter_python_modules

#$(cmt_local_tagfile_zip_TrackFitter_python_modules) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_zip_TrackFitter_python_modules) ::
else
$(cmt_local_tagfile_zip_TrackFitter_python_modules) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_zip_TrackFitter_python_modules); then /bin/rm -f $(cmt_local_tagfile_zip_TrackFitter_python_modules); fi ; \
	  $(cmtexe) -tag=$(tags) $(zip_TrackFitter_python_modules_extratags) build tag_makefile >>$(cmt_local_tagfile_zip_TrackFitter_python_modules)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_zip_TrackFitter_python_modules)"; \
	  test ! -f $(cmt_local_setup_zip_TrackFitter_python_modules) || \rm -f $(cmt_local_setup_zip_TrackFitter_python_modules); \
	  trap '\rm -f $(cmt_local_setup_zip_TrackFitter_python_modules)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(zip_TrackFitter_python_modules_extratags) show setup >$(cmt_local_setup_zip_TrackFitter_python_modules) && \
	  if [ -f $(cmt_final_setup_zip_TrackFitter_python_modules) ] && \
	    \cmp -s $(cmt_final_setup_zip_TrackFitter_python_modules) $(cmt_local_setup_zip_TrackFitter_python_modules); then \
	    \rm $(cmt_local_setup_zip_TrackFitter_python_modules); else \
	    \mv -f $(cmt_local_setup_zip_TrackFitter_python_modules) $(cmt_final_setup_zip_TrackFitter_python_modules); fi

else

#cmt_local_tagfile_zip_TrackFitter_python_modules = $(TrackFitter_tag).make
cmt_local_tagfile_zip_TrackFitter_python_modules = $(bin)$(TrackFitter_tag).make
cmt_final_setup_zip_TrackFitter_python_modules = $(bin)setup.make
#cmt_final_setup_zip_TrackFitter_python_modules = $(bin)TrackFittersetup.make
cmt_local_zip_TrackFitter_python_modules_makefile = $(bin)zip_TrackFitter_python_modules.make

endif

ifdef STRUCTURED_OUTPUT
zip_TrackFitter_python_modulesdirs :
	@if test ! -d $(bin)zip_TrackFitter_python_modules; then $(mkdir) -p $(bin)zip_TrackFitter_python_modules; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_TrackFitter_python_modules
else
zip_TrackFitter_python_modulesdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# zip_TrackFitter_python_modulesdirs ::
#	@if test ! -d $(bin)zip_TrackFitter_python_modules; then $(mkdir) -p $(bin)zip_TrackFitter_python_modules; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_TrackFitter_python_modules
#
#$(cmt_local_zip_TrackFitter_python_modules_makefile) :: $(zip_TrackFitter_python_modules_dependencies) $(cmt_local_tagfile_zip_TrackFitter_python_modules) build_library_links dirs zip_TrackFitter_python_modulesdirs
#else
#$(cmt_local_zip_TrackFitter_python_modules_makefile) :: $(zip_TrackFitter_python_modules_dependencies) $(cmt_local_tagfile_zip_TrackFitter_python_modules) build_library_links dirs
#endif
#else
#$(cmt_local_zip_TrackFitter_python_modules_makefile) :: $(cmt_local_tagfile_zip_TrackFitter_python_modules)
#endif

makefiles : $(cmt_local_zip_TrackFitter_python_modules_makefile)

ifndef QUICK
$(cmt_local_zip_TrackFitter_python_modules_makefile) : $(zip_TrackFitter_python_modules_dependencies) $(cmt_local_tagfile_zip_TrackFitter_python_modules) build_library_links
else
$(cmt_local_zip_TrackFitter_python_modules_makefile) : $(cmt_local_tagfile_zip_TrackFitter_python_modules)
endif
	$(echo) "(constituents.make) Building zip_TrackFitter_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(zip_TrackFitter_python_modules_extratags) build constituent_makefile -out=$(cmt_local_zip_TrackFitter_python_modules_makefile) zip_TrackFitter_python_modules

zip_TrackFitter_python_modules :: $(zip_TrackFitter_python_modules_dependencies) $(cmt_local_zip_TrackFitter_python_modules_makefile) dirs zip_TrackFitter_python_modulesdirs
	$(echo) "(constituents.make) Creating zip_TrackFitter_python_modules${lock_suffix} and Starting zip_TrackFitter_python_modules"
	@${lock_command} zip_TrackFitter_python_modules${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} zip_TrackFitter_python_modules${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_zip_TrackFitter_python_modules_makefile) zip_TrackFitter_python_modules; \
	  retval=$$?; ${unlock_command} zip_TrackFitter_python_modules${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) zip_TrackFitter_python_modules done"

clean :: zip_TrackFitter_python_modulesclean

zip_TrackFitter_python_modulesclean :: $(zip_TrackFitter_python_modulesclean_dependencies) ##$(cmt_local_zip_TrackFitter_python_modules_makefile)
	$(echo) "(constituents.make) Starting zip_TrackFitter_python_modulesclean"
	@-if test -f $(cmt_local_zip_TrackFitter_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_zip_TrackFitter_python_modules_makefile) zip_TrackFitter_python_modulesclean; \
	fi
	$(echo) "(constituents.make) zip_TrackFitter_python_modulesclean done"
#	@-$(MAKE) -f $(cmt_local_zip_TrackFitter_python_modules_makefile) zip_TrackFitter_python_modulesclean

##	  /bin/rm -f $(cmt_local_zip_TrackFitter_python_modules_makefile) $(bin)zip_TrackFitter_python_modules_dependencies.make

install :: zip_TrackFitter_python_modulesinstall

zip_TrackFitter_python_modulesinstall :: $(zip_TrackFitter_python_modules_dependencies) $(cmt_local_zip_TrackFitter_python_modules_makefile)
	$(echo) "(constituents.make) Starting install zip_TrackFitter_python_modules"
	@-$(MAKE) -f $(cmt_local_zip_TrackFitter_python_modules_makefile) install
	$(echo) "(constituents.make) install zip_TrackFitter_python_modules done"

uninstall :: zip_TrackFitter_python_modulesuninstall

$(foreach d,$(zip_TrackFitter_python_modules_dependencies),$(eval $(d)uninstall_dependencies += zip_TrackFitter_python_modulesuninstall))

zip_TrackFitter_python_modulesuninstall :: $(zip_TrackFitter_python_modulesuninstall_dependencies) $(cmt_local_zip_TrackFitter_python_modules_makefile)
	$(echo) "(constituents.make) Starting uninstall zip_TrackFitter_python_modules"
	@$(MAKE) -f $(cmt_local_zip_TrackFitter_python_modules_makefile) uninstall
	$(echo) "(constituents.make) uninstall zip_TrackFitter_python_modules done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ zip_TrackFitter_python_modules"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ zip_TrackFitter_python_modules done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitterConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConfDbMerge_has_target_tag

#cmt_local_tagfile_TrackFitterConfDbMerge = $(TrackFitter_tag)_TrackFitterConfDbMerge.make
cmt_local_tagfile_TrackFitterConfDbMerge = $(bin)$(TrackFitter_tag)_TrackFitterConfDbMerge.make
cmt_local_setup_TrackFitterConfDbMerge = $(bin)setup_TrackFitterConfDbMerge$$$$.make
cmt_final_setup_TrackFitterConfDbMerge = $(bin)setup_TrackFitterConfDbMerge.make
#cmt_final_setup_TrackFitterConfDbMerge = $(bin)TrackFitter_TrackFitterConfDbMergesetup.make
cmt_local_TrackFitterConfDbMerge_makefile = $(bin)TrackFitterConfDbMerge.make

TrackFitterConfDbMerge_extratags = -tag_add=target_TrackFitterConfDbMerge

#$(cmt_local_tagfile_TrackFitterConfDbMerge) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterConfDbMerge) ::
else
$(cmt_local_tagfile_TrackFitterConfDbMerge) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterConfDbMerge); then /bin/rm -f $(cmt_local_tagfile_TrackFitterConfDbMerge); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfDbMerge_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterConfDbMerge)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterConfDbMerge)"; \
	  test ! -f $(cmt_local_setup_TrackFitterConfDbMerge) || \rm -f $(cmt_local_setup_TrackFitterConfDbMerge); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterConfDbMerge)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfDbMerge_extratags) show setup >$(cmt_local_setup_TrackFitterConfDbMerge) && \
	  if [ -f $(cmt_final_setup_TrackFitterConfDbMerge) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterConfDbMerge) $(cmt_local_setup_TrackFitterConfDbMerge); then \
	    \rm $(cmt_local_setup_TrackFitterConfDbMerge); else \
	    \mv -f $(cmt_local_setup_TrackFitterConfDbMerge) $(cmt_final_setup_TrackFitterConfDbMerge); fi

else

#cmt_local_tagfile_TrackFitterConfDbMerge = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConfDbMerge = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterConfDbMerge = $(bin)setup.make
#cmt_final_setup_TrackFitterConfDbMerge = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConfDbMerge_makefile = $(bin)TrackFitterConfDbMerge.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterConfDbMergedirs :
	@if test ! -d $(bin)TrackFitterConfDbMerge; then $(mkdir) -p $(bin)TrackFitterConfDbMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConfDbMerge
else
TrackFitterConfDbMergedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterConfDbMergedirs ::
#	@if test ! -d $(bin)TrackFitterConfDbMerge; then $(mkdir) -p $(bin)TrackFitterConfDbMerge; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConfDbMerge
#
#$(cmt_local_TrackFitterConfDbMerge_makefile) :: $(TrackFitterConfDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfDbMerge) build_library_links dirs TrackFitterConfDbMergedirs
#else
#$(cmt_local_TrackFitterConfDbMerge_makefile) :: $(TrackFitterConfDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfDbMerge) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterConfDbMerge_makefile) :: $(cmt_local_tagfile_TrackFitterConfDbMerge)
#endif

makefiles : $(cmt_local_TrackFitterConfDbMerge_makefile)

ifndef QUICK
$(cmt_local_TrackFitterConfDbMerge_makefile) : $(TrackFitterConfDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfDbMerge) build_library_links
else
$(cmt_local_TrackFitterConfDbMerge_makefile) : $(cmt_local_tagfile_TrackFitterConfDbMerge)
endif
	$(echo) "(constituents.make) Building TrackFitterConfDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfDbMerge_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterConfDbMerge_makefile) TrackFitterConfDbMerge

TrackFitterConfDbMerge :: $(TrackFitterConfDbMerge_dependencies) $(cmt_local_TrackFitterConfDbMerge_makefile) dirs TrackFitterConfDbMergedirs
	$(echo) "(constituents.make) Creating TrackFitterConfDbMerge${lock_suffix} and Starting TrackFitterConfDbMerge"
	@${lock_command} TrackFitterConfDbMerge${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterConfDbMerge${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterConfDbMerge_makefile) TrackFitterConfDbMerge; \
	  retval=$$?; ${unlock_command} TrackFitterConfDbMerge${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterConfDbMerge done"

clean :: TrackFitterConfDbMergeclean

TrackFitterConfDbMergeclean :: $(TrackFitterConfDbMergeclean_dependencies) ##$(cmt_local_TrackFitterConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting TrackFitterConfDbMergeclean"
	@-if test -f $(cmt_local_TrackFitterConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterConfDbMerge_makefile) TrackFitterConfDbMergeclean; \
	fi
	$(echo) "(constituents.make) TrackFitterConfDbMergeclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterConfDbMerge_makefile) TrackFitterConfDbMergeclean

##	  /bin/rm -f $(cmt_local_TrackFitterConfDbMerge_makefile) $(bin)TrackFitterConfDbMerge_dependencies.make

install :: TrackFitterConfDbMergeinstall

TrackFitterConfDbMergeinstall :: $(TrackFitterConfDbMerge_dependencies) $(cmt_local_TrackFitterConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterConfDbMerge"
	@-$(MAKE) -f $(cmt_local_TrackFitterConfDbMerge_makefile) install
	$(echo) "(constituents.make) install TrackFitterConfDbMerge done"

uninstall :: TrackFitterConfDbMergeuninstall

$(foreach d,$(TrackFitterConfDbMerge_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterConfDbMergeuninstall))

TrackFitterConfDbMergeuninstall :: $(TrackFitterConfDbMergeuninstall_dependencies) $(cmt_local_TrackFitterConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterConfDbMerge"
	@$(MAKE) -f $(cmt_local_TrackFitterConfDbMerge_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterConfDbMerge done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterConfDbMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterConfDbMerge done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitter_python_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitter_python_has_target_tag

#cmt_local_tagfile_TrackFitter_python = $(TrackFitter_tag)_TrackFitter_python.make
cmt_local_tagfile_TrackFitter_python = $(bin)$(TrackFitter_tag)_TrackFitter_python.make
cmt_local_setup_TrackFitter_python = $(bin)setup_TrackFitter_python$$$$.make
cmt_final_setup_TrackFitter_python = $(bin)setup_TrackFitter_python.make
#cmt_final_setup_TrackFitter_python = $(bin)TrackFitter_TrackFitter_pythonsetup.make
cmt_local_TrackFitter_python_makefile = $(bin)TrackFitter_python.make

TrackFitter_python_extratags = -tag_add=target_TrackFitter_python

#$(cmt_local_tagfile_TrackFitter_python) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitter_python) ::
else
$(cmt_local_tagfile_TrackFitter_python) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitter_python); then /bin/rm -f $(cmt_local_tagfile_TrackFitter_python); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitter_python)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitter_python)"; \
	  test ! -f $(cmt_local_setup_TrackFitter_python) || \rm -f $(cmt_local_setup_TrackFitter_python); \
	  trap '\rm -f $(cmt_local_setup_TrackFitter_python)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_extratags) show setup >$(cmt_local_setup_TrackFitter_python) && \
	  if [ -f $(cmt_final_setup_TrackFitter_python) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitter_python) $(cmt_local_setup_TrackFitter_python); then \
	    \rm $(cmt_local_setup_TrackFitter_python); else \
	    \mv -f $(cmt_local_setup_TrackFitter_python) $(cmt_final_setup_TrackFitter_python); fi

else

#cmt_local_tagfile_TrackFitter_python = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitter_python = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitter_python = $(bin)setup.make
#cmt_final_setup_TrackFitter_python = $(bin)TrackFittersetup.make
cmt_local_TrackFitter_python_makefile = $(bin)TrackFitter_python.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitter_pythondirs :
	@if test ! -d $(bin)TrackFitter_python; then $(mkdir) -p $(bin)TrackFitter_python; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter_python
else
TrackFitter_pythondirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitter_pythondirs ::
#	@if test ! -d $(bin)TrackFitter_python; then $(mkdir) -p $(bin)TrackFitter_python; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitter_python
#
#$(cmt_local_TrackFitter_python_makefile) :: $(TrackFitter_python_dependencies) $(cmt_local_tagfile_TrackFitter_python) build_library_links dirs TrackFitter_pythondirs
#else
#$(cmt_local_TrackFitter_python_makefile) :: $(TrackFitter_python_dependencies) $(cmt_local_tagfile_TrackFitter_python) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitter_python_makefile) :: $(cmt_local_tagfile_TrackFitter_python)
#endif

makefiles : $(cmt_local_TrackFitter_python_makefile)

ifndef QUICK
$(cmt_local_TrackFitter_python_makefile) : $(TrackFitter_python_dependencies) $(cmt_local_tagfile_TrackFitter_python) build_library_links
else
$(cmt_local_TrackFitter_python_makefile) : $(cmt_local_tagfile_TrackFitter_python)
endif
	$(echo) "(constituents.make) Building TrackFitter_python.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitter_python_extratags) build constituent_makefile -out=$(cmt_local_TrackFitter_python_makefile) TrackFitter_python

TrackFitter_python :: $(TrackFitter_python_dependencies) $(cmt_local_TrackFitter_python_makefile) dirs TrackFitter_pythondirs
	$(echo) "(constituents.make) Creating TrackFitter_python${lock_suffix} and Starting TrackFitter_python"
	@${lock_command} TrackFitter_python${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitter_python${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitter_python_makefile) TrackFitter_python; \
	  retval=$$?; ${unlock_command} TrackFitter_python${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitter_python done"

clean :: TrackFitter_pythonclean

TrackFitter_pythonclean :: $(TrackFitter_pythonclean_dependencies) ##$(cmt_local_TrackFitter_python_makefile)
	$(echo) "(constituents.make) Starting TrackFitter_pythonclean"
	@-if test -f $(cmt_local_TrackFitter_python_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitter_python_makefile) TrackFitter_pythonclean; \
	fi
	$(echo) "(constituents.make) TrackFitter_pythonclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitter_python_makefile) TrackFitter_pythonclean

##	  /bin/rm -f $(cmt_local_TrackFitter_python_makefile) $(bin)TrackFitter_python_dependencies.make

install :: TrackFitter_pythoninstall

TrackFitter_pythoninstall :: $(TrackFitter_python_dependencies) $(cmt_local_TrackFitter_python_makefile)
	$(echo) "(constituents.make) Starting install TrackFitter_python"
	@-$(MAKE) -f $(cmt_local_TrackFitter_python_makefile) install
	$(echo) "(constituents.make) install TrackFitter_python done"

uninstall :: TrackFitter_pythonuninstall

$(foreach d,$(TrackFitter_python_dependencies),$(eval $(d)uninstall_dependencies += TrackFitter_pythonuninstall))

TrackFitter_pythonuninstall :: $(TrackFitter_pythonuninstall_dependencies) $(cmt_local_TrackFitter_python_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitter_python"
	@$(MAKE) -f $(cmt_local_TrackFitter_python_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitter_python done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitter_python"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitter_python done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitterGenConfUser_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterGenConfUser_has_target_tag

#cmt_local_tagfile_TrackFitterGenConfUser = $(TrackFitter_tag)_TrackFitterGenConfUser.make
cmt_local_tagfile_TrackFitterGenConfUser = $(bin)$(TrackFitter_tag)_TrackFitterGenConfUser.make
cmt_local_setup_TrackFitterGenConfUser = $(bin)setup_TrackFitterGenConfUser$$$$.make
cmt_final_setup_TrackFitterGenConfUser = $(bin)setup_TrackFitterGenConfUser.make
#cmt_final_setup_TrackFitterGenConfUser = $(bin)TrackFitter_TrackFitterGenConfUsersetup.make
cmt_local_TrackFitterGenConfUser_makefile = $(bin)TrackFitterGenConfUser.make

TrackFitterGenConfUser_extratags = -tag_add=target_TrackFitterGenConfUser

#$(cmt_local_tagfile_TrackFitterGenConfUser) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterGenConfUser) ::
else
$(cmt_local_tagfile_TrackFitterGenConfUser) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterGenConfUser); then /bin/rm -f $(cmt_local_tagfile_TrackFitterGenConfUser); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterGenConfUser_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterGenConfUser)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterGenConfUser)"; \
	  test ! -f $(cmt_local_setup_TrackFitterGenConfUser) || \rm -f $(cmt_local_setup_TrackFitterGenConfUser); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterGenConfUser)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterGenConfUser_extratags) show setup >$(cmt_local_setup_TrackFitterGenConfUser) && \
	  if [ -f $(cmt_final_setup_TrackFitterGenConfUser) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterGenConfUser) $(cmt_local_setup_TrackFitterGenConfUser); then \
	    \rm $(cmt_local_setup_TrackFitterGenConfUser); else \
	    \mv -f $(cmt_local_setup_TrackFitterGenConfUser) $(cmt_final_setup_TrackFitterGenConfUser); fi

else

#cmt_local_tagfile_TrackFitterGenConfUser = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterGenConfUser = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterGenConfUser = $(bin)setup.make
#cmt_final_setup_TrackFitterGenConfUser = $(bin)TrackFittersetup.make
cmt_local_TrackFitterGenConfUser_makefile = $(bin)TrackFitterGenConfUser.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterGenConfUserdirs :
	@if test ! -d $(bin)TrackFitterGenConfUser; then $(mkdir) -p $(bin)TrackFitterGenConfUser; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterGenConfUser
else
TrackFitterGenConfUserdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterGenConfUserdirs ::
#	@if test ! -d $(bin)TrackFitterGenConfUser; then $(mkdir) -p $(bin)TrackFitterGenConfUser; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterGenConfUser
#
#$(cmt_local_TrackFitterGenConfUser_makefile) :: $(TrackFitterGenConfUser_dependencies) $(cmt_local_tagfile_TrackFitterGenConfUser) build_library_links dirs TrackFitterGenConfUserdirs
#else
#$(cmt_local_TrackFitterGenConfUser_makefile) :: $(TrackFitterGenConfUser_dependencies) $(cmt_local_tagfile_TrackFitterGenConfUser) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterGenConfUser_makefile) :: $(cmt_local_tagfile_TrackFitterGenConfUser)
#endif

makefiles : $(cmt_local_TrackFitterGenConfUser_makefile)

ifndef QUICK
$(cmt_local_TrackFitterGenConfUser_makefile) : $(TrackFitterGenConfUser_dependencies) $(cmt_local_tagfile_TrackFitterGenConfUser) build_library_links
else
$(cmt_local_TrackFitterGenConfUser_makefile) : $(cmt_local_tagfile_TrackFitterGenConfUser)
endif
	$(echo) "(constituents.make) Building TrackFitterGenConfUser.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterGenConfUser_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterGenConfUser_makefile) TrackFitterGenConfUser

TrackFitterGenConfUser :: $(TrackFitterGenConfUser_dependencies) $(cmt_local_TrackFitterGenConfUser_makefile) dirs TrackFitterGenConfUserdirs
	$(echo) "(constituents.make) Creating TrackFitterGenConfUser${lock_suffix} and Starting TrackFitterGenConfUser"
	@${lock_command} TrackFitterGenConfUser${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterGenConfUser${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterGenConfUser_makefile) TrackFitterGenConfUser; \
	  retval=$$?; ${unlock_command} TrackFitterGenConfUser${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterGenConfUser done"

clean :: TrackFitterGenConfUserclean

TrackFitterGenConfUserclean :: $(TrackFitterGenConfUserclean_dependencies) ##$(cmt_local_TrackFitterGenConfUser_makefile)
	$(echo) "(constituents.make) Starting TrackFitterGenConfUserclean"
	@-if test -f $(cmt_local_TrackFitterGenConfUser_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterGenConfUser_makefile) TrackFitterGenConfUserclean; \
	fi
	$(echo) "(constituents.make) TrackFitterGenConfUserclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterGenConfUser_makefile) TrackFitterGenConfUserclean

##	  /bin/rm -f $(cmt_local_TrackFitterGenConfUser_makefile) $(bin)TrackFitterGenConfUser_dependencies.make

install :: TrackFitterGenConfUserinstall

TrackFitterGenConfUserinstall :: $(TrackFitterGenConfUser_dependencies) $(cmt_local_TrackFitterGenConfUser_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterGenConfUser"
	@-$(MAKE) -f $(cmt_local_TrackFitterGenConfUser_makefile) install
	$(echo) "(constituents.make) install TrackFitterGenConfUser done"

uninstall :: TrackFitterGenConfUseruninstall

$(foreach d,$(TrackFitterGenConfUser_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterGenConfUseruninstall))

TrackFitterGenConfUseruninstall :: $(TrackFitterGenConfUseruninstall_dependencies) $(cmt_local_TrackFitterGenConfUser_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterGenConfUser"
	@$(MAKE) -f $(cmt_local_TrackFitterGenConfUser_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterGenConfUser done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterGenConfUser"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterGenConfUser done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TrackFitterConfUserDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TrackFitterConfUserDbMerge_has_target_tag

#cmt_local_tagfile_TrackFitterConfUserDbMerge = $(TrackFitter_tag)_TrackFitterConfUserDbMerge.make
cmt_local_tagfile_TrackFitterConfUserDbMerge = $(bin)$(TrackFitter_tag)_TrackFitterConfUserDbMerge.make
cmt_local_setup_TrackFitterConfUserDbMerge = $(bin)setup_TrackFitterConfUserDbMerge$$$$.make
cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)setup_TrackFitterConfUserDbMerge.make
#cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)TrackFitter_TrackFitterConfUserDbMergesetup.make
cmt_local_TrackFitterConfUserDbMerge_makefile = $(bin)TrackFitterConfUserDbMerge.make

TrackFitterConfUserDbMerge_extratags = -tag_add=target_TrackFitterConfUserDbMerge

#$(cmt_local_tagfile_TrackFitterConfUserDbMerge) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TrackFitterConfUserDbMerge) ::
else
$(cmt_local_tagfile_TrackFitterConfUserDbMerge) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TrackFitterConfUserDbMerge); then /bin/rm -f $(cmt_local_tagfile_TrackFitterConfUserDbMerge); fi ; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfUserDbMerge_extratags) build tag_makefile >>$(cmt_local_tagfile_TrackFitterConfUserDbMerge)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TrackFitterConfUserDbMerge)"; \
	  test ! -f $(cmt_local_setup_TrackFitterConfUserDbMerge) || \rm -f $(cmt_local_setup_TrackFitterConfUserDbMerge); \
	  trap '\rm -f $(cmt_local_setup_TrackFitterConfUserDbMerge)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfUserDbMerge_extratags) show setup >$(cmt_local_setup_TrackFitterConfUserDbMerge) && \
	  if [ -f $(cmt_final_setup_TrackFitterConfUserDbMerge) ] && \
	    \cmp -s $(cmt_final_setup_TrackFitterConfUserDbMerge) $(cmt_local_setup_TrackFitterConfUserDbMerge); then \
	    \rm $(cmt_local_setup_TrackFitterConfUserDbMerge); else \
	    \mv -f $(cmt_local_setup_TrackFitterConfUserDbMerge) $(cmt_final_setup_TrackFitterConfUserDbMerge); fi

else

#cmt_local_tagfile_TrackFitterConfUserDbMerge = $(TrackFitter_tag).make
cmt_local_tagfile_TrackFitterConfUserDbMerge = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)setup.make
#cmt_final_setup_TrackFitterConfUserDbMerge = $(bin)TrackFittersetup.make
cmt_local_TrackFitterConfUserDbMerge_makefile = $(bin)TrackFitterConfUserDbMerge.make

endif

ifdef STRUCTURED_OUTPUT
TrackFitterConfUserDbMergedirs :
	@if test ! -d $(bin)TrackFitterConfUserDbMerge; then $(mkdir) -p $(bin)TrackFitterConfUserDbMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConfUserDbMerge
else
TrackFitterConfUserDbMergedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TrackFitterConfUserDbMergedirs ::
#	@if test ! -d $(bin)TrackFitterConfUserDbMerge; then $(mkdir) -p $(bin)TrackFitterConfUserDbMerge; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TrackFitterConfUserDbMerge
#
#$(cmt_local_TrackFitterConfUserDbMerge_makefile) :: $(TrackFitterConfUserDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfUserDbMerge) build_library_links dirs TrackFitterConfUserDbMergedirs
#else
#$(cmt_local_TrackFitterConfUserDbMerge_makefile) :: $(TrackFitterConfUserDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfUserDbMerge) build_library_links dirs
#endif
#else
#$(cmt_local_TrackFitterConfUserDbMerge_makefile) :: $(cmt_local_tagfile_TrackFitterConfUserDbMerge)
#endif

makefiles : $(cmt_local_TrackFitterConfUserDbMerge_makefile)

ifndef QUICK
$(cmt_local_TrackFitterConfUserDbMerge_makefile) : $(TrackFitterConfUserDbMerge_dependencies) $(cmt_local_tagfile_TrackFitterConfUserDbMerge) build_library_links
else
$(cmt_local_TrackFitterConfUserDbMerge_makefile) : $(cmt_local_tagfile_TrackFitterConfUserDbMerge)
endif
	$(echo) "(constituents.make) Building TrackFitterConfUserDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(TrackFitterConfUserDbMerge_extratags) build constituent_makefile -out=$(cmt_local_TrackFitterConfUserDbMerge_makefile) TrackFitterConfUserDbMerge

TrackFitterConfUserDbMerge :: $(TrackFitterConfUserDbMerge_dependencies) $(cmt_local_TrackFitterConfUserDbMerge_makefile) dirs TrackFitterConfUserDbMergedirs
	$(echo) "(constituents.make) Creating TrackFitterConfUserDbMerge${lock_suffix} and Starting TrackFitterConfUserDbMerge"
	@${lock_command} TrackFitterConfUserDbMerge${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TrackFitterConfUserDbMerge${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) TrackFitterConfUserDbMerge; \
	  retval=$$?; ${unlock_command} TrackFitterConfUserDbMerge${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TrackFitterConfUserDbMerge done"

clean :: TrackFitterConfUserDbMergeclean

TrackFitterConfUserDbMergeclean :: $(TrackFitterConfUserDbMergeclean_dependencies) ##$(cmt_local_TrackFitterConfUserDbMerge_makefile)
	$(echo) "(constituents.make) Starting TrackFitterConfUserDbMergeclean"
	@-if test -f $(cmt_local_TrackFitterConfUserDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) TrackFitterConfUserDbMergeclean; \
	fi
	$(echo) "(constituents.make) TrackFitterConfUserDbMergeclean done"
#	@-$(MAKE) -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) TrackFitterConfUserDbMergeclean

##	  /bin/rm -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) $(bin)TrackFitterConfUserDbMerge_dependencies.make

install :: TrackFitterConfUserDbMergeinstall

TrackFitterConfUserDbMergeinstall :: $(TrackFitterConfUserDbMerge_dependencies) $(cmt_local_TrackFitterConfUserDbMerge_makefile)
	$(echo) "(constituents.make) Starting install TrackFitterConfUserDbMerge"
	@-$(MAKE) -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) install
	$(echo) "(constituents.make) install TrackFitterConfUserDbMerge done"

uninstall :: TrackFitterConfUserDbMergeuninstall

$(foreach d,$(TrackFitterConfUserDbMerge_dependencies),$(eval $(d)uninstall_dependencies += TrackFitterConfUserDbMergeuninstall))

TrackFitterConfUserDbMergeuninstall :: $(TrackFitterConfUserDbMergeuninstall_dependencies) $(cmt_local_TrackFitterConfUserDbMerge_makefile)
	$(echo) "(constituents.make) Starting uninstall TrackFitterConfUserDbMerge"
	@$(MAKE) -f $(cmt_local_TrackFitterConfUserDbMerge_makefile) uninstall
	$(echo) "(constituents.make) uninstall TrackFitterConfUserDbMerge done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TrackFitterConfUserDbMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TrackFitterConfUserDbMerge done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(TrackFitter_tag)_make.make
cmt_local_tagfile_make = $(bin)$(TrackFitter_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)TrackFitter_makesetup.make
cmt_local_make_makefile = $(bin)make.make

make_extratags = -tag_add=target_make

#$(cmt_local_tagfile_make) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_make) ::
else
$(cmt_local_tagfile_make) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_make); then /bin/rm -f $(cmt_local_tagfile_make); fi ; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build tag_makefile >>$(cmt_local_tagfile_make)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_make)"; \
	  test ! -f $(cmt_local_setup_make) || \rm -f $(cmt_local_setup_make); \
	  trap '\rm -f $(cmt_local_setup_make)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) show setup >$(cmt_local_setup_make) && \
	  if [ -f $(cmt_final_setup_make) ] && \
	    \cmp -s $(cmt_final_setup_make) $(cmt_local_setup_make); then \
	    \rm $(cmt_local_setup_make); else \
	    \mv -f $(cmt_local_setup_make) $(cmt_final_setup_make); fi

else

#cmt_local_tagfile_make = $(TrackFitter_tag).make
cmt_local_tagfile_make = $(bin)$(TrackFitter_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)TrackFittersetup.make
cmt_local_make_makefile = $(bin)make.make

endif

ifdef STRUCTURED_OUTPUT
makedirs :
	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)make
else
makedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# makedirs ::
#	@if test ! -d $(bin)make; then $(mkdir) -p $(bin)make; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)make
#
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs makedirs
#else
#$(cmt_local_make_makefile) :: $(make_dependencies) $(cmt_local_tagfile_make) build_library_links dirs
#endif
#else
#$(cmt_local_make_makefile) :: $(cmt_local_tagfile_make)
#endif

makefiles : $(cmt_local_make_makefile)

ifndef QUICK
$(cmt_local_make_makefile) : $(make_dependencies) $(cmt_local_tagfile_make) build_library_links
else
$(cmt_local_make_makefile) : $(cmt_local_tagfile_make)
endif
	$(echo) "(constituents.make) Building make.make"; \
	  $(cmtexe) -tag=$(tags) $(make_extratags) build constituent_makefile -out=$(cmt_local_make_makefile) make

make :: $(make_dependencies) $(cmt_local_make_makefile) dirs makedirs
	$(echo) "(constituents.make) Creating make${lock_suffix} and Starting make"
	@${lock_command} make${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} make${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_make_makefile) make; \
	  retval=$$?; ${unlock_command} make${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) make done"

clean :: makeclean

makeclean :: $(makeclean_dependencies) ##$(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting makeclean"
	@-if test -f $(cmt_local_make_makefile); then \
	  $(MAKE) -f $(cmt_local_make_makefile) makeclean; \
	fi
	$(echo) "(constituents.make) makeclean done"
#	@-$(MAKE) -f $(cmt_local_make_makefile) makeclean

##	  /bin/rm -f $(cmt_local_make_makefile) $(bin)make_dependencies.make

install :: makeinstall

makeinstall :: $(make_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting install make"
	@-$(MAKE) -f $(cmt_local_make_makefile) install
	$(echo) "(constituents.make) install make done"

uninstall :: makeuninstall

$(foreach d,$(make_dependencies),$(eval $(d)uninstall_dependencies += makeuninstall))

makeuninstall :: $(makeuninstall_dependencies) $(cmt_local_make_makefile)
	$(echo) "(constituents.make) Starting uninstall make"
	@$(MAKE) -f $(cmt_local_make_makefile) uninstall
	$(echo) "(constituents.make) uninstall make done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ make"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ make done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_CompilePython_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_CompilePython_has_target_tag

#cmt_local_tagfile_CompilePython = $(TrackFitter_tag)_CompilePython.make
cmt_local_tagfile_CompilePython = $(bin)$(TrackFitter_tag)_CompilePython.make
cmt_local_setup_CompilePython = $(bin)setup_CompilePython$$$$.make
cmt_final_setup_CompilePython = $(bin)setup_CompilePython.make
#cmt_final_setup_CompilePython = $(bin)TrackFitter_CompilePythonsetup.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make

CompilePython_extratags = -tag_add=target_CompilePython

#$(cmt_local_tagfile_CompilePython) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_CompilePython) ::
else
$(cmt_local_tagfile_CompilePython) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_CompilePython); then /bin/rm -f $(cmt_local_tagfile_CompilePython); fi ; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build tag_makefile >>$(cmt_local_tagfile_CompilePython)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_CompilePython)"; \
	  test ! -f $(cmt_local_setup_CompilePython) || \rm -f $(cmt_local_setup_CompilePython); \
	  trap '\rm -f $(cmt_local_setup_CompilePython)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) show setup >$(cmt_local_setup_CompilePython) && \
	  if [ -f $(cmt_final_setup_CompilePython) ] && \
	    \cmp -s $(cmt_final_setup_CompilePython) $(cmt_local_setup_CompilePython); then \
	    \rm $(cmt_local_setup_CompilePython); else \
	    \mv -f $(cmt_local_setup_CompilePython) $(cmt_final_setup_CompilePython); fi

else

#cmt_local_tagfile_CompilePython = $(TrackFitter_tag).make
cmt_local_tagfile_CompilePython = $(bin)$(TrackFitter_tag).make
cmt_final_setup_CompilePython = $(bin)setup.make
#cmt_final_setup_CompilePython = $(bin)TrackFittersetup.make
cmt_local_CompilePython_makefile = $(bin)CompilePython.make

endif

ifdef STRUCTURED_OUTPUT
CompilePythondirs :
	@if test ! -d $(bin)CompilePython; then $(mkdir) -p $(bin)CompilePython; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)CompilePython
else
CompilePythondirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# CompilePythondirs ::
#	@if test ! -d $(bin)CompilePython; then $(mkdir) -p $(bin)CompilePython; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)CompilePython
#
#$(cmt_local_CompilePython_makefile) :: $(CompilePython_dependencies) $(cmt_local_tagfile_CompilePython) build_library_links dirs CompilePythondirs
#else
#$(cmt_local_CompilePython_makefile) :: $(CompilePython_dependencies) $(cmt_local_tagfile_CompilePython) build_library_links dirs
#endif
#else
#$(cmt_local_CompilePython_makefile) :: $(cmt_local_tagfile_CompilePython)
#endif

makefiles : $(cmt_local_CompilePython_makefile)

ifndef QUICK
$(cmt_local_CompilePython_makefile) : $(CompilePython_dependencies) $(cmt_local_tagfile_CompilePython) build_library_links
else
$(cmt_local_CompilePython_makefile) : $(cmt_local_tagfile_CompilePython)
endif
	$(echo) "(constituents.make) Building CompilePython.make"; \
	  $(cmtexe) -tag=$(tags) $(CompilePython_extratags) build constituent_makefile -out=$(cmt_local_CompilePython_makefile) CompilePython

CompilePython :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile) dirs CompilePythondirs
	$(echo) "(constituents.make) Creating CompilePython${lock_suffix} and Starting CompilePython"
	@${lock_command} CompilePython${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} CompilePython${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePython; \
	  retval=$$?; ${unlock_command} CompilePython${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) CompilePython done"

clean :: CompilePythonclean

CompilePythonclean :: $(CompilePythonclean_dependencies) ##$(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting CompilePythonclean"
	@-if test -f $(cmt_local_CompilePython_makefile); then \
	  $(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePythonclean; \
	fi
	$(echo) "(constituents.make) CompilePythonclean done"
#	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) CompilePythonclean

##	  /bin/rm -f $(cmt_local_CompilePython_makefile) $(bin)CompilePython_dependencies.make

install :: CompilePythoninstall

CompilePythoninstall :: $(CompilePython_dependencies) $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting install CompilePython"
	@-$(MAKE) -f $(cmt_local_CompilePython_makefile) install
	$(echo) "(constituents.make) install CompilePython done"

uninstall :: CompilePythonuninstall

$(foreach d,$(CompilePython_dependencies),$(eval $(d)uninstall_dependencies += CompilePythonuninstall))

CompilePythonuninstall :: $(CompilePythonuninstall_dependencies) $(cmt_local_CompilePython_makefile)
	$(echo) "(constituents.make) Starting uninstall CompilePython"
	@$(MAKE) -f $(cmt_local_CompilePython_makefile) uninstall
	$(echo) "(constituents.make) uninstall CompilePython done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ CompilePython"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ CompilePython done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_qmtest_run_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_qmtest_run_has_target_tag

#cmt_local_tagfile_qmtest_run = $(TrackFitter_tag)_qmtest_run.make
cmt_local_tagfile_qmtest_run = $(bin)$(TrackFitter_tag)_qmtest_run.make
cmt_local_setup_qmtest_run = $(bin)setup_qmtest_run$$$$.make
cmt_final_setup_qmtest_run = $(bin)setup_qmtest_run.make
#cmt_final_setup_qmtest_run = $(bin)TrackFitter_qmtest_runsetup.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make

qmtest_run_extratags = -tag_add=target_qmtest_run

#$(cmt_local_tagfile_qmtest_run) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_qmtest_run) ::
else
$(cmt_local_tagfile_qmtest_run) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_qmtest_run); then /bin/rm -f $(cmt_local_tagfile_qmtest_run); fi ; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build tag_makefile >>$(cmt_local_tagfile_qmtest_run)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_qmtest_run)"; \
	  test ! -f $(cmt_local_setup_qmtest_run) || \rm -f $(cmt_local_setup_qmtest_run); \
	  trap '\rm -f $(cmt_local_setup_qmtest_run)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) show setup >$(cmt_local_setup_qmtest_run) && \
	  if [ -f $(cmt_final_setup_qmtest_run) ] && \
	    \cmp -s $(cmt_final_setup_qmtest_run) $(cmt_local_setup_qmtest_run); then \
	    \rm $(cmt_local_setup_qmtest_run); else \
	    \mv -f $(cmt_local_setup_qmtest_run) $(cmt_final_setup_qmtest_run); fi

else

#cmt_local_tagfile_qmtest_run = $(TrackFitter_tag).make
cmt_local_tagfile_qmtest_run = $(bin)$(TrackFitter_tag).make
cmt_final_setup_qmtest_run = $(bin)setup.make
#cmt_final_setup_qmtest_run = $(bin)TrackFittersetup.make
cmt_local_qmtest_run_makefile = $(bin)qmtest_run.make

endif

ifdef STRUCTURED_OUTPUT
qmtest_rundirs :
	@if test ! -d $(bin)qmtest_run; then $(mkdir) -p $(bin)qmtest_run; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_run
else
qmtest_rundirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# qmtest_rundirs ::
#	@if test ! -d $(bin)qmtest_run; then $(mkdir) -p $(bin)qmtest_run; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_run
#
#$(cmt_local_qmtest_run_makefile) :: $(qmtest_run_dependencies) $(cmt_local_tagfile_qmtest_run) build_library_links dirs qmtest_rundirs
#else
#$(cmt_local_qmtest_run_makefile) :: $(qmtest_run_dependencies) $(cmt_local_tagfile_qmtest_run) build_library_links dirs
#endif
#else
#$(cmt_local_qmtest_run_makefile) :: $(cmt_local_tagfile_qmtest_run)
#endif

makefiles : $(cmt_local_qmtest_run_makefile)

ifndef QUICK
$(cmt_local_qmtest_run_makefile) : $(qmtest_run_dependencies) $(cmt_local_tagfile_qmtest_run) build_library_links
else
$(cmt_local_qmtest_run_makefile) : $(cmt_local_tagfile_qmtest_run)
endif
	$(echo) "(constituents.make) Building qmtest_run.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_run_extratags) build constituent_makefile -out=$(cmt_local_qmtest_run_makefile) qmtest_run

qmtest_run :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile) dirs qmtest_rundirs
	$(echo) "(constituents.make) Creating qmtest_run${lock_suffix} and Starting qmtest_run"
	@${lock_command} qmtest_run${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} qmtest_run${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_run; \
	  retval=$$?; ${unlock_command} qmtest_run${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) qmtest_run done"

clean :: qmtest_runclean

qmtest_runclean :: $(qmtest_runclean_dependencies) ##$(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting qmtest_runclean"
	@-if test -f $(cmt_local_qmtest_run_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_runclean; \
	fi
	$(echo) "(constituents.make) qmtest_runclean done"
#	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) qmtest_runclean

##	  /bin/rm -f $(cmt_local_qmtest_run_makefile) $(bin)qmtest_run_dependencies.make

install :: qmtest_runinstall

qmtest_runinstall :: $(qmtest_run_dependencies) $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting install qmtest_run"
	@-$(MAKE) -f $(cmt_local_qmtest_run_makefile) install
	$(echo) "(constituents.make) install qmtest_run done"

uninstall :: qmtest_rununinstall

$(foreach d,$(qmtest_run_dependencies),$(eval $(d)uninstall_dependencies += qmtest_rununinstall))

qmtest_rununinstall :: $(qmtest_rununinstall_dependencies) $(cmt_local_qmtest_run_makefile)
	$(echo) "(constituents.make) Starting uninstall qmtest_run"
	@$(MAKE) -f $(cmt_local_qmtest_run_makefile) uninstall
	$(echo) "(constituents.make) uninstall qmtest_run done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_run"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_run done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_qmtest_summarize_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_qmtest_summarize_has_target_tag

#cmt_local_tagfile_qmtest_summarize = $(TrackFitter_tag)_qmtest_summarize.make
cmt_local_tagfile_qmtest_summarize = $(bin)$(TrackFitter_tag)_qmtest_summarize.make
cmt_local_setup_qmtest_summarize = $(bin)setup_qmtest_summarize$$$$.make
cmt_final_setup_qmtest_summarize = $(bin)setup_qmtest_summarize.make
#cmt_final_setup_qmtest_summarize = $(bin)TrackFitter_qmtest_summarizesetup.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make

qmtest_summarize_extratags = -tag_add=target_qmtest_summarize

#$(cmt_local_tagfile_qmtest_summarize) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_qmtest_summarize) ::
else
$(cmt_local_tagfile_qmtest_summarize) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_qmtest_summarize); then /bin/rm -f $(cmt_local_tagfile_qmtest_summarize); fi ; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build tag_makefile >>$(cmt_local_tagfile_qmtest_summarize)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_qmtest_summarize)"; \
	  test ! -f $(cmt_local_setup_qmtest_summarize) || \rm -f $(cmt_local_setup_qmtest_summarize); \
	  trap '\rm -f $(cmt_local_setup_qmtest_summarize)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) show setup >$(cmt_local_setup_qmtest_summarize) && \
	  if [ -f $(cmt_final_setup_qmtest_summarize) ] && \
	    \cmp -s $(cmt_final_setup_qmtest_summarize) $(cmt_local_setup_qmtest_summarize); then \
	    \rm $(cmt_local_setup_qmtest_summarize); else \
	    \mv -f $(cmt_local_setup_qmtest_summarize) $(cmt_final_setup_qmtest_summarize); fi

else

#cmt_local_tagfile_qmtest_summarize = $(TrackFitter_tag).make
cmt_local_tagfile_qmtest_summarize = $(bin)$(TrackFitter_tag).make
cmt_final_setup_qmtest_summarize = $(bin)setup.make
#cmt_final_setup_qmtest_summarize = $(bin)TrackFittersetup.make
cmt_local_qmtest_summarize_makefile = $(bin)qmtest_summarize.make

endif

ifdef STRUCTURED_OUTPUT
qmtest_summarizedirs :
	@if test ! -d $(bin)qmtest_summarize; then $(mkdir) -p $(bin)qmtest_summarize; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_summarize
else
qmtest_summarizedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# qmtest_summarizedirs ::
#	@if test ! -d $(bin)qmtest_summarize; then $(mkdir) -p $(bin)qmtest_summarize; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)qmtest_summarize
#
#$(cmt_local_qmtest_summarize_makefile) :: $(qmtest_summarize_dependencies) $(cmt_local_tagfile_qmtest_summarize) build_library_links dirs qmtest_summarizedirs
#else
#$(cmt_local_qmtest_summarize_makefile) :: $(qmtest_summarize_dependencies) $(cmt_local_tagfile_qmtest_summarize) build_library_links dirs
#endif
#else
#$(cmt_local_qmtest_summarize_makefile) :: $(cmt_local_tagfile_qmtest_summarize)
#endif

makefiles : $(cmt_local_qmtest_summarize_makefile)

ifndef QUICK
$(cmt_local_qmtest_summarize_makefile) : $(qmtest_summarize_dependencies) $(cmt_local_tagfile_qmtest_summarize) build_library_links
else
$(cmt_local_qmtest_summarize_makefile) : $(cmt_local_tagfile_qmtest_summarize)
endif
	$(echo) "(constituents.make) Building qmtest_summarize.make"; \
	  $(cmtexe) -tag=$(tags) $(qmtest_summarize_extratags) build constituent_makefile -out=$(cmt_local_qmtest_summarize_makefile) qmtest_summarize

qmtest_summarize :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile) dirs qmtest_summarizedirs
	$(echo) "(constituents.make) Creating qmtest_summarize${lock_suffix} and Starting qmtest_summarize"
	@${lock_command} qmtest_summarize${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} qmtest_summarize${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarize; \
	  retval=$$?; ${unlock_command} qmtest_summarize${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) qmtest_summarize done"

clean :: qmtest_summarizeclean

qmtest_summarizeclean :: $(qmtest_summarizeclean_dependencies) ##$(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting qmtest_summarizeclean"
	@-if test -f $(cmt_local_qmtest_summarize_makefile); then \
	  $(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarizeclean; \
	fi
	$(echo) "(constituents.make) qmtest_summarizeclean done"
#	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) qmtest_summarizeclean

##	  /bin/rm -f $(cmt_local_qmtest_summarize_makefile) $(bin)qmtest_summarize_dependencies.make

install :: qmtest_summarizeinstall

qmtest_summarizeinstall :: $(qmtest_summarize_dependencies) $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting install qmtest_summarize"
	@-$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) install
	$(echo) "(constituents.make) install qmtest_summarize done"

uninstall :: qmtest_summarizeuninstall

$(foreach d,$(qmtest_summarize_dependencies),$(eval $(d)uninstall_dependencies += qmtest_summarizeuninstall))

qmtest_summarizeuninstall :: $(qmtest_summarizeuninstall_dependencies) $(cmt_local_qmtest_summarize_makefile)
	$(echo) "(constituents.make) Starting uninstall qmtest_summarize"
	@$(MAKE) -f $(cmt_local_qmtest_summarize_makefile) uninstall
	$(echo) "(constituents.make) uninstall qmtest_summarize done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ qmtest_summarize"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ qmtest_summarize done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TestPackage_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TestPackage_has_target_tag

#cmt_local_tagfile_TestPackage = $(TrackFitter_tag)_TestPackage.make
cmt_local_tagfile_TestPackage = $(bin)$(TrackFitter_tag)_TestPackage.make
cmt_local_setup_TestPackage = $(bin)setup_TestPackage$$$$.make
cmt_final_setup_TestPackage = $(bin)setup_TestPackage.make
#cmt_final_setup_TestPackage = $(bin)TrackFitter_TestPackagesetup.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make

TestPackage_extratags = -tag_add=target_TestPackage

#$(cmt_local_tagfile_TestPackage) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TestPackage) ::
else
$(cmt_local_tagfile_TestPackage) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TestPackage); then /bin/rm -f $(cmt_local_tagfile_TestPackage); fi ; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build tag_makefile >>$(cmt_local_tagfile_TestPackage)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TestPackage)"; \
	  test ! -f $(cmt_local_setup_TestPackage) || \rm -f $(cmt_local_setup_TestPackage); \
	  trap '\rm -f $(cmt_local_setup_TestPackage)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) show setup >$(cmt_local_setup_TestPackage) && \
	  if [ -f $(cmt_final_setup_TestPackage) ] && \
	    \cmp -s $(cmt_final_setup_TestPackage) $(cmt_local_setup_TestPackage); then \
	    \rm $(cmt_local_setup_TestPackage); else \
	    \mv -f $(cmt_local_setup_TestPackage) $(cmt_final_setup_TestPackage); fi

else

#cmt_local_tagfile_TestPackage = $(TrackFitter_tag).make
cmt_local_tagfile_TestPackage = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TestPackage = $(bin)setup.make
#cmt_final_setup_TestPackage = $(bin)TrackFittersetup.make
cmt_local_TestPackage_makefile = $(bin)TestPackage.make

endif

ifdef STRUCTURED_OUTPUT
TestPackagedirs :
	@if test ! -d $(bin)TestPackage; then $(mkdir) -p $(bin)TestPackage; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TestPackage
else
TestPackagedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TestPackagedirs ::
#	@if test ! -d $(bin)TestPackage; then $(mkdir) -p $(bin)TestPackage; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TestPackage
#
#$(cmt_local_TestPackage_makefile) :: $(TestPackage_dependencies) $(cmt_local_tagfile_TestPackage) build_library_links dirs TestPackagedirs
#else
#$(cmt_local_TestPackage_makefile) :: $(TestPackage_dependencies) $(cmt_local_tagfile_TestPackage) build_library_links dirs
#endif
#else
#$(cmt_local_TestPackage_makefile) :: $(cmt_local_tagfile_TestPackage)
#endif

makefiles : $(cmt_local_TestPackage_makefile)

ifndef QUICK
$(cmt_local_TestPackage_makefile) : $(TestPackage_dependencies) $(cmt_local_tagfile_TestPackage) build_library_links
else
$(cmt_local_TestPackage_makefile) : $(cmt_local_tagfile_TestPackage)
endif
	$(echo) "(constituents.make) Building TestPackage.make"; \
	  $(cmtexe) -tag=$(tags) $(TestPackage_extratags) build constituent_makefile -out=$(cmt_local_TestPackage_makefile) TestPackage

TestPackage :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile) dirs TestPackagedirs
	$(echo) "(constituents.make) Creating TestPackage${lock_suffix} and Starting TestPackage"
	@${lock_command} TestPackage${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TestPackage${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackage; \
	  retval=$$?; ${unlock_command} TestPackage${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TestPackage done"

clean :: TestPackageclean

TestPackageclean :: $(TestPackageclean_dependencies) ##$(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting TestPackageclean"
	@-if test -f $(cmt_local_TestPackage_makefile); then \
	  $(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackageclean; \
	fi
	$(echo) "(constituents.make) TestPackageclean done"
#	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) TestPackageclean

##	  /bin/rm -f $(cmt_local_TestPackage_makefile) $(bin)TestPackage_dependencies.make

install :: TestPackageinstall

TestPackageinstall :: $(TestPackage_dependencies) $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting install TestPackage"
	@-$(MAKE) -f $(cmt_local_TestPackage_makefile) install
	$(echo) "(constituents.make) install TestPackage done"

uninstall :: TestPackageuninstall

$(foreach d,$(TestPackage_dependencies),$(eval $(d)uninstall_dependencies += TestPackageuninstall))

TestPackageuninstall :: $(TestPackageuninstall_dependencies) $(cmt_local_TestPackage_makefile)
	$(echo) "(constituents.make) Starting uninstall TestPackage"
	@$(MAKE) -f $(cmt_local_TestPackage_makefile) uninstall
	$(echo) "(constituents.make) uninstall TestPackage done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestPackage"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestPackage done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_TestProject_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_TestProject_has_target_tag

#cmt_local_tagfile_TestProject = $(TrackFitter_tag)_TestProject.make
cmt_local_tagfile_TestProject = $(bin)$(TrackFitter_tag)_TestProject.make
cmt_local_setup_TestProject = $(bin)setup_TestProject$$$$.make
cmt_final_setup_TestProject = $(bin)setup_TestProject.make
#cmt_final_setup_TestProject = $(bin)TrackFitter_TestProjectsetup.make
cmt_local_TestProject_makefile = $(bin)TestProject.make

TestProject_extratags = -tag_add=target_TestProject

#$(cmt_local_tagfile_TestProject) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_TestProject) ::
else
$(cmt_local_tagfile_TestProject) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_TestProject); then /bin/rm -f $(cmt_local_tagfile_TestProject); fi ; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build tag_makefile >>$(cmt_local_tagfile_TestProject)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_TestProject)"; \
	  test ! -f $(cmt_local_setup_TestProject) || \rm -f $(cmt_local_setup_TestProject); \
	  trap '\rm -f $(cmt_local_setup_TestProject)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) show setup >$(cmt_local_setup_TestProject) && \
	  if [ -f $(cmt_final_setup_TestProject) ] && \
	    \cmp -s $(cmt_final_setup_TestProject) $(cmt_local_setup_TestProject); then \
	    \rm $(cmt_local_setup_TestProject); else \
	    \mv -f $(cmt_local_setup_TestProject) $(cmt_final_setup_TestProject); fi

else

#cmt_local_tagfile_TestProject = $(TrackFitter_tag).make
cmt_local_tagfile_TestProject = $(bin)$(TrackFitter_tag).make
cmt_final_setup_TestProject = $(bin)setup.make
#cmt_final_setup_TestProject = $(bin)TrackFittersetup.make
cmt_local_TestProject_makefile = $(bin)TestProject.make

endif

ifdef STRUCTURED_OUTPUT
TestProjectdirs :
	@if test ! -d $(bin)TestProject; then $(mkdir) -p $(bin)TestProject; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)TestProject
else
TestProjectdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# TestProjectdirs ::
#	@if test ! -d $(bin)TestProject; then $(mkdir) -p $(bin)TestProject; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)TestProject
#
#$(cmt_local_TestProject_makefile) :: $(TestProject_dependencies) $(cmt_local_tagfile_TestProject) build_library_links dirs TestProjectdirs
#else
#$(cmt_local_TestProject_makefile) :: $(TestProject_dependencies) $(cmt_local_tagfile_TestProject) build_library_links dirs
#endif
#else
#$(cmt_local_TestProject_makefile) :: $(cmt_local_tagfile_TestProject)
#endif

makefiles : $(cmt_local_TestProject_makefile)

ifndef QUICK
$(cmt_local_TestProject_makefile) : $(TestProject_dependencies) $(cmt_local_tagfile_TestProject) build_library_links
else
$(cmt_local_TestProject_makefile) : $(cmt_local_tagfile_TestProject)
endif
	$(echo) "(constituents.make) Building TestProject.make"; \
	  $(cmtexe) -tag=$(tags) $(TestProject_extratags) build constituent_makefile -out=$(cmt_local_TestProject_makefile) TestProject

TestProject :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile) dirs TestProjectdirs
	$(echo) "(constituents.make) Creating TestProject${lock_suffix} and Starting TestProject"
	@${lock_command} TestProject${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} TestProject${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) TestProject; \
	  retval=$$?; ${unlock_command} TestProject${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) TestProject done"

clean :: TestProjectclean

TestProjectclean :: $(TestProjectclean_dependencies) ##$(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting TestProjectclean"
	@-if test -f $(cmt_local_TestProject_makefile); then \
	  $(MAKE) -f $(cmt_local_TestProject_makefile) TestProjectclean; \
	fi
	$(echo) "(constituents.make) TestProjectclean done"
#	@-$(MAKE) -f $(cmt_local_TestProject_makefile) TestProjectclean

##	  /bin/rm -f $(cmt_local_TestProject_makefile) $(bin)TestProject_dependencies.make

install :: TestProjectinstall

TestProjectinstall :: $(TestProject_dependencies) $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting install TestProject"
	@-$(MAKE) -f $(cmt_local_TestProject_makefile) install
	$(echo) "(constituents.make) install TestProject done"

uninstall :: TestProjectuninstall

$(foreach d,$(TestProject_dependencies),$(eval $(d)uninstall_dependencies += TestProjectuninstall))

TestProjectuninstall :: $(TestProjectuninstall_dependencies) $(cmt_local_TestProject_makefile)
	$(echo) "(constituents.make) Starting uninstall TestProject"
	@$(MAKE) -f $(cmt_local_TestProject_makefile) uninstall
	$(echo) "(constituents.make) uninstall TestProject done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ TestProject"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ TestProject done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_new_rootsys_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_new_rootsys_has_target_tag

#cmt_local_tagfile_new_rootsys = $(TrackFitter_tag)_new_rootsys.make
cmt_local_tagfile_new_rootsys = $(bin)$(TrackFitter_tag)_new_rootsys.make
cmt_local_setup_new_rootsys = $(bin)setup_new_rootsys$$$$.make
cmt_final_setup_new_rootsys = $(bin)setup_new_rootsys.make
#cmt_final_setup_new_rootsys = $(bin)TrackFitter_new_rootsyssetup.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make

new_rootsys_extratags = -tag_add=target_new_rootsys

#$(cmt_local_tagfile_new_rootsys) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_new_rootsys) ::
else
$(cmt_local_tagfile_new_rootsys) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_new_rootsys); then /bin/rm -f $(cmt_local_tagfile_new_rootsys); fi ; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build tag_makefile >>$(cmt_local_tagfile_new_rootsys)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_new_rootsys)"; \
	  test ! -f $(cmt_local_setup_new_rootsys) || \rm -f $(cmt_local_setup_new_rootsys); \
	  trap '\rm -f $(cmt_local_setup_new_rootsys)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) show setup >$(cmt_local_setup_new_rootsys) && \
	  if [ -f $(cmt_final_setup_new_rootsys) ] && \
	    \cmp -s $(cmt_final_setup_new_rootsys) $(cmt_local_setup_new_rootsys); then \
	    \rm $(cmt_local_setup_new_rootsys); else \
	    \mv -f $(cmt_local_setup_new_rootsys) $(cmt_final_setup_new_rootsys); fi

else

#cmt_local_tagfile_new_rootsys = $(TrackFitter_tag).make
cmt_local_tagfile_new_rootsys = $(bin)$(TrackFitter_tag).make
cmt_final_setup_new_rootsys = $(bin)setup.make
#cmt_final_setup_new_rootsys = $(bin)TrackFittersetup.make
cmt_local_new_rootsys_makefile = $(bin)new_rootsys.make

endif

ifdef STRUCTURED_OUTPUT
new_rootsysdirs :
	@if test ! -d $(bin)new_rootsys; then $(mkdir) -p $(bin)new_rootsys; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)new_rootsys
else
new_rootsysdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# new_rootsysdirs ::
#	@if test ! -d $(bin)new_rootsys; then $(mkdir) -p $(bin)new_rootsys; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)new_rootsys
#
#$(cmt_local_new_rootsys_makefile) :: $(new_rootsys_dependencies) $(cmt_local_tagfile_new_rootsys) build_library_links dirs new_rootsysdirs
#else
#$(cmt_local_new_rootsys_makefile) :: $(new_rootsys_dependencies) $(cmt_local_tagfile_new_rootsys) build_library_links dirs
#endif
#else
#$(cmt_local_new_rootsys_makefile) :: $(cmt_local_tagfile_new_rootsys)
#endif

makefiles : $(cmt_local_new_rootsys_makefile)

ifndef QUICK
$(cmt_local_new_rootsys_makefile) : $(new_rootsys_dependencies) $(cmt_local_tagfile_new_rootsys) build_library_links
else
$(cmt_local_new_rootsys_makefile) : $(cmt_local_tagfile_new_rootsys)
endif
	$(echo) "(constituents.make) Building new_rootsys.make"; \
	  $(cmtexe) -tag=$(tags) $(new_rootsys_extratags) build constituent_makefile -out=$(cmt_local_new_rootsys_makefile) new_rootsys

new_rootsys :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile) dirs new_rootsysdirs
	$(echo) "(constituents.make) Creating new_rootsys${lock_suffix} and Starting new_rootsys"
	@${lock_command} new_rootsys${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} new_rootsys${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsys; \
	  retval=$$?; ${unlock_command} new_rootsys${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) new_rootsys done"

clean :: new_rootsysclean

new_rootsysclean :: $(new_rootsysclean_dependencies) ##$(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting new_rootsysclean"
	@-if test -f $(cmt_local_new_rootsys_makefile); then \
	  $(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsysclean; \
	fi
	$(echo) "(constituents.make) new_rootsysclean done"
#	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) new_rootsysclean

##	  /bin/rm -f $(cmt_local_new_rootsys_makefile) $(bin)new_rootsys_dependencies.make

install :: new_rootsysinstall

new_rootsysinstall :: $(new_rootsys_dependencies) $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting install new_rootsys"
	@-$(MAKE) -f $(cmt_local_new_rootsys_makefile) install
	$(echo) "(constituents.make) install new_rootsys done"

uninstall :: new_rootsysuninstall

$(foreach d,$(new_rootsys_dependencies),$(eval $(d)uninstall_dependencies += new_rootsysuninstall))

new_rootsysuninstall :: $(new_rootsysuninstall_dependencies) $(cmt_local_new_rootsys_makefile)
	$(echo) "(constituents.make) Starting uninstall new_rootsys"
	@$(MAKE) -f $(cmt_local_new_rootsys_makefile) uninstall
	$(echo) "(constituents.make) uninstall new_rootsys done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ new_rootsys"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ new_rootsys done"
endif

#-- end of constituent_lock ------
#-- start of constituents_trailer ------

clean :: remove_library_links

remove_library_links ::
	$(echo) "(constituents.make) Removing library links"; \
	  $(remove_library_links)

makefilesclean ::

###	@/bin/rm -f checkuses

###	/bin/rm -f *.make*

clean :: makefilesclean

binclean :: clean
	$(echo) "(constituents.make) Removing binary directory $(bin)"
	@if test ! "$(bin)" = "./"; then \
	  /bin/rm -rf $(bin); \
	fi

#-- end of constituents_trailer ------
