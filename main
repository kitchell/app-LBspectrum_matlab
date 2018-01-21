#!/bin/bash
#PBS -l nodes=1:ppn=8:dc2,walltime=2:00:00
#PBS -N LBmatlab
#PBS -V

rm finished

#if [ $ENV == "IUHPC" ]; then
#    module load matlab
#fi
module load singularity 2> /dev/null

singularity exec -e docker://brainlife/mcr:neurodebian1604-r2017a ./compiledmatlab/main
#matlab -nodisplay -nosplash -r main

#if [ -s spectrum.json ] && [ -s eigenvectors.mat ]
if [ -s spectrum.json ]
then
	echo 0 > finished
else
	echo "files missing"
	echo 1 > finished
	exit 1
fi
