
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile = $(FTDet_tag).make
cmt_local_tagfile = $(bin)$(FTDet_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)FTDetsetup.make
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
#-- start of constituent_lock ------

cmt_install_more_includes_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_install_more_includes_has_target_tag

#cmt_local_tagfile_install_more_includes = $(FTDet_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(FTDet_tag)_install_more_includes.make
cmt_local_setup_install_more_includes = $(bin)setup_install_more_includes$$$$.make
cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
#cmt_final_setup_install_more_includes = $(bin)FTDet_install_more_includessetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

install_more_includes_extratags = -tag_add=target_install_more_includes

#$(cmt_local_tagfile_install_more_includes) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_install_more_includes) ::
else
$(cmt_local_tagfile_install_more_includes) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_install_more_includes); then /bin/rm -f $(cmt_local_tagfile_install_more_includes); fi ; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build tag_makefile >>$(cmt_local_tagfile_install_more_includes)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_install_more_includes)"; \
	  test ! -f $(cmt_local_setup_install_more_includes) || \rm -f $(cmt_local_setup_install_more_includes); \
	  trap '\rm -f $(cmt_local_setup_install_more_includes)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) show setup >$(cmt_local_setup_install_more_includes) && \
	  if [ -f $(cmt_final_setup_install_more_includes) ] && \
	    \cmp -s $(cmt_final_setup_install_more_includes) $(cmt_local_setup_install_more_includes); then \
	    \rm $(cmt_local_setup_install_more_includes); else \
	    \mv -f $(cmt_local_setup_install_more_includes) $(cmt_final_setup_install_more_includes); fi

else

#cmt_local_tagfile_install_more_includes = $(FTDet_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(FTDet_tag).make
cmt_final_setup_install_more_includes = $(bin)setup.make
#cmt_final_setup_install_more_includes = $(bin)FTDetsetup.make
cmt_local_install_more_includes_makefile = $(bin)install_more_includes.make

endif

ifdef STRUCTURED_OUTPUT
install_more_includesdirs :
	@if test ! -d $(bin)install_more_includes; then $(mkdir) -p $(bin)install_more_includes; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)install_more_includes
else
install_more_includesdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# install_more_includesdirs ::
#	@if test ! -d $(bin)install_more_includes; then $(mkdir) -p $(bin)install_more_includes; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)install_more_includes
#
#$(cmt_local_install_more_includes_makefile) :: $(install_more_includes_dependencies) $(cmt_local_tagfile_install_more_includes) build_library_links dirs install_more_includesdirs
#else
#$(cmt_local_install_more_includes_makefile) :: $(install_more_includes_dependencies) $(cmt_local_tagfile_install_more_includes) build_library_links dirs
#endif
#else
#$(cmt_local_install_more_includes_makefile) :: $(cmt_local_tagfile_install_more_includes)
#endif

makefiles : $(cmt_local_install_more_includes_makefile)

ifndef QUICK
$(cmt_local_install_more_includes_makefile) : $(install_more_includes_dependencies) $(cmt_local_tagfile_install_more_includes) build_library_links
else
$(cmt_local_install_more_includes_makefile) : $(cmt_local_tagfile_install_more_includes)
endif
	$(echo) "(constituents.make) Building install_more_includes.make"; \
	  $(cmtexe) -tag=$(tags) $(install_more_includes_extratags) build constituent_makefile -out=$(cmt_local_install_more_includes_makefile) install_more_includes

install_more_includes :: $(install_more_includes_dependencies) $(cmt_local_install_more_includes_makefile) dirs install_more_includesdirs
	$(echo) "(constituents.make) Creating install_more_includes${lock_suffix} and Starting install_more_includes"
	@${lock_command} install_more_includes${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} install_more_includes${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includes; \
	  retval=$$?; ${unlock_command} install_more_includes${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) install_more_includes done"

clean :: install_more_includesclean

install_more_includesclean :: $(install_more_includesclean_dependencies) ##$(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting install_more_includesclean"
	@-if test -f $(cmt_local_install_more_includes_makefile); then \
	  $(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includesclean; \
	fi
	$(echo) "(constituents.make) install_more_includesclean done"
#	@-$(MAKE) -f $(cmt_local_install_more_includes_makefile) install_more_includesclean

##	  /bin/rm -f $(cmt_local_install_more_includes_makefile) $(bin)install_more_includes_dependencies.make

install :: install_more_includesinstall

install_more_includesinstall :: $(install_more_includes_dependencies) $(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting install install_more_includes"
	@-$(MAKE) -f $(cmt_local_install_more_includes_makefile) install
	$(echo) "(constituents.make) install install_more_includes done"

uninstall :: install_more_includesuninstall

$(foreach d,$(install_more_includes_dependencies),$(eval $(d)uninstall_dependencies += install_more_includesuninstall))

install_more_includesuninstall :: $(install_more_includesuninstall_dependencies) $(cmt_local_install_more_includes_makefile)
	$(echo) "(constituents.make) Starting uninstall install_more_includes"
	@$(MAKE) -f $(cmt_local_install_more_includes_makefile) uninstall
	$(echo) "(constituents.make) uninstall install_more_includes done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ install_more_includes"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ install_more_includes done"
endif

#-- end of constituent_lock ------
#-- start of constituent ------

cmt_FTDetLib_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetLib_has_target_tag

#cmt_local_tagfile_FTDetLib = $(FTDet_tag)_FTDetLib.make
cmt_local_tagfile_FTDetLib = $(bin)$(FTDet_tag)_FTDetLib.make
cmt_local_setup_FTDetLib = $(bin)setup_FTDetLib$$$$.make
cmt_final_setup_FTDetLib = $(bin)setup_FTDetLib.make
#cmt_final_setup_FTDetLib = $(bin)FTDet_FTDetLibsetup.make
cmt_local_FTDetLib_makefile = $(bin)FTDetLib.make

FTDetLib_extratags = -tag_add=target_FTDetLib

#$(cmt_local_tagfile_FTDetLib) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetLib) ::
else
$(cmt_local_tagfile_FTDetLib) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetLib); then /bin/rm -f $(cmt_local_tagfile_FTDetLib); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetLib_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetLib)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetLib)"; \
	  test ! -f $(cmt_local_setup_FTDetLib) || \rm -f $(cmt_local_setup_FTDetLib); \
	  trap '\rm -f $(cmt_local_setup_FTDetLib)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetLib_extratags) show setup >$(cmt_local_setup_FTDetLib) && \
	  if [ -f $(cmt_final_setup_FTDetLib) ] && \
	    \cmp -s $(cmt_final_setup_FTDetLib) $(cmt_local_setup_FTDetLib); then \
	    \rm $(cmt_local_setup_FTDetLib); else \
	    \mv -f $(cmt_local_setup_FTDetLib) $(cmt_final_setup_FTDetLib); fi

else

#cmt_local_tagfile_FTDetLib = $(FTDet_tag).make
cmt_local_tagfile_FTDetLib = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetLib = $(bin)setup.make
#cmt_final_setup_FTDetLib = $(bin)FTDetsetup.make
cmt_local_FTDetLib_makefile = $(bin)FTDetLib.make

endif

ifdef STRUCTURED_OUTPUT
FTDetLibdirs :
	@if test ! -d $(bin)FTDetLib; then $(mkdir) -p $(bin)FTDetLib; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetLib
else
FTDetLibdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetLibdirs ::
#	@if test ! -d $(bin)FTDetLib; then $(mkdir) -p $(bin)FTDetLib; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetLib
#
#$(cmt_local_FTDetLib_makefile) :: $(FTDetLib_dependencies) $(cmt_local_tagfile_FTDetLib) build_library_links dirs FTDetLibdirs
#else
#$(cmt_local_FTDetLib_makefile) :: $(FTDetLib_dependencies) $(cmt_local_tagfile_FTDetLib) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetLib_makefile) :: $(cmt_local_tagfile_FTDetLib)
#endif

makefiles : $(cmt_local_FTDetLib_makefile)

ifndef QUICK
$(cmt_local_FTDetLib_makefile) : $(FTDetLib_dependencies) $(cmt_local_tagfile_FTDetLib) build_library_links
else
$(cmt_local_FTDetLib_makefile) : $(cmt_local_tagfile_FTDetLib)
endif
	$(echo) "(constituents.make) Building FTDetLib.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetLib_extratags) build constituent_makefile -out=$(cmt_local_FTDetLib_makefile) FTDetLib

