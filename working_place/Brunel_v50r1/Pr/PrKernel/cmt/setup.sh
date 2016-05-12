# echo "Setting PrKernel v1r10 in /users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr"

if test "${CMTROOT}" = ""; then
  CMTROOT=/afs/cern.ch/sw/contrib/CMT/v1r20p20090520; export CMTROOT
fi
. ${CMTROOT}/mgr/setup.sh

tempfile=`${CMTROOT}/mgr/cmt -quiet build temporary_name`
if test ! $? = 0 ; then tempfile=/tmp/cmt.$$; fi
${CMTROOT}/mgr/cmt setup -sh -pack=PrKernel -version=v1r10 -path=/users/LHCb/abdulkhalek/cmtuser/Brunel_v50r1/Pr  -no_cleanup $* >${tempfile}; . ${tempfile}
/bin/rm -f ${tempfile}

