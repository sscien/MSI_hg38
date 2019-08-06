Daniel Cui Zhou
daniel.cui@wustl.edu
Last updated: 08/06/19

Adapted from Qingsong Gao's hg19 pipeline.

VERSION: v1.2
Build: hg38
Cluster: MGI

MSIsensor can be found here: https://github.com/ding-lab/msisensor.
MSI scores can roughly be interpreted as the percentage of microsatellite sites (with deep enough sequencing coverage) that have a lesion.

Samples with an MSIscore > 3.5 are classified as "MSI-High" and the rest will be classified as "MSS." An intermediate class with 1.0 <= score <= 3.5 can be defined as "MSI-Low."

The site file annotation is as follows:
chromosome, location, repeat_unit_length, repeat_unit_binary, repeat_times, left_flank_binary, right_flank_binary, repeat_unit_bases, left_flank_bases, right_flank_bases
More details can be found in the github page.

Processing details:
Run "get_link.pl" to generate a "to_run.sh" file and create the appropriate folder directory for each sample.
Run "to_run.sh" in order to submit MSIsensor jobs.

Changelog: updated paths in MGI
