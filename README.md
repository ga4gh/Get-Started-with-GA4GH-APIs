# eLwazi, 2023 - GA4GH Starter Kit Practical Sessions


## Introduction

Welcome to the tutorial outline for _**Get Started with GA4GH APIs: An introduction to federated genomics using the GA4GH Starter Kit**_. This tutorial will be (has been) presented at the eLwazi GA4GH technical workshop held on July 10, 2023 - July 14, 2023 in Cape Town, South Africa.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

In this tutorial, we explore four GA4GH standardized API interfaces that enable federated data access and analysis. 
1. **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows.
2. **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest.
3. **Data Connect**, allows researchers to search and filter biomedical datasets based on criteria of interest.
4. **GA4GH Passports** grants researchers fine-grained permission sets for data and compute resources they are allowed to access, and is used to control researcher access to resources behind the other three APIs.

In this tutorial the participants will play the roles of Data Provider, Data Consumer and Data Access Committee

  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Researcher / Data Consumer:* explore direct http access to services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

## Environment Set up

For the workshop sessions, we will utilize Virtual Machines setup in the Ilifu environment. These VMs have already been configured with the required software installations. If you would like to set up your own VM, please refer to the provided terraform template (TODO: link to the terraform here).

## Schedule

### Starter Kits:

### Part 0: Intro to GA4GH Starter Kit and test the environment set up
**Time:** July 10, 2023 | 11:45 AM - 1:00 PM SAST
**Instructor:** Alex Tsai
**Summary:** 
* Introduction to GA4GH Starter Kit. 
* Ensure that all required software and tools are downloaded and installed correctly

[**Go to Part 0**](./sessions/starterkits/part_0_env_check/README.md)

***
### Part 1: Data Abstraction and Workflow Execution

**Time:** July 10, 2023 | 2:45 PM - 3:30 PM SAST
**Instructor:** Yash Puligundla
**Summary:** 
* Run DRS and WES instances using Docker.
* Execute a nextflow workflow using WES.

[**Go to Part 1**](./sessions/starterkits/part_1_drs_wes/README.md)
***
### Part 2: Data Discovery
**Time:** July 11, 2023 | 4:30 PM - 5:00 PM SAST
**Instructor:** Chen Chen
**Summary:** 
* Run Data Connect instance using Docker.
* Explore the dataset using the Data Connect endpoints.

[**Go to Part 2**](./sessions/starterkits/part_2_dataconnect/README.md)

***
### Part 3: Controlled Data Access

**Time:**  July 12, 2023 | 4:15 PM - 5:00 PM SAST
**Instructor:** Yash Puligundla
**Summary:** 
* Run DRS and Passport Broker instances using Docker. 
* Acting as a researcher, obtain authorization for input datasets based on clearance.

[**Go to Part 3**](./sessions/starterkits/part_3_drs_passports/README.md)

## Instructors

* [Alex Tsai](https://github.com/alextsaihi), Software Engineer, Global Alliance for Genomics and Health
* [Chen Chen](https://github.com/Chen2x), Software Engineer, Global Alliance for Genomics and Health
* [Yash Puligundla](https://github.com/yash-puligundla), Senior Software Engineer, Global Alliance for Genomics and Health