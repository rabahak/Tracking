
#-- start of constituents_header ------

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

tags      = $(tag),$(CMTEXTRATAGS)

PrKernel_tag = $(tag)

#cmt_local_tagfile = $(PrKernel_tag).make
cmt_local_tagfile = $(bin)$(PrKernel_tag).make

#-include $(cmt_local_tagfile)
include $(cmt_local_tagfile)

#cmt_local_setup = $(bin)setup$$$$.make
#cmt_local_setup = $(bin)$(package)setup$$$$.make
#cmt_final_setup = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_install_more_includes = $(PrKernel_tag)_install_more_includes.make
cmt_local_tagfile_install_more_includes = $(bin)$(PrKernel_tag)_install_more_includes.make
cmt_local_setup_install_more_includes = $(bin)setup_install_more_includes$$$$.make
cmt_final_setup_install_more_includes = $(bin)setup_install_more_includes.make
#cmt_final_setup_install_more_includes = $(bin)PrKernel_install_more_includessetup.make
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

#cmt_local_tagfile_install_more_includes = $(PrKernel_tag).make
cmt_local_tagfile_install_more_includes = $(bin)$(PrKernel_tag).make
cmt_final_setup_install_more_includes = $(bin)setup.make
#cmt_final_setup_install_more_includes = $(bin)PrKernelsetup.make
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

cmt_PrKernel_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernel_has_target_tag

#cmt_local_tagfile_PrKernel = $(PrKernel_tag)_PrKernel.make
cmt_local_tagfile_PrKernel = $(bin)$(PrKernel_tag)_PrKernel.make
cmt_local_setup_PrKernel = $(bin)setup_PrKernel$$$$.make
cmt_final_setup_PrKernel = $(bin)setup_PrKernel.make
#cmt_final_setup_PrKernel = $(bin)PrKernel_PrKernelsetup.make
cmt_local_PrKernel_makefile = $(bin)PrKernel.make

PrKernel_extratags = -tag_add=target_PrKernel

#$(cmt_local_tagfile_PrKernel) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrKernel) ::
else
$(cmt_local_tagfile_PrKernel) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrKernel); then /bin/rm -f $(cmt_local_tagfile_PrKernel); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrKernel_extratags) build tag_makefile >>$(cmt_local_tagfile_PrKernel)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrKernel)"; \
	  test ! -f $(cmt_local_setup_PrKernel) || \rm -f $(cmt_local_setup_PrKernel); \
	  trap '\rm -f $(cmt_local_setup_PrKernel)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrKernel_extratags) show setup >$(cmt_local_setup_PrKernel) && \
	  if [ -f $(cmt_final_setup_PrKernel) ] && \
	    \cmp -s $(cmt_final_setup_PrKernel) $(cmt_local_setup_PrKernel); then \
	    \rm $(cmt_local_setup_PrKernel); else \
	    \mv -f $(cmt_local_setup_PrKernel) $(cmt_final_setup_PrKernel); fi

else

#cmt_local_tagfile_PrKernel = $(PrKernel_tag).make
cmt_local_tagfile_PrKernel = $(bin)$(PrKernel_tag).make
cmt_final_setup_PrKernel = $(bin)setup.make
#cmt_final_setup_PrKernel = $(bin)PrKernelsetup.make
cmt_local_PrKernel_makefile = $(bin)PrKernel.make

endif

ifdef STRUCTURED_OUTPUT
PrKerneldirs :
	@if test ! -d $(bin)PrKernel; then $(mkdir) -p $(bin)PrKernel; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernel
else
PrKerneldirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrKerneldirs ::
#	@if test ! -d $(bin)PrKernel; then $(mkdir) -p $(bin)PrKernel; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernel
#
#$(cmt_local_PrKernel_makefile) :: $(PrKernel_dependencies) $(cmt_local_tagfile_PrKernel) build_library_links dirs PrKerneldirs
#else
#$(cmt_local_PrKernel_makefile) :: $(PrKernel_dependencies) $(cmt_local_tagfile_PrKernel) build_library_links dirs
#endif
#else
#$(cmt_local_PrKernel_makefile) :: $(cmt_local_tagfile_PrKernel)
#endif

