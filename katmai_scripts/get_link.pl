#!/usr/bin/perl

use strict;
use warnings;


open(OUT, ">to_run.sh");
print OUT "#!/bin/bash\n";

open(IN, "samples.txt");
while(<IN>)
{
	chomp;
	my @l = split(/\t/,);
	my $sample=$l[1];
	system("mkdir -p $sample");
	system("ln -s $l[5] $sample/$sample.N.bam");
	system("ln -s $l[5].bai $sample/$sample.N.bam.bai");
	my $nxt = <IN>;
	my @m = split(/\t/,$nxt);
        system("ln -s $m[5] $sample/$sample.T.bam");
        system("ln -s $m[5].bai $sample/$sample.T.bam.bai");
	print OUT "tmux new -d -s \"$sample\" \'bash /diskmnt/Projects/Users/dcui/Projects/MSI_hg38_pipeline/msisensor.sh $sample $sample.N.bam $sample.T.bam\'\n";
}

