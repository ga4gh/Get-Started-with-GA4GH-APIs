/* ##################################################
    TEST DATASET: PHENOPACKETS
   ################################################## */

/*
    An open dataset of 384 phenopackets acts as our test dataset. We must
    first load up the dev database with these objects. First create a root
    dataset DRS object, which will act as the top-level bundle for all
    phenopacket files
*/

INSERT INTO drs_object (
    id,
    description,
    created_time,
    name,
    updated_time,
    version,
    is_bundle
) VALUES (
    "b8cd0667-2c33-4c9f-967b-161b905932c9",
    "Open dataset of 384 phenopackets",
    "2021-03-12 20:00:00.000",
    "phenopackets.test.dataset",
    "2021-03-13 12:30:45.000",
    "1.0.0",
    1
);

/*
    Next, create a DRS object bundle representing all phenopacket files for
    a given "family", or last name. Creates the family bundle. Creates DRS
    Objects for each patient/file in the family. Associate the patients with
    the family. Associate the family with the root phenopacket bundle
*/

/* ##################################################
    PHENOPACKETS TEST DATASET: CAO FAMILY
   ################################################## */

INSERT INTO drs_object (
    id,
    description,
    created_time,
    name,
    updated_time,
    version,
    is_bundle
) VALUES (
    "a1dd4ae2-8d26-43b0-a199-342b64c7dff6",
    "Synthetic Phenopacket dataset: Cao family",
    "2021-03-12 20:00:00.000",
    "phenopackets.cao.family",
    "2021-03-13 12:30:45.000",
    "1.0.0",
    1
);

INSERT INTO drs_object (
    id,
    description,
    created_time,
    mime_type,
    name,
    size,
    updated_time,
    version,
    is_bundle
) VALUES
    (
        "1a570e4e-2489-4218-9333-f65549495872",
        "Phenopackets, Cao family, Patient 1",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.cao.1",
        4257,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "4d83ba3f-a476-4c7c-868f-3d1fcf77fe29",
        "Phenopackets, Cao family, Patient 2",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.cao.2",
        7401,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "924901d5-6d31-4c33-b443-7931eadfac4b",
        "Phenopackets, Cao family, Patient 3",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.cao.3",
        4251,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "0f8abce3-e161-4bdf-981f-86257d505d69",
        "Phenopackets, Cao family, Patient 4",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.cao.4",
        9264,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    );

INSERT INTO drs_object_alias VALUES
    ("1a570e4e-2489-4218-9333-f65549495872", "Cao-FBN1-1"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "Cao-FBN1-2"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "Cao-FBN1-3"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "Cao-TGFBR2-4");

INSERT INTO drs_object_checksum (drs_object_id, checksum, type) VALUES
    ("1a570e4e-2489-4218-9333-f65549495872", "f81ea43c74824cc72c77a39a92bf7b71", "md5"),
    ("1a570e4e-2489-4218-9333-f65549495872", "34880a6b8aa517a6999da912614753ffb0a837a8", "sha1"),
    ("1a570e4e-2489-4218-9333-f65549495872", "ec44e2ad7ec84c7c42ba57b205e67c7c7416ae1932029d8364cc053cef7abe58", "sha256"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "1cbab050aa20410dc14ce6906f0312fa", "md5"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "3f2f2133054faf71ca9d678fa1fd8918a521faec", "sha1"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "2709878797b4e8c6a7db824fa596f42885551cef730d1408b2b620c9eee43089", "sha256"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "45b61bbe53b13463cd602081613ad855", "md5"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "d3192e17ffd97f7255ffbe2c6f9b447568107612", "sha1"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "f60583aad0e25fc4805668663bcc3bef271f4f93ee98be4f57f6e8c3e26d9dba", "sha256"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "7d3b0a967215523c29de61baff26bfa2", "md5"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "ae6c744487ddf785976893d1bdce2f81c017921e", "sha1"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "69dd919e14d162ebd0132a395cf1967346fd203210428287c354b11eebdda8b3", "sha256");

