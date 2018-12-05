#!/bin/bash

REF="/gscmnt/gc2521/dinglab/mwyczalk/somatic-wrapper-data/image.data/A_Reference/GRCh38.d1.vd1.fa"
SAMPLE=$1
NORMAL_BAM=$2
TUMOR_BAM=$3
MSI="/gscmnt/gc2737/ding/dcui/hg38.microsatellite"
cd ${SAMPLE}
msisensor msi -d ${MSI} -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b 2
gzip ${SAMPLE}_dis
