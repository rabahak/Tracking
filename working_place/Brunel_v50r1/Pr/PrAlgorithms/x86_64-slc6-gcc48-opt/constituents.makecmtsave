
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

PrAlgorithms_tag = $(tag)

#cmt_local_tagfile = $(PrAlgorithms_tag).make
cmt_local_tagfile = $(bin)$(PrAlgorithms_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)PrAlgorithmssetup.make
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

cmt_PrAlgorithms_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithms_has_target_tag

#cmt_local_tagfile_PrAlgorithms = $(PrAlgorithms_tag)_PrAlgorithms.make
cmt_local_tagfile_PrAlgorithms = $(bin)$(PrAlgorithms_tag)_PrAlgorithms.make
cmt_local_setup_PrAlgorithms = $(bin)setup_PrAlgorithms$$$$.make
cmt_final_setup_PrAlgorithms = $(bin)setup_PrAlgorithms.make
#cmt_final_setup_PrAlgorithms = $(bin)PrAlgorithms_PrAlgorithmssetup.make
cmt_local_PrAlgorithms_makefile = $(bin)PrAlgorithms.make

PrAlgorithms_extratags = -tag_add=target_PrAlgorithms

#$(cmt_local_tagfile_PrAlgorithms) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithms) ::
else
$(cmt_local_tagfile_PrAlgorithms) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithms); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithms); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithms)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithms)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithms) || \rm -f $(cmt_local_setup_PrAlgorithms); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithms)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_extratags) show setup >$(cmt_local_setup_PrAlgorithms) && \
	  if [ -f $(cmt_final_setup_PrAlgorithms) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithms) $(cmt_local_setup_PrAlgorithms); then \
	    \rm $(cmt_local_setup_PrAlgorithms); else \
	    \mv -f $(cmt_local_setup_PrAlgorithms) $(cmt_final_setup_PrAlgorithms); fi

else

#cmt_local_tagfile_PrAlgorithms = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithms = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithms = $(bin)setup.make
#cmt_final_setup_PrAlgorithms = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithms_makefile = $(bin)PrAlgorithms.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithmsdirs :
	@if test ! -d $(bin)PrAlgorithms; then $(mkdir) -p $(bin)PrAlgorithms; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithms
else
PrAlgorithmsdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithmsdirs ::
#	@if test ! -d $(bin)PrAlgorithms; then $(mkdir) -p $(bin)PrAlgorithms; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithms
#
#$(cmt_local_PrAlgorithms_makefile) :: $(PrAlgorithms_dependencies) $(cmt_local_tagfile_PrAlgorithms) build_library_links dirs PrAlgorithmsdirs
#else
#$(cmt_local_PrAlgorithms_makefile) :: $(PrAlgorithms_dependencies) $(cmt_local_tagfile_PrAlgorithms) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithms_makefile) :: $(cmt_local_tagfile_PrAlgorithms)
#endif

makefiles : $(cmt_local_PrAlgorithms_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithms_makefile) : $(PrAlgorithms_dependencies) $(cmt_local_tagfile_PrAlgorithms) build_library_links
else
$(cmt_local_PrAlgorithms_makefile) : $(cmt_local_tagfile_PrAlgorithms)
endif
	$(echo) "(constituents.make) Building PrAlgorithms.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithms_makefile) PrAlgorithms

PrAlgorithms :: $(PrAlgorithms_dependencies) $(cmt_local_PrAlgorithms_makefile) dirs PrAlgorithmsdirs
	$(echo) "(constituents.make) Starting PrAlgorithms"
	@$(MAKE) -f $(cmt_local_PrAlgorithms_makefile) PrAlgorithms
	$(echo) "(constituents.make) PrAlgorithms done"

clean :: PrAlgorithmsclean

PrAlgorithmsclean :: $(PrAlgorithmsclean_dependencies) ##$(cmt_local_PrAlgorithms_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithmsclean"
	@-if test -f $(cmt_local_PrAlgorithms_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithms_makefile) PrAlgorithmsclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithmsclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithms_makefile) PrAlgorithmsclean

##	  /bin/rm -f $(cmt_local_PrAlgorithms_makefile) $(bin)PrAlgorithms_dependencies.make

install :: PrAlgorithmsinstall

