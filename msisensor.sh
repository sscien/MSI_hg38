#!/bin/bash

#source activate MSI_hg38

REF="/gscmnt/gc2521/dinglab/dcui/MSI/MSIsensor/CPTAC_pipelines/MSIsensor_hg38/ref/GRCh38.d1.vd1.fa"
SAMPLE=$1
NORMAL_BAM=$2
TUMOR_BAM=$3
MSI="/gscmnt/gc2521/dinglab/dcui/MSI/MSIsensor/CPTAC_pipelines/MSIsensor_hg38/ref/hg38.microsatellite"
cd ${SAMPLE}
msisensor msi -d ${MSI} -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b 2
gzip ${SAMPLE}_dis
