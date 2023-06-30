# Starter Kits (Part 2 Data Connect and Passports)
**Time:** Sunday, July 10th, 2022 @ 5 pm - 6 pm

**Slides:** [link](https://docs.google.com/presentation/d/1nrR0rCpKPpKzrizdUfRcG5ijmEpwgqlT/edit#slide=id.g135c1eb0a82_0_732)

## Outline

In the previous session, we assumed: 
1. The input dataset (DRS URIs) was known by the researcher ahead of time
2. The input dataset was completely open access. 

In a realistic research scenario, the researcher will need to both **search** for and **obtain authorization** to a suitable, controlled access dataset prior to running workflows.

In this session, we will introduce two more GA4GH standard APIs: Data Connect and Passports, which facilitate search and authorization, respectively. Using Docker and Docker Compose, participants will start a Data Connect service and populate it with biomedical metadata about the input dataset. Next, participants will start a Passport Broker service, populate it with researcher user accounts, and give different levels of dataset access to each researcher. Finally, participants will act on behalf of these researchers, running biomedical search queries and using their access credentials to obtain datasets for which they have clearance.


The participants will play the roles of 
* **Data Provider**
  * *System/Platform admin:* Configure, start, and stop GA4GH Starter Kit services 
  * *Data Access Committee (DAC):* Grant/revoke researcher access to datasets

* **Researcher / Data Consumer**
  * Interact with the GA4GH services to accomplish a scientific objective
  * Search, authorize, access, and analyze using the hosted services

**NOTE:** We use Postman for all the HTTP requests

## Tutorial

If you have not set up your environment, follow Tutorial Steps 1,2 from [Starter Kits Part 1](https://github.com/ga4gh/Get-Started-with-GA4GH-APIs/blob/main/sessions/starterkits/part_1_drs_wes/README.md)

### 1. Run Data Connect and Passport Starter Kit docker containers using docker-compose

Enter the working directory for Starter Kits Part 2

```
cd Get-Started-with-GA4GH-APIs/sessions/starterkits/part_2_dataconnect_passports
```

Delete any databases and temporary files from previous runs
```
./refresh.sh
```


Make sure contrib/kratos/kratos.yml is updated with the public IP of your VM and in docker-compose file

In my case, it is "154.114.10.160"





Deploy Data Connect and Passport Starter Kits using docker-compose

```
docker-compose up -d
```


### 2. Check if the docker containers are running

List all the running docker containers 

```
docker ps
```
You can also get this information from the docker desktop application. Check the list of running docker containers in the **part_2_dataconnect_passports** stack 

<img width="1009" alt="docker-desktop-list-containers" src="https://user-images.githubusercontent.com/89084962/175333953-976e5406-8202-4590-a266-66077ea66ef6.png">

### 3. Load 1000 genomes data into Data Connect

The Data Connect Starter Kit comes loaded with two default datasets - phenopackets v1 dataset and 200 genome samples from the 1000 genomes sample dataset.



### 5. Add the broker and visa information to the DRS server and load 1000 genomes data into DRS



```
python3 resources/drs/db-scripts/populate-drs.py
```



### 8. Register a new user account with the passport broker

Visit the welcome page at http://{public_ip_of_your_VM}:4455/welcome

Towards the bottom, under Account Management press Sign Up, which takes you to http://{public_ip_of_your_VM}:4455/registration where you can create a new account.

After signing up, you should see your account information on the welcome page, under User Information. Note down the **user-id**
<img width="1009" alt="passport-broker-user-id" src="https://user-images.githubusercontent.com/89084962/175366273-f053ca18-583b-444d-b8c2-d9923b6cedf6.png">

A successful sign-up will result in the user being created in the passport broker database as well.

Go to ....ipynb to confirm this and grant required visas to this user to access the DRS objects of interest


### 10. Log back into the passport broker, select visas, and obtain the passport token

Back in the [welcome page](http://127.0.0.1:4455/welcome) press [Get Passport Token](http://127.0.0.1:4455/passport). On this page, you should see your assigned visas, check all of them and press Get Passport Token.
<img width="1009" alt="image" src="https://user-images.githubusercontent.com/89084962/175381003-f91f6160-6dd3-4c3f-afbb-d1f4acba771d.png">

You can confirm the validity of your JWT token by visiting https://jwt.io/ and pasting the passport JWT token to examine its contents.

11. Take this passport token to DRS server to obtain access to DRS objects - .ipynb notebook



### 13. Stop and Remove all docker containers, networks, volumes, and images created in this session
Ensure you are in the working directory for Starter Kits Part 2 before running `docker-compose down`

```
cd Get-Started-with-GA4GH-APIs/starterkits/part_2_dataconnect_passports
```
```
docker-compose down
```