makefiles : $(cmt_local_PrKernel_makefile)

ifndef QUICK
$(cmt_local_PrKernel_makefile) : $(PrKernel_dependencies) $(cmt_local_tagfile_PrKernel) build_library_links
else
$(cmt_local_PrKernel_makefile) : $(cmt_local_tagfile_PrKernel)
endif
	$(echo) "(constituents.make) Building PrKernel.make"; \
	  $(cmtexe) -tag=$(tags) $(PrKernel_extratags) build constituent_makefile -out=$(cmt_local_PrKernel_makefile) PrKernel

PrKernel :: $(PrKernel_dependencies) $(cmt_local_PrKernel_makefile) dirs PrKerneldirs
	$(echo) "(constituents.make) Starting PrKernel"
	@$(MAKE) -f $(cmt_local_PrKernel_makefile) PrKernel
	$(echo) "(constituents.make) PrKernel done"

clean :: PrKernelclean

PrKernelclean :: $(PrKernelclean_dependencies) ##$(cmt_local_PrKernel_makefile)
	$(echo) "(constituents.make) Starting PrKernelclean"
	@-if test -f $(cmt_local_PrKernel_makefile); then \
	  $(MAKE) -f $(cmt_local_PrKernel_makefile) PrKernelclean; \
	fi
	$(echo) "(constituents.make) PrKernelclean done"
#	@-$(MAKE) -f $(cmt_local_PrKernel_makefile) PrKernelclean

##	  /bin/rm -f $(cmt_local_PrKernel_makefile) $(bin)PrKernel_dependencies.make

install :: PrKernelinstall

PrKernelinstall :: $(PrKernel_dependencies) $(cmt_local_PrKernel_makefile)
	$(echo) "(constituents.make) Starting install PrKernel"
	@-$(MAKE) -f $(cmt_local_PrKernel_makefile) install
	$(echo) "(constituents.make) install PrKernel done"

uninstall :: PrKerneluninstall

$(foreach d,$(PrKernel_dependencies),$(eval $(d)uninstall_dependencies += PrKerneluninstall))

PrKerneluninstall :: $(PrKerneluninstall_dependencies) $(cmt_local_PrKernel_makefile)
	$(echo) "(constituents.make) Starting uninstall PrKernel"
	@$(MAKE) -f $(cmt_local_PrKernel_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrKernel done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrKernel"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrKernel done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_PrKernelGen_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernelGen_has_target_tag

#cmt_local_tagfile_PrKernelGen = $(PrKernel_tag)_PrKernelGen.make
cmt_local_tagfile_PrKernelGen = $(bin)$(PrKernel_tag)_PrKernelGen.make
cmt_local_setup_PrKernelGen = $(bin)setup_PrKernelGen$$$$.make
cmt_final_setup_PrKernelGen = $(bin)setup_PrKernelGen.make
#cmt_final_setup_PrKernelGen = $(bin)PrKernel_PrKernelGensetup.make
cmt_local_PrKernelGen_makefile = $(bin)PrKernelGen.make

PrKernelGen_extratags = -tag_add=target_PrKernelGen

#$(cmt_local_tagfile_PrKernelGen) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrKernelGen) ::
else
$(cmt_local_tagfile_PrKernelGen) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrKernelGen); then /bin/rm -f $(cmt_local_tagfile_PrKernelGen); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrKernelGen_extratags) build tag_makefile >>$(cmt_local_tagfile_PrKernelGen)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrKernelGen)"; \
	  test ! -f $(cmt_local_setup_PrKernelGen) || \rm -f $(cmt_local_setup_PrKernelGen); \
	  trap '\rm -f $(cmt_local_setup_PrKernelGen)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrKernelGen_extratags) show setup >$(cmt_local_setup_PrKernelGen) && \
	  if [ -f $(cmt_final_setup_PrKernelGen) ] && \
	    \cmp -s $(cmt_final_setup_PrKernelGen) $(cmt_local_setup_PrKernelGen); then \
	    \rm $(cmt_local_setup_PrKernelGen); else \
	    \mv -f $(cmt_local_setup_PrKernelGen) $(cmt_final_setup_PrKernelGen); fi

