# Starter Kits:
## Part 3 - Controlled Data Access

**Starter Kits:** GA4GH Passports, Data Repository Service (DRS)

**Time:** July 12, 2023 | 4:15 PM - 5:00 PM SAST

**Slides:** [link]() (TODO: Update link in the slides)

## Outline
In this session, participants will gain familiarity with the process of using GA4GH Passports to access controlled data through the Data Repository Service (DRS). Using Docker and Docker Compose, participants will be able to download and run local instances of DRS, Passport Broker, and Passport UI Starter Kits. They will then populate the DRS instance with references to public genomics datasets, such as 1000 Genomes CRAM and CRAI files. 

Next, participants will populate the Passport Broker service with researcher user accounts, and give different levels of dataset access to each researcher. Finally, participants will act on behalf of these researchers, by leveraging their access credentials to retrieve DRS objects for which they have been granted clearance.

The participants will play the roles of
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

* **Data Consumer (Researcher)**
  * Interact with the GA4GH services to accomplish a scientific objective
  * Authorize and access data objects using the hosted services

## Tutorial Steps

### 1. Prerequisite: Environment Set up and Check
Ensure that all required software and tools are downloaded and installed correctly by following the steps at [part_0_env_check](./sessions/starterkits/part_0_env_check)

### 2. Make sure you are in `part_3_drs_passports` directory
```
cd Get-Started-with-GA4GH-APIs/sessions/starterkits/part_3_drs_passports
```

### 3. Update *./contrib/kratos/kratos.yml* and *docker-compose.yml* files with the public IP of your Virtual Machine

To ensure proper redirection by the Passport UI service, please follow these steps:

#### i. "./contrib/kratos/kratos.yml"
Open the **./contrib/kratos/kratos.yml** file and locate all the re-direct URLs. Update each of these URLs with the public IP address of your Virtual Machine. Refer to the provided screenshot for guidance.

<img width="598" alt="image" src="https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/assets/89084962/697e846e-ff8c-460f-b01f-02b640e15dd5">


#### ii. "docker-compose.yml"
Open the **docker-compose.yml** file and find the **passport-ui-node** service. Within this service, locate the environment variable named **KRATOS_BROWSER_URL**. Update its value with the public IP address of your Virtual Machine. Refer to the provided screenshot for guidance.

<img width="598" alt="image" src="https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/assets/89084962/4f916b2d-9f78-4775-9591-a34a9fdcce7d">


### 4. Run DRS, Passport UI and Passport Broker Starter Kit docker containers using docker-compose

For a fresh install, delete any databases and temporary files from previous runs
```
./refresh.sh
```

Deploy the Starter Kits and their databases using docker-compose
```
docker-compose up -d
```

### 5. Check if the docker containers are running
List all the currently running docker containers. 
```
docker ps
```
You should see five containers in the response:
- part_3_kratos
- part_3_passport_broker
- part_3_drs
- part_3_mailslurper
- part_3_passport_ui

<img width="1435" alt="image" src="https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/assets/89084962/37d9c7e6-93db-4a29-b6c2-15e901ef7c0a">


### 6. Confirm the service-info endpoints
To verify that the service-info endpoints are working correctly, go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/1_Check_DRS_PassportBroker_Container_Status.ipynb` notebook.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_3_drs_passports
            │
            └── notebooks
                │
                └── 1_Check_DRS_PassportBroker_Container_Status.ipynb
```
###  6. Load a subset of 1000 genomes data into DRS
```
python3 resources/drs/db-scripts/populate-drs.py
```

### 7. Access DRS objects without using a Passport Token that contains required Visa
Go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/2_Access_DRS_object_without_Passport_Token.ipynb` notebook.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_3_drs_passports
            │
            └── notebooks
                │
                └── 2_Access_DRS_object_without_Passport_Token.ipynb
```

### 8. Acting as an Admin, Add Visas to the Passport Broker

Go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/3_Add_Visas_to_Passport_Broker.ipynb` notebook to add all the 5 visas into the Passport Broker.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_3_drs_passports
            │
            └── notebooks
                │
                └── 3_Add_Visas_to_Passport_Broker.ipynb
```

### 9. Register a new user account with the Passport Broker

To create a new user account, follow these steps:

* Visit the welcome page at `http://{Public_IP_of_your_VM}:4455/welcome`
* Scroll down to the "Account Management" section and click on "Sign Up". This will redirect you to `http://{Public_IP_of_your_VM}:4455/registration`
* Fill in the necessary information to create a new account
* After signing up, you will be redirected to the welcome page. Under "User Information", you will find your account details. Take note of the `user-id`
<img width="1009" alt="passport-broker-user-id" src="https://user-images.githubusercontent.com/89084962/175366273-f053ca18-583b-444d-b8c2-d9923b6cedf6.png">
* A successful sign-up will create a new user in the Passport Broker database

### 9. Acting as an Admin, Confirm User Creation and Grant Visas

Go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/4_Grant_Visas_to_User.ipynb` notebook to confirm the user's presence in the Passport Broker Database and grant them the necessary visas.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_3_drs_passports
            │
            └── notebooks
                │
                └── 4_Grant_Visas_to_User.ipynb
```
### 10. Obtain Passport Token with Selected Visas from the Passport UI

* Go back to the welcome page at `http://{Public_IP_of_your_VM}:4455/welcome`
* Click on **Get Passport Token** button. This will take you to a page where you can view your assigned visas
* Check all the visas that you require and click on **Get Passport Token**
<img width="1009" alt="image" src="https://user-images.githubusercontent.com/89084962/175381003-f91f6160-6dd3-4c3f-afbb-d1f4acba771d.png">
* The passport token will be generated.
* You can verify the validity of your JWT token by visiting [jwt.io](https://jwt.io/) and pasting the passport JWT token to examine its contents.

### 11. Take this passport token to DRS server to obtain access to DRS objects
Go to Jupyter Notebook using a browser on your local machine and follow the steps in `./notebooks/5_Access_DRS_Object_with_Passport_Token.ipynb` notebook.

```
Get-Started-with-GA4GH-APIs
│
└── sessions
    │
    └── starterkits
        │
        └── part_3_drs_passports
            │
            └── notebooks
                │
                └── 5_Access_DRS_Object_with_Passport_Token.ipynb
```

### 12. Clean up
Finally, to stop and remove all the deployed docker containers, networks and volumes created in this session, run the following command from the working directory of this session ( `Get-Started-with-GA4GH-APIs/starterkits/part_3_drs_passports`)
```
docker-compose down
```