PrAlgorithmsinstall :: $(PrAlgorithms_dependencies) $(cmt_local_PrAlgorithms_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithms"
	@-$(MAKE) -f $(cmt_local_PrAlgorithms_makefile) install
	$(echo) "(constituents.make) install PrAlgorithms done"

uninstall :: PrAlgorithmsuninstall

$(foreach d,$(PrAlgorithms_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithmsuninstall))

PrAlgorithmsuninstall :: $(PrAlgorithmsuninstall_dependencies) $(cmt_local_PrAlgorithms_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithms"
	@$(MAKE) -f $(cmt_local_PrAlgorithms_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithms done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithms"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithms done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_PrAlgorithmsComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsComponentsList_has_target_tag

#cmt_local_tagfile_PrAlgorithmsComponentsList = $(PrAlgorithms_tag)_PrAlgorithmsComponentsList.make
cmt_local_tagfile_PrAlgorithmsComponentsList = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsComponentsList.make
cmt_local_setup_PrAlgorithmsComponentsList = $(bin)setup_PrAlgorithmsComponentsList$$$$.make
cmt_final_setup_PrAlgorithmsComponentsList = $(bin)setup_PrAlgorithmsComponentsList.make
#cmt_final_setup_PrAlgorithmsComponentsList = $(bin)PrAlgorithms_PrAlgorithmsComponentsListsetup.make
cmt_local_PrAlgorithmsComponentsList_makefile = $(bin)PrAlgorithmsComponentsList.make

PrAlgorithmsComponentsList_extratags = -tag_add=target_PrAlgorithmsComponentsList

#$(cmt_local_tagfile_PrAlgorithmsComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithmsComponentsList) ::
else
$(cmt_local_tagfile_PrAlgorithmsComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithmsComponentsList); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithmsComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithmsComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithmsComponentsList)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithmsComponentsList) || \rm -f $(cmt_local_setup_PrAlgorithmsComponentsList); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithmsComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsComponentsList_extratags) show setup >$(cmt_local_setup_PrAlgorithmsComponentsList) && \
	  if [ -f $(cmt_final_setup_PrAlgorithmsComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithmsComponentsList) $(cmt_local_setup_PrAlgorithmsComponentsList); then \
	    \rm $(cmt_local_setup_PrAlgorithmsComponentsList); else \
	    \mv -f $(cmt_local_setup_PrAlgorithmsComponentsList) $(cmt_final_setup_PrAlgorithmsComponentsList); fi

else

#cmt_local_tagfile_PrAlgorithmsComponentsList = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsComponentsList = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithmsComponentsList = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsComponentsList = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsComponentsList_makefile = $(bin)PrAlgorithmsComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithmsComponentsListdirs :
	@if test ! -d $(bin)PrAlgorithmsComponentsList; then $(mkdir) -p $(bin)PrAlgorithmsComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsComponentsList
else
PrAlgorithmsComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithmsComponentsListdirs ::
#	@if test ! -d $(bin)PrAlgorithmsComponentsList; then $(mkdir) -p $(bin)PrAlgorithmsComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsComponentsList
#
#$(cmt_local_PrAlgorithmsComponentsList_makefile) :: $(PrAlgorithmsComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsComponentsList) build_library_links dirs PrAlgorithmsComponentsListdirs
#else
#$(cmt_local_PrAlgorithmsComponentsList_makefile) :: $(PrAlgorithmsComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithmsComponentsList_makefile) :: $(cmt_local_tagfile_PrAlgorithmsComponentsList)
#endif

makefiles : $(cmt_local_PrAlgorithmsComponentsList_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithmsComponentsList_makefile) : $(PrAlgorithmsComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsComponentsList) build_library_links
else
$(cmt_local_PrAlgorithmsComponentsList_makefile) : $(cmt_local_tagfile_PrAlgorithmsComponentsList)
endif
	$(echo) "(constituents.make) Building PrAlgorithmsComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsComponentsList_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithmsComponentsList_makefile) PrAlgorithmsComponentsList

PrAlgorithmsComponentsList :: $(PrAlgorithmsComponentsList_dependencies) $(cmt_local_PrAlgorithmsComponentsList_makefile) dirs PrAlgorithmsComponentsListdirs
	$(echo) "(constituents.make) Creating PrAlgorithmsComponentsList${lock_suffix} and Starting PrAlgorithmsComponentsList"
	@${lock_command} PrAlgorithmsComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrAlgorithmsComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsComponentsList_makefile) PrAlgorithmsComponentsList; \
	  retval=$$?; ${unlock_command} PrAlgorithmsComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrAlgorithmsComponentsList done"

clean :: PrAlgorithmsComponentsListclean

PrAlgorithmsComponentsListclean :: $(PrAlgorithmsComponentsListclean_dependencies) ##$(cmt_local_PrAlgorithmsComponentsList_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithmsComponentsListclean"
	@-if test -f $(cmt_local_PrAlgorithmsComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsComponentsList_makefile) PrAlgorithmsComponentsListclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithmsComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithmsComponentsList_makefile) PrAlgorithmsComponentsListclean

##	  /bin/rm -f $(cmt_local_PrAlgorithmsComponentsList_makefile) $(bin)PrAlgorithmsComponentsList_dependencies.make

install :: PrAlgorithmsComponentsListinstall

