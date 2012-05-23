#!/bin/ksh

#--------------------------------------------------------------------
# Part 2 of the ipolates regression test.
#
# Ensure single and multiple thread files are bit identical.
#--------------------------------------------------------------------

#set -x

echo
echo "ENSURE SINGLE AND MULTIPLE THREAD IPOLATES FILES ARE BIT IDENTICAL"
echo

WORK_DIR=${WORK_DIR:-/stmp/$LOGNAME/regression}

WORK1=$WORK_DIR/ipolates.1threads/test
WORK2=$WORK_DIR/ipolates.4threads/test

cd $WORK1

for binfile in *.bin
do
  echo "COMPARE FILE " $binfile
  cmp $binfile  $WORK2/$binfile
  status=$?
  if ((status != 0))
  then
    echo $binfile "NOT BIT IDENTIAL. TEST FAILED."
  fi
done

echo
echo TEST COMPLETED
echo

exit 0
