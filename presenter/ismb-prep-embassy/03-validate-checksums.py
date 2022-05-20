import os

def main():
    records_file = "1000genomes.low_coverage.GRCh38DH.alignment.index"
    records = open(records_file, "r").readlines()
    
    assessed = 0
    valid = 0
    invalid = []
    for record in records:
        rs = record.rstrip().split("\t")
        filename = rs[0].split("/")[-1]
        sample_id = filename.split(".")[0]
        cram_md5_file = "./md5/%s.cram.md5" % sample_id
        crai_md5_file = "./md5/%s.crai.md5" % sample_id

        exp_cram_md5 = rs[1]
        exp_crai_md5 = rs[3]

        if os.path.exists(cram_md5_file) and os.path.exists(crai_md5_file):
            assessed += 1
            obs_cram_md5 = open(cram_md5_file, "r").read().rstrip()
            obs_crai_md5 = open(crai_md5_file, "r").read().rstrip()
            if exp_cram_md5 == obs_cram_md5 and exp_crai_md5 == obs_crai_md5:
                valid += 1
            else:
                invalid.append(sample_id)
    
    message = str(assessed) + " cram/crai pairs were assessed for md5 integrity.\n" \
            + str(valid) + " pairs passed validation.\n"
    
    if len(invalid) > 0:
        message += str(len(invalid)) + " pairs failed validation.\n" \
            + "Sample IDs failing validation:\n" \
            + "\n".join(invalid) + "\n"
    
    print(message)

if __name__ == "__main__":
    main()
