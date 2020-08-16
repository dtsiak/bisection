#!/bin/bash


#1.2951
#dphi_list=(0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.5201 0.5202 0.5203 0.5204 0.5205 0.5206 0.5207 0.5208 0.5209 0.521 0.5211 0.5212 0.5213 0.5214 0.5215)
#1.2949
#dphi_list=(0.5216 0.52161 0.52162)
dphi_list=(0.5374 0.5373 0.5372 0.5371 0.5375 0.538 0.5385 0.539 0.5391 0.53775 0.53825 0.5395 0.537 0.5396 0.53695 0.536975 0.53694)
#below is the peninsula
#dphi_list=(0.5426 0.5428 0.543 0.544 0.545 0.546 0.547 0.548 0.549)


#dphi_list=(0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.5201 0.5202 0.5203 0.5204 0.5205 0.5206 0.5207 0.5208 0.5209 0.521 0.5211 0.5212 0.5213 0.5214 0.5215)
#dphi_list=(0.5216 0.52161 0.52162)
#dphi_list=(0.508 0.509 0.51 0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518)
D0_list=(3.0)

rm APoints NPoints Convergences CompletionStatus Convergence APointsp ALLPoints ALLPoints  APointsp NPointsp CompletionStatusp Convergencep  Convergencesp ALLPointsp

for dphi in "${dphi_list[@]}"; do
   for D0 in "${D0_list[@]}"; do

   tail -n 1 OUTPUTS/output_${dphi}_Allowed >> APoints
   tail -n 1 OUTPUTS/output_${dphi}_Not_Allowed >> NPoints
   echo ${dphi} >> CompletionStatus
   tail -n 1 Documentation/CurrentPoint_${dphi} >> CompletionStatus    
   echo ${dphi} >> Convergence
   tail -n 1 Documentation/Diff_${dphi} >> Convergence

   command=$(tail -n 1 Documentation/Diff_${dphi})
   echo {${dphi}, ${command}}, >> Convergences
   
   cat OUTPUTS/output_${dphi}_Allowed >> ALLPoints 
   cat OUTPUTS/output_${dphi}_Not_Allowed >> ALLPoints

   done
done 

dphi_list=(0.5424 0.5426 0.5428 0.543 0.544 0.545 0.546 0.547 0.548 0.549 0.5423)
for dphi in "${dphi_list[@]}"; do
   for D0 in "${D0_list[@]}"; do

   tail -n 1 OUTPUTS/output_${dphi}_Allowed >> APointsp
   tail -n 1 OUTPUTS/output_${dphi}_Not_Allowed >> NPointsp
   echo ${dphi} >> CompletionStatusp
   tail -n 1 Documentation/CurrentPoint_${dphi} >> CompletionStatusp
   echo ${dphi} >> Convergencep
   tail -n 1 Documentation/Diff_${dphi} >> Convergencep

   command=$(tail -n 1 Documentation/Diff_${dphi})
   echo {${dphi}, ${command}}, >> Convergencesp

   cat OUTPUTS/output_${dphi}_Allowed >> ALLPointsp
   cat OUTPUTS/output_${dphi}_Not_Allowed >> ALLPointsp

   done
done

