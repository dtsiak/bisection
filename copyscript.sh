#!/bin/bash


#1.2951
#dphi_list=(0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.5201 0.5202 0.5203 0.5204 0.5205 0.5206 0.5207 0.5208 0.5209 0.521 0.5211 0.5212 0.5213 0.5214 0.5215)
#1.2949
#dphi_list=(0.5216 0.52161 0.52162)
#dphi_list=(0.5374 0.5373 0.5372 0.5371 0.5375 0.538 0.5385 0.539 0.5391 0.53775 0.53825 0.5395 0.537 0.5396 0.53695 0.536975 0.53694)
#below is the peninsula
#dphi_list=(0.5426 0.5428 0.543 0.544 0.545 0.546 0.547 0.548 0.549)


#dphi_list=(0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.5201 0.5202 0.5203 0.5204 0.5205 0.5206 0.5207 0.5208 0.5209 0.521 0.5211 0.5212 0.5213 0.5214 0.5215)
#dphi_list=(0.5216 0.52161 0.52162)
#dphi_list=(0.508 0.509 0.51 0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518)
D0_list=(3.0)
#dphi_list=(0.501 0.502  0.503 0.504 0.505 0.506 0.507 0.508 0.509 0.51  0.511 0.512 0.513 0.514 0.515 0.516 0.517 0.518 0.519 0.52  0.521 0.522 0.523 0.524 0.525 0.526 0.527 0.528 0.529 0.53  0.531 0.532 0.533 0.534 0.535 0.536 0.537 0.538 0.539 0.54  0.541 0.542 0.543 0.544 0.545 0.546 0.547 0.548 0.549 0.55)
#dphi_list=(0.517 0.518 0.5181 0.5182 0.5183 0.5184 0.5185 0.5186 0.5187 0.5188 0.5189 0.519  0.5191 0.5192 0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.521 0.522 0.523 0.525 0.527 0.529 0.531 0.533 0.535)
#dphi_list=(0.519 0.5191)

#COMPLETED ONES
#dphi_list=(0.518556 0.518557 0.518558 0.518559 0.51856 0.51857 0.51858 0.51859 0.5186 0.51875 0.5189 0.519 0.5191 0.5192 0.5193 0.5194 0.5195 0.5196 0.5197 0.5198 0.5199 0.52 0.52001 0.52002 0.52003 0.52004)
dphi_list=(0.518552 0.518553 0.518554 0.518555 0.518556 0.518557 0.518558 0.518559 0.52005 0.52006)
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

dphi_list=(0.51869 0.5187 0.5188 0.5189 0.519 0.5191 0.5192 0.5193 0.5194 0.5195 0.5196 0.51964)
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