INSERT INTO file_access_object (drs_object_id, path) VALUES
    ("1a570e4e-2489-4218-9333-f65549495872", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_1.json"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_2.json"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_3.json"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "./src/test/resources/data/phenopackets/Cao-2018-TGFBR2-Patient_4.json");

INSERT INTO aws_s3_access_object (drs_object_id, region, bucket, key) VALUES
    ("1a570e4e-2489-4218-9333-f65549495872", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_1.json"),
    ("4d83ba3f-a476-4c7c-868f-3d1fcf77fe29", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_2.json"),
    ("924901d5-6d31-4c33-b443-7931eadfac4b", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_3.json"),
    ("0f8abce3-e161-4bdf-981f-86257d505d69", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-TGFBR2-Patient_4.json");

INSERT INTO drs_object_bundle VALUES
    ("b8cd0667-2c33-4c9f-967b-161b905932c9", "a1dd4ae2-8d26-43b0-a199-342b64c7dff6"),
    ("a1dd4ae2-8d26-43b0-a199-342b64c7dff6", "1a570e4e-2489-4218-9333-f65549495872"),
    ("a1dd4ae2-8d26-43b0-a199-342b64c7dff6", "4d83ba3f-a476-4c7c-868f-3d1fcf77fe29"),
    ("a1dd4ae2-8d26-43b0-a199-342b64c7dff6", "924901d5-6d31-4c33-b443-7931eadfac4b"),
    ("a1dd4ae2-8d26-43b0-a199-342b64c7dff6", "0f8abce3-e161-4bdf-981f-86257d505d69");

/* ##################################################
    PHENOPACKETS TEST DATASET: LALANI FAMILY
   ################################################## */

INSERT INTO drs_object (
    id,
    description,
    created_time,
    name,
    updated_time,
    version,
    is_bundle
) VALUES (
    "c69a3d6c-4a28-4b7c-b215-0782f8d62429",
    "Synthetic Phenopacket dataset: Lalani family",
    "2021-03-12 20:00:00.000",
    "phenopackets.lalani.family",
    "2021-03-13 12:30:45.000",
    "1.0.0",
    1
);

INSERT INTO drs_object (
    id,
    description,
    created_time,
    mime_type,
    name,
    size,
    updated_time,
    version,
    is_bundle
) VALUES
    (
        "456e9ee0-5b60-4f38-82b5-83ba5d338038",
        "Phenopackets, Lalani family, Patient 1",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.lalani.1",
        11606,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "1af6b862-7fc8-411a-86c5-d8e280e5b77a",
        "Phenopackets, Lalani family, Patient 2",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.lalani.2",
        17531,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "c37b37fd-0450-432d-b6aa-9ffdece35ad0",
        "Phenopackets, Lalani family, Patient 4",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.lalani.4",
        9827,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa",
        "Phenopackets, Lalani family, Patient 5",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.lalani.5",
        12111,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "a3bb76d7-76ae-414b-81f7-97e663b02206",
        "Phenopackets, Lalani family, Patient 6",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.lalani.6",
        10316,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    );

INSERT INTO drs_object_alias VALUES
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "Lalani-TANGO2-1"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "Lalani-TANGO2-2"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "Lalani-TANGO2-4"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "Lalani-TANGO2-5"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "Lalani-TANGO2-6");

INSERT INTO drs_object_checksum (drs_object_id, checksum, type) VALUES
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "2262c06d95790324a76f09e2ee0ec418", "md5"),
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "868177570cd7593aeb8e4b244d0ab4da47841037", "sha1"),
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "317a5a0c3f12b607a81e711e776fccac28cadc6d48867bba51b8572bf56e77fa", "sha256"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "93180f19252a5779ce0bc653354900ac", "md5"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "8c5a1b7fbaf9c390e765372e7323c42ab7ea4171", "sha1"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "9199d98bbc89533fcf4ccee9b68a70d199f99c0008d93f97da61f33a4f2a4a81", "sha256"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "2b8a0d5f3279edd6052c1870ddcd9025", "md5"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "f4542ec50ef731b2ed5b948474192704b4b95a1e", "sha1"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "3ee388233d2dcb878c0ff58a8ed54d18e0a5661314bdcaf65da794ecea98eb54", "sha256"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "284bc700ae1456223c514fa64bee948c", "md5"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "0a8d6f1af30ead10b0b113c6785bc415100fd130", "sha1"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "e43d20405adee85ac532db75a3e4c32bd96a775dd7bbf43d7df4437cd4b68dcf", "sha256"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "963d6a7d703c2e162f2b478b5b546127", "md5"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "e381e836440c63d05bda9d68670114dac65977a2", "sha1"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "56c14073cd80e8fdb447f271d48f6f60321c5abe08cdc4cef992d55037f79949", "sha256");

INSERT INTO file_access_object (drs_object_id, path) VALUES
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "./src/test/resources/data/phenopackets/Lalani-2016-TANGO2-Suject_1.json"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "./src/test/resources/data/phenopackets/Lalani-2016-TANGO2-Subject_2.json"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "./src/test/resources/data/phenopackets/Lalani-2016-TANGO2-Subject_4.json"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "./src/test/resources/data/phenopackets/Lalani-2016-TANGO2-Subject_5.json"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "./src/test/resources/data/phenopackets/Lalani-2016-TANGO2-Subject_6.json");

