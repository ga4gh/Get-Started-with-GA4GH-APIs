CREATE TABLE drs_object (
    id TEXT PRIMARY KEY,
    description TEXT,
    created_time TEXT,
    mime_type TEXT,
    name TEXT,
    size UNSIGNED BIG INT,
    updated_time TEXT,
    version TEXT,
    is_bundle INT
);

CREATE TABLE file_access_object(
    id INTEGER PRIMARY KEY,
    drs_object_id TEXT,
    path TEXT,
    FOREIGN KEY (drs_object_id) REFERENCES drs_object(id)
);

CREATE TABLE aws_s3_access_object(
    id INTEGER PRIMARY KEY,
    drs_object_id TEXT,
    region TEXT,
    bucket TEXT,
    key TEXT,
    FOREIGN KEY (drs_object_id) REFERENCES drs_object(id)
);

CREATE TABLE drs_object_alias (
    drs_object_id TEXT,
    alias TEXT,
    PRIMARY KEY (drs_object_id, alias),
    FOREIGN KEY(drs_object_id) REFERENCES drs_object(id)
);

CREATE TABLE drs_object_checksum (
    id INTEGER PRIMARY KEY,
    drs_object_id TEXT,
    checksum TEXT,
    type TEXT CHECK (type IN ('md5', 'etag', 'crc32c', 'trunc512', 'sha1', 'sha256')),
    FOREIGN KEY(drs_object_id) REFERENCES drs_object(id)
);

CREATE TABLE drs_object_bundle (
    parent_id TEXT,
    child_id TEXT,
    PRIMARY KEY (parent_id, child_id),
    FOREIGN KEY(parent_id) REFERENCES drs_object(id),
    FOREIGN KEY(child_id) REFERENCES drs_object(id)
);

CREATE TABLE passport_broker (
    url TEXT PRIMARY KEY,
    secret TEXT
);

CREATE TABLE passport_visa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    issuer TEXT,
    secret TEXT,
    passport_broker_url TEXT,
    FOREIGN KEY (passport_broker_url) REFERENCES passport_broker(url)
);

CREATE TABLE drs_object_visa (
    drs_object_id TEXT,
    visa_id TEXT,
    FOREIGN KEY(drs_object_id) REFERENCES drs_object(id),
    FOREIGN KEY(visa_id) REFERENCES passport_visa(id)
);