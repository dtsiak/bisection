#!/bin/bash
#SBATCH --partition=parallel
#SBATCH --mem=48GB
#SBATCH --cpus-per-task=20



#for OMON it was 94GB 20 cpus per task

module load python/2.7.9
module load cmake/3.10.2
module load mpi/ofed/openmpi-1.8.8-gcc5
module load python/2.7.9
module load gcc/7.3.0




DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#dphi_list=(0.501  0.502 0.503 0.504 0.505 0.506 0.507 0.508 0.509 0.51 0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518 0.519 0.52 0.521 0.522 0.523 0.524 0.525 0.527 0.529 0.531 0.533 0.535 0.54 0.55)
dphi_list=(0.501 0.502 0.503 0.504 0.505 0.506 0.507 0.508 0.509 0.51 0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518 0.519 0.52 0.521 0.522 0.523 0.524 0.525 0.526 0.527 0.529 0.531 0.533 0.535 0.54 0.55 0.56 0.57 0.58 0.59 0.6)

upper=2.0
lower=0.5
echo "scale=20; $upper/2 + $lower/2" | bc >> CurrentPoint


mkdir OUTPUTS
mkdir SLURM_Grid_OUTS
mkdir Documentation

for dphi in "${dphi_list[@]}"; do
   mkdir xml_ck_out_${dphi}
#   cp generate_xmlOMN22.py xml_and_ck_${dphi}/generate_xml.py     
   cp generate_xmlONOMsingle.py xml_ck_out_${dphi}/generate_xml.py   
   cp sbatchgridPARB2.sh xml_ck_out_${dphi}/sbatchgrid.sh 
   cd xml_ck_out_${dphi}
   mkdir xml_ck_out_${dphi}
   D0=$( tail -n 1 ../CurrentPoint )
   mkdir xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}
#   sbatch --partition=serial --cpus-per-task=10  -e ${DIR}/SLURM_OUTS/${dphi}_${D0}.err -o ${DIR}/SLURM_OUTS/out${dphi}_${D0}.out generate_xml.py ${dphi} ${D0}
   sbatch -e ${DIR}/SLURM_Grid_OUTS/${dphi}_${D0}.err -o ${DIR}/SLURM_Grid_OUTS/out${dphi}_${D0}.out sbatchgrid.sh ${dphi} ${D0} 

 
   echo $upper >> ../Documentation/Upper_${dphi}
   echo $lower >> ../Documentation/Lower_${dphi}
   echo $D0 >> ../Documentation/CurrentPoint_${dphi}
   cd ..

done