PrAlgorithmsComponentsListinstall :: $(PrAlgorithmsComponentsList_dependencies) $(cmt_local_PrAlgorithmsComponentsList_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithmsComponentsList"
	@-$(MAKE) -f $(cmt_local_PrAlgorithmsComponentsList_makefile) install
	$(echo) "(constituents.make) install PrAlgorithmsComponentsList done"

uninstall :: PrAlgorithmsComponentsListuninstall

$(foreach d,$(PrAlgorithmsComponentsList_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithmsComponentsListuninstall))

PrAlgorithmsComponentsListuninstall :: $(PrAlgorithmsComponentsListuninstall_dependencies) $(cmt_local_PrAlgorithmsComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithmsComponentsList"
	@$(MAKE) -f $(cmt_local_PrAlgorithmsComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithmsComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithmsComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithmsComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_PrAlgorithmsMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsMergeComponentsList_has_target_tag

#cmt_local_tagfile_PrAlgorithmsMergeComponentsList = $(PrAlgorithms_tag)_PrAlgorithmsMergeComponentsList.make
cmt_local_tagfile_PrAlgorithmsMergeComponentsList = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsMergeComponentsList.make
cmt_local_setup_PrAlgorithmsMergeComponentsList = $(bin)setup_PrAlgorithmsMergeComponentsList$$$$.make
cmt_final_setup_PrAlgorithmsMergeComponentsList = $(bin)setup_PrAlgorithmsMergeComponentsList.make
#cmt_final_setup_PrAlgorithmsMergeComponentsList = $(bin)PrAlgorithms_PrAlgorithmsMergeComponentsListsetup.make
cmt_local_PrAlgorithmsMergeComponentsList_makefile = $(bin)PrAlgorithmsMergeComponentsList.make

PrAlgorithmsMergeComponentsList_extratags = -tag_add=target_PrAlgorithmsMergeComponentsList

#$(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) ::
else
$(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsMergeComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithmsMergeComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithmsMergeComponentsList)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithmsMergeComponentsList) || \rm -f $(cmt_local_setup_PrAlgorithmsMergeComponentsList); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithmsMergeComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsMergeComponentsList_extratags) show setup >$(cmt_local_setup_PrAlgorithmsMergeComponentsList) && \
	  if [ -f $(cmt_final_setup_PrAlgorithmsMergeComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithmsMergeComponentsList) $(cmt_local_setup_PrAlgorithmsMergeComponentsList); then \
	    \rm $(cmt_local_setup_PrAlgorithmsMergeComponentsList); else \
	    \mv -f $(cmt_local_setup_PrAlgorithmsMergeComponentsList) $(cmt_final_setup_PrAlgorithmsMergeComponentsList); fi

else

#cmt_local_tagfile_PrAlgorithmsMergeComponentsList = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsMergeComponentsList = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithmsMergeComponentsList = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsMergeComponentsList = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsMergeComponentsList_makefile = $(bin)PrAlgorithmsMergeComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithmsMergeComponentsListdirs :
	@if test ! -d $(bin)PrAlgorithmsMergeComponentsList; then $(mkdir) -p $(bin)PrAlgorithmsMergeComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsMergeComponentsList
else
PrAlgorithmsMergeComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithmsMergeComponentsListdirs ::
#	@if test ! -d $(bin)PrAlgorithmsMergeComponentsList; then $(mkdir) -p $(bin)PrAlgorithmsMergeComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsMergeComponentsList
#
#$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) :: $(PrAlgorithmsMergeComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) build_library_links dirs PrAlgorithmsMergeComponentsListdirs
#else
#$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) :: $(PrAlgorithmsMergeComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) :: $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList)
#endif

makefiles : $(cmt_local_PrAlgorithmsMergeComponentsList_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) : $(PrAlgorithmsMergeComponentsList_dependencies) $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList) build_library_links
else
$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) : $(cmt_local_tagfile_PrAlgorithmsMergeComponentsList)
endif
	$(echo) "(constituents.make) Building PrAlgorithmsMergeComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsMergeComponentsList_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithmsMergeComponentsList_makefile) PrAlgorithmsMergeComponentsList

PrAlgorithmsMergeComponentsList :: $(PrAlgorithmsMergeComponentsList_dependencies) $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) dirs PrAlgorithmsMergeComponentsListdirs
	$(echo) "(constituents.make) Creating PrAlgorithmsMergeComponentsList${lock_suffix} and Starting PrAlgorithmsMergeComponentsList"
	@${lock_command} PrAlgorithmsMergeComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrAlgorithmsMergeComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) PrAlgorithmsMergeComponentsList; \
	  retval=$$?; ${unlock_command} PrAlgorithmsMergeComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrAlgorithmsMergeComponentsList done"

clean :: PrAlgorithmsMergeComponentsListclean

PrAlgorithmsMergeComponentsListclean :: $(PrAlgorithmsMergeComponentsListclean_dependencies) ##$(cmt_local_PrAlgorithmsMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithmsMergeComponentsListclean"
	@-if test -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) PrAlgorithmsMergeComponentsListclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithmsMergeComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) PrAlgorithmsMergeComponentsListclean

##	  /bin/rm -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) $(bin)PrAlgorithmsMergeComponentsList_dependencies.make

install :: PrAlgorithmsMergeComponentsListinstall

PrAlgorithmsMergeComponentsListinstall :: $(PrAlgorithmsMergeComponentsList_dependencies) $(cmt_local_PrAlgorithmsMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithmsMergeComponentsList"
	@-$(MAKE) -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) install
	$(echo) "(constituents.make) install PrAlgorithmsMergeComponentsList done"

uninstall :: PrAlgorithmsMergeComponentsListuninstall

$(foreach d,$(PrAlgorithmsMergeComponentsList_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithmsMergeComponentsListuninstall))

PrAlgorithmsMergeComponentsListuninstall :: $(PrAlgorithmsMergeComponentsListuninstall_dependencies) $(cmt_local_PrAlgorithmsMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithmsMergeComponentsList"
	@$(MAKE) -f $(cmt_local_PrAlgorithmsMergeComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithmsMergeComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithmsMergeComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithmsMergeComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_PrAlgorithmsConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsConf_has_target_tag

#cmt_local_tagfile_PrAlgorithmsConf = $(PrAlgorithms_tag)_PrAlgorithmsConf.make
cmt_local_tagfile_PrAlgorithmsConf = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsConf.make
cmt_local_setup_PrAlgorithmsConf = $(bin)setup_PrAlgorithmsConf$$$$.make
cmt_final_setup_PrAlgorithmsConf = $(bin)setup_PrAlgorithmsConf.make
#cmt_final_setup_PrAlgorithmsConf = $(bin)PrAlgorithms_PrAlgorithmsConfsetup.make
cmt_local_PrAlgorithmsConf_makefile = $(bin)PrAlgorithmsConf.make

PrAlgorithmsConf_extratags = -tag_add=target_PrAlgorithmsConf

#$(cmt_local_tagfile_PrAlgorithmsConf) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithmsConf) ::
else
$(cmt_local_tagfile_PrAlgorithmsConf) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithmsConf); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithmsConf); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConf_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithmsConf)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithmsConf)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithmsConf) || \rm -f $(cmt_local_setup_PrAlgorithmsConf); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithmsConf)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConf_extratags) show setup >$(cmt_local_setup_PrAlgorithmsConf) && \
	  if [ -f $(cmt_final_setup_PrAlgorithmsConf) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithmsConf) $(cmt_local_setup_PrAlgorithmsConf); then \
	    \rm $(cmt_local_setup_PrAlgorithmsConf); else \
	    \mv -f $(cmt_local_setup_PrAlgorithmsConf) $(cmt_final_setup_PrAlgorithmsConf); fi

