# ELWAZI 
# TODO: Update session title, timings and details

## Introduction

Welcome to the tutorial outline for _**Get Started with GA4GH APIs: An introduction to federated genomics using the GA4GH Starter Kit**_. This tutorial will be (has been) presented at the eLwazi workshop on July 10th - 12th, 2023 in Cape Town, South Africa.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

TODO: update this section
In this tutorial, we explore four GA4GH standardized API interfaces that enable federated data access and analysis. The first API standard, **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows. The second standard, **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest. The third standard, **Data Connect**, allows researchers to search and filter biomedical datasets based on criteria of interest. Lastly, **GA4GH Passports** grants researchers fine-grained permission sets for data and compute resources they are allowed to access, and is used to control researcher access to resources behind the other three APIs.

We will explore two perspectives
* **Using GA4GH services as a client user Researcher / Data Consumer)**
  * Jupyter notebooks will be used to access services and perform end-to-end tasks using a number of services 
  * Using implementations of GA4GH services by a range of organizations
   
* **Running GA4GH services as a Data Provider using Starter Kit**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Researcher / Data Consumer:* explore direct http access to services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

## Environment Set up

We will be using VMs in the Ilifi(TODO: check the spelling) environment for the purpose of these workshop sessions. The VM comes pre-installed with required software and docker images. Please refer to (TODO: link to the terraform here) for the VM set up if you are interested


## Schedule

### Starter Kits:

(TODO: Check this content)
### Part 0: Check the Environment set up
**Time:** July 10, 2023 | 12:15 - 13:00

**Summary:** Ensure that all required software and tools are downloaded and installed correctly

[**Go to Part 0**](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/main/sessions/starterkits/part_0_env_check/README.md)

***
### Part 1: Data abstraction and workflow execution

**Time:** July 10, 2023 | 3:30 pm - 4:45 pm

**Summary:** Run DRS and WES instances using Docker, execute a nextflow workflow using WES.

[**Go to Part I**](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/main/sessions/starterkits/part_1_drs_wes/README.md)
***
### Part 2: Data Discovery
**Time:** July 11, 2023 | 3:30 pm - 4:45 pm

**Summary:** Run Data Connect instance using Docker and explore the dataset using the Data Connect endpoints.

[**Go to Part II**](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/main/sessions/starterkits/part_2_dataconnect/README.md)

***
### Part 3: Controlled data access

**Time:**  July 12, 2023 |5 pm - 6 pm

**Summary:** Run DRS and Passport Broker instances using Docker. Acting as a researcher, obtain authorization for input datasets based on clearance.

[**Go to Part III**](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/main/sessions/starterkits/part_2_drs_passports/README.md)

## Instructors

Alex Tsai, Software Engineer, Global Alliance for Genomics and Health
* [Github](https://github.com/alextsaihi)

Chen Chen, Software Engineer, Global Alliance for Genomics and Health
* [Github](https://github.com/Chen2x)

Yash Puligundla, Senior Software Engineer, Global Alliance for Genomics and Health
* [Github](https://github.com/yash-puligundla)