FTDetLib :: $(FTDetLib_dependencies) $(cmt_local_FTDetLib_makefile) dirs FTDetLibdirs
	$(echo) "(constituents.make) Starting FTDetLib"
	@$(MAKE) -f $(cmt_local_FTDetLib_makefile) FTDetLib
	$(echo) "(constituents.make) FTDetLib done"

clean :: FTDetLibclean

FTDetLibclean :: $(FTDetLibclean_dependencies) ##$(cmt_local_FTDetLib_makefile)
	$(echo) "(constituents.make) Starting FTDetLibclean"
	@-if test -f $(cmt_local_FTDetLib_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetLib_makefile) FTDetLibclean; \
	fi
	$(echo) "(constituents.make) FTDetLibclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetLib_makefile) FTDetLibclean

##	  /bin/rm -f $(cmt_local_FTDetLib_makefile) $(bin)FTDetLib_dependencies.make

install :: FTDetLibinstall

FTDetLibinstall :: $(FTDetLib_dependencies) $(cmt_local_FTDetLib_makefile)
	$(echo) "(constituents.make) Starting install FTDetLib"
	@-$(MAKE) -f $(cmt_local_FTDetLib_makefile) install
	$(echo) "(constituents.make) install FTDetLib done"

uninstall :: FTDetLibuninstall

$(foreach d,$(FTDetLib_dependencies),$(eval $(d)uninstall_dependencies += FTDetLibuninstall))

FTDetLibuninstall :: $(FTDetLibuninstall_dependencies) $(cmt_local_FTDetLib_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetLib"
	@$(MAKE) -f $(cmt_local_FTDetLib_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetLib done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetLib"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetLib done"
endif

#-- end of constituent ------
#-- start of constituent ------

cmt_FTDet_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDet_has_target_tag

#cmt_local_tagfile_FTDet = $(FTDet_tag)_FTDet.make
cmt_local_tagfile_FTDet = $(bin)$(FTDet_tag)_FTDet.make
cmt_local_setup_FTDet = $(bin)setup_FTDet$$$$.make
cmt_final_setup_FTDet = $(bin)setup_FTDet.make
#cmt_final_setup_FTDet = $(bin)FTDet_FTDetsetup.make
cmt_local_FTDet_makefile = $(bin)FTDet.make

FTDet_extratags = -tag_add=target_FTDet

#$(cmt_local_tagfile_FTDet) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDet) ::
else
$(cmt_local_tagfile_FTDet) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDet); then /bin/rm -f $(cmt_local_tagfile_FTDet); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDet_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDet)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDet)"; \
	  test ! -f $(cmt_local_setup_FTDet) || \rm -f $(cmt_local_setup_FTDet); \
	  trap '\rm -f $(cmt_local_setup_FTDet)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDet_extratags) show setup >$(cmt_local_setup_FTDet) && \
	  if [ -f $(cmt_final_setup_FTDet) ] && \
	    \cmp -s $(cmt_final_setup_FTDet) $(cmt_local_setup_FTDet); then \
	    \rm $(cmt_local_setup_FTDet); else \
	    \mv -f $(cmt_local_setup_FTDet) $(cmt_final_setup_FTDet); fi

else

#cmt_local_tagfile_FTDet = $(FTDet_tag).make
cmt_local_tagfile_FTDet = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDet = $(bin)setup.make
#cmt_final_setup_FTDet = $(bin)FTDetsetup.make
cmt_local_FTDet_makefile = $(bin)FTDet.make

endif

ifdef STRUCTURED_OUTPUT
FTDetdirs :
	@if test ! -d $(bin)FTDet; then $(mkdir) -p $(bin)FTDet; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDet
else
FTDetdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetdirs ::
#	@if test ! -d $(bin)FTDet; then $(mkdir) -p $(bin)FTDet; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDet
#
#$(cmt_local_FTDet_makefile) :: $(FTDet_dependencies) $(cmt_local_tagfile_FTDet) build_library_links dirs FTDetdirs
#else
#$(cmt_local_FTDet_makefile) :: $(FTDet_dependencies) $(cmt_local_tagfile_FTDet) build_library_links dirs
#endif
#else
#$(cmt_local_FTDet_makefile) :: $(cmt_local_tagfile_FTDet)
#endif

makefiles : $(cmt_local_FTDet_makefile)

ifndef QUICK
$(cmt_local_FTDet_makefile) : $(FTDet_dependencies) $(cmt_local_tagfile_FTDet) build_library_links
else
$(cmt_local_FTDet_makefile) : $(cmt_local_tagfile_FTDet)
endif
	$(echo) "(constituents.make) Building FTDet.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDet_extratags) build constituent_makefile -out=$(cmt_local_FTDet_makefile) FTDet

FTDet :: $(FTDet_dependencies) $(cmt_local_FTDet_makefile) dirs FTDetdirs
	$(echo) "(constituents.make) Starting FTDet"
	@$(MAKE) -f $(cmt_local_FTDet_makefile) FTDet
	$(echo) "(constituents.make) FTDet done"

clean :: FTDetclean

FTDetclean :: $(FTDetclean_dependencies) ##$(cmt_local_FTDet_makefile)
	$(echo) "(constituents.make) Starting FTDetclean"
	@-if test -f $(cmt_local_FTDet_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDet_makefile) FTDetclean; \
	fi
	$(echo) "(constituents.make) FTDetclean done"
#	@-$(MAKE) -f $(cmt_local_FTDet_makefile) FTDetclean

##	  /bin/rm -f $(cmt_local_FTDet_makefile) $(bin)FTDet_dependencies.make

install :: FTDetinstall

FTDetinstall :: $(FTDet_dependencies) $(cmt_local_FTDet_makefile)
	$(echo) "(constituents.make) Starting install FTDet"
	@-$(MAKE) -f $(cmt_local_FTDet_makefile) install
	$(echo) "(constituents.make) install FTDet done"

uninstall :: FTDetuninstall

$(foreach d,$(FTDet_dependencies),$(eval $(d)uninstall_dependencies += FTDetuninstall))

