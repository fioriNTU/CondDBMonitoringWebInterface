#!/bin/bash

if [ "${1}" == "CMSSW_7_4_0_pre9" ]; then
   export SCRAM_ARCH=slc6_amd64_gcc491
elif [ "${1}" == "CMSSW_7_0_4" ]; then
   export SCRAM_ARCH=slc5_amd64_gcc481
else
   export SCRAM_ARCH=slc5_amd64_gcc462
fi
echo $SCRAM_ARCH

source /afs/cern.ch/cms/cmsset_default.sh
echo $SCRAM_ARCH
echo $HOSTNAME

cd /afs/cern.ch/cms/tracker/sistrcalib/MonitorConditionDB/${1}/src
eval `scramv1 runtime -sh`
echo $SCRAM_ARCH
echo $LD_LIBRARY_PATH
cd $OLDPWD

echo $1 $2 $3 $4 $5 $6 $7 $8 $9

print_TrackerMap $2 "$3" $4 $5 $6 $7 $8 $9 2>&1
