# ISMB 2022 GA4GH Tutorial

## Introduction

Welcome to the tutorial outline for _**GA4GH: An introduction to federated genomics using the GA4GH Starter Kit and real-world data platforms**_. This tutorial will be (has been) presented at the ISMB conference on Sunday, July 10th, 2022 in Madison, Wisconsin, USA.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

In this tutorial, we explore four GA4GH standardized API interfaces that enable federated data access and analysis. The first API standard, **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows. The second standard, **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest. The third standard, **Data Connect**, allows researchers to search and filter biomedical datasets based on criteria of interest. Lastly, **GA4GH Passports** grants researchers fine-grained permission sets for data and compute resources they are allowed to access, and is used to control researcher access to resources behind the other three APIs.

If you are planning to attend the ISMB tutorial, please complete the steps in the [Preparation](#preparation) section to ensure your laptop is ready to run the various demos.

## Preparation

* Install [Docker](https://docs.docker.com/get-docker/) (and Docker Compose) on your local machine. Verify installation by running `docker` and `docker-compose` in your terminal, you should see a dialog message explaining how to use the command in each case. 
* Install an HTTP client testing tool, we recommend [Postman](https://www.postman.com/downloads/).

* Ensure the Docker daemon is running on your local machine at the start of the tutorial.

###### Setting up Python

* Install [Python](https://www.python.org/downloads/) on your local machine. Verify installation by running `python --version` in your terminal, you should see the version printed.
    * Note: If you installed Python3 you should place a 3 at the end of your commands, for example `python3` and `pip3`

* The Package Installer for Python `pip` should come pre-installed, you can confirm it by running the command `pip --version`.
    * If `pip` is not installed, visit the [pip documentation website](https://pip.pypa.io/en/stable/installation/) to set it up.

* Download the required python modules by running the command `pip install -r starterkit-requirements.txt`

## Schedule

### Session 1: Introduction to GA4GH, Federated Analysis, and the Starter Kit

**Time:** 11 am - 12 pm

**Summary:** Overview of GA4GH as a technical standards-setting organization in genomics, outline key technical standards that we will interact with during the tutorial. 

[**Go to Session 1**](./sessions/1/README.md)

### Session 2: Federated Analysis - Find and access data in the cloud via Data Connect and Data Repository Service (DRS)

**Time:** 12 pm - 1 pm

**Summary:** Interact with real-world implementations of Data Connect and DRS to locate and access files in various datasets.

[**Go to Session 2**](./sessions/2/README.md)

### Session 3: Federated Analysis - Run workflows using the Workflow Execution Service (WES)

**Time:** 2 pm - 3:15 pm

**Summary:** Interact with real-world implementations of WES to run workflows on the data accessed in the previous session.

[**Go to Session 3**](./sessions/3/README.md)

### Starter Kits:
### Part I: Data abstraction and workflow execution


**Summary:** Run DRS and WES instances using Docker, execute a nextflow workflow using WES

[**Go to Starter Kits Part I**](sessions/StarterKits/Part_1_DRS_WES/README.md)

### Part II: Controlled data access and data discovery

**Time:** 5 pm - 6 pm

**Summary:** Run Data Connect and Passport Broker instances using Docker. Acting as a researcher, search and obtain authorization for input datasets based on clearance.

[**Go to Starter Kits Part II**](sessions/StarterKits/Part_2_DataConnect_Passports/README.md)

## Instructors

1. Ian Fore, D. Phil. Senior Biomedical Informatics Program Manager, National Cancer Institute
    * Github
    * ORCID

2. Yash Puligundla, Software Engineer, Global Alliance for Genomics and Health
    * Github
    * ORCID

## Additional Links

* Coming Soon...
