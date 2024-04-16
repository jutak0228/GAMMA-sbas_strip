#!/bin/bash

# Part 0: remove "polar" name and create SLC_tab and dates from rslc files

work_dir="$1"
ref_date="$2"
polar="$3"

cd ${work_dir}/rslc
if [ -e SLC_tab -a dates ];then rm -f SLC_tab dates; fi
for file in `ls *_${polar}.rslc`
do
    date=`basename ${file} | awk -F"_" '{print $1}'`
    cp ${file} ${date}.rslc
    cp ${file}.par ${date}.rslc.par
    echo "${work_dir}/rslc/${date}.rslc ${work_dir}/rslc/${date}.rslc.par" >> ${work_dir}/rslc/SLC_tab
    echo "${date}" >> ${work_dir}/rslc/dates
done

