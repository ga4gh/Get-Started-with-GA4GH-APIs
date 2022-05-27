# Session 5: Starter Kit - Controlled data access and data discovery

## Outline

**Time:** Sunday, July 10th, 2022 @ 5 pm - 6 pm

**Slides:** [link](https://docs.google.com/presentation/d/1qHAFg6z_JZNIeyMa8FXu9aZXoKvay9PM5yk5zTielio)

In the previous session, we assumed 2 things: **(1)** The input dataset (DRS URIs) was known by the researcher ahead of time; and **(2)** The input dataset was completely open access. In a realistic research scenario, the researcher will need to both **search** for and **obtain authorization** to a suitable, controlled access dataset prior to running workflows.

In this session, we will introduce two more GA4GH standard APIs: Data Connect and Passports, which facilitate search and authorization, respectively. Using Docker and Docker Compose, participants will start a Data Connect service and populate it with biomedical metadata about the input dataset. Next, participants will start a Passport Broker service, populate it with researcher user accounts, and give different levels of dataset access to each researcher. Finally, participants will act on behalf of these researchers, running biomedical search queries and using their access credentials to obtain datasets for which they have clearance.

## Tutorial

** Note: If you have not already done so, clone the tutorial repository and enter the working directory for Session 5:

```
git clone https://github.com/ga4gh/ismb-2022-ga4gh-tutorial.git
cd ismb-2022-ga4gh-tutorial/sessions/5
```

### As Admin - Deploy services

```
docker-compose up -d
```

### As Admin - Load 1000 Genomes search data into Data Connect

The Data Connect Starter Kit comes loaded with two default datasets - phenopackets v1 dataset and 200 genome samples from the 1000 genomes sample dataset.   

### As Researcher - Explore Data Connect endpoints

### 1. /service-info

```
GET http://localhost:4500/service-info
```

### 2. /tables

```
GET http://localhost:4500/tables
```

### 3. /table/<table_name>/info

```
GET http://localhost:4500/table/one_thousand_genomes_sample/info
```

### 4. /table/<table_name>/data

```
GET http://localhost:4500/table/one_thousand_genomes_sample/data
```

### 5. /search

search for samples with population_code = "PUR" and sex = "female"
```
POST: 
http://localhost:4500/search

HEADER: 
content-type: application/json

REQUEST BODY:
{
  "query": "select sample_name , sex , population_code , population_name from one_thousand_genomes_sample where population_code=? and sex=?;",
  "parameters": [ "PUR","female" ]
} 
```

search for samples with superpopulation_name = "European Ancestry" and population_code = "FIN"
```
POST: 
http://localhost:4500/search

HEADER: 
Content-Type: application/json

REQUEST BODY:
{
  "query": "select * from one_thousand_genomes_sample where superpopulation_name = ? and population_code=?;",
  "parameters": [ "European Ancestry","FIN" ]
} 
```

### As Researcher - Attempt to access DRS objects, get auth info

### As Admin - Create visas on the passport broker

### 1. Confirm the Passport Broker is working
```
GET http://localhost:4500/ga4gh/passport/v1/service-info
```

### 2. Create a visa
```
POST http://localhost:4501/admin/ga4gh/passport/v1/visas

HEADER:
Content-Type: application/json

REQUEST BODY: 
{
  "id": "6ecaef9e-d6bb-4d96-9aed-ca517ceed8a1",
  "visaName": "1000GenomesIndividualsWithEastAsianAncestry",
  "visaIssuer": "https://federatedgenomics.org/",
  "visaDescription": "Controls access to genomic data obtained from individuals with East Asian ancestry",
  "visaSecret": "29CD6DFBB2684BAEACED3B1C6A7F4"
}
```

Repeat the process for all the other visas (one-by-one):
```
{
  "id": "3af0e101-cd51-4fe4-aa8c-29a69be48fe0",
  "visaName": "1000GenomesIndividualsWithEuropeanAncestry",
  "visaIssuer": "https://federatedgenomics.org/",
  "visaDescription": "Controls access to genomic data obtained from individuals with European ancestry",
  "visaSecret": "47B42DF32976DFDBD6EC4D9ED2593"
}
```
```
{
  "id": "e38f656e-3146-4b06-92f2-6edea44f0cd1",
  "visaName": "1000GenomesIndividualsWithAfricanAncestry",
  "visaIssuer": "https://federatedgenomics.org/",
  "visaDescription": "Controls access to genomic data obtained from individuals with African ancestry",
  "visaSecret": "582A164E2C5DA377F3E3F76158CE6"
}
```
```
{
  "id": "b62249d0-d71d-42d2-9a67-55003fdae8ec",
  "visaName": "1000GenomesIndividualsWithAmericanAncestry",
  "visaIssuer": "https://federatedgenomics.org/",
  "visaDescription": "Controls access to genomic data obtained from individuals with American ancestry",
  "visaSecret": "BF9CAB5D5157C5C21EBDEE6C91D91"
}
```
```
{
  "id": "55cb5d06-bbf3-428b-a822-3565557518ba",
  "visaName": "1000GenomesIndividualsWithSouthAsianAncestry",
  "visaIssuer": "https://federatedgenomics.org/",
  "visaDescription": "Controls access to genomic data obtained from individuals with South Asian ancestry",
  "visaSecret": "9474C832599DC95F949DB3CAE443E"
}
```

### As Researcher - Register account with the passport broker
Visit the [welcome page](http://127.0.0.1:4455/welcome)

Towards the bottom, under Account Management press [Sign Up](http://127.0.0.1:4455/registration) to create an account.

After signing up, you should see your account information on the welcome page, under User Information.

Once the sign up is complete, a user in the passport broker service will also be created. Confirm the new user is created:
```
GET http://localhost:4501/admin/ga4gh/passport/v1/users
```
You should see your account's ID in the array of user IDs.

### As Admin - Grant visas to researcher
```
PUT http://localhost:4501/admin/ga4gh/passport/v1/<USER_ID>

HEADER:
Content-Type: application/json

REQUEST BODY: 
{
    "id": "<USER_ID>",
    "passportVisaAssertions": [
        {
            "status": "active",
            "passportVisa": {
                "id": "6ecaef9e-d6bb-4d96-9aed-ca517ceed8a1",
                "visaName": "1000GenomesIndividualsWithEastAsianAncestry",
                "visaIssuer": "https://federatedgenomics.org/",
                "visaDescription": "Controls access to genomic data obtained from individuals with East Asian ancestry"
            }
        },
        {
            "status": "active",
            "passportVisa": {
                "id": "3af0e101-cd51-4fe4-aa8c-29a69be48fe0",
                "visaName": "1000GenomesIndividualsWithEuropeanAncestry",
                "visaIssuer": "https://federatedgenomics.org/",
                "visaDescription": "Controls access to genomic data obtained from individuals with European ancestry",
                "visaSecret": "47B42DF32976DFDBD6EC4D9ED2593"
            }
        },
        {
            "status": "active",
            "passportVisa": {
                "id": "e38f656e-3146-4b06-92f2-6edea44f0cd1",
                "visaName": "1000GenomesIndividualsWithAfricanAncestry",
                "visaIssuer": "https://federatedgenomics.org/",
                "visaDescription": "Controls access to genomic data obtained from individuals with African ancestry",
                "visaSecret": "582A164E2C5DA377F3E3F76158CE6"
            }
        },
        {
            "status": "active",
            "passportVisa": {
                "id": "b62249d0-d71d-42d2-9a67-55003fdae8ec",
                "visaName": "1000GenomesIndividualsWithAmericanAncestry",
                "visaIssuer": "https://federatedgenomics.org/",
                "visaDescription": "Controls access to genomic data obtained from individuals with American ancestry",
                "visaSecret": "BF9CAB5D5157C5C21EBDEE6C91D91"
            }
        },
        {
            "status": "active",
            "passportVisa": {
                "id": "55cb5d06-bbf3-428b-a822-3565557518ba",
                "visaName": "1000GenomesIndividualsWithSouthAsianAncestry",
                "visaIssuer": "https://federatedgenomics.org/",
                "visaDescription": "Controls access to genomic data obtained from individuals with South Asian ancestry",
                "visaSecret": "9474C832599DC95F949DB3CAE443E"
            }
        }
    ]
}
```

### As Researcher - Log in to broker, select visas and obtain passport
Back in the [welcome page](http://127.0.0.1:4455/welcome) press [Get Passport Token](http://127.0.0.1:4455/passport). On this page you should see your assigned visas, select some of them and press Get Passport Token.

You can confirm the validity of your JWT token by visiting https://jwt.io/ and pasting the JWT token to examine its contents.

### As Researcher - Take passport to DRS to obtain access to DRS objects
