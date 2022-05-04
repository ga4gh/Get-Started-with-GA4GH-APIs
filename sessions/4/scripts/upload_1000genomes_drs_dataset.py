import json
import requests

def main():
    input_file = "tmp/drs_dataset.ndjson"
    input_fh = open(input_file, "r")

    url = "http://localhost:4001/admin/ga4gh/drs/v1/objects"

    for record in input_fh:
        drs_object_json = record.strip()
        drs_object = json.loads(drs_object_json)

        response = requests.post(url, json=drs_object)

if __name__ == "__main__":
    main()