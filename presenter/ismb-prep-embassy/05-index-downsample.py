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
        input_filename = original_filename.replace(".cram", ".downsampled.cram")
        output_filename = input_filename + ".crai"

        command = "samtools index" \
            + " downsampled/" + input_filename \
            + " downsampled/" + output_filename

        os.system(command)

if __name__ == "__main__":
    main()
