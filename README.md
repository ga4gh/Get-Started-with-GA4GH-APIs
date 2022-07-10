# ISMB 2022 GA4GH Tutorial

## Introduction

Welcome to the tutorial outline for _**GA4GH: An introduction to federated genomics using the GA4GH Starter Kit and real-world data platforms**_. This tutorial will be (has been) presented at the ISMB conference on Sunday, July 10th, 2022 in Madison, Wisconsin, USA.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

In this tutorial, we explore four GA4GH standardized API interfaces that enable federated data access and analysis. The first API standard, **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows. The second standard, **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest. The third standard, **Data Connect**, allows researchers to search and filter biomedical datasets based on criteria of interest. Lastly, **GA4GH Passports** grants researchers fine-grained permission sets for data and compute resources they are allowed to access, and is used to control researcher access to resources behind the other three APIs.

We will explore two perspectives
* **Using GA4GH services as a client user Researcher / Data Consumer)**
  * Jupyter notebooks will be used to access services and perform end-to-end tasks using a number of services 
  * Using implementations of GA4GH services by a range of organizations
   
* **Running GA4GH services as a Data Provider using Starter Kit**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Researcher / Data Consumer:* explore direct http access to services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets
   
If you are planning to attend the ISMB tutorial, please complete the steps in the [Preparation](#preparation) section to ensure your laptop is ready to run the various demos.

## Environment Set up

Follow [this](https://docs.google.com/document/d/1n3UjQ1m0B1fG3LHFDPXx1OUw2uMzms5uANK76cngDyc/edit?usp=sharing) document to set up your environment for this tutorial.

## Schedule

### Session 1: Introduction to GA4GH, Federated Analysis, and the Starter Kit

**Time:** 11 am - 11:30 am

**Summary:** Overview of GA4GH as a technical standards-setting organization in genomics, outline key technical standards that we will interact with during the tutorial. 

[**Go to Session 1**](./sessions/session1/README.md)
***
### Session 2: Federated Analysis - Find and access data in the cloud via Data Connect, Data Repository Service (DRS) and Workflow Execution Service WES

**Time:** 11:30 am - 1 pm

**Summary:** Interact with real-world implementations of Data Connect, DRS and WES to locate and access files in various datasets.

[**Go to Session 2**](./sessions/session2/README.md)
***
### Lunch Break

**Time:** 1 pm - 2 pm
***
### Session 3: Federated Analysis - Putting the standards together 

**Time:** 2 pm - 3:15 pm

**Summary:** Combine examples from the previous session to perform an end to end task. Explore some of the other implementations of the standards explored.

[**Go to Session 3**](./sessions/session3/README.md)
***
### Break

**Time:** 3:15 pm - 3:30 pm
***
### Starter Kits:
### Part I: Data abstraction and workflow execution

**Time:** 3:30 pm - 4:45 pm

**Summary:** Run DRS and WES instances using Docker, execute a nextflow workflow using WES

[**Go to Starter Kits Part I**](https://github.com/ga4gh/ismb-2022-ga4gh-tutorial/wiki/Starter-Kits-(Part-1-DRS-and-WES))
***
### Break

**Time:** 4:45 pm - 5 pm
***
### Part II: Controlled data access and data discovery

**Time:** 5 pm - 6 pm

**Summary:** Run Data Connect and Passport Broker instances using Docker. Acting as a researcher, search and obtain authorization for input datasets based on clearance.

[**Go to Starter Kits Part II**](https://github.com/ga4gh/ismb-2022-ga4gh-tutorial/wiki/Starter-Kits-(Part-2-Data-Connect-and-Passports))

## Instructors

Ian Fore, D. Phil. Senior Biomedical Informatics Program Manager, National Cancer Institute
* [Github](https://github.com/ianfore)
* [orcid:0000-0002-2926-9324](http://identifiers.org/orcid:0000-0002-2926-9324)

Yash Puligundla, Software Engineer, Global Alliance for Genomics and Health
* [Github](https://github.com/yash-puligundla)
