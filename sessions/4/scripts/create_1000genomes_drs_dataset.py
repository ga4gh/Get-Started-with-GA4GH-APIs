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
            "created_time": "2022-07-10T09:00:00Z",
            "mime_type": "application/cram",
            "name": sample + ".1kgenomes.wgs.downsampled.cram",
            "size": 0,
            "updated_time": "2022-07-10T09:00:00Z",
            "version": "0.1.0",
            "aliases": [
                sample + " WGS Downsampled CRAM"
            ],
            "checksums": [
            ],
            "is_bundle": False,
            "aws_s3_access_objects": []
        }
        output_fh.write(json.dumps(drs_object) + "\n")

        # CRAI DRS OBJECT
        drs_object = {
            "id": sample + ".1kgenomes.wgs.downsampled.crai",
            "description": "1000 Genomes WGS Downsample CRAI for Sample: " + sample,
            "created_time": "2022-07-10T09:00:00Z",
            "mime_type": "application/crai",
            "name": sample + ".1kgenomes.wgs.downsampled.crai",
            "size": 0,
            "updated_time": "2022-07-10T09:00:00Z",
            "version": "0.1.0",
            "aliases": [
                sample + " WGS Downsampled CRAI"
            ],
            "checksums": [
            ],
            "is_bundle": False,
            "aws_s3_access_objects": []
        }
        output_fh.write(json.dumps(drs_object) + "\n")

        # BUNDLE DRS OBJECT
        drs_object = {
            "id": sample + ".1kgenomes.wgs.downsampled.bundle",
            "description": "1000 Genomes WGS Downsample CRAM/CRAI Bundle for Sample: " + sample,
            "created_time": "2022-07-10T09:00:00Z",
            "name": sample + ".1kgenomes.wgs.downsampled.bundle",
            "size": 0,
            "updated_time": "2022-07-10T09:00:00Z",
            "version": "0.1.0",
            "aliases": [
                sample + " WGS Downsampled CRAM/CRAI Bundle"
            ],
            "checksums": [
            ],
            "is_bundle": True,
            "drs_object_children": [
                {"id": sample + ".1kgenomes.wgs.downsampled.cram"},
                {"id": sample + ".1kgenomes.wgs.downsampled.crai"}
            ]
        }
        output_fh.write(json.dumps(drs_object) + "\n")

    output_fh.close()

if __name__ == "__main__":
    main()
