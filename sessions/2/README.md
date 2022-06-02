# Session 2: Federated Analysis - Find and access data in the cloud via Data Connect and Data Repository Service (DRS)

## Outline

**Time:** Sunday, July 10th, 2022 @ 12 pm - 1 pm

**Slides:** [link](https://docs.google.com/presentation/d/1zuw_KVO_TQy91ODBWYmObkc_FTkAK7iy-SETjTY5TkQ)

*Suggestion that this session would be #4 in the running order.*

The key addition from previous sessions is to run scripts and notebooks against GA4GH services provided by GA4GH Driver Projects and other data providers.

Participants will use python clients for GA4GH services and write scripts in Jupyter notebooks.

Participants will interact with Driver Project implementations of Data Connect and DRS to locate and access files in datasets such as TCGA, GTEx, and TopMed and run workflows against them using WES (though that could be the add in the following session).

## Tutorial

Candidate scripts to be selected from https://github.com/ga4gh/fasp-scripts/tree/master/notebooks

For follow on from morning sessions will likely use CNest example (complex), or SAMTools (less computaionally ambitious, but easier).

### Draft component list

| Component/Standard | Implementation used                                          |
| ------------------ | ------------------------------------------------------------ |
| DRS Service        | dbGaP DRS Service                                            |
| WES Service        | WES Starter Kit implementation                               |
| Data Discovery     | KIds First FHIR or Data Connect                              |
| Passport provided  | dbGap Passport Provider (not required for open data)         |
| Candidate dataset  | Clinical and Genetic Evaluation of Individuals with Undiagnosed Disorders Through the Undiagnosed Diseases Network (UDN) [dbgap:phs001232.v1.p1](http://identifiers.org/dbgap:phs001232.v1.p1) |



## Session specific requirements

Jupyter

Fasp-scripts

Starter accounts with cloud credits on selected platforms (to be listed e.g. Seven Bridges BioData Catalyst)

### Working notes

*Notes on candidate scripts and servers. (still for discussion but see specific proposal as above)*

*FASPNotebook02  - is working end to end. CRDC and TopMed data sources and SB WES Client.* 

*FASPNotebook06 is potentially nice - SRA data source and DNAStack WES Client - issues are: a) cannot get results back b) Use of the signed URL wasn't working* 

*The above all hide the specifics of the WES call in the WES Client (not all bad if the client code is in scope for the tutorial)*

*Probably to merge with something like SBCGC_WES_Example.ipynb which deals with constructing the WES call in the notebook.*

*SBCGC_WES_Example.ipynb was the basis for the CNest example*

## 