else

#cmt_local_tagfile_PrAlgorithmsConf = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsConf = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithmsConf = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsConf = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsConf_makefile = $(bin)PrAlgorithmsConf.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithmsConfdirs :
	@if test ! -d $(bin)PrAlgorithmsConf; then $(mkdir) -p $(bin)PrAlgorithmsConf; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsConf
else
PrAlgorithmsConfdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithmsConfdirs ::
#	@if test ! -d $(bin)PrAlgorithmsConf; then $(mkdir) -p $(bin)PrAlgorithmsConf; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsConf
#
#$(cmt_local_PrAlgorithmsConf_makefile) :: $(PrAlgorithmsConf_dependencies) $(cmt_local_tagfile_PrAlgorithmsConf) build_library_links dirs PrAlgorithmsConfdirs
#else
#$(cmt_local_PrAlgorithmsConf_makefile) :: $(PrAlgorithmsConf_dependencies) $(cmt_local_tagfile_PrAlgorithmsConf) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithmsConf_makefile) :: $(cmt_local_tagfile_PrAlgorithmsConf)
#endif

makefiles : $(cmt_local_PrAlgorithmsConf_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithmsConf_makefile) : $(PrAlgorithmsConf_dependencies) $(cmt_local_tagfile_PrAlgorithmsConf) build_library_links
else
$(cmt_local_PrAlgorithmsConf_makefile) : $(cmt_local_tagfile_PrAlgorithmsConf)
endif
	$(echo) "(constituents.make) Building PrAlgorithmsConf.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConf_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithmsConf_makefile) PrAlgorithmsConf

PrAlgorithmsConf :: $(PrAlgorithmsConf_dependencies) $(cmt_local_PrAlgorithmsConf_makefile) dirs PrAlgorithmsConfdirs
	$(echo) "(constituents.make) Creating PrAlgorithmsConf${lock_suffix} and Starting PrAlgorithmsConf"
	@${lock_command} PrAlgorithmsConf${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrAlgorithmsConf${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsConf_makefile) PrAlgorithmsConf; \
	  retval=$$?; ${unlock_command} PrAlgorithmsConf${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrAlgorithmsConf done"

clean :: PrAlgorithmsConfclean

PrAlgorithmsConfclean :: $(PrAlgorithmsConfclean_dependencies) ##$(cmt_local_PrAlgorithmsConf_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithmsConfclean"
	@-if test -f $(cmt_local_PrAlgorithmsConf_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsConf_makefile) PrAlgorithmsConfclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithmsConfclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithmsConf_makefile) PrAlgorithmsConfclean

##	  /bin/rm -f $(cmt_local_PrAlgorithmsConf_makefile) $(bin)PrAlgorithmsConf_dependencies.make

install :: PrAlgorithmsConfinstall

PrAlgorithmsConfinstall :: $(PrAlgorithmsConf_dependencies) $(cmt_local_PrAlgorithmsConf_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithmsConf"
	@-$(MAKE) -f $(cmt_local_PrAlgorithmsConf_makefile) install
	$(echo) "(constituents.make) install PrAlgorithmsConf done"

uninstall :: PrAlgorithmsConfuninstall

$(foreach d,$(PrAlgorithmsConf_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithmsConfuninstall))

PrAlgorithmsConfuninstall :: $(PrAlgorithmsConfuninstall_dependencies) $(cmt_local_PrAlgorithmsConf_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithmsConf"
	@$(MAKE) -f $(cmt_local_PrAlgorithmsConf_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithmsConf done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithmsConf"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithmsConf done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_PrAlgorithms_python_init_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithms_python_init_has_target_tag

#cmt_local_tagfile_PrAlgorithms_python_init = $(PrAlgorithms_tag)_PrAlgorithms_python_init.make
cmt_local_tagfile_PrAlgorithms_python_init = $(bin)$(PrAlgorithms_tag)_PrAlgorithms_python_init.make
cmt_local_setup_PrAlgorithms_python_init = $(bin)setup_PrAlgorithms_python_init$$$$.make
cmt_final_setup_PrAlgorithms_python_init = $(bin)setup_PrAlgorithms_python_init.make
#cmt_final_setup_PrAlgorithms_python_init = $(bin)PrAlgorithms_PrAlgorithms_python_initsetup.make
cmt_local_PrAlgorithms_python_init_makefile = $(bin)PrAlgorithms_python_init.make

PrAlgorithms_python_init_extratags = -tag_add=target_PrAlgorithms_python_init

#$(cmt_local_tagfile_PrAlgorithms_python_init) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithms_python_init) ::
else
$(cmt_local_tagfile_PrAlgorithms_python_init) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithms_python_init); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithms_python_init); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_python_init_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithms_python_init)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithms_python_init)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithms_python_init) || \rm -f $(cmt_local_setup_PrAlgorithms_python_init); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithms_python_init)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_python_init_extratags) show setup >$(cmt_local_setup_PrAlgorithms_python_init) && \
	  if [ -f $(cmt_final_setup_PrAlgorithms_python_init) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithms_python_init) $(cmt_local_setup_PrAlgorithms_python_init); then \
	    \rm $(cmt_local_setup_PrAlgorithms_python_init); else \
	    \mv -f $(cmt_local_setup_PrAlgorithms_python_init) $(cmt_final_setup_PrAlgorithms_python_init); fi

else

#cmt_local_tagfile_PrAlgorithms_python_init = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithms_python_init = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithms_python_init = $(bin)setup.make
#cmt_final_setup_PrAlgorithms_python_init = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithms_python_init_makefile = $(bin)PrAlgorithms_python_init.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithms_python_initdirs :
	@if test ! -d $(bin)PrAlgorithms_python_init; then $(mkdir) -p $(bin)PrAlgorithms_python_init; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithms_python_init
