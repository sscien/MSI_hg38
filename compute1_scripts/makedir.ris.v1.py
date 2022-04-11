#!/usr/bin/python

import sys;
import subprocess;

outputFolder = sys.argv[3];

# Single column
wantedFile = open(sys.argv[1]);
wanted = [line.strip() for line in wantedFile];
wantedFile.close();

pathDict = {};
# BamMap file
matchFile = open(sys.argv[2])
matchFile.readline();
for line in matchFile:
	line = line.strip().split("\t");
	sample = line[0].split(".")[0];
	if sample not in wanted:
		continue;
	if "tumor" in line[4]:
		tissue = "T";
	else:
		tissue = "N";
	pairDir = line[0].split(".")[-2];
	path = line[5];
	if "WXS" not in line[3]:
		continue
	if "bam" not in path:
		continue
	if sample not in pathDict:
		pathDict[sample] = {"T":"","N":""};
	pathDict[sample][tissue] = path;
matchFile.close();

output = open("toRun.sh","w");
output2 = open("missingSamples.txt","w");
output3 = open("seqRun.sh","w");
output4 = open("ogRun.sh","w");

for sample in pathDict:
	if sample not in wanted:
		print(sample+"\t"+"noData",file=output2);
		continue;
	elif pathDict[sample]["T"] == "":
		print(sample+"\t"+"noTumorData",file=output2);
		continue;
	elif pathDict[sample]["N"] == "":
		print(sample+"\t"+"noNormalData",file=output2);
		continue;
	subprocess.call("mkdir "+outputFolder+"/"+sample+"/",shell=True);
	subprocess.call("ln -s "+pathDict[sample]["T"]+" "+outputFolder+"/"+sample+"/"+sample+".T.bam",shell=True);
	subprocess.call("ln -s "+pathDict[sample]["N"]+" "+outputFolder+"/"+sample+"/"+sample+".N.bam",shell=True);
	print(pathDict[sample]["N"]);
	print("tmux new -d -s "+ sample +" '"+'bash /diskmnt/Projects/Users/dcui/Projects/MSI_hg38_pipeline/msisensor.sh ' +sample +" " +sample+".N.bam " +sample+".T.bam"+"'",file=output);
	print('bash /diskmnt/Projects/Users/dcui/Projects/MSI_hg38_pipeline/msisensor.sh ' +sample +" " +pathDict[sample]["N"] +" " +pathDict[sample]["T"],file=output4);
	print('bash /diskmnt/Projects/Users/dcui/Projects/MSI_hg38_pipeline/msisensor.sh ' +sample +" " +sample+".N.bam " +sample+".T.bam",file=output3);
output.close();
output2.close();
output3.close();
output4.close();