import json

def main():
    samples_file = "data/igsr_samples.tsv"
    samples_fh = open(samples_file, "r")
    samples_fh.readline() # header line

    output_file = "tmp/drs_dataset.ndjson"
    output_fh = open(output_file, "w")
    output_fh.write("")
    output_fh.close()

    output_fh = open(output_file, "a")

    for i in range(0, 4978): # 4978 samples
        sample_line = samples_fh.readline().strip().split()
        sample = sample_line[0]

        # CRAM DRS OBJECT
        drs_object = {
            "id": sample + ".1kgenomes.wgs.downsampled.cram",
            "description": "1000 Genomes WGS Downsample CRAM for Sample: " + sample,
            "createdTime": "2022-07-10T09:00:00Z",
            "mimeType": "application/cram",
            "name": sample + ".1kgenomes.wgs.downsampled.cram",
            "size": 0,
            "updatedTime": "2022-07-10T09:00:00Z",
            "version": "0.1.0",
            "aliases": [
                sample + " WGS Downsampled"
            ],
            "checksums": [
            ],
            "isBundle": False,
            "awsS3AccessObjects": []
        }
        output_fh.write(json.dumps(drs_object) + "\n")

        # CRAI DRS OBJECT

        # BUNDLE DRS OBJECT

    output_fh.close()

if __name__ == "__main__":
    main()
