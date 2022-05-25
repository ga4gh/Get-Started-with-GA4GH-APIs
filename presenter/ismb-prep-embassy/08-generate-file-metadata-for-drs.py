import hashlib
import os

def main():
    input_dir = "downsampled"
    output_lines = ["\t".join([
        "sample_id",
        "cram_size",
        "cram_md5",
        "cram_sha1",
        "cram_sha256",
        "crai_size",
        "crai_md5",
        "crai_sha1",
        "crai_sha256",
    ])]
    all_files = sorted(os.listdir(input_dir))
    all_crams = [f for f in all_files if f.endswith(".cram")]

    for cram in all_crams:
        sample_id = cram.split(".")[0]
        crai = cram + ".crai"

        cram_content = open(os.path.join(input_dir, cram), 'rb').read()
        crai_content = open(os.path.join(input_dir, crai), 'rb').read()
        
        cram_size = str(os.path.getsize(os.path.join(input_dir, cram)))
        cram_md5 = hashlib.md5(cram_content).hexdigest()
        cram_sha1 = hashlib.sha1(cram_content).hexdigest()
        cram_sha256 = hashlib.sha256(cram_content).hexdigest()
        
        crai_size = str(os.path.getsize(os.path.join(input_dir, crai)))
        crai_md5 = hashlib.md5(crai_content).hexdigest()
        crai_sha1 = hashlib.sha1(crai_content).hexdigest()
        crai_sha256 = hashlib.sha256(crai_content).hexdigest()

        output_line = [
            sample_id,
            cram_size,
            cram_md5,
            cram_sha1,
            cram_sha256,
            crai_size,
            crai_md5,
            crai_sha1,
            crai_sha256,
        ]

        output_lines.append("\t".join(output_line))
    
    output_file = "../../sessions/5/data/1000genomes-testdataset-metadata.tsv"
    open(output_file, "w").write("\n".join(output_lines) + "\n")

if __name__ == "__main__":
    main()