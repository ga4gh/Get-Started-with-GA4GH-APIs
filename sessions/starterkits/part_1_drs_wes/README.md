# Starter Kits (Part 1 DRS and WES)

**Time:** Sunday, July 10th, 2022 @ 3:30 pm - 4:45 pm

**Slides:** [link](https://docs.google.com/presentation/d/1nrR0rCpKPpKzrizdUfRcG5ijmEpwgqlT/edit?usp=sharing&ouid=116022107626925645879&rtpof=true&sd=true)
## Outline

In this session, participants will gain familiarity with the GA4GH Starter Kits for Data Repository Service (DRS) and Workflow Execution Service (WES) standards. Using Docker and Docker Compose, participants will download and run DRS and 
WES API instances on their local machine. They will then populate the DRS instance with references to public genomics 
datasets, such as 1000 Genomes CRAM and CRAI files. Lastly, participants will execute containerized workflows (stored in 
Github) using WES.

The participants will play the roles of 
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

* **Researcher / Data Consumer**
  * Interact with the GA4GH services to accomplish a scientific objective
  * Search, authorize, access, and analyze using the hosted services

**NOTE:** We use Postman for all the HTTP requests

## Tutorial Steps

### 1. Instructions to Set Up Environment

Follow these [instructions](https://docs.google.com/document/d/1n3UjQ1m0B1fG3LHFDPXx1OUw2uMzms5uANK76cngDyc/edit?usp=sharing) document to set up your environment for this tutorial.) to set up your environment.

Once the virtual environment "venvs/ga4ghsk" is activated, go to "Get-Started-with-GA4GH-APIs" directory and install the requirements

If you have not already done so, clone the tutorial repository

```
git clone https://github.com/ga4gh/Get-Started-with-GA4GH-APIs.git
```
```
cd Get-Started-with-GA4GH-APIs
```
```
pip3 install -r starterkit-requirements.txt
```

### 2. Check the environment
#### 1. Python installation

Running this command should return the python version installed on your machine
```
python --version
```
#### 2. Docker Desktop and command line
```
docker run hello-world
```
#### 3. Postman (check -> GET google.com)
Run this GET request on Postman. It will return your IP

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> https://httpbin.org/ip
> ```

### 3. Run DRS and WES Starter Kit docker containers using docker-compose

```
cd sessions/starterkits/part_1_drs_wes
```

Delete any databases and temporary files from previous runs
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

### 4. Check if the docker containers are running & confirm the service-info endpoints

List all the running docker containers. You should see two containers, part_1_wes and part_1_drs

```
docker ps
```

You can also get this information from the docker desktop application. Check the list of running docker containers in the **part_1_drs_wes** stack 
<img width="1009" alt="image" src="https://user-images.githubusercontent.com/89084962/175344895-f5655346-8a21-4a8e-9b59-284888e6c712.png">


Inspect **service-info** endpoint of DRS and WES containers. The service-info endpoint returns the server details of the current implementation.

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/service-info
> ```

> **HTTP Method:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:6000/ga4gh/wes/v1/service-info
> ```

### 5. Load 1000 genomes data into DRS

```
python3 resources/drs/db-scripts/populate-drs.py
```

### 6. Explore DRS endpoints

Find the detailed GA4GH DRS Specification [here](https://github.com/ga4gh/data-repository-service-schemas).

#### i. GET service-info

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/service-info
> ```

#### ii. GET object by id

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/8e18bfb64168994489bc9e7fda0acd4f
> ```

#### iii. Bulk request objects

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>     "selection":
>         [
>             "8e18bfb64168994489bc9e7fda0acd4f",
>             "ba094cae0da59f27ea82a8a802be34cd"
>         ]
> }
> ```

#### iv. OPTIONS object by id

This endpoint provides the details about any authorization required to access the object

> **HTTP METHOD:**
> ```
> OPTIONS
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/8e18bfb64168994489bc9e7fda0acd4f
> ```

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

### 8. Stop and Remove all docker containers, networks, volumes, and images created in step 1

```
docker-compose down
```
