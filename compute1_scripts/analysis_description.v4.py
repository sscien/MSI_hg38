import subprocess
import os

uuidDict = {};
sampleFile = open("sample_map.txt");
for line in sampleFile:
    line = line.strip().split("\t");
    uuidDict[line[5]] = line[9];
sampleFile.close();

samples = [i for i in subprocess.check_output("ls",shell=True).decode("utf-8").strip().split("\n") if "C3" in i]
currPath = os.path.abspath(".")+"/";
print("#Case_Name\tDisease\tOutput_File_Path\tOutput_File_Format\tTumor_Sample_Name\tTumor_BAM_UUID\tNormal_Sample_Name\tNormal_BAM_UUID");
for sample in samples:
    print("\t".join([sample,
        "AML",
        currPath+"submission/"+sample+".MSI.WXS.dat",
        "TSV",
        sample+".WXS.T.hg38",
        uuidDict[os.path.realpath(sample+"/"+sample+".T.bam")],
        sample+".WXS.N.hg38",
        uuidDict[os.path.realpath(sample+"/"+sample+".N.bam")]
                    ]))
    print("\t".join([sample,
        "AML",
        currPath+"submission/"+sample+".somatic.sites.tsv",
        "TSV",
        sample+".WXS.T.hg38",
        uuidDict[os.path.realpath(sample+"/"+sample+".T.bam")],
        sample+".WXS.N.hg38",
        uuidDict[os.path.realpath(sample+"/"+sample+".N.bam")]
                    ]))