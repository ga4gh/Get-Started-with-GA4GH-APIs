# Session 4: Starter Kit - Data abstraction and workflow execution

## Outline

**Time:** Sunday, July 10th, 2022 @ 3:30 pm - 4:45 pm

**Slides:** [link](https://docs.google.com/presentation/d/1cJe5MyI6K0sHBHNcsvbLTbgaYGzsnVLCrYiEBtD2e2c)

In this session, participants will gain familiarity with the GA4GH Starter Kit, a suite of dockerized microservices implementing various GA4GH Standard APIs. Using Docker and Docker Compose, participants will download and run DRS and WES API instances on their local machine. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes BAM and CRAM files. Lastly, participants will execute containerized workflows (stored in Dockstore) using WES.

## Tutorial

### As Admin - Initialize databases for DRS and WES Starter Kits

```bash
docker pull ga4gh/ga4gh-starter-kit-utils:0.1.1
```

```bash
docker run ga4gh/ga4gh-starter-kit-utils:0.1.1 database list-migrations drs
```

### As Admin - Start services

### As Admin - Test DRS and WES services

### As Admin - Load 1000 Genomes dataset into DRS

### As Researcher - Inspect DRS for 1000 Genomes data

### As Researcher - Run CNest workflow (Nextflow)

### As Researcher - Run CNest workflow (WDL)
