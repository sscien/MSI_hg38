#!/bin/bash

dir=$1
target=$2

sed '1d' $dir/to_run.sh | cut -f 7 -d ' ' | while read sample
do
	#array=(${sample//_/ })
	#cp $dir/$sample/${sample}_somatic $2/${array[1]}_sites.tsv
	cp $dir/$sample/${sample}_somatic $2/${sample}.sites.tsv
done