else
PrAlgorithms_python_initdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithms_python_initdirs ::
#	@if test ! -d $(bin)PrAlgorithms_python_init; then $(mkdir) -p $(bin)PrAlgorithms_python_init; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithms_python_init
#
#$(cmt_local_PrAlgorithms_python_init_makefile) :: $(PrAlgorithms_python_init_dependencies) $(cmt_local_tagfile_PrAlgorithms_python_init) build_library_links dirs PrAlgorithms_python_initdirs
#else
#$(cmt_local_PrAlgorithms_python_init_makefile) :: $(PrAlgorithms_python_init_dependencies) $(cmt_local_tagfile_PrAlgorithms_python_init) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithms_python_init_makefile) :: $(cmt_local_tagfile_PrAlgorithms_python_init)
#endif

makefiles : $(cmt_local_PrAlgorithms_python_init_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithms_python_init_makefile) : $(PrAlgorithms_python_init_dependencies) $(cmt_local_tagfile_PrAlgorithms_python_init) build_library_links
else
$(cmt_local_PrAlgorithms_python_init_makefile) : $(cmt_local_tagfile_PrAlgorithms_python_init)
endif
	$(echo) "(constituents.make) Building PrAlgorithms_python_init.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithms_python_init_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithms_python_init_makefile) PrAlgorithms_python_init

