# BOSC 2025 - Walkthrough of GA4GH standards and interoperability it provides for genomic data implementations


## Introduction

Welcome to the session on GA4GH standards for genomic data sharing and the interoperability it provides. This session is for presentation at the Bioinformatics Open Source Conference held on 21-22 July, 2025 in Liverpool, UK.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

In this session, we explore two GA4GH standardized API interfaces that enable federated data access and analysis. 
1. **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows.
2. **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest.

In this tutorial the participants will play the roles of Data Provider, Data Consumer and Data Access Committee

  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Researcher / Data Consumer:* explore direct http access to services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

## Environment Set up

For the workshop sessions, we will utilize Virtual Machines setup in the Ilifu environment. These VMs have already been configured with the required software installations. If you would like to set up your own VM, please refer to the details at [grbot/elwazi-workshop-vm-setup](https://github.com/grbot/elwazi-workshop-vm-setup).

## Schedule

### Starter Kits:

### Part 0: Intro to GA4GH Starter Kit and test the environment set up
**Time:** November 12, 2024 | 9:00 AM - 9:45 PM COT \
**Instructor:**  \
**Summary:** 
* Introduction to GA4GH Starter Kit. 
* Ensure that all required software and tools are downloaded and installed correctly

[**Go to Part 0**](./sessions/starterkits/part_0_env_check/README.md)

***
### Part 1: Data Abstraction and Workflow Execution

**Time:** November 12, 2024 | 9:45 AM - 11:00 AM COT \
**Instructor:**  \
**Summary:** 
* Run DRS and WES instances using Docker.
* Execute a nextflow workflow using WES.

[**Go to Part 1**](./sessions/starterkits/part_1_drs_wes/README.md)
***
### Part 2: Data Discovery
**Time:** November 12, 2024 | 11:00 AM - 12:00 PM COT \
**Instructor:**  \
**Summary:** 
* Run Data Connect instance using Docker.
* Explore the dataset using the Data Connect endpoints.

[**Go to Part 2**](./sessions/starterkits/part_2_dataconnect/README.md)

***
### Part 3: Controlled Data Access

**Time:**  November 12, 2024 | 12:00 PM - 1:00 PM COT \
**Instructor:**  \
**Summary:** 
* Run DRS and Passport Broker instances using Docker. 
* Acting as a researcher, obtain authorization for input datasets based on clearance.

[**Go to Part 3**](./sessions/starterkits/part_3_drs_passports/README.md)

## Instructors

* [Alex Tsai](https://github.com/alextsaihi), Software Engineer, Global Alliance for Genomics and Health
* [Chen Chen](https://github.com/Chen2x), Software Engineer, Global Alliance for Genomics and Health
* [Yash Puligundla](https://github.com/yash-puligundla), Senior Software Engineer, Global Alliance for Genomics and Health
