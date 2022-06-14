# Session 4: Starter Kit - Data abstraction and workflow execution

## Outline

**Time:** Sunday, July 10th, 2022 @ 3:30 pm - 4:45 pm

**Slides:** [link](https://docs.google.com/presentation/d/1cJe5MyI6K0sHBHNcsvbLTbgaYGzsnVLCrYiEBtD2e2c)

In this session, participants will gain familiarity with the GA4GH Starter Kit, a suite of dockerized microservices implementing various GA4GH Standard APIs. Using Docker and Docker Compose, participants will download and run DRS and WES API instances on their local machine. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes BAM and CRAM files. Lastly, participants will execute containerized workflows (stored in Dockstore) using WES.

## Tutorial

** Note: If you have not already done so, clone the tutorial repository and enter the working directory for Session 4:

```
git clone https://github.com/ga4gh/ismb-2022-ga4gh-tutorial.git
cd ismb-2022-ga4gh-tutorial/sessions/4
```

### As Admin - Initialize databases for DRS and WES Starter Kits

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

### As Admin - Start services

### As Admin - Test DRS and WES services

```
GET http://localhost:5000/ga4gh/drs/v1/service-info
```

Some more HTTP calls to DRS here...

```
GET http://localhost:6000/ga4gh/wes/v1/service-info
```

Run "hello world" workflows in Nextflow and WDL here...

### As Admin - Load 1000 Genomes dataset into DRS

```
python scripts/populate_drs.py
```

### As Researcher - Inspect DRS for 1000 Genomes data

### As Researcher - Run CNest workflow (Nextflow)

### As Researcher - Run CNest workflow (WDL)
