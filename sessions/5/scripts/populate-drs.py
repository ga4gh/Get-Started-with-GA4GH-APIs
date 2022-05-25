import requests
import datetime

timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%SZ")
aws_region = "us-east-2"
aws_bucket = "ga4gh-ismb-tutorial-2022"

def post_drs_object_to_server(object_id=None, description=None, name=None,
    version=None, aliases=[], is_bundle=None, size=None, mime_type=None,
    checksum_md5=None, checksum_sha1=None, checksum_sha256=None,
    drs_object_parent_ids=[], aws_file_key=None,
    passport_visa_id=None):

    """Submit DRS Object to the local Starter Kit DRS server"""

    url = "http://localhost:5001/admin/ga4gh/drs/v1/objects"
    drs_object_json = {
        "id": object_id,
        "description": description,
        "created_time": timestamp,
        "name": name,
        "updated_time": timestamp,
        "version": version,
        "aliases": aliases,
        "is_bundle": is_bundle,
    }

    if len(drs_object_parent_ids) > 0:
        drs_object_json["drs_object_parents"] = [{"id": i} for i in drs_object_parent_ids]

    if not is_bundle:
        # add size, checksums, drs object parents
        drs_object_json["size"] = size
        drs_object_json["mime_type"] = mime_type
        drs_object_json["checksums"] = []
        drs_object_json["checksums"].append({"type": "md5", "checksum": checksum_md5})
        drs_object_json["checksums"].append({"type": "sha1", "checksum": checksum_sha1})
        drs_object_json["checksums"].append({"type": "sha256", "checksum": checksum_sha256})
        drs_object_json["aws_s3_access_objects"] = [
            {
                "region": aws_region,
                "bucket": aws_bucket,
                "key": aws_file_key
            }
        ]
    
    if passport_visa_id:
        drs_object_json["passport_visas"] = [{"id": passport_visa_id}]

    response = requests.post(url, json=drs_object_json)
    if response.status_code != 200:
        message = "WARNING: Unsuccessful object creation for DRS object with" \
            + " ID: '" + object_id + "'." \
            + " Status Code: " + str(response.status_code)
        print(message)

def add_bed_to_drs():
    """Register test dataset BED file on local Starter Kit DRS service"""

    post_drs_object_to_server(
        object_id="cnest.downsampling.intervals",
        description="Downsampling interval file for test runs of CNest",
        name="2400kb.bed",
        version="1.0.0",
        aliases=[
            "CNest Test BED File"
        ],
        is_bundle=False,
        size=57134,
        mime_type="application/bed",
        checksum_md5="828e5c16c726aa39f1bd35d153b9ab01",
        checksum_sha1="adefa1dce74c487887243bf38e136174bf6d2d0b",
        checksum_sha256="6a4c85d453aee95cb487aef337c61607a1114a5a5402051888b551053e42c0bf",
        aws_file_key="/data/bed/2400kb.bed"
    )

def add_ref_to_drs():
    """Register GRCh38 reference genome on local Starter Kit DRS service"""

    # bundle
    post_drs_object_to_server(
        object_id="GRCh38.reference.bundle",
        description="GRCh38 Reference Genome Bundle (FASTA and index)",
        name="GRCh38 Reference Bundle",
        version="1.0.0",
        aliases=[
            "GRCh38"
        ],
        is_bundle=True
    )

    # Reference FASTA
    post_drs_object_to_server(
        object_id="GRCh38.reference.fasta",
        description="GRCh38 Reference Genome FASTA",
        name="GRCh38_full_analysis_set_plus_decoy_hla.fa",
        version="1.0.0",
        aliases=[
            "GRCh38 FASTA"
        ],
        is_bundle=False,
        size=3263683042,
        mime_type="application/fasta",
        checksum_md5="64b32de2fc934679c16e83a2bc072064",
        checksum_sha1="efaaea68910ee444b2756062b2ae2b990d5cdb71",
        checksum_sha256="3b103f4742abfd54938fb0333e19ad067635c8eb86f1dbf0ce44b165c4292b50",
        drs_object_parent_ids=["GRCh38.reference.bundle"],
        aws_file_key="/data/ref/GRCh38_full_analysis_set_plus_decoy_hla.fa"
    )

    # Reference Index
    post_drs_object_to_server(
        object_id="GRCh38.reference.index",
        description="GRCh38 Reference Genome Index",
        name="GRCh38_full_analysis_set_plus_decoy_hla.fa.fai",
        version="1.0.0",
        aliases=[
            "GRCh38 Index"
        ],
        is_bundle=False,
        size=154196,
        mime_type="application/fasta/fai",
        checksum_md5="5ccc91e56dc4a05448dd5b9507ec6bc6",
        checksum_sha1="8c6e9635f50256e4ecd84bee2bfb1cb27cc8bbd1",
        checksum_sha256="f361f004bdae5ca68d632458b01a3848d02834ac7176f378e177344d148a6a6d",
        drs_object_parent_ids=["GRCh38.reference.bundle"],
        aws_file_key="/data/ref/GRCh38_full_analysis_set_plus_decoy_hla.fa.fai"
    )

def add_1k_genomes_lowcov_dataset_to_drs():
    """
    Register test CRAM dataset (from 1000 genomes) on local Starter Kit DRS
    """

def main():
    """Register all test dataset DRS Objects on local Starter Kit DRS server"""

    add_bed_to_drs()
    add_ref_to_drs()
    add_1k_genomes_lowcov_dataset_to_drs()

if __name__ == "__main__":
    main()
