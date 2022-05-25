import os
import sys

def main():
    start = int(sys.argv[1])
    end = int(sys.argv[2])

    records_file = "1000genomes.low_coverage.GRCh38DH.alignment.index"
    records = open(records_file, "r").readlines()

    for record in records[start:end]:
        rs = record.rstrip().split("\t")
        original_filename = rs[0].split("/")[-1]
        input_cram = original_filename.replace(".cram", ".downsampled.cram")

        command = "scp" \
            + " -i " + os.getenv("KEY_FILE") \
            + " %s@%s:/scratch/data/ismb-prep-embassy/downsampled/%s*" % (os.getenv("USER"), os.getenv("SERVER_IP"), input_cram) \
            + " downsampled/"

        os.system(command)

if __name__ == "__main__":
    main()
