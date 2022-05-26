import os

def main():
    sql_db = os.path.join("resources", "drs", "db", "drs.db")
    sql_script = os.path.join("tmp", "add-known-visas-to-drs.sql")
    fh = open(sql_script, "w")
    fh.write("")
    fh.close()
    fh = open(sql_script, "a")


    broker_url = "http://localhost:4455/"
    broker_secret = "1F4B4EBC23ABE9C1AFFFD5531C95F"
    insert_broker = "INSERT INTO passport_broker (url, secret) VALUES ('%s', '%s');\n" % (broker_url, broker_secret)
    fh.write(insert_broker)

    passport_visas = [
        {
            "name": "1000GenomesIndividualsWithEastAsianAncestry",
            "secret": "29CD6DFBB2684BAEACED3B1C6A7F4"
        },
        {
            "name": "1000GenomesIndividualsWithEuropeanAncestry",
            "secret": "47B42DF32976DFDBD6EC4D9ED2593"
        },
        {
            "name": "1000GenomesIndividualsWithAfricanAncestry",
            "secret": "582A164E2C5DA377F3E3F76158CE6"
        },
        {
            "name": "1000GenomesIndividualsWithAmericanAncestry",
            "secret": "BF9CAB5D5157C5C21EBDEE6C91D91"
        },
        {
            "name": "1000GenomesIndividualsWithSouthAsianAncestry",
            "secret": "9474C832599DC95F949DB3CAE443E"
        }
    ]

    for passport_visa in passport_visas:
        insert_visa = "INSERT INTO passport_visa" \
            + " (name, issuer, secret, passport_broker_url)" \
            + " VALUES ('%s', '%s', '%s', '%s')" % (passport_visa["name"], "https://federatedgenomics.org/", passport_visa["secret"], broker_url) \
            + ";\n"
        fh.write(insert_visa)
    
    fh.close()
    os.system("sqlite3 %s < %s" % (sql_db, sql_script))

if __name__ == "__main__":
    main()
