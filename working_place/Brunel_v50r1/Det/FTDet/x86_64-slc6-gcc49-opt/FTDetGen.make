#-- start of make_header -----------------

#====================================
#  Document FTDetGen
#
#   Generated Fri Apr 22 11:43:18 2016  by rquaglia
#
#====================================

include ${CMTROOT}/src/Makefile.core

ifdef tag
CMTEXTRATAGS = $(tag)
else
tag       = $(CMTCONFIG)
endif

cmt_FTDetGen_has_no_target_tag = 1

#--------------------------------------------------------

ifdef cmt_FTDetGen_has_target_tag

tags      = $(tag),$(CMTEXTRATAGS),target_FTDetGen

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetGen = $(FTDet_tag)_FTDetGen.make
cmt_local_tagfile_FTDetGen = $(bin)$(FTDet_tag)_FTDetGen.make

else

tags      = $(tag),$(CMTEXTRATAGS)

FTDet_tag = $(tag)

#cmt_local_tagfile_FTDetGen = $(FTDet_tag).make
cmt_local_tagfile_FTDetGen = $(bin)$(FTDet_tag).make

endif

include $(cmt_local_tagfile_FTDetGen)
#-include $(cmt_local_tagfile_FTDetGen)

ifdef cmt_FTDetGen_has_target_tag

cmt_final_setup_FTDetGen = $(bin)setup_FTDetGen.make
#cmt_final_setup_FTDetGen = $(bin)FTDet_FTDetGensetup.make
cmt_local_FTDetGen_makefile = $(bin)FTDetGen.make

else

cmt_final_setup_FTDetGen = $(bin)setup.make
#cmt_final_setup_FTDetGen = $(bin)FTDetsetup.make
cmt_local_FTDetGen_makefile = $(bin)FTDetGen.make

endif

cmt_final_setup = $(bin)setup.make
#cmt_final_setup = $(bin)FTDetsetup.make

#FTDetGen :: ;

dirs ::
	@if test ! -r requirements ; then echo "No requirements file" ; fi; \
	  if test ! -d $(bin) ; then $(mkdir) -p $(bin) ; fi

javadirs ::
	@if test ! -d $(javabin) ; then $(mkdir) -p $(javabin) ; fi

srcdirs ::
	@if test ! -d $(src) ; then $(mkdir) -p $(src) ; fi

help ::
	$(echo) 'FTDetGen'

binobj = 
ifdef STRUCTURED_OUTPUT
binobj = FTDetGen/
#FTDetGen::
#	@if test ! -d $(bin)$(binobj) ; then $(mkdir) -p $(bin)$(binobj) ; fi
#	$(echo) "STRUCTURED_OUTPUT="$(bin)$(binobj)
endif

ifdef use_requirements
$(use_requirements) : ;
endif

#-- end of make_header ------------------
#-- start of dependency ------------------
ifneq ($(MAKECMDGOALS),FTDetGenclean)
ifneq ($(MAKECMDGOALS),uninstall)

#$(bin)FTDetGen_dependencies.make :: dirs

ifndef QUICK
$(bin)FTDetGen_dependencies.make : /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/dict/FTDetDict.h $(use_requirements) $(cmt_final_setup_FTDetGen)
	$(echo) "(FTDetGen.make) Rebuilding $@"; \
	  $(build_dependencies) FTDetGen -all_sources -out=$@ /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/dict/FTDetDict.h
endif

#$(FTDetGen_dependencies)

-include $(bin)FTDetGen_dependencies.make

endif
endif
#-- end of dependency -------------------
# File: cmt/fragments/reflex_dictionary_generator
# Author: Pere Mato

# Makefile fragment to generate the Reflex dictionary together with a local rootmap file
# and a merged file in the installation area if InstallArea is present


.PHONY: FTDetGen FTDetGenclean MergeRootMap MergeRootMapclean

ppcmd=-I

dictdir=../$(tag)/dict/FTDet
gensrcdict=$(dictdir)/FTDetDict.cpp
ifdef FTDet_rootmap
  rootmapname=FTDetDict.rootmap
  rootmapdict=$(dictdir)/$(rootmapname)
  rootmapopts=--rootmap=$(rootmapname) --rootmap-lib=$(library_prefix)FTDetDict
