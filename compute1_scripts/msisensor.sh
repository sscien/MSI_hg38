#!/bin/bash
export LANG=C
# Activate environment
#source activate MSI_hg38 || echo activate failed

# Read in arguments
#sample=$1
#fq_1=$2
#fq_2=$3
#cpu=$4
#worklist=1
SAMPLE="$(sed -n "${LSB_JOBINDEX}p" work.list)"
NORMAL_BAM="$(sed -n "${LSB_JOBINDEX}p" work.list).N.bam"
TUMOR_BAM="$(sed -n "${LSB_JOBINDEX}p" work.list).T.bam"
cpu=8
REF="/storage1/fs1/dinglab/Active/Projects/PECGS/ref_genome/GRCh38.d1.vd1.fa"
out="/storage1/fs1/dinglab/Active/Projects/ysong/Projects/cptac_jobs/cptac_msi_analysis/msi_batch_0308/submission"

# Make directories
cd ${SAMPLE}
#mkdir -p logs
#msisensor msi -d ${MSI} -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b 2
#msisensor msi -d ${MSI} -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b 16
#MSI=/diskmnt/Projects/Users/ysong/test_data/hg38.microsatellite
msisensor msi -d /storage1/fs1/dinglab/Active/Projects/PECGS/MSI_hg38/WXS_test/hg38.microsatellite -n ${NORMAL_BAM} -t ${TUMOR_BAM} -o ${SAMPLE} -l 1 -q 1 -b $cpu
cp ${SAMPLE}_somatic $out/${SAMPLE}.somatic.sites.tsv
cp ${SAMPLE}_germline $out/${SAMPLE}.germline.sites.tsv
cp ${SAMPLE} $out/${SAMPLE}.MSI.WXS.dat
gzip ${SAMPLE}_dis