FTDetuninstall :: $(FTDetuninstall_dependencies) $(cmt_local_FTDet_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDet"
	@$(MAKE) -f $(cmt_local_FTDet_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDet done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDet"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDet done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_FTDetComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetComponentsList_has_target_tag

#cmt_local_tagfile_FTDetComponentsList = $(FTDet_tag)_FTDetComponentsList.make
cmt_local_tagfile_FTDetComponentsList = $(bin)$(FTDet_tag)_FTDetComponentsList.make
cmt_local_setup_FTDetComponentsList = $(bin)setup_FTDetComponentsList$$$$.make
cmt_final_setup_FTDetComponentsList = $(bin)setup_FTDetComponentsList.make
#cmt_final_setup_FTDetComponentsList = $(bin)FTDet_FTDetComponentsListsetup.make
cmt_local_FTDetComponentsList_makefile = $(bin)FTDetComponentsList.make

FTDetComponentsList_extratags = -tag_add=target_FTDetComponentsList

#$(cmt_local_tagfile_FTDetComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetComponentsList) ::
else
$(cmt_local_tagfile_FTDetComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetComponentsList); then /bin/rm -f $(cmt_local_tagfile_FTDetComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetComponentsList)"; \
	  test ! -f $(cmt_local_setup_FTDetComponentsList) || \rm -f $(cmt_local_setup_FTDetComponentsList); \
	  trap '\rm -f $(cmt_local_setup_FTDetComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetComponentsList_extratags) show setup >$(cmt_local_setup_FTDetComponentsList) && \
	  if [ -f $(cmt_final_setup_FTDetComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_FTDetComponentsList) $(cmt_local_setup_FTDetComponentsList); then \
	    \rm $(cmt_local_setup_FTDetComponentsList); else \
	    \mv -f $(cmt_local_setup_FTDetComponentsList) $(cmt_final_setup_FTDetComponentsList); fi

else

#cmt_local_tagfile_FTDetComponentsList = $(FTDet_tag).make
cmt_local_tagfile_FTDetComponentsList = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetComponentsList = $(bin)setup.make
#cmt_final_setup_FTDetComponentsList = $(bin)FTDetsetup.make
cmt_local_FTDetComponentsList_makefile = $(bin)FTDetComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
FTDetComponentsListdirs :
	@if test ! -d $(bin)FTDetComponentsList; then $(mkdir) -p $(bin)FTDetComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetComponentsList
else
FTDetComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetComponentsListdirs ::
#	@if test ! -d $(bin)FTDetComponentsList; then $(mkdir) -p $(bin)FTDetComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetComponentsList
#
#$(cmt_local_FTDetComponentsList_makefile) :: $(FTDetComponentsList_dependencies) $(cmt_local_tagfile_FTDetComponentsList) build_library_links dirs FTDetComponentsListdirs
#else
#$(cmt_local_FTDetComponentsList_makefile) :: $(FTDetComponentsList_dependencies) $(cmt_local_tagfile_FTDetComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetComponentsList_makefile) :: $(cmt_local_tagfile_FTDetComponentsList)
#endif

makefiles : $(cmt_local_FTDetComponentsList_makefile)

ifndef QUICK
$(cmt_local_FTDetComponentsList_makefile) : $(FTDetComponentsList_dependencies) $(cmt_local_tagfile_FTDetComponentsList) build_library_links
else
$(cmt_local_FTDetComponentsList_makefile) : $(cmt_local_tagfile_FTDetComponentsList)
endif
	$(echo) "(constituents.make) Building FTDetComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetComponentsList_extratags) build constituent_makefile -out=$(cmt_local_FTDetComponentsList_makefile) FTDetComponentsList

FTDetComponentsList :: $(FTDetComponentsList_dependencies) $(cmt_local_FTDetComponentsList_makefile) dirs FTDetComponentsListdirs
	$(echo) "(constituents.make) Creating FTDetComponentsList${lock_suffix} and Starting FTDetComponentsList"
	@${lock_command} FTDetComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDetComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDetComponentsList_makefile) FTDetComponentsList; \
	  retval=$$?; ${unlock_command} FTDetComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDetComponentsList done"

clean :: FTDetComponentsListclean

FTDetComponentsListclean :: $(FTDetComponentsListclean_dependencies) ##$(cmt_local_FTDetComponentsList_makefile)
	$(echo) "(constituents.make) Starting FTDetComponentsListclean"
	@-if test -f $(cmt_local_FTDetComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetComponentsList_makefile) FTDetComponentsListclean; \
	fi
	$(echo) "(constituents.make) FTDetComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetComponentsList_makefile) FTDetComponentsListclean

##	  /bin/rm -f $(cmt_local_FTDetComponentsList_makefile) $(bin)FTDetComponentsList_dependencies.make

install :: FTDetComponentsListinstall

FTDetComponentsListinstall :: $(FTDetComponentsList_dependencies) $(cmt_local_FTDetComponentsList_makefile)
	$(echo) "(constituents.make) Starting install FTDetComponentsList"
	@-$(MAKE) -f $(cmt_local_FTDetComponentsList_makefile) install
	$(echo) "(constituents.make) install FTDetComponentsList done"

uninstall :: FTDetComponentsListuninstall

$(foreach d,$(FTDetComponentsList_dependencies),$(eval $(d)uninstall_dependencies += FTDetComponentsListuninstall))

FTDetComponentsListuninstall :: $(FTDetComponentsListuninstall_dependencies) $(cmt_local_FTDetComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetComponentsList"
	@$(MAKE) -f $(cmt_local_FTDetComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_FTDetMergeComponentsList_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetMergeComponentsList_has_target_tag

#cmt_local_tagfile_FTDetMergeComponentsList = $(FTDet_tag)_FTDetMergeComponentsList.make
cmt_local_tagfile_FTDetMergeComponentsList = $(bin)$(FTDet_tag)_FTDetMergeComponentsList.make
cmt_local_setup_FTDetMergeComponentsList = $(bin)setup_FTDetMergeComponentsList$$$$.make
cmt_final_setup_FTDetMergeComponentsList = $(bin)setup_FTDetMergeComponentsList.make
#cmt_final_setup_FTDetMergeComponentsList = $(bin)FTDet_FTDetMergeComponentsListsetup.make
cmt_local_FTDetMergeComponentsList_makefile = $(bin)FTDetMergeComponentsList.make

FTDetMergeComponentsList_extratags = -tag_add=target_FTDetMergeComponentsList

#$(cmt_local_tagfile_FTDetMergeComponentsList) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetMergeComponentsList) ::
else
$(cmt_local_tagfile_FTDetMergeComponentsList) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetMergeComponentsList); then /bin/rm -f $(cmt_local_tagfile_FTDetMergeComponentsList); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetMergeComponentsList_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetMergeComponentsList)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetMergeComponentsList)"; \
	  test ! -f $(cmt_local_setup_FTDetMergeComponentsList) || \rm -f $(cmt_local_setup_FTDetMergeComponentsList); \
	  trap '\rm -f $(cmt_local_setup_FTDetMergeComponentsList)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetMergeComponentsList_extratags) show setup >$(cmt_local_setup_FTDetMergeComponentsList) && \
	  if [ -f $(cmt_final_setup_FTDetMergeComponentsList) ] && \
	    \cmp -s $(cmt_final_setup_FTDetMergeComponentsList) $(cmt_local_setup_FTDetMergeComponentsList); then \
	    \rm $(cmt_local_setup_FTDetMergeComponentsList); else \
	    \mv -f $(cmt_local_setup_FTDetMergeComponentsList) $(cmt_final_setup_FTDetMergeComponentsList); fi

else

#cmt_local_tagfile_FTDetMergeComponentsList = $(FTDet_tag).make
cmt_local_tagfile_FTDetMergeComponentsList = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetMergeComponentsList = $(bin)setup.make
#cmt_final_setup_FTDetMergeComponentsList = $(bin)FTDetsetup.make
cmt_local_FTDetMergeComponentsList_makefile = $(bin)FTDetMergeComponentsList.make

endif

ifdef STRUCTURED_OUTPUT
FTDetMergeComponentsListdirs :
	@if test ! -d $(bin)FTDetMergeComponentsList; then $(mkdir) -p $(bin)FTDetMergeComponentsList; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetMergeComponentsList
else
FTDetMergeComponentsListdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetMergeComponentsListdirs ::
#	@if test ! -d $(bin)FTDetMergeComponentsList; then $(mkdir) -p $(bin)FTDetMergeComponentsList; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetMergeComponentsList
#
#$(cmt_local_FTDetMergeComponentsList_makefile) :: $(FTDetMergeComponentsList_dependencies) $(cmt_local_tagfile_FTDetMergeComponentsList) build_library_links dirs FTDetMergeComponentsListdirs
#else
#$(cmt_local_FTDetMergeComponentsList_makefile) :: $(FTDetMergeComponentsList_dependencies) $(cmt_local_tagfile_FTDetMergeComponentsList) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetMergeComponentsList_makefile) :: $(cmt_local_tagfile_FTDetMergeComponentsList)
#endif

makefiles : $(cmt_local_FTDetMergeComponentsList_makefile)

ifndef QUICK
$(cmt_local_FTDetMergeComponentsList_makefile) : $(FTDetMergeComponentsList_dependencies) $(cmt_local_tagfile_FTDetMergeComponentsList) build_library_links
else
$(cmt_local_FTDetMergeComponentsList_makefile) : $(cmt_local_tagfile_FTDetMergeComponentsList)
endif
	$(echo) "(constituents.make) Building FTDetMergeComponentsList.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetMergeComponentsList_extratags) build constituent_makefile -out=$(cmt_local_FTDetMergeComponentsList_makefile) FTDetMergeComponentsList