else
  rootmapdict=
endif

FTDetGen ::  $(gensrcdict) $(rootmapdict) MergeRootMap
	@:

.NOTPARALLEL: $(gensrcdict) $(rootmapdict)

$(gensrcdict) $(rootmapdict) :: $(FTDetDict_h_dependencies) $(FTDet_reflex_selection_file)
	echo $@ FTDetDict.h
	@-mkdir -p $(dictdir)
	$(genreflex_cmd) /afs/cern.ch/user/r/rquaglia/work/Tracking/NeedforSpeed_Forward/Brunel_v49r1/Det/FTDet/dict/FTDetDict.h -o $(gensrcdict) $(FTDetDict_reflex_options)  \
			 $(FTDet_reflex_options) $(rootmapopts) $(gccxml_cppflags) $(pp_cppflags) $(includes) $(use_pp_cppflags)
	test -e "$(dictdir)/FTDetDict_rdict.pcm" \
	&& $(install_command) $(dictdir)/FTDetDict_rdict.pcm ${CMTINSTALLAREA}/$(tag)/lib \
	|| true

FTDetGenclean ::
	@echo 'Deleting $(gensrcdict) $(rootmapdict)'
	@$(uninstall_command) $(gensrcdict) $(rootmapdict)


#---Dealing with merging the rootmap files 
ifdef  FTDet_rootmap

mergedrootmapdir=$(dir $(FTDet_rootmap))
mergedrootmap=$(FTDet_rootmap)
stamprootmap=$(mergedrootmapdir)/$(rootmapname).stamp

MergeRootMap :: $(stamprootmap) $(mergedrootmap)
	@:

$(stamprootmap) $(mergedrootmap) :: $(rootmapdict)
	@echo "Running merge_rootmap  FTDetGen" 
	@-mkdir -p $(mergedrootmapdir)
	@touch $(mergedrootmap)
	$(merge_rootmap_cmd) --do-merge --input-file $(rootmapdict) --merged-file $(mergedrootmap)

FTDetGenclean ::
	@echo "Un-merging rootmap"
	@$(merge_rootmap_cmd) --un-merge --input-file $(rootmapdict) --merged-file $(mergedrootmap)
	@$(uninstall_command) $(stamprootmap)

else

MergeRootMap ::
        @:

endif
FTDetGenclean ::
	@/bin/rm -rf ../$(tag)/dict
#-- start of cleanup_header --------------

clean :: FTDetGenclean ;
#	@cd .

ifndef PEDANTIC
.DEFAULT::
	$(echo) "(FTDetGen.make) $@: No rule for such target" >&2
#	@echo "#CMT> Warning: $@: No rule for such target" >&2; exit
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetGen.make): $@: File no longer generated" >&2; exit 0; fi
else
.DEFAULT::
	$(echo) "(FTDetGen.make) PEDANTIC: $@: No rule for such target" >&2
	if echo $@ | grep '$(package)setup\.make$$' >/dev/null; then\
	 echo "$(CMTMSGPREFIX)" "(FTDetGen.make): $@: File no longer generated" >&2; exit 0;\
	 elif test $@ = "$(cmt_final_setup)" -o\
	 $@ = "$(cmt_final_setup_FTDetGen)" ; then\
	 found=n; for s in 1 2 3 4 5; do\
	 sleep $$s; test ! -f $@ || { found=y; break; }\
	 done; if test $$found = n; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetGen.make) PEDANTIC: $@: Seems to be missing. Ignore it for now" >&2; exit 0 ; fi;\
	 elif test `expr $@ : '.*/'` -ne 0 ; then\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetGen.make) PEDANTIC: $@: Seems to be a missing file. Please check" >&2; exit 2 ; \
	 else\
	 test -z "$(cmtmsg)" ||\
	 echo "$(CMTMSGPREFIX)" "(FTDetGen.make) PEDANTIC: $@: Seems to be a fake target due to some pattern. Just ignore it" >&2 ; exit 0; fi
endif

FTDetGenclean ::
#-- end of cleanup_header ---------------
