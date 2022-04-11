#!/bin/bash
export LANG=C
# Activate environment
source activate Fusion || echo activate failed

# Read in arguments
#sample=$1
#fq_1=$2
#fq_2=$3
#cpu=$4
#worklist=1
SAMPLE="$(sed -n "${LSB_JOBINDEX}p" work.list)"
NORMAL_BAM="$(sed -n "${LSB_JOBINDEX}p" work.list).N.bam"
TUMOR_BAM="$(sed -n "${LSB_JOBINDEX}p" work.list).T.bam"
# Make directories
cd ${SAMPLE}
samtools index ${NORMAL_BAM}
samtools index ${TUMOR_BAM}