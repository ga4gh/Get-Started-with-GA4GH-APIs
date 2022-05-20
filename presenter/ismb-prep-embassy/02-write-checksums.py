import hashlib
import os
import sys

def get_md5_and_write(infile, outfile):
    with open(infile, "rb") as f:
        file_hash = hashlib.md5()
        while chunk := f.read(8192):
            file_hash.update(chunk)
    
        open(outfile, "w").write(file_hash.hexdigest()+"\n")

def main():
    start = int(sys.argv[1])
    end = int(sys.argv[2])

    records_file = "1000genomes.low_coverage.GRCh38DH.alignment.index"
    records = open(records_file, "r").readlines()

    if not os.path.exists("md5"):
        os.mkdir("md5")
    
    for record in records[start:end]:
        filename = record.rstrip().split("\t")[0].split("/")[-1]
        cram_file = "./cram/" + filename
        crai_file = cram_file + ".crai"
        sample_id = filename.split(".")[0]
        cram_md5_file = "./md5/%s.cram.md5" % sample_id
        crai_md5_file = "./md5/%s.crai.md5" % sample_id

        get_md5_and_write(cram_file, cram_md5_file)
        get_md5_and_write(crai_file, crai_md5_file)

if __name__ == "__main__":
    main()