PrAlgorithms_python_init :: $(PrAlgorithms_python_init_dependencies) $(cmt_local_PrAlgorithms_python_init_makefile) dirs PrAlgorithms_python_initdirs
	$(echo) "(constituents.make) Creating PrAlgorithms_python_init${lock_suffix} and Starting PrAlgorithms_python_init"
	@${lock_command} PrAlgorithms_python_init${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrAlgorithms_python_init${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrAlgorithms_python_init_makefile) PrAlgorithms_python_init; \
	  retval=$$?; ${unlock_command} PrAlgorithms_python_init${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrAlgorithms_python_init done"

clean :: PrAlgorithms_python_initclean

PrAlgorithms_python_initclean :: $(PrAlgorithms_python_initclean_dependencies) ##$(cmt_local_PrAlgorithms_python_init_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithms_python_initclean"
	@-if test -f $(cmt_local_PrAlgorithms_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithms_python_init_makefile) PrAlgorithms_python_initclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithms_python_initclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithms_python_init_makefile) PrAlgorithms_python_initclean

##	  /bin/rm -f $(cmt_local_PrAlgorithms_python_init_makefile) $(bin)PrAlgorithms_python_init_dependencies.make

install :: PrAlgorithms_python_initinstall

PrAlgorithms_python_initinstall :: $(PrAlgorithms_python_init_dependencies) $(cmt_local_PrAlgorithms_python_init_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithms_python_init"
	@-$(MAKE) -f $(cmt_local_PrAlgorithms_python_init_makefile) install
	$(echo) "(constituents.make) install PrAlgorithms_python_init done"

uninstall :: PrAlgorithms_python_inituninstall

$(foreach d,$(PrAlgorithms_python_init_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithms_python_inituninstall))

PrAlgorithms_python_inituninstall :: $(PrAlgorithms_python_inituninstall_dependencies) $(cmt_local_PrAlgorithms_python_init_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithms_python_init"
	@$(MAKE) -f $(cmt_local_PrAlgorithms_python_init_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithms_python_init done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithms_python_init"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithms_python_init done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_zip_PrAlgorithms_python_modules_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_zip_PrAlgorithms_python_modules_has_target_tag

#cmt_local_tagfile_zip_PrAlgorithms_python_modules = $(PrAlgorithms_tag)_zip_PrAlgorithms_python_modules.make
cmt_local_tagfile_zip_PrAlgorithms_python_modules = $(bin)$(PrAlgorithms_tag)_zip_PrAlgorithms_python_modules.make
cmt_local_setup_zip_PrAlgorithms_python_modules = $(bin)setup_zip_PrAlgorithms_python_modules$$$$.make
cmt_final_setup_zip_PrAlgorithms_python_modules = $(bin)setup_zip_PrAlgorithms_python_modules.make
#cmt_final_setup_zip_PrAlgorithms_python_modules = $(bin)PrAlgorithms_zip_PrAlgorithms_python_modulessetup.make
cmt_local_zip_PrAlgorithms_python_modules_makefile = $(bin)zip_PrAlgorithms_python_modules.make

zip_PrAlgorithms_python_modules_extratags = -tag_add=target_zip_PrAlgorithms_python_modules

#$(cmt_local_tagfile_zip_PrAlgorithms_python_modules) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_zip_PrAlgorithms_python_modules) ::
else
$(cmt_local_tagfile_zip_PrAlgorithms_python_modules) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_zip_PrAlgorithms_python_modules); then /bin/rm -f $(cmt_local_tagfile_zip_PrAlgorithms_python_modules); fi ; \
	  $(cmtexe) -tag=$(tags) $(zip_PrAlgorithms_python_modules_extratags) build tag_makefile >>$(cmt_local_tagfile_zip_PrAlgorithms_python_modules)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_zip_PrAlgorithms_python_modules)"; \
	  test ! -f $(cmt_local_setup_zip_PrAlgorithms_python_modules) || \rm -f $(cmt_local_setup_zip_PrAlgorithms_python_modules); \
	  trap '\rm -f $(cmt_local_setup_zip_PrAlgorithms_python_modules)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(zip_PrAlgorithms_python_modules_extratags) show setup >$(cmt_local_setup_zip_PrAlgorithms_python_modules) && \
	  if [ -f $(cmt_final_setup_zip_PrAlgorithms_python_modules) ] && \
	    \cmp -s $(cmt_final_setup_zip_PrAlgorithms_python_modules) $(cmt_local_setup_zip_PrAlgorithms_python_modules); then \
	    \rm $(cmt_local_setup_zip_PrAlgorithms_python_modules); else \
	    \mv -f $(cmt_local_setup_zip_PrAlgorithms_python_modules) $(cmt_final_setup_zip_PrAlgorithms_python_modules); fi

else

#cmt_local_tagfile_zip_PrAlgorithms_python_modules = $(PrAlgorithms_tag).make
cmt_local_tagfile_zip_PrAlgorithms_python_modules = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_zip_PrAlgorithms_python_modules = $(bin)setup.make
#cmt_final_setup_zip_PrAlgorithms_python_modules = $(bin)PrAlgorithmssetup.make
cmt_local_zip_PrAlgorithms_python_modules_makefile = $(bin)zip_PrAlgorithms_python_modules.make

endif

ifdef STRUCTURED_OUTPUT
zip_PrAlgorithms_python_modulesdirs :
	@if test ! -d $(bin)zip_PrAlgorithms_python_modules; then $(mkdir) -p $(bin)zip_PrAlgorithms_python_modules; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_PrAlgorithms_python_modules
else
zip_PrAlgorithms_python_modulesdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# zip_PrAlgorithms_python_modulesdirs ::
#	@if test ! -d $(bin)zip_PrAlgorithms_python_modules; then $(mkdir) -p $(bin)zip_PrAlgorithms_python_modules; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_PrAlgorithms_python_modules
#
#$(cmt_local_zip_PrAlgorithms_python_modules_makefile) :: $(zip_PrAlgorithms_python_modules_dependencies) $(cmt_local_tagfile_zip_PrAlgorithms_python_modules) build_library_links dirs zip_PrAlgorithms_python_modulesdirs
#else
#$(cmt_local_zip_PrAlgorithms_python_modules_makefile) :: $(zip_PrAlgorithms_python_modules_dependencies) $(cmt_local_tagfile_zip_PrAlgorithms_python_modules) build_library_links dirs
#endif
#else
#$(cmt_local_zip_PrAlgorithms_python_modules_makefile) :: $(cmt_local_tagfile_zip_PrAlgorithms_python_modules)
#endif

makefiles : $(cmt_local_zip_PrAlgorithms_python_modules_makefile)

ifndef QUICK
$(cmt_local_zip_PrAlgorithms_python_modules_makefile) : $(zip_PrAlgorithms_python_modules_dependencies) $(cmt_local_tagfile_zip_PrAlgorithms_python_modules) build_library_links
else
$(cmt_local_zip_PrAlgorithms_python_modules_makefile) : $(cmt_local_tagfile_zip_PrAlgorithms_python_modules)
endif
	$(echo) "(constituents.make) Building zip_PrAlgorithms_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(zip_PrAlgorithms_python_modules_extratags) build constituent_makefile -out=$(cmt_local_zip_PrAlgorithms_python_modules_makefile) zip_PrAlgorithms_python_modules

zip_PrAlgorithms_python_modules :: $(zip_PrAlgorithms_python_modules_dependencies) $(cmt_local_zip_PrAlgorithms_python_modules_makefile) dirs zip_PrAlgorithms_python_modulesdirs
	$(echo) "(constituents.make) Creating zip_PrAlgorithms_python_modules${lock_suffix} and Starting zip_PrAlgorithms_python_modules"
	@${lock_command} zip_PrAlgorithms_python_modules${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} zip_PrAlgorithms_python_modules${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) zip_PrAlgorithms_python_modules; \
	  retval=$$?; ${unlock_command} zip_PrAlgorithms_python_modules${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) zip_PrAlgorithms_python_modules done"

clean :: zip_PrAlgorithms_python_modulesclean

zip_PrAlgorithms_python_modulesclean :: $(zip_PrAlgorithms_python_modulesclean_dependencies) ##$(cmt_local_zip_PrAlgorithms_python_modules_makefile)
	$(echo) "(constituents.make) Starting zip_PrAlgorithms_python_modulesclean"
	@-if test -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) zip_PrAlgorithms_python_modulesclean; \
	fi
	$(echo) "(constituents.make) zip_PrAlgorithms_python_modulesclean done"
#	@-$(MAKE) -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) zip_PrAlgorithms_python_modulesclean

##	  /bin/rm -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) $(bin)zip_PrAlgorithms_python_modules_dependencies.make

install :: zip_PrAlgorithms_python_modulesinstall

zip_PrAlgorithms_python_modulesinstall :: $(zip_PrAlgorithms_python_modules_dependencies) $(cmt_local_zip_PrAlgorithms_python_modules_makefile)
	$(echo) "(constituents.make) Starting install zip_PrAlgorithms_python_modules"
	@-$(MAKE) -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) install
	$(echo) "(constituents.make) install zip_PrAlgorithms_python_modules done"

uninstall :: zip_PrAlgorithms_python_modulesuninstall

$(foreach d,$(zip_PrAlgorithms_python_modules_dependencies),$(eval $(d)uninstall_dependencies += zip_PrAlgorithms_python_modulesuninstall))

zip_PrAlgorithms_python_modulesuninstall :: $(zip_PrAlgorithms_python_modulesuninstall_dependencies) $(cmt_local_zip_PrAlgorithms_python_modules_makefile)
	$(echo) "(constituents.make) Starting uninstall zip_PrAlgorithms_python_modules"
	@$(MAKE) -f $(cmt_local_zip_PrAlgorithms_python_modules_makefile) uninstall
	$(echo) "(constituents.make) uninstall zip_PrAlgorithms_python_modules done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ zip_PrAlgorithms_python_modules"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ zip_PrAlgorithms_python_modules done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_PrAlgorithmsConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrAlgorithmsConfDbMerge_has_target_tag

#cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(PrAlgorithms_tag)_PrAlgorithmsConfDbMerge.make
cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(bin)$(PrAlgorithms_tag)_PrAlgorithmsConfDbMerge.make
cmt_local_setup_PrAlgorithmsConfDbMerge = $(bin)setup_PrAlgorithmsConfDbMerge$$$$.make
cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)setup_PrAlgorithmsConfDbMerge.make
#cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)PrAlgorithms_PrAlgorithmsConfDbMergesetup.make
cmt_local_PrAlgorithmsConfDbMerge_makefile = $(bin)PrAlgorithmsConfDbMerge.make

PrAlgorithmsConfDbMerge_extratags = -tag_add=target_PrAlgorithmsConfDbMerge

#$(cmt_local_tagfile_PrAlgorithmsConfDbMerge) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrAlgorithmsConfDbMerge) ::
else
$(cmt_local_tagfile_PrAlgorithmsConfDbMerge) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrAlgorithmsConfDbMerge); then /bin/rm -f $(cmt_local_tagfile_PrAlgorithmsConfDbMerge); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConfDbMerge_extratags) build tag_makefile >>$(cmt_local_tagfile_PrAlgorithmsConfDbMerge)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrAlgorithmsConfDbMerge)"; \
	  test ! -f $(cmt_local_setup_PrAlgorithmsConfDbMerge) || \rm -f $(cmt_local_setup_PrAlgorithmsConfDbMerge); \
	  trap '\rm -f $(cmt_local_setup_PrAlgorithmsConfDbMerge)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConfDbMerge_extratags) show setup >$(cmt_local_setup_PrAlgorithmsConfDbMerge) && \
	  if [ -f $(cmt_final_setup_PrAlgorithmsConfDbMerge) ] && \
	    \cmp -s $(cmt_final_setup_PrAlgorithmsConfDbMerge) $(cmt_local_setup_PrAlgorithmsConfDbMerge); then \
	    \rm $(cmt_local_setup_PrAlgorithmsConfDbMerge); else \
	    \mv -f $(cmt_local_setup_PrAlgorithmsConfDbMerge) $(cmt_final_setup_PrAlgorithmsConfDbMerge); fi

else

#cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(PrAlgorithms_tag).make
cmt_local_tagfile_PrAlgorithmsConfDbMerge = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)setup.make
#cmt_final_setup_PrAlgorithmsConfDbMerge = $(bin)PrAlgorithmssetup.make
cmt_local_PrAlgorithmsConfDbMerge_makefile = $(bin)PrAlgorithmsConfDbMerge.make

endif

ifdef STRUCTURED_OUTPUT
PrAlgorithmsConfDbMergedirs :
	@if test ! -d $(bin)PrAlgorithmsConfDbMerge; then $(mkdir) -p $(bin)PrAlgorithmsConfDbMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsConfDbMerge
else
PrAlgorithmsConfDbMergedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrAlgorithmsConfDbMergedirs ::
#	@if test ! -d $(bin)PrAlgorithmsConfDbMerge; then $(mkdir) -p $(bin)PrAlgorithmsConfDbMerge; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrAlgorithmsConfDbMerge
#
#$(cmt_local_PrAlgorithmsConfDbMerge_makefile) :: $(PrAlgorithmsConfDbMerge_dependencies) $(cmt_local_tagfile_PrAlgorithmsConfDbMerge) build_library_links dirs PrAlgorithmsConfDbMergedirs
#else
#$(cmt_local_PrAlgorithmsConfDbMerge_makefile) :: $(PrAlgorithmsConfDbMerge_dependencies) $(cmt_local_tagfile_PrAlgorithmsConfDbMerge) build_library_links dirs
#endif
#else
#$(cmt_local_PrAlgorithmsConfDbMerge_makefile) :: $(cmt_local_tagfile_PrAlgorithmsConfDbMerge)
#endif

makefiles : $(cmt_local_PrAlgorithmsConfDbMerge_makefile)

ifndef QUICK
$(cmt_local_PrAlgorithmsConfDbMerge_makefile) : $(PrAlgorithmsConfDbMerge_dependencies) $(cmt_local_tagfile_PrAlgorithmsConfDbMerge) build_library_links
else
$(cmt_local_PrAlgorithmsConfDbMerge_makefile) : $(cmt_local_tagfile_PrAlgorithmsConfDbMerge)
endif
	$(echo) "(constituents.make) Building PrAlgorithmsConfDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(PrAlgorithmsConfDbMerge_extratags) build constituent_makefile -out=$(cmt_local_PrAlgorithmsConfDbMerge_makefile) PrAlgorithmsConfDbMerge

