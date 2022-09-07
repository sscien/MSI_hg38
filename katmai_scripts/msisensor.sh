#!/bin/bash

#source activate MSI_hg38

REF="/diskmnt/Datasets/Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"
SAMPLE=$1
NORMAL_BAM=$2
TUMOR_BAM=$3
MSI="/diskmnt/Projects/Users/dcui/Projects/MSI_hg38_pipeline/hg38.microsatellite"
cd ${SAMPLE}
msisensor msi -d ${MSI} -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b 2
gzip ${SAMPLE}_dis
