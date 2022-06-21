# Starter Kits - Data abstraction and workflow execution

## Outline

**Time:** Sunday, July 10th, 2022 @ 3:30 pm - 4:45 pm

**Slides:** [link](https://docs.google.com/presentation/d/1cJe5MyI6K0sHBHNcsvbLTbgaYGzsnVLCrYiEBtD2e2c)

In this session, participants will gain familiarity with the GA4GH Starter Kit, a suite of dockerized microservices implementing various GA4GH Standard APIs. Using Docker and Docker Compose, participants will download and run DRS and WES API instances on their local machine. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes BAM and CRAM files. Lastly, participants will execute containerized workflows (stored in Dockstore) using WES.

## Tutorial

** Note: If you have not already done so, clone the tutorial repository and enter the working directory for Session 4:

```
git clone https://github.com/ga4gh/ismb-2022-ga4gh-tutorial.git
cd ismb-2022-ga4gh-tutorial/sessions/StarterKits/Part_1_DRS_WES
```

### As Admin - Start services and initialize databases for DRS and WES Starter Kits

```
docker-compose up -d
```

Note: For this part of the tutorial we assume the data is public access 
and there is no authorization needed. 

#### If a port is already in use...

You might see an error like this:
```
ERROR: for 5_drs_1 Cannot start service drs: Ports are not available: listen tcp 0.0.0.0:5000: bind: address already in use
```
In this case you can check which service is using that specific port:
```
sudo lsof -i :<port>
```
You can also kill the process that is using the port (You can find the PID of the process by running the command above). 
Make sure to not kill a vital process!
```
kill -9 <PID>
```

### Load 1000 genomes data into DRS

To check if the DRS service is up and running as expected, check if the service-info endpoint is working as expected

```
GET http://localhost:5000/ga4gh/drs/v1/service-info
```
service-info endpoint should return the server details of the current implementation.

To load the 1000 genomes data into DRS server, run

```
python3 scripts/populate-drs.py
```

### Explore DRS endpoints
### 1. GET /service-info

```
GET http://localhost:5000/ga4gh/drs/v1/service-info
```

### 2. GET /objects/{id}

```
GET http://localhost:5000/ga4gh/drs/v1/objects/HG00449.1000genomes.highcov.downsampled.cram
```



### 3. Bulk request /objects

```
POST http://localhost:5000/ga4gh/drs/v1/objects

BODY
{
    "selection":
        [
            "HG00449.1000genomes.highcov.downsampled.cram",
            "HG00449.1000genomes.highcov.downsampled.crai"
        ]
}
```

### 4. OPTIONS /objects/{id}

```
OPTIONS http://localhost:5000/ga4gh/drs/v1/objects/HG00449.1000genomes.highcov.downsampled.cram 
```
we will talk in detail about the case where the data is not publicly accessible and there is authorization involved in the next part of the tutorial.

POST method is also available for the /objects/{id} endpoint. You can learn more about the specification [here](https://ga4gh.github.io/data-repository-service-schemas/preview/release/drs-1.2.0/docs/).


### Explore WES endpoints
### 1. /service-info

```
GET http://localhost:6000/ga4gh/wes/v1/service-info
```


### 3. List runs

```
GET http://localhost:6000/ga4gh/wes/v1/runs
```

### 4. Add a nextflow workflow 

```
POST http://localhost:6000/ga4gh/wes/v1/runs

REQUEST HEADER 
Content-Type: multipart/form-data

REQUEST BODY (form-data)
workflow_type:NEXTFLOW
workflow_type_version:21.04.0
workflow_url:https://github.com/jb-adams/samtools-view-count-nf
workflow_params:{"input":<drs uri>}
```
TODO: fix wes - /runs
TODO: fix wes - drs hostname resolution
### 5. Monitor the workflow
Using run id from step 4
```
GET http://localhost:6000/ga4gh/wes/v1/runs/<run id>
```

### 6. Add a nextflow workflow - Samtools view


### 7. Monitor the workflow

### Stop and Remove all the docker containers, networks, volumes, and images created by `docker-compose up`
```
docker-compose down
```
