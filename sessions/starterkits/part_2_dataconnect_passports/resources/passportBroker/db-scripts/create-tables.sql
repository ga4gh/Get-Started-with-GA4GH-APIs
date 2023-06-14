CREATE TABLE passport_user (
    id TEXT PRIMARY KEY
);

CREATE TABLE passport_visa (
    id TEXT PRIMARY KEY,
    visa_name TEXT,
    visa_issuer TEXT,
    visa_description TEXT,
    visa_secret TEXT
);

CREATE TABLE passport_visa_assertion (
    id INTEGER PRIMARY KEY,
    user_id TEXT,
    visa_id TEXT,
    status TEXT,
    asserted_at INTEGER,
    FOREIGN KEY (user_id) REFERENCES passport_user(id),
    FOREIGN KEY (visa_id) REFERENCES passport_visa(id)
);