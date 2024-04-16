#!/bin/bash

##########################################################################
# [flags] 
##########################################################################
# preprocessing: please copy rslc/ and DEM_prep/ the processing directory.
# sbas processing
part_00="off" 		     # [0] preprocessing (remove polar name from rslc files)
part_01="off" 		     # [1] Generation of MLI images and geocoding
part_02="off"			 # [2] Selection of pairs for the multi-reference stack
part_03="off"		 	 # [3] Generation of differential interferograms, filtering and spatial unwrapping
# please check diff/*.diff0.adf3.bmp
part_04="off"			 # [4] Definition of a mask for the subsidence area
part_05="off"			 # [5] Estimation of linear phase ramps
part_06="off"			 # [6] Checking of phase unwrapping consistency using mb with gamma = 0 
part_07="off"			 # [7] Estimation and subtraction of very long-range atmospheric component
part_08="off"			 # [8] Update estimation and subtraction of atmospheric component
part_09="off"			 # [9] Rerun mb to get quality measure, mask low quality part of result and finalize the result 
part_10="off"			 # [10] Geocoding and visualization of the result

####################################################################################
# setting parameters
####################################################################################
work_dir="/mnt/disks/sdb/jaxa_add/asc/sbas_strip"
shell="${work_dir}/sh"
ref_date="20210212" # First date 
polar="HH" # polar: HH, HV, VH, VV 
rglks="4" # range looks
azlks="4" # azimuth looks
thres_bperp="500" # threshold bperp ("[bperp_max]")
thres_days="-" # threshold days ("[delta_T_max]")
rg_off="1827" # 
az_off="545"

####################################################################################
# sbas processing
####################################################################################
if [ "${part_00}" = "on" ];then bash ${shell}/part00.sh ${work_dir} ${ref_date} ${polar}; fi
if [ "${part_01}" = "on" ];then bash ${shell}/part01.sh ${work_dir} ${ref_date} ${rglks} ${azlks}; fi
if [ "${part_02}" = "on" ];then bash ${shell}/part02.sh ${work_dir} ${ref_date} ${thres_bperp} ${thres_days}; fi
if [ "${part_03}" = "on" ];then bash ${shell}/part03.sh ${work_dir} ${ref_date} ${rglks} ${azlks}; fi
if [ "${part_04}" = "on" ];then bash ${shell}/part04.sh ${work_dir} ${ref_date}; fi
if [ "${part_05}" = "on" ];then bash ${shell}/part05.sh ${work_dir} ${ref_date} ${rg_off} ${az_off}; fi
if [ "${part_06}" = "on" ];then bash ${shell}/part06.sh ${work_dir} ${ref_date} ${rg_off} ${az_off}; fi
if [ "${part_07}" = "on" ];then bash ${shell}/part07.sh ${work_dir} ${ref_date}; fi
if [ "${part_08}" = "on" ];then bash ${shell}/part08.sh ${work_dir} ${ref_date} ${rg_off} ${az_off}; fi
if [ "${part_09}" = "on" ];then bash ${shell}/part09.sh ${work_dir} ${ref_date} ${rg_off} ${az_off}; fi
if [ "${part_10}" = "on" ];then bash ${shell}/part10.sh ${work_dir} ${ref_date}; fi



