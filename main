#!/bin/bash
#PBS -l nodes=1:ppn=8,vmem=28gb,walltime=8:00:00
#PBS -N LBmatlab
singularity exec -e docker://brainlife/mcr:neurodebian1604-r2017a ./compiledmatlab/main

if [ ! -f spectrum.json ] 

then
    echo "spectrum.json is missing"
    exit 1
fi

