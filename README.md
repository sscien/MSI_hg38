Yizhe Song
y.song@wustl.edu

& Daniel Cui Zhou daniel.cui@wustl.edu

Last updated: 11/17/21

Adapted from Daniel Cui Zhou's hg38 pipeline.

VERSION: v1.4
Build: hg38
Cluster: katmai

MSIsensor can be found here: https://github.com/ding-lab/msisensor.
MSI scores can roughly be interpreted as the percentage of microsatellite sites (with deep enough sequencing coverage) that have a lesion.

Samples with an MSIscore > 3.5 are classified as "MSI-High" and the rest will be classified as "MSS." An intermediate class with 1.0 <= score <= 3.5 can be defined as "MSI-Low."

The site file annotation is as follows:
chromosome, location, repeat_unit_length, repeat_unit_binary, repeat_times, left_flank_binary, right_flank_binary, repeat_unit_bases, left_flank_bases, right_flank_bases
More details can be found in the github page.

Processing details:
Run "makeDir_msi_v1.py" to generate a "to_run.sh" file and create the appropriate folder directory for each sample. 
Run "to_run.sh" in order to submit MSIsensor jobs.
Run "copy_MSI_scores.sh" and "copy_MSI_sites.sh" to organize the results.
Run "analysis_description_V3.py" to generate Analysis summary file


Changelog: updated paths in katmai

Versions:

1.4: Adapted MSIsensor to be compatible with katmai since MGI was down; Changed perl script to Python script (get_link.pl to makeDir_msi_v1.py), fixed bugs for querying matched tumor-normal pairs; Added run_name for analysis description file (MSI.analysis_description.dat)

1.3: Fixed minor bug (highly unusual edge cases with normal bam swaps). Recommended to rerun samples with v1.3 just in case.

1.2: Slight modification to reduce job memory requirements

1.1: Slight modification for faster parallel job submission

1.0: Pipeline developed for hg38
