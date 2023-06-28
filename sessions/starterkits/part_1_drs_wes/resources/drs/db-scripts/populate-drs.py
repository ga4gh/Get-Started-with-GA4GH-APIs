import requests
import datetime
import json
import hashlib

drs_map = {}
drs_map_file = './tmp/drs_map.json'

timestamp = datetime.datetime.now().strftime("%Y-%m-%dT%H:%M:%SZ")
aws_region = "us-east-2"
aws_bucket = "ga4gh-ismb-tutorial-2022"

def post_drs_object_to_server(object_id=None, description=None, name=None,
    version=None, aliases=[], is_bundle=None, size=None, mime_type=None,
    checksum_md5=None, checksum_sha1=None, checksum_sha256=None,
    drs_object_parent_ids=[], aws_file_key=None):

    """Submit DRS Object to the local Starter Kit DRS server"""

    if is_bundle == None or not is_bundle:
        drs_map[object_id] = checksum_md5
        	
    if checksum_md5 != None:
        object_id = checksum_md5
        
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

    response = requests.post(url, json=drs_object_json)
    if response.status_code == 500:
        response_json = response.json()
        message = ( "WARNING: Unsuccessful object creation for DRS object with ID: '{}'. " \
        + "Status Code: {}. Error Message: {}").format(object_id, response_json["status"], response_json["error"])
        print(message)
    elif response.status_code != 200:
        response_json = response.json()
        message = ( "WARNING: Unsuccessful object creation for DRS object with ID: '{}'. " \
        + "Status Code: {}. Error Message: {}").format(object_id, response_json["status_code"], response_json["msg"])
        print(message)

