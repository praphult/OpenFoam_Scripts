#!/bin/bash


GS_1="10X10X10" 

GS_2="20X20X20"

GS_3="40X40X40"

echo -e "Creating directories \n"

mkdir -p Run_$GS_2 Run_$GS_3

echo -e "Directories created \n"

echo -e "Cleaning Run_$GS_1 directory"

(cd Run_$GS_1; . ./clearCase.sh )

#: <<'END'

echo -e "Copying files to Run_$GS_2 | Run_$GS_3 \n"

cp -r Run_$GS_1/* Run_$GS_2 

cp -r Run_$GS_1/* Run_$GS_3 

echo -e "Copying completed \n "


echo -e "Modiying_meshes in Run_$GS_2 | Run_$GS_3 \n"

sed -i '34s/(10 10 10)/(20 20 20)/g' Run_$GS_2/system/blockMeshDict   # <--- Edit here 

sed -i '34s/(10 10 10)/(40 40 40)/g' Run_$GS_2/system/blockMeshDict   # <--- Edit here

echo -e "Sourcing OpenFoam environment \n"

of19

echo -e  "Meshing \n"


(cd Run_$GS_1; blockMesh 2>&1 >> blockMeshLog_$GS_1.txt)     

(cd Run_$GS_2; blockMesh 2>&1 >> blockMeshLog_$GS_2.txt)     

(cd Run_$GS_3; blockMesh 2>&1 >> blockMeshLog_$GS_3.txt)     

echo -e "Meshing completed \n"

echo -e "Solving \n"


(cd Run_$GS_1; laplacianFoam 2>&1 >> solverLog_$GS_1.txt)

(cd Run_$GS_2; laplacianFoam 2>&1 >> solverLog_$GS_2.txt)


(cd Run_$GS_3; laplacianFoam 2>&1 >> solverLog_$GS_3.txt)

echo -e  "Solution complete \n"

#END

