# Starter Kits:
## Part 1 - Data Abstraction and Workflow Execution
**Starter Kits:** Data Repository Service (DRS) and Workflow Execution Service (WES)
**Time:** July 10, 2023 | 2:45 PM - 3:30 PM SAST
**Slides:** [link]() (TODO: Update link in the slides)
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
cd Get-Started-with-GA4GH-APIs/sessions/starterkits/part_1_drs_wes
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
```
### 4. Check if the docker containers are running
List all the currently running docker containers. 
```
docker ps
```
You should see two containers in the response:
- part_1_wes
- part_1_drs

<img width="1317" alt="image" src="https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/assets/89084962/fd33dde3-3456-4bdf-94ac-c69bfd54b8c0">

### 5. Confirm the service-info endpoints
To verify that the service-info endpoints are working correctly, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./client_notebooks/1_Check_DRS_WES_Container_Status.ipynb` notebook.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── client_notebooks
                │
                └── 1_Check_DRS_WES_Container_Status.ipynb
```
###  6. Load a subset of 1000 genomes data into DRS
```
python3 resources/drs/db-scripts/populate-drs.py
```
### 6. Explore DRS endpoints

To explore various DRS endpoints, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./client_notebooks/2_Explore_DRS_Endpoints.ipynb` notebook.
```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── client_notebooks
                │
                └── 2_Explore_DRS_Endpoints.ipynb
```
Find the detailed GA4GH DRS Specification [here](https://github.com/ga4gh/data-repository-service-schemas).

### 7. Explore WES Endpoints
To explore various WES endpoints, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./client_notebooks/3_Explore_WES_Endpoints.ipynb` notebook.
```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_1_drs_wes
            │
            └── client_notebooks
                │
                └── 3_Explore_WES_Endpoints.ipynb
```
Find the detailed GA4GH WES Specification [here](https://github.com/ga4gh/workflow-execution-service-schemas).

### 8. Clean up
Finally, to stop and remove all the deployed docker containers, networks and volumes created in this session, run the following command from the working directory of this session ( `Get-Started-with-GA4GH-APIs/starterkits/part_1_drs_wes`)
```
docker-compose down
```
