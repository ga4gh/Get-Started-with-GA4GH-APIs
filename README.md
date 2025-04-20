# BOSC 2025 - Walkthrough of GA4GH standards and interoperability it provides for genomic data implementations

## Part 0
## Introduction

Welcome to the session on GA4GH standards for genomic data sharing and the interoperability it provides. This session is for presentation at the Bioinformatics Open Source Conference held on 21-22 July, 2025 in Liverpool, UK.

The Global Alliance for Genomics and Health (GA4GH) is an international technical standards-setting organization, enabling genomic data sharing. Through its standards, GA4GH aims to promote a federated model of data sharing, in which researchers can seamlessly access data from multiple sources in an international network using common tools and protocols, and data providers can securely share data with trusted researchers while still maintaining ownership and control over their data. 

In this session, we explore two GA4GH standardized API interfaces that enable federated data access and analysis. 
1. **Data Repository Service (DRS)**, provides minimal metadata and access information about files that can be used as input to analytical workflows.
2. **Workflow Execution Service (WES)**, enables researchers to remotely run workflows defined in Common Workflow Language (CWL), Workflow Description Language (WDL), or Nextflow on an input dataset of interest.


These two services are fully interoperable. Data retrieved via DRS can be directly consumed by workflows run through WES. This integration facilitates a seamless pipeline from data access to analysis, enhancing reproducibility, collaboration, and scalability. The figure below is a visual representation of the interoperability that can be achieved between implementations of these two standards. 

 
We will demonstrate how this interoperability enables open source, cloud-agnostic research workflows using open standards. In addition, we will showcase real-world use cases to illustrate how DRS and WES can support data science and accelerate discovery.


## Environment Set up

To set up the environment on local system (such as laptop), the instructions are available in [Part 1](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/tree/bosc-2025/sessions/starterkits/part_1_drs_wes).
