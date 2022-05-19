# Session 5: Starter Kit - Controlled data access and data discovery

## Outline

**Time:** Sunday, July 10th, 2022 @ 5 pm - 6 pm

**Slides:** [link](https://docs.google.com/presentation/d/1qHAFg6z_JZNIeyMa8FXu9aZXoKvay9PM5yk5zTielio)

In the previous session, we assumed 2 things: **(1)** The input dataset (DRS URIs) was known by the researcher ahead of time; and **(2)** The input dataset was completely open access. In a realistic research scenario, the researcher will need to both **search** for and **obtain authorization** to a suitable, controlled access dataset prior to running workflows.

In this session, we will introduce two more GA4GH standard APIs: Data Connect and Passports, which facilitate search and authorization, respectively. Using Docker and Docker Compose, participants will start a Data Connect service and populate it with biomedical metadata about the input dataset. Next, participants will start a Passport Broker service, populate it with researcher user accounts, and give different levels of dataset access to each researcher. Finally, participants will act on behalf of these researchers, running biomedical search queries and using their access credentials to obtain datasets for which they have clearance.

## Tutorial

### As Admin - Deploy services

### As Admin - Load 1000 Genomes search data into Data Connect

### As Researcher - Explore Data Connect endpoints

### As Researcher - Perform search queries on /search endpoint

### As Researcher - Attempt to access DRS objects, get auth info

### As Admin - Create visas on the passport broker

### As Researcher - Register account with the passport broker, request visas

### As Admin - Grant visas to researcher

### As Researcher - Log in to broker, select visas and obtain passport

### As Researcher - Take passport to DRS to obtain access to DRS objects
