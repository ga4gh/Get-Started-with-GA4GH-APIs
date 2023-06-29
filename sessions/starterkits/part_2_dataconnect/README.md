# Starter Kits (Part 2 Data Connect)
**Time:** Monday, July 10th, 2022 @ 4:30 pm - 5 pm


## Outline

In the previous session, we assumed: 
1. The input dataset (DRS URIs) was known by the researcher ahead of time
2. The input dataset was completely open access. 

In a realistic research scenario, the researcher will need to both **search** for and **obtain authorization** to a suitable, controlled access dataset prior to running workflows.

In this session, we will introduce another GA4GH standard API: Data Connect, which is used to facilitate search and access of data. Using Docker and Docker Compose, participants will start a Data Connect service and populate it with biomedical metadata about the input dataset. After learning how searching is done, there will be an exercise questions for the participants to write their own code to search the dataset. 


The participants will play the roles of 
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

* **Researcher / Data Consumer**
  * Interact with the GA4GH services to accomplish a scientific objective
  * Search, authorize, access, and analyze using the hosted services

## Tutorial

If you have not set up your environment, follow Tutorial Steps 1,2 from [Starter Kits Part 1](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/elwazi/sessions/starterkits/part_1_drs_wes/README.md)

### 1. Run Data Connect and Passport Starter Kit docker containers using docker-compose

Enter the working directory for Starter Kits Part 2.

```
cd Get-Started-with-GA4GH-APIs/sessions/starterkits/part_2_dataconnect
```

Delete any databases and temporary files from previous runs.
```
./refresh.sh
```

Deploy Data Connect and Passport Starter Kits using docker-compose. Make sure docker desktop is open.

```
docker-compose up -d
```
***
#### Potential Error: If a port is already in use...

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
***
### 2. Check if the docker containers are running

List all the running docker containers 

```
docker ps
```
You can also get this information from the docker desktop application. Check the list of running docker containers in the **part_2_dataconnect_passports** stack 

<img width="1009" alt="docker-desktop-list-containers" src="https://user-images.githubusercontent.com/89084962/175333953-976e5406-8202-4590-a266-66077ea66ef6.png">

### 3. Load 1000 genomes data into Data Connect

The Data Connect Starter Kit comes loaded with two default datasets - phenopackets v1 dataset and 200 genome samples from the 1000 genomes sample dataset.

### 4. Explore Data Connect endpoints

These requests can be made from the Jupyter Notebook for this session by entering the `/client_notebooks` directory and executing the command `jupyter notebook`. Find the detailed GA4GH Data Connect Specification [here](https://github.com/ga4gh-discovery/data-connect).

#### i. GET service-info

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/service-info
> ```

#### ii. GET tables list

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/tables
> ```

#### iii. GET table info for a specific table

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/table/one_thousand_genomes_sample/info
> ```

#### iv. GET table data for a specific table

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/table/one_thousand_genomes_sample/data
> ```

#### v. Search for data satisfying specific conditions

##### Search for samples with population_code = "PUR" and sex = "female"

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/search
> ```
> **REQUEST HEADER:**
> ```
> content-type:application/json
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "query": "select sample_name , sex , population_code , population_name from one_thousand_genomes_sample where population_code=?;",
>   "parameters": [ "PUR" ]
> }
> ```

#### v. Practice - Can you formulate a query to retrieve the `cram_drs_uri` and `crai_drs_uri` fields from one_thousand_genomes_sample table where population_code="PUR" and sex="female"?

#### vi. Convert DRS Object URI to HTTP URL

drs://{host}/{id} -> http(s)://{host}/ga4gh/drs/v1/objects/{id}

```
drs://localhost:5000/28ffe6386b78fffb7cd0a7b2d0a79846 ->

http://localhost:5000/ga4gh/drs/v1/objects/28ffe6386b78fffb7cd0a7b2d0a79846
```

### 5. Stop and Remove all docker containers, networks, volumes, and images created in this session
Ensure you are in the working directory for Starter Kits Part 2 before running `docker-compose down`

```
cd Get-Started-with-GA4GH-APIs/starterkits/part_2_dataconnect
```
```
docker-compose down
```