FTDetMergeComponentsList :: $(FTDetMergeComponentsList_dependencies) $(cmt_local_FTDetMergeComponentsList_makefile) dirs FTDetMergeComponentsListdirs
	$(echo) "(constituents.make) Creating FTDetMergeComponentsList${lock_suffix} and Starting FTDetMergeComponentsList"
	@${lock_command} FTDetMergeComponentsList${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDetMergeComponentsList${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDetMergeComponentsList_makefile) FTDetMergeComponentsList; \
	  retval=$$?; ${unlock_command} FTDetMergeComponentsList${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDetMergeComponentsList done"

clean :: FTDetMergeComponentsListclean

FTDetMergeComponentsListclean :: $(FTDetMergeComponentsListclean_dependencies) ##$(cmt_local_FTDetMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting FTDetMergeComponentsListclean"
	@-if test -f $(cmt_local_FTDetMergeComponentsList_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetMergeComponentsList_makefile) FTDetMergeComponentsListclean; \
	fi
	$(echo) "(constituents.make) FTDetMergeComponentsListclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetMergeComponentsList_makefile) FTDetMergeComponentsListclean

##	  /bin/rm -f $(cmt_local_FTDetMergeComponentsList_makefile) $(bin)FTDetMergeComponentsList_dependencies.make

install :: FTDetMergeComponentsListinstall

FTDetMergeComponentsListinstall :: $(FTDetMergeComponentsList_dependencies) $(cmt_local_FTDetMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting install FTDetMergeComponentsList"
	@-$(MAKE) -f $(cmt_local_FTDetMergeComponentsList_makefile) install
	$(echo) "(constituents.make) install FTDetMergeComponentsList done"

uninstall :: FTDetMergeComponentsListuninstall

$(foreach d,$(FTDetMergeComponentsList_dependencies),$(eval $(d)uninstall_dependencies += FTDetMergeComponentsListuninstall))

FTDetMergeComponentsListuninstall :: $(FTDetMergeComponentsListuninstall_dependencies) $(cmt_local_FTDetMergeComponentsList_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetMergeComponentsList"
	@$(MAKE) -f $(cmt_local_FTDetMergeComponentsList_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetMergeComponentsList done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetMergeComponentsList"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetMergeComponentsList done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_FTDetConf_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetConf_has_target_tag

#cmt_local_tagfile_FTDetConf = $(FTDet_tag)_FTDetConf.make
cmt_local_tagfile_FTDetConf = $(bin)$(FTDet_tag)_FTDetConf.make
cmt_local_setup_FTDetConf = $(bin)setup_FTDetConf$$$$.make
cmt_final_setup_FTDetConf = $(bin)setup_FTDetConf.make
#cmt_final_setup_FTDetConf = $(bin)FTDet_FTDetConfsetup.make
cmt_local_FTDetConf_makefile = $(bin)FTDetConf.make

FTDetConf_extratags = -tag_add=target_FTDetConf

#$(cmt_local_tagfile_FTDetConf) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetConf) ::
else
$(cmt_local_tagfile_FTDetConf) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetConf); then /bin/rm -f $(cmt_local_tagfile_FTDetConf); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetConf_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetConf)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetConf)"; \
	  test ! -f $(cmt_local_setup_FTDetConf) || \rm -f $(cmt_local_setup_FTDetConf); \
	  trap '\rm -f $(cmt_local_setup_FTDetConf)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetConf_extratags) show setup >$(cmt_local_setup_FTDetConf) && \
	  if [ -f $(cmt_final_setup_FTDetConf) ] && \
	    \cmp -s $(cmt_final_setup_FTDetConf) $(cmt_local_setup_FTDetConf); then \
	    \rm $(cmt_local_setup_FTDetConf); else \
	    \mv -f $(cmt_local_setup_FTDetConf) $(cmt_final_setup_FTDetConf); fi

else

#cmt_local_tagfile_FTDetConf = $(FTDet_tag).make
cmt_local_tagfile_FTDetConf = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetConf = $(bin)setup.make
#cmt_final_setup_FTDetConf = $(bin)FTDetsetup.make
cmt_local_FTDetConf_makefile = $(bin)FTDetConf.make

endif

ifdef STRUCTURED_OUTPUT
FTDetConfdirs :
	@if test ! -d $(bin)FTDetConf; then $(mkdir) -p $(bin)FTDetConf; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetConf
else
FTDetConfdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetConfdirs ::
#	@if test ! -d $(bin)FTDetConf; then $(mkdir) -p $(bin)FTDetConf; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetConf
#
#$(cmt_local_FTDetConf_makefile) :: $(FTDetConf_dependencies) $(cmt_local_tagfile_FTDetConf) build_library_links dirs FTDetConfdirs
#else
#$(cmt_local_FTDetConf_makefile) :: $(FTDetConf_dependencies) $(cmt_local_tagfile_FTDetConf) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetConf_makefile) :: $(cmt_local_tagfile_FTDetConf)
#endif

makefiles : $(cmt_local_FTDetConf_makefile)

ifndef QUICK
$(cmt_local_FTDetConf_makefile) : $(FTDetConf_dependencies) $(cmt_local_tagfile_FTDetConf) build_library_links
else
$(cmt_local_FTDetConf_makefile) : $(cmt_local_tagfile_FTDetConf)
endif
	$(echo) "(constituents.make) Building FTDetConf.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetConf_extratags) build constituent_makefile -out=$(cmt_local_FTDetConf_makefile) FTDetConf

FTDetConf :: $(FTDetConf_dependencies) $(cmt_local_FTDetConf_makefile) dirs FTDetConfdirs
	$(echo) "(constituents.make) Creating FTDetConf${lock_suffix} and Starting FTDetConf"
	@${lock_command} FTDetConf${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDetConf${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDetConf_makefile) FTDetConf; \
	  retval=$$?; ${unlock_command} FTDetConf${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDetConf done"

clean :: FTDetConfclean

FTDetConfclean :: $(FTDetConfclean_dependencies) ##$(cmt_local_FTDetConf_makefile)
	$(echo) "(constituents.make) Starting FTDetConfclean"
	@-if test -f $(cmt_local_FTDetConf_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetConf_makefile) FTDetConfclean; \
	fi
	$(echo) "(constituents.make) FTDetConfclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetConf_makefile) FTDetConfclean

##	  /bin/rm -f $(cmt_local_FTDetConf_makefile) $(bin)FTDetConf_dependencies.make

install :: FTDetConfinstall

FTDetConfinstall :: $(FTDetConf_dependencies) $(cmt_local_FTDetConf_makefile)
	$(echo) "(constituents.make) Starting install FTDetConf"
	@-$(MAKE) -f $(cmt_local_FTDetConf_makefile) install
	$(echo) "(constituents.make) install FTDetConf done"

uninstall :: FTDetConfuninstall

$(foreach d,$(FTDetConf_dependencies),$(eval $(d)uninstall_dependencies += FTDetConfuninstall))

FTDetConfuninstall :: $(FTDetConfuninstall_dependencies) $(cmt_local_FTDetConf_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetConf"
	@$(MAKE) -f $(cmt_local_FTDetConf_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetConf done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetConf"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetConf done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_FTDet_python_init_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDet_python_init_has_target_tag

#cmt_local_tagfile_FTDet_python_init = $(FTDet_tag)_FTDet_python_init.make
cmt_local_tagfile_FTDet_python_init = $(bin)$(FTDet_tag)_FTDet_python_init.make
cmt_local_setup_FTDet_python_init = $(bin)setup_FTDet_python_init$$$$.make
cmt_final_setup_FTDet_python_init = $(bin)setup_FTDet_python_init.make
#cmt_final_setup_FTDet_python_init = $(bin)FTDet_FTDet_python_initsetup.make
cmt_local_FTDet_python_init_makefile = $(bin)FTDet_python_init.make

FTDet_python_init_extratags = -tag_add=target_FTDet_python_init

#$(cmt_local_tagfile_FTDet_python_init) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDet_python_init) ::
else
$(cmt_local_tagfile_FTDet_python_init) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDet_python_init); then /bin/rm -f $(cmt_local_tagfile_FTDet_python_init); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDet_python_init_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDet_python_init)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDet_python_init)"; \
	  test ! -f $(cmt_local_setup_FTDet_python_init) || \rm -f $(cmt_local_setup_FTDet_python_init); \
	  trap '\rm -f $(cmt_local_setup_FTDet_python_init)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDet_python_init_extratags) show setup >$(cmt_local_setup_FTDet_python_init) && \
	  if [ -f $(cmt_final_setup_FTDet_python_init) ] && \
	    \cmp -s $(cmt_final_setup_FTDet_python_init) $(cmt_local_setup_FTDet_python_init); then \
	    \rm $(cmt_local_setup_FTDet_python_init); else \
	    \mv -f $(cmt_local_setup_FTDet_python_init) $(cmt_final_setup_FTDet_python_init); fi

else

#cmt_local_tagfile_FTDet_python_init = $(FTDet_tag).make
cmt_local_tagfile_FTDet_python_init = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDet_python_init = $(bin)setup.make
#cmt_final_setup_FTDet_python_init = $(bin)FTDetsetup.make
cmt_local_FTDet_python_init_makefile = $(bin)FTDet_python_init.make

endif

ifdef STRUCTURED_OUTPUT
FTDet_python_initdirs :
	@if test ! -d $(bin)FTDet_python_init; then $(mkdir) -p $(bin)FTDet_python_init; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDet_python_init
else
FTDet_python_initdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDet_python_initdirs ::
#	@if test ! -d $(bin)FTDet_python_init; then $(mkdir) -p $(bin)FTDet_python_init; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDet_python_init
#
#$(cmt_local_FTDet_python_init_makefile) :: $(FTDet_python_init_dependencies) $(cmt_local_tagfile_FTDet_python_init) build_library_links dirs FTDet_python_initdirs
#else
#$(cmt_local_FTDet_python_init_makefile) :: $(FTDet_python_init_dependencies) $(cmt_local_tagfile_FTDet_python_init) build_library_links dirs
#endif
#else
#$(cmt_local_FTDet_python_init_makefile) :: $(cmt_local_tagfile_FTDet_python_init)
#endif

makefiles : $(cmt_local_FTDet_python_init_makefile)

ifndef QUICK
$(cmt_local_FTDet_python_init_makefile) : $(FTDet_python_init_dependencies) $(cmt_local_tagfile_FTDet_python_init) build_library_links
else
$(cmt_local_FTDet_python_init_makefile) : $(cmt_local_tagfile_FTDet_python_init)
endif
	$(echo) "(constituents.make) Building FTDet_python_init.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDet_python_init_extratags) build constituent_makefile -out=$(cmt_local_FTDet_python_init_makefile) FTDet_python_init

FTDet_python_init :: $(FTDet_python_init_dependencies) $(cmt_local_FTDet_python_init_makefile) dirs FTDet_python_initdirs
	$(echo) "(constituents.make) Creating FTDet_python_init${lock_suffix} and Starting FTDet_python_init"
	@${lock_command} FTDet_python_init${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDet_python_init${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDet_python_init_makefile) FTDet_python_init; \
	  retval=$$?; ${unlock_command} FTDet_python_init${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDet_python_init done"

clean :: FTDet_python_initclean

FTDet_python_initclean :: $(FTDet_python_initclean_dependencies) ##$(cmt_local_FTDet_python_init_makefile)
	$(echo) "(constituents.make) Starting FTDet_python_initclean"
	@-if test -f $(cmt_local_FTDet_python_init_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDet_python_init_makefile) FTDet_python_initclean; \
	fi
	$(echo) "(constituents.make) FTDet_python_initclean done"
#	@-$(MAKE) -f $(cmt_local_FTDet_python_init_makefile) FTDet_python_initclean

##	  /bin/rm -f $(cmt_local_FTDet_python_init_makefile) $(bin)FTDet_python_init_dependencies.make

install :: FTDet_python_initinstall

FTDet_python_initinstall :: $(FTDet_python_init_dependencies) $(cmt_local_FTDet_python_init_makefile)
	$(echo) "(constituents.make) Starting install FTDet_python_init"
	@-$(MAKE) -f $(cmt_local_FTDet_python_init_makefile) install
	$(echo) "(constituents.make) install FTDet_python_init done"

uninstall :: FTDet_python_inituninstall

$(foreach d,$(FTDet_python_init_dependencies),$(eval $(d)uninstall_dependencies += FTDet_python_inituninstall))

FTDet_python_inituninstall :: $(FTDet_python_inituninstall_dependencies) $(cmt_local_FTDet_python_init_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDet_python_init"
	@$(MAKE) -f $(cmt_local_FTDet_python_init_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDet_python_init done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDet_python_init"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDet_python_init done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_zip_FTDet_python_modules_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_zip_FTDet_python_modules_has_target_tag

#cmt_local_tagfile_zip_FTDet_python_modules = $(FTDet_tag)_zip_FTDet_python_modules.make
cmt_local_tagfile_zip_FTDet_python_modules = $(bin)$(FTDet_tag)_zip_FTDet_python_modules.make
cmt_local_setup_zip_FTDet_python_modules = $(bin)setup_zip_FTDet_python_modules$$$$.make
cmt_final_setup_zip_FTDet_python_modules = $(bin)setup_zip_FTDet_python_modules.make
#cmt_final_setup_zip_FTDet_python_modules = $(bin)FTDet_zip_FTDet_python_modulessetup.make
cmt_local_zip_FTDet_python_modules_makefile = $(bin)zip_FTDet_python_modules.make

zip_FTDet_python_modules_extratags = -tag_add=target_zip_FTDet_python_modules

#$(cmt_local_tagfile_zip_FTDet_python_modules) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_zip_FTDet_python_modules) ::
else
$(cmt_local_tagfile_zip_FTDet_python_modules) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_zip_FTDet_python_modules); then /bin/rm -f $(cmt_local_tagfile_zip_FTDet_python_modules); fi ; \
	  $(cmtexe) -tag=$(tags) $(zip_FTDet_python_modules_extratags) build tag_makefile >>$(cmt_local_tagfile_zip_FTDet_python_modules)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_zip_FTDet_python_modules)"; \
	  test ! -f $(cmt_local_setup_zip_FTDet_python_modules) || \rm -f $(cmt_local_setup_zip_FTDet_python_modules); \
	  trap '\rm -f $(cmt_local_setup_zip_FTDet_python_modules)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(zip_FTDet_python_modules_extratags) show setup >$(cmt_local_setup_zip_FTDet_python_modules) && \
	  if [ -f $(cmt_final_setup_zip_FTDet_python_modules) ] && \
	    \cmp -s $(cmt_final_setup_zip_FTDet_python_modules) $(cmt_local_setup_zip_FTDet_python_modules); then \
	    \rm $(cmt_local_setup_zip_FTDet_python_modules); else \
	    \mv -f $(cmt_local_setup_zip_FTDet_python_modules) $(cmt_final_setup_zip_FTDet_python_modules); fi

else

#cmt_local_tagfile_zip_FTDet_python_modules = $(FTDet_tag).make
cmt_local_tagfile_zip_FTDet_python_modules = $(bin)$(FTDet_tag).make
cmt_final_setup_zip_FTDet_python_modules = $(bin)setup.make
#cmt_final_setup_zip_FTDet_python_modules = $(bin)FTDetsetup.make
cmt_local_zip_FTDet_python_modules_makefile = $(bin)zip_FTDet_python_modules.make

endif

ifdef STRUCTURED_OUTPUT
zip_FTDet_python_modulesdirs :
	@if test ! -d $(bin)zip_FTDet_python_modules; then $(mkdir) -p $(bin)zip_FTDet_python_modules; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_FTDet_python_modules
else
zip_FTDet_python_modulesdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# zip_FTDet_python_modulesdirs ::
#	@if test ! -d $(bin)zip_FTDet_python_modules; then $(mkdir) -p $(bin)zip_FTDet_python_modules; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)zip_FTDet_python_modules
#
#$(cmt_local_zip_FTDet_python_modules_makefile) :: $(zip_FTDet_python_modules_dependencies) $(cmt_local_tagfile_zip_FTDet_python_modules) build_library_links dirs zip_FTDet_python_modulesdirs
#else
#$(cmt_local_zip_FTDet_python_modules_makefile) :: $(zip_FTDet_python_modules_dependencies) $(cmt_local_tagfile_zip_FTDet_python_modules) build_library_links dirs
#endif
#else
#$(cmt_local_zip_FTDet_python_modules_makefile) :: $(cmt_local_tagfile_zip_FTDet_python_modules)
#endif

makefiles : $(cmt_local_zip_FTDet_python_modules_makefile)

ifndef QUICK
$(cmt_local_zip_FTDet_python_modules_makefile) : $(zip_FTDet_python_modules_dependencies) $(cmt_local_tagfile_zip_FTDet_python_modules) build_library_links
else
$(cmt_local_zip_FTDet_python_modules_makefile) : $(cmt_local_tagfile_zip_FTDet_python_modules)
endif
	$(echo) "(constituents.make) Building zip_FTDet_python_modules.make"; \
	  $(cmtexe) -tag=$(tags) $(zip_FTDet_python_modules_extratags) build constituent_makefile -out=$(cmt_local_zip_FTDet_python_modules_makefile) zip_FTDet_python_modules

zip_FTDet_python_modules :: $(zip_FTDet_python_modules_dependencies) $(cmt_local_zip_FTDet_python_modules_makefile) dirs zip_FTDet_python_modulesdirs
	$(echo) "(constituents.make) Creating zip_FTDet_python_modules${lock_suffix} and Starting zip_FTDet_python_modules"
	@${lock_command} zip_FTDet_python_modules${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} zip_FTDet_python_modules${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_zip_FTDet_python_modules_makefile) zip_FTDet_python_modules; \
	  retval=$$?; ${unlock_command} zip_FTDet_python_modules${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) zip_FTDet_python_modules done"

clean :: zip_FTDet_python_modulesclean

zip_FTDet_python_modulesclean :: $(zip_FTDet_python_modulesclean_dependencies) ##$(cmt_local_zip_FTDet_python_modules_makefile)
	$(echo) "(constituents.make) Starting zip_FTDet_python_modulesclean"
	@-if test -f $(cmt_local_zip_FTDet_python_modules_makefile); then \
	  $(MAKE) -f $(cmt_local_zip_FTDet_python_modules_makefile) zip_FTDet_python_modulesclean; \
	fi
	$(echo) "(constituents.make) zip_FTDet_python_modulesclean done"
#	@-$(MAKE) -f $(cmt_local_zip_FTDet_python_modules_makefile) zip_FTDet_python_modulesclean

##	  /bin/rm -f $(cmt_local_zip_FTDet_python_modules_makefile) $(bin)zip_FTDet_python_modules_dependencies.make

install :: zip_FTDet_python_modulesinstall

zip_FTDet_python_modulesinstall :: $(zip_FTDet_python_modules_dependencies) $(cmt_local_zip_FTDet_python_modules_makefile)
	$(echo) "(constituents.make) Starting install zip_FTDet_python_modules"
	@-$(MAKE) -f $(cmt_local_zip_FTDet_python_modules_makefile) install
	$(echo) "(constituents.make) install zip_FTDet_python_modules done"

uninstall :: zip_FTDet_python_modulesuninstall

$(foreach d,$(zip_FTDet_python_modules_dependencies),$(eval $(d)uninstall_dependencies += zip_FTDet_python_modulesuninstall))

zip_FTDet_python_modulesuninstall :: $(zip_FTDet_python_modulesuninstall_dependencies) $(cmt_local_zip_FTDet_python_modules_makefile)
	$(echo) "(constituents.make) Starting uninstall zip_FTDet_python_modules"
	@$(MAKE) -f $(cmt_local_zip_FTDet_python_modules_makefile) uninstall
	$(echo) "(constituents.make) uninstall zip_FTDet_python_modules done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ zip_FTDet_python_modules"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ zip_FTDet_python_modules done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_FTDetConfDbMerge_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetConfDbMerge_has_target_tag

#cmt_local_tagfile_FTDetConfDbMerge = $(FTDet_tag)_FTDetConfDbMerge.make
cmt_local_tagfile_FTDetConfDbMerge = $(bin)$(FTDet_tag)_FTDetConfDbMerge.make
cmt_local_setup_FTDetConfDbMerge = $(bin)setup_FTDetConfDbMerge$$$$.make
cmt_final_setup_FTDetConfDbMerge = $(bin)setup_FTDetConfDbMerge.make
#cmt_final_setup_FTDetConfDbMerge = $(bin)FTDet_FTDetConfDbMergesetup.make
cmt_local_FTDetConfDbMerge_makefile = $(bin)FTDetConfDbMerge.make

FTDetConfDbMerge_extratags = -tag_add=target_FTDetConfDbMerge

#$(cmt_local_tagfile_FTDetConfDbMerge) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetConfDbMerge) ::
else
$(cmt_local_tagfile_FTDetConfDbMerge) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetConfDbMerge); then /bin/rm -f $(cmt_local_tagfile_FTDetConfDbMerge); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetConfDbMerge_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetConfDbMerge)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetConfDbMerge)"; \
	  test ! -f $(cmt_local_setup_FTDetConfDbMerge) || \rm -f $(cmt_local_setup_FTDetConfDbMerge); \
	  trap '\rm -f $(cmt_local_setup_FTDetConfDbMerge)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetConfDbMerge_extratags) show setup >$(cmt_local_setup_FTDetConfDbMerge) && \
	  if [ -f $(cmt_final_setup_FTDetConfDbMerge) ] && \
	    \cmp -s $(cmt_final_setup_FTDetConfDbMerge) $(cmt_local_setup_FTDetConfDbMerge); then \
	    \rm $(cmt_local_setup_FTDetConfDbMerge); else \
	    \mv -f $(cmt_local_setup_FTDetConfDbMerge) $(cmt_final_setup_FTDetConfDbMerge); fi

else

#cmt_local_tagfile_FTDetConfDbMerge = $(FTDet_tag).make
cmt_local_tagfile_FTDetConfDbMerge = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetConfDbMerge = $(bin)setup.make
#cmt_final_setup_FTDetConfDbMerge = $(bin)FTDetsetup.make
cmt_local_FTDetConfDbMerge_makefile = $(bin)FTDetConfDbMerge.make

endif

ifdef STRUCTURED_OUTPUT
FTDetConfDbMergedirs :
	@if test ! -d $(bin)FTDetConfDbMerge; then $(mkdir) -p $(bin)FTDetConfDbMerge; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetConfDbMerge
else
FTDetConfDbMergedirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetConfDbMergedirs ::
#	@if test ! -d $(bin)FTDetConfDbMerge; then $(mkdir) -p $(bin)FTDetConfDbMerge; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetConfDbMerge
#
#$(cmt_local_FTDetConfDbMerge_makefile) :: $(FTDetConfDbMerge_dependencies) $(cmt_local_tagfile_FTDetConfDbMerge) build_library_links dirs FTDetConfDbMergedirs
#else
#$(cmt_local_FTDetConfDbMerge_makefile) :: $(FTDetConfDbMerge_dependencies) $(cmt_local_tagfile_FTDetConfDbMerge) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetConfDbMerge_makefile) :: $(cmt_local_tagfile_FTDetConfDbMerge)
#endif

makefiles : $(cmt_local_FTDetConfDbMerge_makefile)

ifndef QUICK
$(cmt_local_FTDetConfDbMerge_makefile) : $(FTDetConfDbMerge_dependencies) $(cmt_local_tagfile_FTDetConfDbMerge) build_library_links
else
$(cmt_local_FTDetConfDbMerge_makefile) : $(cmt_local_tagfile_FTDetConfDbMerge)
endif
	$(echo) "(constituents.make) Building FTDetConfDbMerge.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetConfDbMerge_extratags) build constituent_makefile -out=$(cmt_local_FTDetConfDbMerge_makefile) FTDetConfDbMerge

FTDetConfDbMerge :: $(FTDetConfDbMerge_dependencies) $(cmt_local_FTDetConfDbMerge_makefile) dirs FTDetConfDbMergedirs
	$(echo) "(constituents.make) Creating FTDetConfDbMerge${lock_suffix} and Starting FTDetConfDbMerge"
	@${lock_command} FTDetConfDbMerge${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDetConfDbMerge${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDetConfDbMerge_makefile) FTDetConfDbMerge; \
	  retval=$$?; ${unlock_command} FTDetConfDbMerge${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDetConfDbMerge done"

clean :: FTDetConfDbMergeclean

FTDetConfDbMergeclean :: $(FTDetConfDbMergeclean_dependencies) ##$(cmt_local_FTDetConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting FTDetConfDbMergeclean"
	@-if test -f $(cmt_local_FTDetConfDbMerge_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetConfDbMerge_makefile) FTDetConfDbMergeclean; \
	fi
	$(echo) "(constituents.make) FTDetConfDbMergeclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetConfDbMerge_makefile) FTDetConfDbMergeclean

##	  /bin/rm -f $(cmt_local_FTDetConfDbMerge_makefile) $(bin)FTDetConfDbMerge_dependencies.make

install :: FTDetConfDbMergeinstall

FTDetConfDbMergeinstall :: $(FTDetConfDbMerge_dependencies) $(cmt_local_FTDetConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting install FTDetConfDbMerge"
	@-$(MAKE) -f $(cmt_local_FTDetConfDbMerge_makefile) install
	$(echo) "(constituents.make) install FTDetConfDbMerge done"

uninstall :: FTDetConfDbMergeuninstall

$(foreach d,$(FTDetConfDbMerge_dependencies),$(eval $(d)uninstall_dependencies += FTDetConfDbMergeuninstall))

FTDetConfDbMergeuninstall :: $(FTDetConfDbMergeuninstall_dependencies) $(cmt_local_FTDetConfDbMerge_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetConfDbMerge"
	@$(MAKE) -f $(cmt_local_FTDetConfDbMerge_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetConfDbMerge done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetConfDbMerge"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetConfDbMerge done"
endif

#-- end of constituent_lock ------
#-- start of constituent_lock ------

cmt_FTDetGen_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetGen_has_target_tag

#cmt_local_tagfile_FTDetGen = $(FTDet_tag)_FTDetGen.make
cmt_local_tagfile_FTDetGen = $(bin)$(FTDet_tag)_FTDetGen.make
cmt_local_setup_FTDetGen = $(bin)setup_FTDetGen$$$$.make
cmt_final_setup_FTDetGen = $(bin)setup_FTDetGen.make
#cmt_final_setup_FTDetGen = $(bin)FTDet_FTDetGensetup.make
cmt_local_FTDetGen_makefile = $(bin)FTDetGen.make

FTDetGen_extratags = -tag_add=target_FTDetGen

#$(cmt_local_tagfile_FTDetGen) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetGen) ::
else
$(cmt_local_tagfile_FTDetGen) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetGen); then /bin/rm -f $(cmt_local_tagfile_FTDetGen); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetGen_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetGen)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetGen)"; \
	  test ! -f $(cmt_local_setup_FTDetGen) || \rm -f $(cmt_local_setup_FTDetGen); \
	  trap '\rm -f $(cmt_local_setup_FTDetGen)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetGen_extratags) show setup >$(cmt_local_setup_FTDetGen) && \
	  if [ -f $(cmt_final_setup_FTDetGen) ] && \
	    \cmp -s $(cmt_final_setup_FTDetGen) $(cmt_local_setup_FTDetGen); then \
	    \rm $(cmt_local_setup_FTDetGen); else \
	    \mv -f $(cmt_local_setup_FTDetGen) $(cmt_final_setup_FTDetGen); fi

else

#cmt_local_tagfile_FTDetGen = $(FTDet_tag).make
cmt_local_tagfile_FTDetGen = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetGen = $(bin)setup.make
#cmt_final_setup_FTDetGen = $(bin)FTDetsetup.make
cmt_local_FTDetGen_makefile = $(bin)FTDetGen.make

endif

ifdef STRUCTURED_OUTPUT
FTDetGendirs :
	@if test ! -d $(bin)FTDetGen; then $(mkdir) -p $(bin)FTDetGen; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetGen
else
FTDetGendirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetGendirs ::
#	@if test ! -d $(bin)FTDetGen; then $(mkdir) -p $(bin)FTDetGen; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetGen
#
#$(cmt_local_FTDetGen_makefile) :: $(FTDetGen_dependencies) $(cmt_local_tagfile_FTDetGen) build_library_links dirs FTDetGendirs
#else
#$(cmt_local_FTDetGen_makefile) :: $(FTDetGen_dependencies) $(cmt_local_tagfile_FTDetGen) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetGen_makefile) :: $(cmt_local_tagfile_FTDetGen)
#endif

makefiles : $(cmt_local_FTDetGen_makefile)

ifndef QUICK
$(cmt_local_FTDetGen_makefile) : $(FTDetGen_dependencies) $(cmt_local_tagfile_FTDetGen) build_library_links
else
$(cmt_local_FTDetGen_makefile) : $(cmt_local_tagfile_FTDetGen)
endif
	$(echo) "(constituents.make) Building FTDetGen.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetGen_extratags) build constituent_makefile -out=$(cmt_local_FTDetGen_makefile) FTDetGen

FTDetGen :: $(FTDetGen_dependencies) $(cmt_local_FTDetGen_makefile) dirs FTDetGendirs
	$(echo) "(constituents.make) Creating FTDetGen${lock_suffix} and Starting FTDetGen"
	@${lock_command} FTDetGen${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} FTDetGen${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_FTDetGen_makefile) FTDetGen; \
	  retval=$$?; ${unlock_command} FTDetGen${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) FTDetGen done"

clean :: FTDetGenclean

FTDetGenclean :: $(FTDetGenclean_dependencies) ##$(cmt_local_FTDetGen_makefile)
	$(echo) "(constituents.make) Starting FTDetGenclean"
	@-if test -f $(cmt_local_FTDetGen_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetGen_makefile) FTDetGenclean; \
	fi
	$(echo) "(constituents.make) FTDetGenclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetGen_makefile) FTDetGenclean

##	  /bin/rm -f $(cmt_local_FTDetGen_makefile) $(bin)FTDetGen_dependencies.make

install :: FTDetGeninstall

FTDetGeninstall :: $(FTDetGen_dependencies) $(cmt_local_FTDetGen_makefile)
	$(echo) "(constituents.make) Starting install FTDetGen"
	@-$(MAKE) -f $(cmt_local_FTDetGen_makefile) install
	$(echo) "(constituents.make) install FTDetGen done"

uninstall :: FTDetGenuninstall

$(foreach d,$(FTDetGen_dependencies),$(eval $(d)uninstall_dependencies += FTDetGenuninstall))

FTDetGenuninstall :: $(FTDetGenuninstall_dependencies) $(cmt_local_FTDetGen_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetGen"
	@$(MAKE) -f $(cmt_local_FTDetGen_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetGen done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetGen"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetGen done"
endif

#-- end of constituent_lock ------
#-- start of constituent ------

cmt_FTDetDict_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetDict_has_target_tag

#cmt_local_tagfile_FTDetDict = $(FTDet_tag)_FTDetDict.make
cmt_local_tagfile_FTDetDict = $(bin)$(FTDet_tag)_FTDetDict.make
cmt_local_setup_FTDetDict = $(bin)setup_FTDetDict$$$$.make
cmt_final_setup_FTDetDict = $(bin)setup_FTDetDict.make
#cmt_final_setup_FTDetDict = $(bin)FTDet_FTDetDictsetup.make
cmt_local_FTDetDict_makefile = $(bin)FTDetDict.make

FTDetDict_extratags = -tag_add=target_FTDetDict

#$(cmt_local_tagfile_FTDetDict) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_FTDetDict) ::
else
$(cmt_local_tagfile_FTDetDict) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_FTDetDict); then /bin/rm -f $(cmt_local_tagfile_FTDetDict); fi ; \
	  $(cmtexe) -tag=$(tags) $(FTDetDict_extratags) build tag_makefile >>$(cmt_local_tagfile_FTDetDict)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_FTDetDict)"; \
	  test ! -f $(cmt_local_setup_FTDetDict) || \rm -f $(cmt_local_setup_FTDetDict); \
	  trap '\rm -f $(cmt_local_setup_FTDetDict)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(FTDetDict_extratags) show setup >$(cmt_local_setup_FTDetDict) && \
	  if [ -f $(cmt_final_setup_FTDetDict) ] && \
	    \cmp -s $(cmt_final_setup_FTDetDict) $(cmt_local_setup_FTDetDict); then \
	    \rm $(cmt_local_setup_FTDetDict); else \
	    \mv -f $(cmt_local_setup_FTDetDict) $(cmt_final_setup_FTDetDict); fi

else

#cmt_local_tagfile_FTDetDict = $(FTDet_tag).make
cmt_local_tagfile_FTDetDict = $(bin)$(FTDet_tag).make
cmt_final_setup_FTDetDict = $(bin)setup.make
#cmt_final_setup_FTDetDict = $(bin)FTDetsetup.make
cmt_local_FTDetDict_makefile = $(bin)FTDetDict.make

endif

ifdef STRUCTURED_OUTPUT
FTDetDictdirs :
	@if test ! -d $(bin)FTDetDict; then $(mkdir) -p $(bin)FTDetDict; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetDict
else
FTDetDictdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# FTDetDictdirs ::
#	@if test ! -d $(bin)FTDetDict; then $(mkdir) -p $(bin)FTDetDict; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)FTDetDict
#
#$(cmt_local_FTDetDict_makefile) :: $(FTDetDict_dependencies) $(cmt_local_tagfile_FTDetDict) build_library_links dirs FTDetDictdirs
#else
#$(cmt_local_FTDetDict_makefile) :: $(FTDetDict_dependencies) $(cmt_local_tagfile_FTDetDict) build_library_links dirs
#endif
#else
#$(cmt_local_FTDetDict_makefile) :: $(cmt_local_tagfile_FTDetDict)
#endif

makefiles : $(cmt_local_FTDetDict_makefile)

ifndef QUICK
$(cmt_local_FTDetDict_makefile) : $(FTDetDict_dependencies) $(cmt_local_tagfile_FTDetDict) build_library_links
else
$(cmt_local_FTDetDict_makefile) : $(cmt_local_tagfile_FTDetDict)
endif
	$(echo) "(constituents.make) Building FTDetDict.make"; \
	  $(cmtexe) -tag=$(tags) $(FTDetDict_extratags) build constituent_makefile -out=$(cmt_local_FTDetDict_makefile) FTDetDict

FTDetDict :: $(FTDetDict_dependencies) $(cmt_local_FTDetDict_makefile) dirs FTDetDictdirs
	$(echo) "(constituents.make) Starting FTDetDict"
	@$(MAKE) -f $(cmt_local_FTDetDict_makefile) FTDetDict
	$(echo) "(constituents.make) FTDetDict done"

clean :: FTDetDictclean

FTDetDictclean :: $(FTDetDictclean_dependencies) ##$(cmt_local_FTDetDict_makefile)
	$(echo) "(constituents.make) Starting FTDetDictclean"
	@-if test -f $(cmt_local_FTDetDict_makefile); then \
	  $(MAKE) -f $(cmt_local_FTDetDict_makefile) FTDetDictclean; \
	fi
	$(echo) "(constituents.make) FTDetDictclean done"
#	@-$(MAKE) -f $(cmt_local_FTDetDict_makefile) FTDetDictclean

##	  /bin/rm -f $(cmt_local_FTDetDict_makefile) $(bin)FTDetDict_dependencies.make

install :: FTDetDictinstall

FTDetDictinstall :: $(FTDetDict_dependencies) $(cmt_local_FTDetDict_makefile)
	$(echo) "(constituents.make) Starting install FTDetDict"
	@-$(MAKE) -f $(cmt_local_FTDetDict_makefile) install
	$(echo) "(constituents.make) install FTDetDict done"

uninstall :: FTDetDictuninstall

$(foreach d,$(FTDetDict_dependencies),$(eval $(d)uninstall_dependencies += FTDetDictuninstall))

FTDetDictuninstall :: $(FTDetDictuninstall_dependencies) $(cmt_local_FTDetDict_makefile)
	$(echo) "(constituents.make) Starting uninstall FTDetDict"
	@$(MAKE) -f $(cmt_local_FTDetDict_makefile) uninstall
	$(echo) "(constituents.make) uninstall FTDetDict done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ FTDetDict"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ FTDetDict done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(FTDet_tag)_make.make
cmt_local_tagfile_make = $(bin)$(FTDet_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)FTDet_makesetup.make
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

#cmt_local_tagfile_make = $(FTDet_tag).make
cmt_local_tagfile_make = $(bin)$(FTDet_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_CompilePython = $(FTDet_tag)_CompilePython.make
cmt_local_tagfile_CompilePython = $(bin)$(FTDet_tag)_CompilePython.make
cmt_local_setup_CompilePython = $(bin)setup_CompilePython$$$$.make
cmt_final_setup_CompilePython = $(bin)setup_CompilePython.make
#cmt_final_setup_CompilePython = $(bin)FTDet_CompilePythonsetup.make
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

#cmt_local_tagfile_CompilePython = $(FTDet_tag).make
cmt_local_tagfile_CompilePython = $(bin)$(FTDet_tag).make
cmt_final_setup_CompilePython = $(bin)setup.make
#cmt_final_setup_CompilePython = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_qmtest_run = $(FTDet_tag)_qmtest_run.make
cmt_local_tagfile_qmtest_run = $(bin)$(FTDet_tag)_qmtest_run.make
cmt_local_setup_qmtest_run = $(bin)setup_qmtest_run$$$$.make
cmt_final_setup_qmtest_run = $(bin)setup_qmtest_run.make
#cmt_final_setup_qmtest_run = $(bin)FTDet_qmtest_runsetup.make
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

#cmt_local_tagfile_qmtest_run = $(FTDet_tag).make
cmt_local_tagfile_qmtest_run = $(bin)$(FTDet_tag).make
cmt_final_setup_qmtest_run = $(bin)setup.make
#cmt_final_setup_qmtest_run = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(FTDet_tag)_qmtest_summarize.make
cmt_local_tagfile_qmtest_summarize = $(bin)$(FTDet_tag)_qmtest_summarize.make
cmt_local_setup_qmtest_summarize = $(bin)setup_qmtest_summarize$$$$.make
cmt_final_setup_qmtest_summarize = $(bin)setup_qmtest_summarize.make
#cmt_final_setup_qmtest_summarize = $(bin)FTDet_qmtest_summarizesetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(FTDet_tag).make
cmt_local_tagfile_qmtest_summarize = $(bin)$(FTDet_tag).make
cmt_final_setup_qmtest_summarize = $(bin)setup.make
#cmt_final_setup_qmtest_summarize = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_TestPackage = $(FTDet_tag)_TestPackage.make
cmt_local_tagfile_TestPackage = $(bin)$(FTDet_tag)_TestPackage.make
cmt_local_setup_TestPackage = $(bin)setup_TestPackage$$$$.make
cmt_final_setup_TestPackage = $(bin)setup_TestPackage.make
#cmt_final_setup_TestPackage = $(bin)FTDet_TestPackagesetup.make
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

#cmt_local_tagfile_TestPackage = $(FTDet_tag).make
cmt_local_tagfile_TestPackage = $(bin)$(FTDet_tag).make
cmt_final_setup_TestPackage = $(bin)setup.make
#cmt_final_setup_TestPackage = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_TestProject = $(FTDet_tag)_TestProject.make
cmt_local_tagfile_TestProject = $(bin)$(FTDet_tag)_TestProject.make
cmt_local_setup_TestProject = $(bin)setup_TestProject$$$$.make
cmt_final_setup_TestProject = $(bin)setup_TestProject.make
#cmt_final_setup_TestProject = $(bin)FTDet_TestProjectsetup.make
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

#cmt_local_tagfile_TestProject = $(FTDet_tag).make
cmt_local_tagfile_TestProject = $(bin)$(FTDet_tag).make
cmt_final_setup_TestProject = $(bin)setup.make
#cmt_final_setup_TestProject = $(bin)FTDetsetup.make
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

#cmt_local_tagfile_new_rootsys = $(FTDet_tag)_new_rootsys.make
cmt_local_tagfile_new_rootsys = $(bin)$(FTDet_tag)_new_rootsys.make
cmt_local_setup_new_rootsys = $(bin)setup_new_rootsys$$$$.make
cmt_final_setup_new_rootsys = $(bin)setup_new_rootsys.make
#cmt_final_setup_new_rootsys = $(bin)FTDet_new_rootsyssetup.make
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

#cmt_local_tagfile_new_rootsys = $(FTDet_tag).make
cmt_local_tagfile_new_rootsys = $(bin)$(FTDet_tag).make
cmt_final_setup_new_rootsys = $(bin)setup.make
#cmt_final_setup_new_rootsys = $(bin)FTDetsetup.make
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
