def main():
    samples_file = "scripts/igsr_samples.tsv"
    uuid_file = "scripts/uuids.tsv"

    samples_fh = open(samples_file, "r")
    uuid_fh = open(uuid_file, "r")

    samples_fh.readline() # header line

    for i in range(0, 4978): # 4978 samples
        sample = samples_fh.readline().strip()
        uuid = uuid_fh.readline().strip()
        print(sample)
        print(uuid)
        print("*")

if __name__ == "__main__":
    main()
