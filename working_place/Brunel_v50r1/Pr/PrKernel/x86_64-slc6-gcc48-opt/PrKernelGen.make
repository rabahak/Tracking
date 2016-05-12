#-- start of make_header -----------------

#====================================
#  Document PrKernelGen
#
#   Generated Wed May 11 14:30:26 2016  by abdulkhalek
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_PrKernelGen_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_PrKernelGen_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_PrKernelGen

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernelGen = $(PrKernel_tag)_PrKernelGen.make
cmt_local_tagfile_PrKernelGen = $(bin)$(PrKernel_tag)_PrKernelGen.make

else

tags      = $(tag),$(CMTEXTRATAGS)

PrKernel_tag = $(tag)

#cmt_local_tagfile_PrKernelGen = $(PrKernel_tag).make
cmt_local_tagfile_PrKernelGen = $(bin)$(PrKernel_tag).make

endif

include $(cmt_local_tagfile_PrKernelGen)
#-include $(cmt_local_tagfile_PrKernelGen)

ifdef cmt_PrKernelGen_has_target_tag

cmt_final_setup_PrKernelGen = $(bin)setup_PrKernelGen.make
#cmt_final_setup_PrKernelGen = $(bin)PrKernel_PrKernelGensetup.make
cmt_local_PrKernelGen_makefile = $(bin)PrKernelGen.make

else

cmt_final_setup_PrKernelGen = $(bin)setup.make
#cmt_final_setup_PrKernelGen = $(bin)PrKernelsetup.make
cmt_local_PrKernelGen_makefile = $(bin)PrKernelGen.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)PrKernelsetup.make

#PrKernelGen :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'PrKernelGen'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = PrKernelGen/
#PrKernelGen::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),PrKernelGenclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)PrKernelGen_dependencies.make :: dirs

ifndef QUICK
$(bin)PrKernelGen_dependencies.make : /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrKernel/dict/PrKernelDict.h $(use_requirements) $(cmt_final_setup_PrKernelGen)
	$(echo) "(PrKernelGen.make) Rebuilding $@"; \
	  $(build_dependencies) PrKernelGen -all_sources -out=$@ /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrKernel/dict/PrKernelDict.h
endif

#$(PrKernelGen_dependencies)

-include $(bin)PrKernelGen_dependencies.make

endif
endif
#-- end of dependency -------------------
# File: cmt/fragments/reflex_dictionary_generator
# Author: Pere Mato

# Makefile fragment to generate the Reflex dictionary together with a local rootmap file
# and a merged file in the installation area if InstallArea is present


.PHONY: PrKernelGen PrKernelGenclean MergeRootMap MergeRootMapclean

ppcmd=-I

dictdir=../$(tag)/dict/PrKernel
gensrcdict=$(dictdir)/PrKernelDict.cpp
ifdef PrKernel_rootmap
  rootmapname=PrKernelDict.rootmap
  rootmapdict=$(dictdir)/$(rootmapname)
  rootmapopts=--rootmap=$(rootmapname) --rootmap-lib=$(library_prefix)PrKernelDict
else
  rootmapdict=
endif

PrKernelGen ::  $(gensrcdict) $(rootmapdict) MergeRootMap
	@:

.NOTPARALLEL: $(gensrcdict) $(rootmapdict)

$(gensrcdict) $(rootmapdict) :: $(PrKernelDict_h_dependencies) $(PrKernel_reflex_selection_file)
	echo $@ PrKernelDict.h
	@-mkdir -p $(dictdir)
	$(genreflex_cmd) /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr/PrKernel/dict/PrKernelDict.h -o $(gensrcdict) $(PrKernelDict_reflex_options)  \
			 $(PrKernel_reflex_options) $(rootmapopts) $(gccxml_cppflags) $(pp_cppflags) $(includes) $(use_pp_cppflags)
	test -e "$(dictdir)/PrKernelDict_rdict.pcm" \
	&& $(install_command) $(dictdir)/PrKernelDict_rdict.pcm ${CMTINSTALLAREA}/$(tag)/lib \
	|| true

PrKernelGenclean ::
	@echo 'Deleting $(gensrcdict) $(rootmapdict)'
	@$(uninstall_command) $(gensrcdict) $(rootmapdict)


#---Dealing with merging the rootmap files 
ifdef  PrKernel_rootmap

mergedrootmapdir=$(dir $(PrKernel_rootmap))
mergedrootmap=$(PrKernel_rootmap)
stamprootmap=$(mergedrootmapdir)/$(rootmapname).stamp

MergeRootMap :: $(stamprootmap) $(mergedrootmap)
	@:

$(stamprootmap) $(mergedrootmap) :: $(rootmapdict)
	@echo "Running merge_rootmap  PrKernelGen" 
	@-mkdir -p $(mergedrootmapdir)
	@touch $(mergedrootmap)
	$(merge_rootmap_cmd) --do-merge --input-file $(rootmapdict) --merged-file $(mergedrootmap)

PrKernelGenclean ::
	@echo "Un-merging rootmap"
	@$(merge_rootmap_cmd) --un-merge --input-file $(rootmapdict) --merged-file $(mergedrootmap)
	@$(uninstall_command) $(stamprootmap)

else

MergeRootMap ::
        @:

endif
PrKernelGenclean ::
	@/bin/rm -rf ../$(tag)/dict
#-- start of cleanup_header --------------

clean :: PrKernelGenclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(PrKernelGen.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernelGen.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(PrKernelGen.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(PrKernelGen.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_PrKernelGen)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelGen.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelGen.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(PrKernelGen.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

PrKernelGenclean ::
#-- end of cleanup_header ---------------
