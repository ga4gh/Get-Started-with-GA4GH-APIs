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

### 1. /tables

```
GET http://localhost:4500/tables
```

### 2. /table/<table_name>/info

```
GET http://localhost:4500/table/one_thousand_genomes_sample/info
```

### 3. /table/<table_name>/data

```
GET http://localhost:4500/table/one_thousand_genomes_sample/data
```

### 4. /search

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
content-type: application/json

REQUEST BODY:
{
  "query": "select * from one_thousand_genomes_sample where superpopulation_name = ? and population_code=?;",
  "parameters": [ "European Ancestry","FIN" ]
} 
```

### As Researcher - Attempt to access DRS objects, get auth info

### As Admin - Create visas on the passport broker

### As Researcher - Register account with the passport broker, request visas

### As Admin - Grant visas to researcher

### As Researcher - Log in to broker, select visas and obtain passport

### As Researcher - Take passport to DRS to obtain access to DRS objects
