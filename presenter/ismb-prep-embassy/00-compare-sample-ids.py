# Check input files to see if 200 sample id's match

def main():
    file_a = "1kg-200samples.tsv"
    file_b = "1000genomes.low_coverage.GRCh38DH.alignment.index"

    sample_ids_a = []
    sample_ids_b = []

    fh_a = open(file_a, "r")
    fh_a.readline()
    for line in fh_a:
        sample_id = line.strip().split("\t")[-1]
        sample_ids_a.append(sample_id)
    
    fh_b = open(file_b, "r")
    for line in fh_b:
        sample_id = line.rstrip().split("\t")[0].split("/")[-1].split(".")[0]
        sample_ids_b.append(sample_id)
    
    sorted_samples_a = ",".join(sorted(sample_ids_a))
    sorted_samples_b = ",".join(sorted(sample_ids_b))

    if sorted_samples_a == sorted_samples_b:
        print("EQUAL")
    else:
        print("NOT EQUAL")

if __name__ == "__main__":
    main()
