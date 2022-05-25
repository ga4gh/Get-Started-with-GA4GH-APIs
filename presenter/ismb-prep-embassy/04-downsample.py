import os
import sys

def main():
    start = int(sys.argv[1])
    end = int(sys.argv[2])

    records_file = "1000genomes.low_coverage.GRCh38DH.alignment.index"
    records = open(records_file, "r").readlines()

    for record in records[start:end]:
        rs = record.rstrip().split("\t")
        input_filename = rs[0].split("/")[-1]
        output_filename = input_filename.replace(".cram", ".downsampled.cram")

        command = "samtools view" \
            + " -T /scratch/data/ref/GRCh38_full_analysis_set_plus_decoy_hla.fa" \
            + " -C -L 2400kb.bed" \
            + " cram/" + input_filename \
            + " > downsampled/" + output_filename

        os.system(command)

if __name__ == "__main__":
    main()