INSERT INTO aws_s3_access_object (drs_object_id, region, bucket, key) VALUES
    ("456e9ee0-5b60-4f38-82b5-83ba5d338038", "us-east-2", "ga4gh-demo-data", "/phenopackets/Lalani-2016-TANGO2-Suject_1.json"),
    ("1af6b862-7fc8-411a-86c5-d8e280e5b77a", "us-east-2", "ga4gh-demo-data", "/phenopackets/Lalani-2016-TANGO2-Subject_2.json"),
    ("c37b37fd-0450-432d-b6aa-9ffdece35ad0", "us-east-2", "ga4gh-demo-data", "/phenopackets/Lalani-2016-TANGO2-Subject_4.json"),
    ("0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa", "us-east-2", "ga4gh-demo-data", "/phenopackets/Lalani-2016-TANGO2-Subject_5.json"),
    ("a3bb76d7-76ae-414b-81f7-97e663b02206", "us-east-2", "ga4gh-demo-data", "/phenopackets/Lalani-2016-TANGO2-Subject_6.json");

INSERT INTO drs_object_bundle VALUES
    ("b8cd0667-2c33-4c9f-967b-161b905932c9", "c69a3d6c-4a28-4b7c-b215-0782f8d62429"),
    ("c69a3d6c-4a28-4b7c-b215-0782f8d62429", "456e9ee0-5b60-4f38-82b5-83ba5d338038"),
    ("c69a3d6c-4a28-4b7c-b215-0782f8d62429", "1af6b862-7fc8-411a-86c5-d8e280e5b77a"),
    ("c69a3d6c-4a28-4b7c-b215-0782f8d62429", "c37b37fd-0450-432d-b6aa-9ffdece35ad0"),
    ("c69a3d6c-4a28-4b7c-b215-0782f8d62429", "0bb9d297-2710-48f6-ab4d-80d5eb0c9eaa"),
    ("c69a3d6c-4a28-4b7c-b215-0782f8d62429", "a3bb76d7-76ae-414b-81f7-97e663b02206");

/* ##################################################
    PHENOPACKETS TEST DATASET: MUNDHOFIR FAMILY
   ################################################## */

INSERT INTO drs_object (
    id,
    description,
    created_time,
    name,
    updated_time,
    version,
    is_bundle
) VALUES (
    "1af5cdcf-898c-4dbc-944e-1ac95e82c0ea",
    "Synthetic Phenopacket dataset: Mundhofir family",
    "2021-03-12 20:00:00.000",
    "phenopackets.mundhofir.family",
    "2021-03-13 12:30:45.000",
    "1.0.0",
    1
);

INSERT INTO drs_object (
    id,
    description,
    created_time,
    mime_type,
    name,
    size,
    updated_time,
    version,
    is_bundle
) VALUES
    (
        "2506f0e1-29e4-4132-9b37-f7452dc8a89b",
        "Phenopackets, Mundhofir family, Patient 1",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.mundhofir.1",
        7002,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "c00c264a-8f17-471f-8ded-1a1f10e965ac",
        "Phenopackets, Mundhofir family, Patient 2",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.mundhofir.2",
        7634,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    );

INSERT INTO drs_object_alias VALUES
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "Mundhofir-FGFR2-1"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "Mundhofir-FGFR2-2");

INSERT INTO drs_object_checksum (drs_object_id, checksum, type) VALUES
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "ed8dc271295fdea0f6df1fcb92f19d01", "md5"),
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "3210c0096eb14b6437a8b4f7438c0c0178cacb89", "sha1"),
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "bda2eaba66f9a328cf9f31916d0fb7c13126ecec0a44214684d851a8c389b046", "sha256"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "09d05a76060f87af2006a5e5be332f99", "md5"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "bfff2ff28057eb81ceab73fb47df9d172821ee37", "sha1"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "60fb8710f620dcf8af8296e89e08cb8ac9bab4ac489069105b8ca3fd3493e38c", "sha256");

