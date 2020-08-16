#!/bin/bash
#SBATCH --partition=parallel
#SBATCH --mem=0
#SBATCH --cpus-per-task=40


dphi_list=(0.501 0.502 0.503 0.504 0.505 0.506 0.507 0.508 0.509 0.51 0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518 0.519 0.52 0.521 0.522 0.523 0.524 0.525 0.526 0.527 0.529 0.531 0.533 0.535 0.54 0.55 0.56 0.57 0.58 0.59 0.6)
D0=(0.8 0.98 1.55)


for dphi in "${dphi_list[@]}"; do
#  cp sbatchgridScratch.sh /scratch/skousvos/xml_ck_out_${dphi}/sbatchgrid.sh
  rm -r /scratch/skousvos/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}*
done
