#!/bin/bash
#SBATCH --partition=parallel
#SBATCH --mem=48GB
#SBATCH --cpus-per-task=20



module load cmake/3.10.2
module load mpi/ofed/openmpi-1.8.8-gcc5
module load python/2.7.9
module load gcc/7.3.0
 
dphi=$1
D0=$2


D01=$(python -c "print $D0")
mv  $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0} $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01}
python  generate_xml.py ${dphi} ${D0}
mv  $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01} $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}


#mv $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D01}.xml $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/xml_ck_out_${dphi}_${D0}.xml




##--time=1-0
sbatch  -e $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/${dphi}_${D0}.err -o $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/xml_ck_out_${dphi}/out${dphi}_${D0}.out  $HOME/workdir/workdir2/PARALLEL_XML_BISECTION/SdpbRunnerBACKUP2 ${dphi} ${D0}