INSERT INTO file_access_object (drs_object_id, path) VALUES
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "./src/test/resources/data/phenopackets/Mundhofir-2013-FGFR2-Patient_1.json"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "./src/test/resources/data/phenopackets/Mundhofir-2013-FGFR2-Patient_2.json");

INSERT INTO aws_s3_access_object (drs_object_id, region, bucket, key) VALUES
    ("2506f0e1-29e4-4132-9b37-f7452dc8a89b", "us-east-2", "ga4gh-demo-data", "/phenopackets/Mundhofir-2013-FGFR2-Patient_1.json"),
    ("c00c264a-8f17-471f-8ded-1a1f10e965ac", "us-east-2", "ga4gh-demo-data", "/phenopackets/Mundhofir-2013-FGFR2-Patient_2.json");

INSERT INTO drs_object_bundle VALUES
    ("b8cd0667-2c33-4c9f-967b-161b905932c9", "1af5cdcf-898c-4dbc-944e-1ac95e82c0ea"),
    ("1af5cdcf-898c-4dbc-944e-1ac95e82c0ea", "2506f0e1-29e4-4132-9b37-f7452dc8a89b"),
    ("1af5cdcf-898c-4dbc-944e-1ac95e82c0ea", "c00c264a-8f17-471f-8ded-1a1f10e965ac");

/* ##################################################
    PHENOPACKETS TEST DATASET: ZHANG FAMILY
   ################################################## */

INSERT INTO drs_object (
    id,
    description,
    created_time,
    name,
    updated_time,
    version,
    is_bundle
) VALUES (
    "355a74bd-6571-4d4a-8602-a9989936717f",
    "Synthetic Phenopacket dataset: Zhang family",
    "2021-03-12 20:00:00.000",
    "phenopackets.zhang.family",
    "2021-03-13 12:30:45.000",
    "1.0.0",
    1
);

INSERT INTO drs_object (
    id,
    description,
    created_time,
    mime_type,
    name,
    size,
    updated_time,
    version,
    is_bundle
) VALUES
    (
        "697907bf-d5bd-433e-aac2-1747f1faf366",
        "Phenopackets, Zhang family, 2009, proband",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2009.proband",
        6471,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "3a45fab2-f350-445d-a137-4b1f946bf184",
        "Phenopackets, Zhang family, 2011, Patient 2",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2011.2",
        4001,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe",
        "Phenopackets, Zhang family, 2016, Patient 1",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2016.1",
        4709,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "1275f896-4c8f-47e1-99a1-873a6b2ef5fb",
        "Phenopackets, Zhang family, 2017, Patient 1",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2017.1",
        7555,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7",
        "Phenopackets, Zhang family, 2017, Patient 2",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2017.2",
        7114,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "41898242-62a9-4129-9a2c-5a4e8f5f0afb",
        "Phenopackets, Zhang family, 2017, Patient 3",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2017.3",
        6262,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    ),
    (
        "6b994f18-6189-4233-bb83-139686490d68",
        "Phenopackets, Zhang family, 2017, Patient 4",
        "2021-03-12 20:00:00.000",
        "application/json",
        "phenopackets.zhang.2017.4",
        6289,
        "2021-03-13 12:30:45.000",
        "1.0.0",
        0
    );

INSERT INTO drs_object_alias VALUES
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "Zhang-EDA-proband"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "Zhang-TYRP1-2"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "Zhang-RPS19-1"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "Zhang-FOXG1-1"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "Zhang-FOXG1-2"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "Zhang-FOXG1-3"),
    ("6b994f18-6189-4233-bb83-139686490d68", "PMID:28851325-Zhang-2017-FOXG1-Patient_4"),
    ("6b994f18-6189-4233-bb83-139686490d68", "Zhang-FOXG1-4");

