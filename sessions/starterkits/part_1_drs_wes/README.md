# Starter Kits:
## Part 1 - Data Abstraction and Workflow Execution

**Starter Kits:** Data Repository Service (DRS) and Workflow Execution Service (WES)

**Time:** July 10, 2023 | 2:45 PM - 3:30 PM SAST

**Slides:** [link](https://docs.google.com/presentation/d/1R0AZDTl8JAGJgvU8A3ESCk7OKp6l77KW/edit?usp=sharing&ouid=116022107626925645879&rtpof=true&sd=true)

## Outline

In this session, participants will gain familiarity with the GA4GH Starter Kits for Data Repository Service (DRS) and Workflow Execution Service (WES) standards. Using Docker and Docker Compose, participants will download and run DRS and WES API instances on their local machine. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes CRAM and CRAI files. Lastly, participants will execute containerized workflows (stored in Github) using WES.

The participants will play the roles of
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services
* **Data Consumer (Researcher)**
  * Interact with the GA4GH services to accomplish a scientific objective

## Tutorial Steps

### 1. Prerequisite: Environment Set up and Check
Ensure that all required software and tools are downloaded and installed correctly by following the steps at [part_0_env_check](./sessions/starterkits/part_0_env_check)

### 2. Make sure you are in `part_1_drs_wes` directory
```
cd ~/Get-Started-with-GA4GH-APIs/sessions/starterkits/part_1_drs_wes
```
### 3. Run DRS and WES Starter Kit docker containers using docker-compose

For a fresh install, delete any databases and temporary files from previous runs
```
./refresh.sh
```
Create a directory on the host machine to store wes_runs
```
mkdir -p /tmp/shared/wes/
```
Deploy DRS and WES Starter Kits and their databases using docker-compose
```
docker-compose up -d

# with newer versions of docker this might be
docker compose  up -d

```
### 4. Check if the docker containers are running
List all the currently running docker containers.
```
docker ps
```
You should see two containers in the response:
- part_1_wes
- part_1_drs

<img width="1438" alt="image" src="https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/assets/89084962/87bc82fe-eff2-4fdf-b7e9-9b72d9d53e1c">

### 5. Confirm the service-info endpoints
To verify that the service-info endpoints are working correctly, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/1_Check_DRS_WES_Container_Status.ipynb` notebook.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── notebooks
                │
                └── 1_Check_DRS_WES_Container_Status.ipynb
```
###  6. Load a subset of 1000 genomes data into DRS
```
python3 resources/drs/db-scripts/populate-drs.py
```
### 7. Explore DRS endpoints

To explore various DRS endpoints, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/2_Explore_DRS_Endpoints.ipynb` notebook.
```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── notebooks
                │
                └── 2_Explore_DRS_Endpoints.ipynb
```
Find the detailed GA4GH DRS Specification [here](https://github.com/ga4gh/data-repository-service-schemas).

### 8. Explore WES Endpoints
To explore various WES endpoints, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/3_Explore_WES_Endpoints.ipynb` notebook.
```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── notebooks
                │
                └── 3_Explore_WES_Endpoints.ipynb
```
Find the detailed GA4GH WES Specification [here](https://github.com/ga4gh/workflow-execution-service-schemas).

### 9. Clean up
To stop and remove all the deployed Docker containers, networks, and volumes created in this session, follow these steps:

Make sure you are in the working directory of this session by running this command:

```
cd ~/Get-Started-with-GA4GH-APIs/sessions/starterkits/part_1_drs_wes
```

The following command stops and removes all the Docker resources created in this session:

```
docker-compose down

# or
docker compose down

```

To confirm the cleanup, execute `docker ps` command. The response should not list any of the Docker containers from this session.
