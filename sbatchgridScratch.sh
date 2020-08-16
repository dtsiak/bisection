#!/bin/bash
#SBATCH --partition=parallel
#SBATCH --mem=10GB
#SBATCH --cpus-per-task=4



#module load cmake/3.10.2
#module load mpi/ofed/openmpi-1.8.8-gcc5
#module load python/2.7.9
#module load gcc/7.3.0
module load gcc/9.3.0


dphi=$1
D0=$2
dim_Y=1.1

D01=$(python -c "print $D0")
mv  /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0} /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01}
mkdir /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01}
#python  /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/generate_xml.py ${dphi} ${D0}
mv  /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01} /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}



#/scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/main.cpp
###
mkdir /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/build
cd /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/build
/home/dtsiakoulias/qboot/cmake-3.18.0-rc3/bin/cmake .. -DQBoot_ROOT=/home/dtsiakoulias/qboot/executable -DCMAKE_BUILD_TYPE=Debug
make
cd /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/build/bin
./sample-debug ${dphi} ${D0} ${dimY}

###
#module unload gcc/9.3.0
#module load gcc/7.3.0

sbatch  -e /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/${dphi}_${D0}.err -o /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/out${dphi}_${D0}.out  $HOME/workdir/workdir2/PARALLEL_XML_BISECTION_AUTO/SdpbRunnerScratch ${dphi} ${D0}
