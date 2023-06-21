# Starter Kits:
## Part 1 - Data Repository Service (DRS) and Workflow Execution Service (WES)

**Time:** Sunday, July 10th, 2022 @ 3:30 pm - 4:45 pm (TODO: Update the time)

**Slides:** [link](https://docs.google.com/presentation/d/1nrR0rCpKPpKzrizdUfRcG5ijmEpwgqlT/edit?usp=sharing&ouid=116022107626925645879&rtpof=true&sd=true) (TODO: Update link in the slides)
## Outline

In this session, participants will gain familiarity with the GA4GH Starter Kits for Data Repository Service (DRS) and Workflow Execution Service (WES) standards. Using Docker and Docker Compose, participants will download and run DRS and WES API instances on their local machine. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes CRAM and CRAI files. Lastly, participants will execute containerized workflows (stored in Github) using WES.

The participants will play the roles of
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

* **Researcher / Data Consumer**
  * Interact with the GA4GH services to accomplish a scientific objective
  * Search, authorize, access, and analyze using the hosted services

## Tutorial Steps

### 1. Set Up & Verify the environment

Follow these [instructions](TODO: link to Part 0 readme - also includes install starterkit-requirements.txt) to set up and verify your environment for this tutorial.

If you have not already done so, clone the tutorial repository

```
git clone -b elwazi https://github.com/ga4gh/Get-Started-with-GA4GH-APIs.git
```
```
cd Get-Started-with-GA4GH-APIs/sessions/starterkits/part_1_drs_wes
```
### 2. Run DRS and WES Starter Kit docker containers using docker-compose

For a fresh install, delete any databases and temporary files from previous runs
```
./refresh.sh
```

Create a directory on the host machine to store wes_runs
```
mkdir -p /tmp/shared/wes/
```

Deploy DRS and WES Starter Kits using docker-compose
```
docker-compose up -d
```

### 4. Check if the docker containers are running & confirm the service-info endpoints

List all the running docker containers. You should see two containers, part_1_wes and part_1_drs

```
docker ps
```

You can also get this information from the docker desktop application. Check the list of running docker containers in the **part_1_drs_wes** stack
<img width="1009" alt="image" src="https://user-images.githubusercontent.com/89084962/175344895-f5655346-8a21-4a8e-9b59-284888e6c712.png">

TODO: Link to jupyter notebook for hands on workflow using WES to run a workflow that uses a DRS object



###  5. Load 1000 genomes data into DRS
```
python3 resources/drs/db-scripts/populate-drs.py
```



### 6. Explore DRS endpoints

Find the detailed GA4GH DRS Specification [here](https://github.com/ga4gh/data-repository-service-schemas).




### 7. Explore WES Endpoints

Find the detailed GA4GH WES Specification [here](https://github.com/ga4gh/workflow-execution-service-schemas).

#### i. GET service-info

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:6000/ga4gh/wes/v1/service-info
> ```

#### ii. GET runs list

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:6000/ga4gh/wes/v1/runs
> ```

#### iii. POST a Nextflow workflow

Run samtools head on drs://localhost:5000/8e18bfb64168994489bc9e7fda0acd4f

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:6000/ga4gh/wes/v1/runs
> ```
> **REQUEST HEADER:**
> ```
> Content-Type:multipart/form-data
> ```
> **REQUEST BODY (form-data):**
> ```
> workflow_type:NEXTFLOW
> workflow_type_version:21.04.0
> workflow_url:https://github.com/yash-puligundla/samtools-head-nf
> workflow_params:{"input":"drs://localhost:5000/8e18bfb64168994489bc9e7fda0acd4f"}
> ```

The response from this request provides the "run_id" which can be used to monitor the run.

#### iv. Monitor the run

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:6000/ga4gh/wes/v1/runs/<run id>
> ```

It takes about 20 minutes to complete this run. Do not stop your docker containers until then.

### 8. Stop and Remove all docker containers, networks, volumes, and images created in this session
Ensure you are in the working directory for Starter Kits Part 1 before running `docker-compose down`

```
cd Get-Started-with-GA4GH-APIs/starterkits/part_1_drs_wes
```
```
docker-compose down
```