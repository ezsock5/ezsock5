#!/bin/sh
pwdStr=`pwd`
echo $pwdStr

for f in `find ${pwdStr} -name *.so.*` 
do
  fname=${f}
  for i in 1 2 3 4
  do
    if [[ ${fname} == *so ]]; then
       break
    else
      fname="${fname%.*}"
      echo "${fname}"
      ln -s -f $f $fname
    fi 
  done
done

export LD_LIBRARY_PATH=$pwdStr/usr/lib64:$LD_LIBRARY_PATH

./ezsock5