else

#cmt_local_tagfile_PrKernelGen = $(PrKernel_tag).make
cmt_local_tagfile_PrKernelGen = $(bin)$(PrKernel_tag).make
cmt_final_setup_PrKernelGen = $(bin)setup.make
#cmt_final_setup_PrKernelGen = $(bin)PrKernelsetup.make
cmt_local_PrKernelGen_makefile = $(bin)PrKernelGen.make

endif

ifdef STRUCTURED_OUTPUT
PrKernelGendirs :
	@if test ! -d $(bin)PrKernelGen; then $(mkdir) -p $(bin)PrKernelGen; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernelGen
else
PrKernelGendirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrKernelGendirs ::
#	@if test ! -d $(bin)PrKernelGen; then $(mkdir) -p $(bin)PrKernelGen; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernelGen
#
#$(cmt_local_PrKernelGen_makefile) :: $(PrKernelGen_dependencies) $(cmt_local_tagfile_PrKernelGen) build_library_links dirs PrKernelGendirs
#else
#$(cmt_local_PrKernelGen_makefile) :: $(PrKernelGen_dependencies) $(cmt_local_tagfile_PrKernelGen) build_library_links dirs
#endif
#else
#$(cmt_local_PrKernelGen_makefile) :: $(cmt_local_tagfile_PrKernelGen)
#endif

makefiles : $(cmt_local_PrKernelGen_makefile)

ifndef QUICK
$(cmt_local_PrKernelGen_makefile) : $(PrKernelGen_dependencies) $(cmt_local_tagfile_PrKernelGen) build_library_links
else
$(cmt_local_PrKernelGen_makefile) : $(cmt_local_tagfile_PrKernelGen)
endif
	$(echo) "(constituents.make) Building PrKernelGen.make"; \
	  $(cmtexe) -tag=$(tags) $(PrKernelGen_extratags) build constituent_makefile -out=$(cmt_local_PrKernelGen_makefile) PrKernelGen

PrKernelGen :: $(PrKernelGen_dependencies) $(cmt_local_PrKernelGen_makefile) dirs PrKernelGendirs
	$(echo) "(constituents.make) Creating PrKernelGen${lock_suffix} and Starting PrKernelGen"
	@${lock_command} PrKernelGen${lock_suffix} || exit $$?; \
	  retval=$$?; \
	  trap '${unlock_command} PrKernelGen${lock_suffix}; exit $${retval}' 1 2 15; \
	  $(MAKE) -f $(cmt_local_PrKernelGen_makefile) PrKernelGen; \
	  retval=$$?; ${unlock_command} PrKernelGen${lock_suffix}; exit $${retval}
	$(echo) "(constituents.make) PrKernelGen done"

clean :: PrKernelGenclean

PrKernelGenclean :: $(PrKernelGenclean_dependencies) ##$(cmt_local_PrKernelGen_makefile)
	$(echo) "(constituents.make) Starting PrKernelGenclean"
	@-if test -f $(cmt_local_PrKernelGen_makefile); then \
	  $(MAKE) -f $(cmt_local_PrKernelGen_makefile) PrKernelGenclean; \
	fi
	$(echo) "(constituents.make) PrKernelGenclean done"
#	@-$(MAKE) -f $(cmt_local_PrKernelGen_makefile) PrKernelGenclean

##	  /bin/rm -f $(cmt_local_PrKernelGen_makefile) $(bin)PrKernelGen_dependencies.make

install :: PrKernelGeninstall

PrKernelGeninstall :: $(PrKernelGen_dependencies) $(cmt_local_PrKernelGen_makefile)
	$(echo) "(constituents.make) Starting install PrKernelGen"
	@-$(MAKE) -f $(cmt_local_PrKernelGen_makefile) install
	$(echo) "(constituents.make) install PrKernelGen done"

uninstall :: PrKernelGenuninstall

$(foreach d,$(PrKernelGen_dependencies),$(eval $(d)uninstall_dependencies += PrKernelGenuninstall))

