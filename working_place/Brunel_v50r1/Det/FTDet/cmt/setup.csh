# echo "Setting FTDet v2r12 in /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Det"

if ( $?CMTROOT == 0 ) then
  setenv CMTROOT /afs/cern.ch/sw/contrib/CMT/v1r20p20090520
endif
source ${CMTROOT}/mgr/setup.csh

set tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if $status != 0 then
  set tempfile=/tmp/cmt.$$
endif
${CMTROOT}/mgr/cmt setup -csh -pack=FTDet -version=v2r12 -path=/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Det  -no_cleanup $* >${tempfile}; source ${tempfile}
/bin/rm -f ${tempfile}

