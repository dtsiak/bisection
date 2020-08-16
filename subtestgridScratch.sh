#!/bin/bash
#SBATCH --partition=parallel
#SBATCH --mem=10GB
#SBATCH --cpus-per-task=4

#BEFORE IT WAS mem=0GB and cpuspertask=40

#for OMON it was 94GB 20 cpus per task

#module load python/2.7.9
#module load cmake/3.10.2
#module load mpi/ofed/openmpi-1.8.8-gcc5
#module load python/2.7.9
#module load gcc/7.3.0

module load gcc/9.3.0



DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#Uncomment the appropriate lines depending on upper lower  inputs etc

#upper=2.0
#lower=1.0
#echo "scale=20; $upper/2 + $lower/2" | bc >> CurrentPoint
dphi_list=(0.5195)
mkdir OUTPUTS
mkdir SLURM_Grid_OUTS
mkdir Documentation
mkdir /scratch/dtsiakoulias/bisection_auto


for dphi in "${dphi_list[@]}"; do

#THESE THREE LINES ARE THE NEW ONES
#   lower=1.0
#   upper=10.0
   lower=$( tail -n 1 ${DIR}/Documentation/Lower_${dphi} )
   upper=$( tail -n 1 ${DIR}/Documentation/Upper_${dphi} )
   echo "scale=20; $upper/2 + $lower/2" | bc >> CurrentPoint


   mkdir /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}

   cp main.cpp /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/main.cpp
   cp CMakeLists.txt /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/CMakeLists.txt
   cp sbatchgridScratch.sh /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/sbatchgridScratch.sh


#   cp generate_xmlCUBICphiS.py /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/generate_xml.py
#   cp sbatchgridScratch.sh /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/sbatchgrid.sh 
   cd /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}
   mkdir xml_ck_out_${dphi}
   D0=$( tail -n 1 ${DIR}/CurrentPoint )
   mkdir xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}
   sbatch -e ${DIR}/SLURM_Grid_OUTS/${dphi}_${D0}.err -o ${DIR}/SLURM_Grid_OUTS/out${dphi}_${D0}.out /scratch/dtsiakoulias/bisection_auto/xml_ck_out_${dphi}/sbatchgrid.sh ${dphi} ${D0} 

 
   echo $upper >> ${DIR}/Documentation/Upper_${dphi}
   echo $lower >> ${DIR}/Documentation/Lower_${dphi}
   echo $D0 >> ${DIR}/Documentation/CurrentPoint_${dphi}
   cd ${DIR}

done