PrKernelGenuninstall :: $(PrKernelGenuninstall_dependencies) $(cmt_local_PrKernelGen_makefile)
	$(echo) "(constituents.make) Starting uninstall PrKernelGen"
	@$(MAKE) -f $(cmt_local_PrKernelGen_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrKernelGen done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrKernelGen"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrKernelGen done"
endif

#-- end of constituent_lock ------
#-- start of constituent ------

cmt_PrKernelDict_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernelDict_has_target_tag

#cmt_local_tagfile_PrKernelDict = $(PrKernel_tag)_PrKernelDict.make
cmt_local_tagfile_PrKernelDict = $(bin)$(PrKernel_tag)_PrKernelDict.make
cmt_local_setup_PrKernelDict = $(bin)setup_PrKernelDict$$$$.make
cmt_final_setup_PrKernelDict = $(bin)setup_PrKernelDict.make
#cmt_final_setup_PrKernelDict = $(bin)PrKernel_PrKernelDictsetup.make
cmt_local_PrKernelDict_makefile = $(bin)PrKernelDict.make

PrKernelDict_extratags = -tag_add=target_PrKernelDict

#$(cmt_local_tagfile_PrKernelDict) : $(cmt_lock_setup)
ifndef QUICK
$(cmt_local_tagfile_PrKernelDict) ::
else
$(cmt_local_tagfile_PrKernelDict) :
endif
	$(echo) "(constituents.make) Rebuilding $@"; \
	  if test -f $(cmt_local_tagfile_PrKernelDict); then /bin/rm -f $(cmt_local_tagfile_PrKernelDict); fi ; \
	  $(cmtexe) -tag=$(tags) $(PrKernelDict_extratags) build tag_makefile >>$(cmt_local_tagfile_PrKernelDict)
	$(echo) "(constituents.make) Rebuilding $(cmt_final_setup_PrKernelDict)"; \
	  test ! -f $(cmt_local_setup_PrKernelDict) || \rm -f $(cmt_local_setup_PrKernelDict); \
	  trap '\rm -f $(cmt_local_setup_PrKernelDict)' 0 1 2 15; \
	  $(cmtexe) -tag=$(tags) $(PrKernelDict_extratags) show setup >$(cmt_local_setup_PrKernelDict) && \
	  if [ -f $(cmt_final_setup_PrKernelDict) ] && \
	    \cmp -s $(cmt_final_setup_PrKernelDict) $(cmt_local_setup_PrKernelDict); then \
	    \rm $(cmt_local_setup_PrKernelDict); else \
	    \mv -f $(cmt_local_setup_PrKernelDict) $(cmt_final_setup_PrKernelDict); fi

else

#cmt_local_tagfile_PrKernelDict = $(PrKernel_tag).make
cmt_local_tagfile_PrKernelDict = $(bin)$(PrKernel_tag).make
cmt_final_setup_PrKernelDict = $(bin)setup.make
#cmt_final_setup_PrKernelDict = $(bin)PrKernelsetup.make
cmt_local_PrKernelDict_makefile = $(bin)PrKernelDict.make

endif

ifdef STRUCTURED_OUTPUT
PrKernelDictdirs :
	@if test ! -d $(bin)PrKernelDict; then $(mkdir) -p $(bin)PrKernelDict; fi
	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernelDict
else
PrKernelDictdirs : ;
endif

#ifndef QUICK
#ifdef STRUCTURED_OUTPUT
# PrKernelDictdirs ::
#	@if test ! -d $(bin)PrKernelDict; then $(mkdir) -p $(bin)PrKernelDict; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)PrKernelDict
#
#$(cmt_local_PrKernelDict_makefile) :: $(PrKernelDict_dependencies) $(cmt_local_tagfile_PrKernelDict) build_library_links dirs PrKernelDictdirs
#else
#$(cmt_local_PrKernelDict_makefile) :: $(PrKernelDict_dependencies) $(cmt_local_tagfile_PrKernelDict) build_library_links dirs
#endif
#else
#$(cmt_local_PrKernelDict_makefile) :: $(cmt_local_tagfile_PrKernelDict)
#endif

makefiles : $(cmt_local_PrKernelDict_makefile)

ifndef QUICK
$(cmt_local_PrKernelDict_makefile) : $(PrKernelDict_dependencies) $(cmt_local_tagfile_PrKernelDict) build_library_links
else
$(cmt_local_PrKernelDict_makefile) : $(cmt_local_tagfile_PrKernelDict)
endif
	$(echo) "(constituents.make) Building PrKernelDict.make"; \
	  $(cmtexe) -tag=$(tags) $(PrKernelDict_extratags) build constituent_makefile -out=$(cmt_local_PrKernelDict_makefile) PrKernelDict

PrKernelDict :: $(PrKernelDict_dependencies) $(cmt_local_PrKernelDict_makefile) dirs PrKernelDictdirs
	$(echo) "(constituents.make) Starting PrKernelDict"
	@$(MAKE) -f $(cmt_local_PrKernelDict_makefile) PrKernelDict
	$(echo) "(constituents.make) PrKernelDict done"

clean :: PrKernelDictclean

PrKernelDictclean :: $(PrKernelDictclean_dependencies) ##$(cmt_local_PrKernelDict_makefile)
	$(echo) "(constituents.make) Starting PrKernelDictclean"
	@-if test -f $(cmt_local_PrKernelDict_makefile); then \
	  $(MAKE) -f $(cmt_local_PrKernelDict_makefile) PrKernelDictclean; \
	fi
	$(echo) "(constituents.make) PrKernelDictclean done"
#	@-$(MAKE) -f $(cmt_local_PrKernelDict_makefile) PrKernelDictclean

##	  /bin/rm -f $(cmt_local_PrKernelDict_makefile) $(bin)PrKernelDict_dependencies.make

install :: PrKernelDictinstall

PrKernelDictinstall :: $(PrKernelDict_dependencies) $(cmt_local_PrKernelDict_makefile)
	$(echo) "(constituents.make) Starting install PrKernelDict"
	@-$(MAKE) -f $(cmt_local_PrKernelDict_makefile) install
	$(echo) "(constituents.make) install PrKernelDict done"

uninstall :: PrKernelDictuninstall

$(foreach d,$(PrKernelDict_dependencies),$(eval $(d)uninstall_dependencies += PrKernelDictuninstall))

PrKernelDictuninstall :: $(PrKernelDictuninstall_dependencies) $(cmt_local_PrKernelDict_makefile)
	$(echo) "(constituents.make) Starting uninstall PrKernelDict"
	@$(MAKE) -f $(cmt_local_PrKernelDict_makefile) uninstall
	$(echo) "(constituents.make) uninstall PrKernelDict done"

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(constituents.make) Starting $@ PrKernelDict"
	$(echo) Using default action for $@
	$(echo) "(constituents.make) $@ PrKernelDict done"
endif

#-- end of constituent ------
#-- start of constituent_lock ------

cmt_make_has_target_tag = 1

#--------------------------------------------------------

ifdef cmt_make_has_target_tag

#cmt_local_tagfile_make = $(PrKernel_tag)_make.make
cmt_local_tagfile_make = $(bin)$(PrKernel_tag)_make.make
cmt_local_setup_make = $(bin)setup_make$$$$.make
cmt_final_setup_make = $(bin)setup_make.make
#cmt_final_setup_make = $(bin)PrKernel_makesetup.make
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

#cmt_local_tagfile_make = $(PrKernel_tag).make
cmt_local_tagfile_make = $(bin)$(PrKernel_tag).make
cmt_final_setup_make = $(bin)setup.make
#cmt_final_setup_make = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_CompilePython = $(PrKernel_tag)_CompilePython.make
cmt_local_tagfile_CompilePython = $(bin)$(PrKernel_tag)_CompilePython.make
cmt_local_setup_CompilePython = $(bin)setup_CompilePython$$$$.make
cmt_final_setup_CompilePython = $(bin)setup_CompilePython.make
#cmt_final_setup_CompilePython = $(bin)PrKernel_CompilePythonsetup.make
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

#cmt_local_tagfile_CompilePython = $(PrKernel_tag).make
cmt_local_tagfile_CompilePython = $(bin)$(PrKernel_tag).make
cmt_final_setup_CompilePython = $(bin)setup.make
#cmt_final_setup_CompilePython = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_qmtest_run = $(PrKernel_tag)_qmtest_run.make
cmt_local_tagfile_qmtest_run = $(bin)$(PrKernel_tag)_qmtest_run.make
cmt_local_setup_qmtest_run = $(bin)setup_qmtest_run$$$$.make
cmt_final_setup_qmtest_run = $(bin)setup_qmtest_run.make
#cmt_final_setup_qmtest_run = $(bin)PrKernel_qmtest_runsetup.make
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

#cmt_local_tagfile_qmtest_run = $(PrKernel_tag).make
cmt_local_tagfile_qmtest_run = $(bin)$(PrKernel_tag).make
cmt_final_setup_qmtest_run = $(bin)setup.make
#cmt_final_setup_qmtest_run = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(PrKernel_tag)_qmtest_summarize.make
cmt_local_tagfile_qmtest_summarize = $(bin)$(PrKernel_tag)_qmtest_summarize.make
cmt_local_setup_qmtest_summarize = $(bin)setup_qmtest_summarize$$$$.make
cmt_final_setup_qmtest_summarize = $(bin)setup_qmtest_summarize.make
#cmt_final_setup_qmtest_summarize = $(bin)PrKernel_qmtest_summarizesetup.make
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

#cmt_local_tagfile_qmtest_summarize = $(PrKernel_tag).make
cmt_local_tagfile_qmtest_summarize = $(bin)$(PrKernel_tag).make
cmt_final_setup_qmtest_summarize = $(bin)setup.make
#cmt_final_setup_qmtest_summarize = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_TestPackage = $(PrKernel_tag)_TestPackage.make
cmt_local_tagfile_TestPackage = $(bin)$(PrKernel_tag)_TestPackage.make
cmt_local_setup_TestPackage = $(bin)setup_TestPackage$$$$.make
cmt_final_setup_TestPackage = $(bin)setup_TestPackage.make
#cmt_final_setup_TestPackage = $(bin)PrKernel_TestPackagesetup.make
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

#cmt_local_tagfile_TestPackage = $(PrKernel_tag).make
cmt_local_tagfile_TestPackage = $(bin)$(PrKernel_tag).make
cmt_final_setup_TestPackage = $(bin)setup.make
#cmt_final_setup_TestPackage = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_TestProject = $(PrKernel_tag)_TestProject.make
cmt_local_tagfile_TestProject = $(bin)$(PrKernel_tag)_TestProject.make
cmt_local_setup_TestProject = $(bin)setup_TestProject$$$$.make
cmt_final_setup_TestProject = $(bin)setup_TestProject.make
#cmt_final_setup_TestProject = $(bin)PrKernel_TestProjectsetup.make
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

#cmt_local_tagfile_TestProject = $(PrKernel_tag).make
cmt_local_tagfile_TestProject = $(bin)$(PrKernel_tag).make
cmt_final_setup_TestProject = $(bin)setup.make
#cmt_final_setup_TestProject = $(bin)PrKernelsetup.make
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

#cmt_local_tagfile_new_rootsys = $(PrKernel_tag)_new_rootsys.make
cmt_local_tagfile_new_rootsys = $(bin)$(PrKernel_tag)_new_rootsys.make
cmt_local_setup_new_rootsys = $(bin)setup_new_rootsys$$$$.make
cmt_final_setup_new_rootsys = $(bin)setup_new_rootsys.make
#cmt_final_setup_new_rootsys = $(bin)PrKernel_new_rootsyssetup.make
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

#cmt_local_tagfile_new_rootsys = $(PrKernel_tag).make
cmt_local_tagfile_new_rootsys = $(bin)$(PrKernel_tag).make
cmt_final_setup_new_rootsys = $(bin)setup.make
#cmt_final_setup_new_rootsys = $(bin)PrKernelsetup.make
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