def add_bed_to_drs():
    """Register test dataset BED file on local Starter Kit DRS service"""

    post_drs_object_to_server(
        object_id="828e5c16c726aa39f1bd35d153b9ab01",
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

def bundle_id_from_name(bundle_name):
    bundle_hash = hashlib.md5(bundle_name.encode()) 
    bundle_id = bundle_hash.hexdigest()
    drs_map[bundle_name] = bundle_id
    return bundle_id

def add_1k_genomes_highcov_dataset_to_drs():
    """
    Register test CRAM dataset (from 1000 genomes) on local Starter Kit DRS 
    """

    # create root bundle for high coverage downsampled dataset
    root_bundle_name = "1000genomes.highcov.downsampled"
    root_bundle_id = bundle_id_from_name(root_bundle_name)
    post_drs_object_to_server(
        object_id=root_bundle_id,
        description="15-sample high coverage, downsampled CRAM test dataset from 1000 genomes",
        name="1000 Genomes High Coverage Downsampled CRAM test dataset",
        version="1.0.0",
        aliases=[
            "1000 genomes high coverage test dataset"
        ],
        is_bundle=True
    )

    headings = [
        "sample_id",
        "cram_size",
        "cram_md5",
        "cram_sha1",
        "cram_sha256",
        "crai_size",
        "crai_md5",
        "crai_sha1",
        "crai_sha256",
    ]
    file_metadata_list = [
        ["HG00443", 21308003, "ecbb0b5131051c41f1c302287c13495c", "5cacafb5ac82c347e261543a6dd02e914b94e038", "adc82f24f03c7943561e614c17d5bffdc92af53ceec2484823faabff565c1522", 1845, "b60e59cc6b46ed04a3ede78d8c75a6ce", "917982e5012b80f7403c1ef962b150342aff7643", "6ba13ec013e1a4980b85ba5f262cf040ad89001ffa3559f1553ec01e2cb1d6ab"],
        ["HG00445", 22699106, "28ee4d1d0937b2eddb81beb1820e7fec", "14bc4efc372a60096abab000c551b588288f4a8e", "91229075a55904eab63d5b71789c76f9d1b1fd1e16e92e190074eda31af0a9e1", 1856, "e2d03ee77bc4a7786bf6855da96dcb86", "03f98558f558249628ca2def331cc9639f88e7fe", "10eb2c8131eaf4514f0b4e2dae37ff31c6e8b5fc6b4f834655617561860b5747"],
        ["HG00446", 20138492, "097a9521d2db2c7b4cabd3b5a76cdd3c", "3d7386787b6586e2f7b116340e0494fb65d6851c", "0dd246cad6bc16293c84dda1520624a1253f1542aab172334872dde068e802e3", 1595, "2405a382375763292ea903a6a658ce95", "1a1bf0999b7d8d01b25c0ca834311e5bce883605", "1e668c2e6176d3bdbf89f35c90961473c475ca68d4e16bd908cbb1cc8a0880b9"],
        ["HG00448", 22110103, "ec9dc4beb2a20651daab19030ac801fd", "9e2678c674818ebac0f647192e88953c64408815", "61953078153968f519ae98568f4427535e83a20542d398f07ef6b0b59329d278", 1820, "00be9e467ed3986cb2b2b1e2d157a2df", "e21790ff2cc5fd2cd3a3306b63d80175064454fa", "905a04a0dd67562dc8f44a1a42e9a579f3ec18254b602d7bc43ff2e2d9a245cc"],
        ["HG00449", 18977144, "8e18bfb64168994489bc9e7fda0acd4f", "232a8379bf238fe0c2b646c03a4b8bd2d83917f3", "44ee4289015c892c442b504ed681532f032de5c09e846be021624815859f82e8", 1475, "ba094cae0da59f27ea82a8a802be34cd", "4f276a341ae941b512df7635b74faec257522528", "79e64d3b32e7c8db7af6c9e2f2f724f8aa63d192e0669ec9e96189a65bf5422b"],
        ["HG00451", 19561068, "1d1ec431af3bab935cc381c2aca316ee", "6404a8ec7fa2606ec6597b89e778b2bc5df5b7e4", "e2dac5410dd8ab24320f97a242c42d31d5f8c7632ac9d99e6c8d412e78ca8359", 1637, "9c6ad5209da53a3eeab831445b3c7dc2", "963b2cd4971d5aa26581f073196db1a40823cd78", "ef5fbb82fe6cb705b079b8a455082ec3fabeb178e238a71e0614093cb4edc1f2"],
        ["NA12718", 18480011, "5b019b7fb8e42f4f8d4a41c2b1627b6d", "7b5e63fa6e739852ddba67de7522eaba1196ede7", "cf674e8ab913e48413b82544f068208d208d637bcecad800799f53c09643867b", 1569, "f4e33a5535b43f8d3c3baf9ce05893ad", "fc35e4268e4f93f7b3aca5d11ac0064a8e3b049c", "4b36e498299c9a80d58d211e7a927e82bca9c165b62b56d5c5aaf360f5e7251d"],
        ["NA12748", 18305600, "eb939647e4f1cda6dea43cb7c7df71de", "39a7278549efe741ddc995b77485c1db4cad35ea", "c2d5769487d66e6d304790b7f8835c61ffb6ef6b9fee57958e94b123bc9f018c", 1579, "90dc98385d4523b6967299d0b3d0d1e2", "2dc3ecf87add68ced69cc9dce00dbd7e44d51246", "d6504319f916005d7c80f16cc973feb11d9de5e066ba95f8debba33e31101bf8"],
        ["NA12775", 21523724, "01b0fe13b5c4de28a4ff5a7ee3c15773", "cac416b9084cd6681f3c9df3073900c62ab69c09", "8418e4e26ca6401932c2a9d357818db3f9db37e1fa319319c7832b8639ecd9d6", 1572, "f684f723102fc3b20a70ce132ec51ab7", "fe66c96373a2790ebb0b5f758fa9083cc20c36e5", "cf6ae72c959433397bc45215c005f1ea9767a81f8c185caecff9eeac420d92cb"],
        ["NA12777", 17566849, "156f8e135472a6bc7f481c11da6a9372", "d405536241a618d10e8a4eb5dd925a8c4f3f068a", "e6b8bcb04e8be47a883735613a9c528c3e50aaa81c5f5b4c3688116b242e4a3b", 1526, "c2ddf71411a1afa4e68a132258d70be7", "1f90e03ddb4aaa23c9feb734fbe71160bdf19739", "096c853d66c7e84eeafab9b0bdd70055d0d7e4aa46719e31c15cd1949f6a3c56"],
        ["NA12778", 17857072, "336854e9e2cd32476efed80508e522ab", "a604863383b1a497881a1d7c9213de3a335b8a88", "cf79f678f9b71f3ecb09b308cc67213df25a5410a2d844d280b04ea1154172e0", 1471, "e768acda1c6fc6c9d96313d2f4fda168", "cfcd8d09f6027e39aef9337a6d200f9e434f4676", "a626a024a65b8c91883b33a2e3d3b6d5271bfa8adce02383d649d515148add46"],
        ["NA12827", 29488067, "4db2e371cf5f5b4257120f26736f6a1d", "3acdcd27445f6099c18a90449f0fc54da6ea7b16", "2710af2ee7ca7c3aa470184cef889cd34ca3424a9c587e2fb2525ed670a84f51", 2316, "b676e6232f5dab2efa4df0c4f9ae53a4", "f07e223c45b735586a820b94dacadb1f2e044590", "7ec7ac641e845683274cb85cd02a78f9078602082c0905a636d46cc54b49113c"],
        ["NA12829", 29335679, "d5d4dc9bc29d993e5cc057c6c5a05939", "49992d1bdf1b6770befcb2c7b22bc36365e32078", "3bfbe641b956dddddfd8a39b113eed5d1740ee58f6b642138550fdb927e00441", 2372, "77214c462f86c5e530c0572e6bb6ed1d", "7ce4edd5d57322769dbd94abdd4cdd0187b3b12d", "b1965dbe7162500110a2444ce6041760942227f18607645e27d41e2f78080d3f"],
        ["NA12842", 20437371, "77b0f3d65271c4a0064ff7760828dd92", "36d1ea13a483155ba2ab7cc78e145b6b1341e433", "8b50cb5a1bbc42a7171d05875918cfd24cf710cabac349df6ace6adc6722d03a", 1523, "cb1061ec7488045176220b2318a4e025", "5779e5df32176db4654d203b4380e3387d69e5b6", "5953e82e8c4fc96b5a7b3c9f7d52181e52d1cc874dd17e46651bc10727d47f05"],
        ["NA12889", 24209380, "07d36706f15c3af1f1ad1dd595eca188", "266af717582b4127fd7f476fefdbb9f1168f50d7", "e55d3973ce2a23d3b29adc8a0350c89400724f2750dfa938b580507675dad18b", 1905, "7155f787d1a2454f1e315fa5139c2516", "02a20388045517cc85c8bffae44534d4f3252a10", "ac823e6f5ae5b971657c7d72a28edd5b9dbcb7ad2370f6123754d9059f7caf05"]
    ]

    # create CRAM/CRAI bundle, CRAM, and CRAI DRS Object for each sample
    for file_metadata in file_metadata_list:
        file_d = {headings[i]: file_metadata[i] for i in range(0, len(headings))}
        bundle_name = "%s.1000genomes.highcov.downsampled.bundle" % (file_d["sample_id"])
        bundle_id = bundle_id_from_name(bundle_name)
        

            
        # CRAM/CRAI Bundle
        post_drs_object_to_server(
            object_id=bundle_id,
            description="High coverage, downsampled CRAM/CRAI bundle for sample %s" % (file_d["sample_id"]),
            name="%s 1000 Genomes Downsampled High Coverage CRAM Bundle" % (file_d["sample_id"]),
            version="1.0.0",
            aliases=[
                "%s high coverage downsampled bundle" % file_d["sample_id"]
            ],
            is_bundle=True,
            drs_object_parent_ids=[root_bundle_id]
        )

        # CRAM File
        post_drs_object_to_server(
            object_id="%s.1000genomes.highcov.downsampled.cram" % (file_d["sample_id"]),
            description="High coverage, downsampled CRAM file for sample %s" % (file_d["sample_id"]),
            name="%s 1000 Genomes Downsampled High Coverage CRAM file" % (file_d["sample_id"]),
            version="1.0.0",
            aliases=[
                "%s high coverage downsampled CRAM" % file_d["sample_id"]
            ],
            is_bundle=False,
            size=file_d["cram_size"],
            mime_type="application/cram",
            checksum_md5=file_d["cram_md5"],
            checksum_sha1=file_d["cram_sha1"],
            checksum_sha256=file_d["cram_sha256"],
            drs_object_parent_ids=[bundle_id],
            aws_file_key="/data/1000genomes/cram/highcov/%s.final.2400kb.cram" % file_d["sample_id"]
        )

        # CRAI File
        post_drs_object_to_server(
            object_id="%s.1000genomes.highcov.downsampled.crai" % (file_d["sample_id"]),
            description="High coverage, downsampled CRAI file for sample %s" % (file_d["sample_id"]),
            name="%s 1000 Genomes Downsampled High Coverage CRAI file" % (file_d["sample_id"]),
            version="1.0.0",
            aliases=[
                "%s high coverage downsampled CRAI" % file_d["sample_id"]
            ],
            is_bundle=False,
            size=file_d["crai_size"],
            mime_type="application/crai",
            checksum_md5=file_d["crai_md5"],
            checksum_sha1=file_d["crai_sha1"],
            checksum_sha256=file_d["crai_sha256"],
            drs_object_parent_ids=[bundle_id],
            aws_file_key="/data/1000genomes/cram/highcov/%s.final.2400kb.cram.crai" % file_d["sample_id"]
        )

    # Save the mapping of previous drs_ids to hex drs_ids
    with open (drs_map_file, 'w') as f:
        json.dump(drs_map, f, indent=3)

def main():
    """Register all test dataset DRS Objects on local Starter Kit DRS server"""
    print("Loading a subset of One Thousand Genomes Sample Data into DRS database.....")

    add_bed_to_drs()
    print("Successfully added test dataset BED file to DRS")
    
    add_ref_to_drs()
    print("Successfully added GRCh38 reference genome to Starter Kit DRS")
    
    add_1k_genomes_highcov_dataset_to_drs()
    print("Successfully added test CRAM dataset (from 1000 Genomes) to Starter Kit DRS")

    print("Process Completed!")
    
    
    
if __name__ == "__main__":
    main()