PrAlgorithmsConfDbMerge :: $(PrAlgorithmsConfDbMerge_dependencies) $(cmt_local_PrAlgorithmsConfDbMerge_makefile) dirs PrAlgorithmsConfDbMergedirs
	$(echo) "(constituents.make) Creating PrAlgorithmsConfDbMerge${lock_suffix} and Starting PrAlgorithmsConfDbMerge"
	@${lock_command} PrAlgorithmsConfDbMerge${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrAlgorithmsConfDbMerge${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) PrAlgorithmsConfDbMerge; \
	  retval=$$?; ${unlock_command} PrAlgorithmsConfDbMerge${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrAlgorithmsConfDbMerge done"

clean :: PrAlgorithmsConfDbMergeclean

PrAlgorithmsConfDbMergeclean :: $(PrAlgorithmsConfDbMergeclean_dependencies) ##$(cmt_local_PrAlgorithmsConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting PrAlgorithmsConfDbMergeclean"
	@-if test -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) PrAlgorithmsConfDbMergeclean; \
	fi
	$(echo) "(constituents.make) PrAlgorithmsConfDbMergeclean done"
#	@-$(MAKE) -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) PrAlgorithmsConfDbMergeclean

##	  /bin/rm -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) $(bin)PrAlgorithmsConfDbMerge_dependencies.make

install :: PrAlgorithmsConfDbMergeinstall

PrAlgorithmsConfDbMergeinstall :: $(PrAlgorithmsConfDbMerge_dependencies) $(cmt_local_PrAlgorithmsConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting install PrAlgorithmsConfDbMerge"
	@-$(MAKE) -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) install
	$(echo) "(constituents.make) install PrAlgorithmsConfDbMerge done"

uninstall :: PrAlgorithmsConfDbMergeuninstall

$(foreach d,$(PrAlgorithmsConfDbMerge_dependencies),$(eval $(d)uninstall_dependencies += PrAlgorithmsConfDbMergeuninstall))

PrAlgorithmsConfDbMergeuninstall :: $(PrAlgorithmsConfDbMergeuninstall_dependencies) $(cmt_local_PrAlgorithmsConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting uninstall PrAlgorithmsConfDbMerge"
	@$(MAKE) -f $(cmt_local_PrAlgorithmsConfDbMerge_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrAlgorithmsConfDbMerge done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrAlgorithmsConfDbMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrAlgorithmsConfDbMerge done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(PrAlgorithms_tag)_make.make
cmt_local_tagfile_make = $(bin)$(PrAlgorithms_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)PrAlgorithms_makesetup.make
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

#cmt_local_tagfile_make = $(PrAlgorithms_tag).make
cmt_local_tagfile_make = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_CompilePython = $(PrAlgorithms_tag)_CompilePython.make
cmt_local_tagfile_CompilePython = $(bin)$(PrAlgorithms_tag)_CompilePython.make
cmt_local_setup_CompilePython = $(bin)setup_CompilePython$$$$.make
cmt_final_setup_CompilePython = $(bin)setup_CompilePython.make
#cmt_final_setup_CompilePython = $(bin)PrAlgorithms_CompilePythonsetup.make
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

#cmt_local_tagfile_CompilePython = $(PrAlgorithms_tag).make
cmt_local_tagfile_CompilePython = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_CompilePython = $(bin)setup.make
#cmt_final_setup_CompilePython = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_qmtest_run = $(PrAlgorithms_tag)_qmtest_run.make
cmt_local_tagfile_qmtest_run = $(bin)$(PrAlgorithms_tag)_qmtest_run.make
cmt_local_setup_qmtest_run = $(bin)setup_qmtest_run$$$$.make
cmt_final_setup_qmtest_run = $(bin)setup_qmtest_run.make
#cmt_final_setup_qmtest_run = $(bin)PrAlgorithms_qmtest_runsetup.make
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

#cmt_local_tagfile_qmtest_run = $(PrAlgorithms_tag).make
cmt_local_tagfile_qmtest_run = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_qmtest_run = $(bin)setup.make
#cmt_final_setup_qmtest_run = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(PrAlgorithms_tag)_qmtest_summarize.make
cmt_local_tagfile_qmtest_summarize = $(bin)$(PrAlgorithms_tag)_qmtest_summarize.make
cmt_local_setup_qmtest_summarize = $(bin)setup_qmtest_summarize$$$$.make
cmt_final_setup_qmtest_summarize = $(bin)setup_qmtest_summarize.make
#cmt_final_setup_qmtest_summarize = $(bin)PrAlgorithms_qmtest_summarizesetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(PrAlgorithms_tag).make
cmt_local_tagfile_qmtest_summarize = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_qmtest_summarize = $(bin)setup.make
#cmt_final_setup_qmtest_summarize = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_TestPackage = $(PrAlgorithms_tag)_TestPackage.make
cmt_local_tagfile_TestPackage = $(bin)$(PrAlgorithms_tag)_TestPackage.make
cmt_local_setup_TestPackage = $(bin)setup_TestPackage$$$$.make
cmt_final_setup_TestPackage = $(bin)setup_TestPackage.make
#cmt_final_setup_TestPackage = $(bin)PrAlgorithms_TestPackagesetup.make
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

#cmt_local_tagfile_TestPackage = $(PrAlgorithms_tag).make
cmt_local_tagfile_TestPackage = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_TestPackage = $(bin)setup.make
#cmt_final_setup_TestPackage = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_TestProject = $(PrAlgorithms_tag)_TestProject.make
cmt_local_tagfile_TestProject = $(bin)$(PrAlgorithms_tag)_TestProject.make
cmt_local_setup_TestProject = $(bin)setup_TestProject$$$$.make
cmt_final_setup_TestProject = $(bin)setup_TestProject.make
#cmt_final_setup_TestProject = $(bin)PrAlgorithms_TestProjectsetup.make
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

#cmt_local_tagfile_TestProject = $(PrAlgorithms_tag).make
cmt_local_tagfile_TestProject = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_TestProject = $(bin)setup.make
#cmt_final_setup_TestProject = $(bin)PrAlgorithmssetup.make
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

#cmt_local_tagfile_new_rootsys = $(PrAlgorithms_tag)_new_rootsys.make
cmt_local_tagfile_new_rootsys = $(bin)$(PrAlgorithms_tag)_new_rootsys.make
cmt_local_setup_new_rootsys = $(bin)setup_new_rootsys$$$$.make
cmt_final_setup_new_rootsys = $(bin)setup_new_rootsys.make
#cmt_final_setup_new_rootsys = $(bin)PrAlgorithms_new_rootsyssetup.make
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

#cmt_local_tagfile_new_rootsys = $(PrAlgorithms_tag).make
cmt_local_tagfile_new_rootsys = $(bin)$(PrAlgorithms_tag).make
cmt_final_setup_new_rootsys = $(bin)setup.make
#cmt_final_setup_new_rootsys = $(bin)PrAlgorithmssetup.make
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