INSERT INTO drs_object_checksum (drs_object_id, checksum, type) VALUES
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "71611ed3a3246fea6ce80916924c0722", "md5"),
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "b7e976ef2a9d13c65f154ad72a5495139dc6ac32", "sha1"),
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "70722813447e98baf8f79cd5828668f971676bcfe08c286f62a7decd84b03eb0", "sha256"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "816d9c54b567e894f4c7744f6057502f", "md5"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "66e0c9556f676a34dbe48ec0b4a4559a38e72758", "sha1"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "3bf78d8532c27534b3c9772905d513ef10e55d5d70e212d4945e0fc1c6bb7805", "sha256"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "e65b70b1a23153490affb3419752d98d", "md5"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "50187374a8dbbb2c939333f8fd4323b1191f659c", "sha1"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "c5253c3dd7e568a2f55d155881610acc5844b28c32dfcb6b43d456f2098f9d77", "sha256"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "75887d159129fcb75ed32fce892649ca", "md5"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "5cb05b30f72d48fb9200ccf44dec31a2d7edcc74", "sha1"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "17f576439adf0daf536fddfcf346dcfefa4729612f82ff824662174791a9ef06", "sha256"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "95277c4266a4c7a77d3233cbd8bcaf96", "md5"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "9874a03c5455d8aca47f4681943ab0e146ea6e3e", "sha1"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "088a1e815d42013a659a13b1b7c7c472ad50eb80acea47be712cdb398cb23a63", "sha256"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "fefd616cb11a205d2dd871e357f85b66", "md5"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "0a076231b6b9153b03be403b5611b4af49c95f52", "sha1"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "ad412ddb59007515c0f138273cf2bcd86cfbe19290404e4cb85b501109131b8c", "sha256"),
    ("6b994f18-6189-4233-bb83-139686490d68", "cf6b48cce2989de6ce13a0960c6cc2dd", "md5"),
    ("6b994f18-6189-4233-bb83-139686490d68", "e065fb118dee30730e641fb896c3f96474009f6f", "sha1"),
    ("6b994f18-6189-4233-bb83-139686490d68", "d6c7496a91de38e03e63940073ec6f7d2ccb41f6a28b8791178a6f16c05afb24", "sha256");

INSERT INTO file_access_object (drs_object_id, path) VALUES
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "./src/test/resources/data/phenopackets/Zhang-2009-EDA-proband.json"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "./src/test/resources/data/phenopackets/Zhang-2011-TYRP1-patient_2.json"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "./src/test/resources/data/phenopackets/Zhang-2016-RPS19-patient.json"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "./src/test/resources/data/phenopackets/Zhang-2017-FOXG1-Patient_1.json"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "./src/test/resources/data/phenopackets/Zhang-2017-FOXG1-Patient_2.json"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "./src/test/resources/data/phenopackets/Zhang-2017-FOXG1-Patient_3.json"),
    ("6b994f18-6189-4233-bb83-139686490d68", "./src/test/resources/data/phenopackets/Zhang-2017-FOXG1-Patient_4.json");

INSERT INTO aws_s3_access_object (drs_object_id, region, bucket, key) VALUES
    ("697907bf-d5bd-433e-aac2-1747f1faf366", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2009-EDA-proband.json"),
    ("3a45fab2-f350-445d-a137-4b1f946bf184", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2011-TYRP1-patient_2.json"),
    ("ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2016-RPS19-patient.json"),
    ("1275f896-4c8f-47e1-99a1-873a6b2ef5fb", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2017-FOXG1-Patient_1.json"),
    ("8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2017-FOXG1-Patient_2.json"),
    ("41898242-62a9-4129-9a2c-5a4e8f5f0afb", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2017-FOXG1-Patient_3.json"),
    ("6b994f18-6189-4233-bb83-139686490d68", "us-east-2", "ga4gh-demo-data", "/phenopackets/Zhang-2017-FOXG1-Patient_4.json");

INSERT INTO drs_object_bundle VALUES
    ("b8cd0667-2c33-4c9f-967b-161b905932c9", "355a74bd-6571-4d4a-8602-a9989936717f"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "697907bf-d5bd-433e-aac2-1747f1faf366"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "3a45fab2-f350-445d-a137-4b1f946bf184"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "ac53ca59-46f3-4f61-b1e7-bb75a49bfbfe"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "1275f896-4c8f-47e1-99a1-873a6b2ef5fb"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "8f40acc0-0c54-45c5-8c85-a6f5fb32a1a7"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "41898242-62a9-4129-9a2c-5a4e8f5f0afb"),
    ("355a74bd-6571-4d4a-8602-a9989936717f", "6b994f18-6189-4233-bb83-139686490d68");

/* MINI DATASET FOR PASSPORTS AUTH */

INSERT INTO passport_broker VALUES (
    'https://ga4gh.org/',
    'insecureSecretPleaseOverride'
);

INSERT INTO passport_visa VALUES
(
    0,
    'StarterKitDatasetsControlledAccessGrants',
    'https://datasets.starterkit.ga4gh.org/',
    '87A3B5D68FD88197254D9889B4AAB',
    'https://ga4gh.org/'
);

INSERT INTO drs_object (
    id,
    description,
    created_time,
    mime_type,
    name,
    size,
    updated_time,
    version,
    is_bundle
) VALUES
    (
        "e26f8428-1a5d-4465-b389-10998ba7b894",
        "PASSPORT AUTH - Phenopackets, Cao Patient 1",
        "2022-05-16 20:00:00.000",
        "application/json",
        "passport.phenopackets.cao.1",
        4257,
        "2022-05-16 20:00:00.000",
        "1.0.0",
        0
    ),
    (
        "996ead07-8dfc-4c5d-b319-5b59bebb507e",
        "PASSPORT AUTH - Phenopackets, Cao Patient 2",
        "2022-05-16 20:00:00.000",
        "application/json",
        "passport.phenopackets.cao.2",
        7401,
        "2022-05-16 20:00:00.000",
        "1.0.0",
        0
    ),
    (
        "81e8b499-1054-4846-8df4-d079ea32a44f",
        "PASSPORT AUTH - Phenopackets, Cao Patient 3",
        "2022-05-16 20:00:00.000",
        "application/json",
        "passport.phenopackets.cao.3",
        4251,
        "2022-05-16 20:00:00.000",
        "1.0.0",
        0
    ),
    (
        "672d0425-137c-437f-ab12-29a3cce1ffc0",
        "PASSPORT AUTH - Phenopackets, Cao Patient 4",
        "2022-05-16 20:00:00.000",
        "application/json",
        "passport.phenopackets.cao.4",
        9264,
        "2022-05-16 20:00:00.000",
        "1.0.0",
        0
    );

INSERT INTO drs_object_alias VALUES
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "Passport-Cao-FBN1-1"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "Passport-Cao-FBN1-2"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "Passport-Cao-FBN1-3"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "Passport-Cao-TGFBR2-4");

INSERT INTO drs_object_checksum (drs_object_id, checksum, type) VALUES
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "f81ea43c74824cc72c77a39a92bf7b71", "md5"),
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "34880a6b8aa517a6999da912614753ffb0a837a8", "sha1"),
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "ec44e2ad7ec84c7c42ba57b205e67c7c7416ae1932029d8364cc053cef7abe58", "sha256"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "1cbab050aa20410dc14ce6906f0312fa", "md5"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "3f2f2133054faf71ca9d678fa1fd8918a521faec", "sha1"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "2709878797b4e8c6a7db824fa596f42885551cef730d1408b2b620c9eee43089", "sha256"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "45b61bbe53b13463cd602081613ad855", "md5"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "d3192e17ffd97f7255ffbe2c6f9b447568107612", "sha1"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "f60583aad0e25fc4805668663bcc3bef271f4f93ee98be4f57f6e8c3e26d9dba", "sha256"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "7d3b0a967215523c29de61baff26bfa2", "md5"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "ae6c744487ddf785976893d1bdce2f81c017921e", "sha1"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "69dd919e14d162ebd0132a395cf1967346fd203210428287c354b11eebdda8b3", "sha256");

INSERT INTO file_access_object (drs_object_id, path) VALUES
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_1.json"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_2.json"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "./src/test/resources/data/phenopackets/Cao-2018-FBN1-Patient_3.json"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "./src/test/resources/data/phenopackets/Cao-2018-TGFBR2-Patient_4.json");

INSERT INTO aws_s3_access_object (drs_object_id, region, bucket, key) VALUES
    ("e26f8428-1a5d-4465-b389-10998ba7b894", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_1.json"),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_2.json"),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-FBN1-Patient_3.json"),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", "us-east-2", "ga4gh-demo-data", "/phenopackets/Cao-2018-TGFBR2-Patient_4.json");

INSERT INTO drs_object_visa VALUES
    ("e26f8428-1a5d-4465-b389-10998ba7b894", 0),
    ("996ead07-8dfc-4c5d-b319-5b59bebb507e", 0),
    ("81e8b499-1054-4846-8df4-d079ea32a44f", 0),
    ("672d0425-137c-437f-ab12-29a3cce1ffc0", 0);