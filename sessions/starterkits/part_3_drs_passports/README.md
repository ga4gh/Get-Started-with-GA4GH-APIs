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

Deploy Data Connect and Passport Starter Kits using docker-compose

```
docker-compose up -d
```
***
#### Potential Error: If a port is already in use...

You might see an error like this:
```
ERROR: for 5_drs_1 Cannot start service drs: Ports are not available: listen tcp 0.0.0.0:5000: bind: address already in use
```
In this case you can check which service is using that specific port:
```
sudo lsof -i :<port>
```
You can also kill the process that is using the port (You can find the PID of the process by running the command above). 
Make sure to not kill a vital process!
```
kill -9 <PID>
```
***
### 2. Check if the docker containers are running

List all the running docker containers 

```
docker ps
```
You can also get this information from the docker desktop application. Check the list of running docker containers in the **part_2_dataconnect_passports** stack 

<img width="1009" alt="docker-desktop-list-containers" src="https://user-images.githubusercontent.com/89084962/175333953-976e5406-8202-4590-a266-66077ea66ef6.png">

### 3. Load 1000 genomes data into Data Connect

The Data Connect Starter Kit comes loaded with two default datasets - phenopackets v1 dataset and 200 genome samples from the 1000 genomes sample dataset.

### 4. Explore Data Connect endpoints

Find the detailed GA4GH Data Connect Specification [here](https://github.com/ga4gh-discovery/data-connect).

#### i. GET service-info

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/service-info
> ```

#### ii. GET tables list

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/tables
> ```

#### iii. GET table info for a specific table

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/table/one_thousand_genomes_sample/info
> ```

#### iv. GET table data for a specific table

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/table/one_thousand_genomes_sample/data
> ```

#### v. Search for data satisfying specific conditions

##### Search for samples with population_code = "PUR" and sex = "female"

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:4800/search
> ```
> **REQUEST HEADER:**
> ```
> content-type:application/json
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "query": "select sample_name , sex , population_code , population_name from one_thousand_genomes_sample where population_code=?;",
>   "parameters": [ "PUR" ]
> }
> ```

#### v. Practice - Can you formulate a query to retrieve the `cram_drs_uri` and `crai_drs_uri` fields from one_thousand_genomes_sample table where population_code="PUR" and sex="female"?

#### vi. Convert DRS Object URI to HTTP URL

drs://{host}/{id} -> http(s)://{host}/ga4gh/drs/v1/objects/{id}

```
drs://localhost:5000/28ffe6386b78fffb7cd0a7b2d0a79846 ->

http://localhost:5000/ga4gh/drs/v1/objects/28ffe6386b78fffb7cd0a7b2d0a79846
```

### 5. Add the broker and visa information to the DRS server and load 1000 genomes data into DRS

```
python3 resources/drs/db-scripts/add-known-visas-to-drs.py
```

```
python3 resources/drs/db-scripts/populate-drs.py
```

### 6. Attempt to access DRS Object from Step 4 (vi)

#### i. Get DRS Object
Since, DRS data in this Part 2 of the tutorial is access controlled using Passports, when we try to request the DRS object, we receive an "Unauthorized" error

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/28ffe6386b78fffb7cd0a7b2d0a79846
> ```

> **ERROR RESPONSE:**
> ```
> {
> "timestamp": "2022-06-08T21:53:08Z",
> "status_code": 401,
> "error": "Unauthorized",
> "msg": "Request for controlled data is missing user passport(s)"
> }
> ```

#### ii. Get the passport broker and visa details from the DRS server for the specified DRS object id

> **HTTP METHOD:**
> ```
> OPTIONS
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/28ffe6386b78fffb7cd0a7b2d0a79846
> ```

#### iii. Get the passport broker and visa details from the DRS server for an array of DRS object ids

> **HTTP METHOD:**
> ```
> OPTIONS
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {"selection": ["28ffe6386b78fffb7cd0a7b2d0a79846", "0045077ccfaa91681480e96d7e7e7809"]}
> ```

### 7. Create visas on the passport broker

Find the detailed GA4GH Passports Specification [here](https://github.com/ga4gh-duri/ga4gh-duri.github.io/blob/master/researcher_ids/ga4gh_passport_v1.md).

#### i. Confirm the Passport Broker is working

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4500/ga4gh/passport/v1/service-info
> ```

#### ii. Create Visas

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:4501/admin/ga4gh/passport/v1/visas
> ```
> **REQUEST HEADER:**
> ```
> Content-Type:application/json
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "id": "b62249d0-d71d-42d2-9a67-55003fdae8ec",
>   "visaName": "1000GenomesIndividualsWithAmericanAncestry",
>   "visaIssuer": "https://federatedgenomics.org/",
>   "visaDescription": "Controls access to genomic data obtained from individuals with American ancestry",
>   "visaSecret": "BF9CAB5D5157C5C21EBDEE6C91D91"
> }
> ```

Repeat the process for all the other visas (one-by-one):

> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "id": "3af0e101-cd51-4fe4-aa8c-29a69be48fe0",
>   "visaName": "1000GenomesIndividualsWithEuropeanAncestry",
>   "visaIssuer": "https://federatedgenomics.org/",
>   "visaDescription": "Controls access to genomic data obtained from individuals with European ancestry",
>   "visaSecret": "47B42DF32976DFDBD6EC4D9ED2593"
> }
> ```

> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "id": "e38f656e-3146-4b06-92f2-6edea44f0cd1",
>   "visaName": "1000GenomesIndividualsWithAfricanAncestry",
>   "visaIssuer": "https://federatedgenomics.org/",
>   "visaDescription": "Controls access to genomic data obtained from individuals with African ancestry",
>   "visaSecret": "582A164E2C5DA377F3E3F76158CE6"
> }
> ```

> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "id": "6ecaef9e-d6bb-4d96-9aed-ca517ceed8a1",
>   "visaName": "1000GenomesIndividualsWithEastAsianAncestry",
>   "visaIssuer": "https://federatedgenomics.org/",
>   "visaDescription": "Controls access to genomic data obtained from individuals with East Asian ancestry",
>   "visaSecret": "29CD6DFBB2684BAEACED3B1C6A7F4"
> }
> ```

> **REQUEST BODY (raw, JSON):**
> ```
> {
>   "id": "55cb5d06-bbf3-428b-a822-3565557518ba",
>   "visaName": "1000GenomesIndividualsWithSouthAsianAncestry",
>   "visaIssuer": "https://federatedgenomics.org/",
>   "visaDescription": "Controls access to genomic data obtained from individuals with South Asian ancestry",
>   "visaSecret": "9474C832599DC95F949DB3CAE443E"
> }
> ```

### 8. Register a new user account with the passport broker

Visit the [welcome page](http://127.0.0.1:4455/welcome)
***
#### Potential Error: "127.0.0.1 redirected you too many times..."

The front-end service requires cookies to work as expected. 
1. Please make sure cookies are enabled in your browser of choice. Once enabled, reload the page. If the error still persists, close and re-open your browser.
2. If you are still unable to load the page, try clearing cookies and cache in your browser.

***
Towards the bottom, under Account Management press [Sign Up](http://127.0.0.1:4455/registration) to create an account.

After signing up, you should see your account information on the welcome page, under User Information. Note down the **user-id**
<img width="1009" alt="passport-broker-user-id" src="https://user-images.githubusercontent.com/89084962/175366273-f053ca18-583b-444d-b8c2-d9923b6cedf6.png">

Once the sign-up is complete, a user in the passport broker service will also be created. Confirm the new user is created:

> **HTTP METHOD:**
> ```
> GET
> ```
> **REQUEST URL:**
> ```
> http://localhost:4501/admin/ga4gh/passport/v1/users
> ```

You should see your account's ID in the array of user IDs.

### 9. Grant visas to the newly created user

> **HTTP METHOD:**
> ```
> PUT
> ```
> **REQUEST URL:**
> ```
> http://localhost:4501/admin/ga4gh/passport/v1/users/<USER_ID>
> ```
> **REQUEST HEADER:**
> ```
> Content-Type:application/json
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>     "id": "<USER_ID>",
>     "passportVisaAssertions": [
>         {
>             "status": "active",
>             "passportVisa": {
>                 "id": "b62249d0-d71d-42d2-9a67-55003fdae8ec",
>                 "visaName": "1000GenomesIndividualsWithAmericanAncestry",
>                 "visaIssuer": "https://federatedgenomics.org/",
>                 "visaDescription": "Controls access to genomic data obtained from individuals with American ancestry",
>                 "visaSecret": "BF9CAB5D5157C5C21EBDEE6C91D91"
>             }
>         },
>         {
>             "status": "active",
>             "passportVisa": {
>                 "id": "6ecaef9e-d6bb-4d96-9aed-ca517ceed8a1",
>                 "visaName": "1000GenomesIndividualsWithEastAsianAncestry",
>                 "visaIssuer": "https://federatedgenomics.org/",
>                 "visaDescription": "Controls access to genomic data obtained from individuals with East Asian ancestry"
>             }
>         },
>         {
>             "status": "active",
>             "passportVisa": {
>                 "id": "3af0e101-cd51-4fe4-aa8c-29a69be48fe0",
>                 "visaName": "1000GenomesIndividualsWithEuropeanAncestry",
>                 "visaIssuer": "https://federatedgenomics.org/",
>                 "visaDescription": "Controls access to genomic data obtained from individuals with European ancestry",
>                 "visaSecret": "47B42DF32976DFDBD6EC4D9ED2593"
>             }
>         },
>         {
>             "status": "active",
>             "passportVisa": {
>                 "id": "e38f656e-3146-4b06-92f2-6edea44f0cd1",
>                 "visaName": "1000GenomesIndividualsWithAfricanAncestry",
>                 "visaIssuer": "https://federatedgenomics.org/",
>                 "visaDescription": "Controls access to genomic data obtained from individuals with African ancestry",
>                 "visaSecret": "582A164E2C5DA377F3E3F76158CE6"
>             }
>         },
>         {
>             "status": "active",
>             "passportVisa": {
>                 "id": "55cb5d06-bbf3-428b-a822-3565557518ba",
>                 "visaName": "1000GenomesIndividualsWithSouthAsianAncestry",
>                 "visaIssuer": "https://federatedgenomics.org/",
>                 "visaDescription": "Controls access to genomic data obtained from individuals with South Asian ancestry",
>                 "visaSecret": "9474C832599DC95F949DB3CAE443E"
>             }
>         }
>     ]
> }
> ```

### 10. Log back into the passport broker, select visas, and obtain the passport token

Back in the [welcome page](http://127.0.0.1:4455/welcome) press [Get Passport Token](http://127.0.0.1:4455/passport). On this page, you should see your assigned visas, check all of them and press Get Passport Token.
<img width="1009" alt="image" src="https://user-images.githubusercontent.com/89084962/175381003-f91f6160-6dd3-4c3f-afbb-d1f4acba771d.png">

You can confirm the validity of your JWT token by visiting https://jwt.io/ and pasting the passport JWT token to examine its contents.

### 11. Take this passport token to DRS server to obtain access to DRS objects

#### i. Request DRS object 

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/28ffe6386b78fffb7cd0a7b2d0a79846
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> { "passports": ["<passport token>"] } 
> ```

#### ii. Bulk request DRS objects

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> {
>     "selection":
>     [
>         "28ffe6386b78fffb7cd0a7b2d0a79846",
>         "0045077ccfaa91681480e96d7e7e7809"
>     ],
>     "passports":
>     [
>         "<passport token>"
>     ]
> }
> ```

### 12. Practice - Request DRS Object without the appropriate visa

Let's see what happens when the user uses a passport without the required visa to access a DRS Object.
Create a passport token without the required visa "SouthAsianAncestry" for the DRS Object "fc24456d15227c7c08bef8131cfaa872". Use this token to request the DRS object. You will get an error response from the DRS server

> **HTTP METHOD:**
> ```
> POST
> ```
> **REQUEST URL:**
> ```
> http://localhost:5000/ga4gh/drs/v1/objects/fc24456d15227c7c08bef8131cfaa872
> ```
> **REQUEST BODY (raw, JSON):**
> ```
> { "passports": ["<passport token>"] } 
> ```

> **ERROR RESPONSE:**
> ```
> {
>     "timestamp": "2022-06-23T19:31:22Z",
>     "status_code": 403,
>     "error": "Forbidden",
>     "msg": "No suitable visa found in user passport(s) for requested DRS object"
> }
> ```

### 13. Stop and Remove all docker containers, networks, volumes, and images created in this session
Ensure you are in the working directory for Starter Kits Part 2 before running `docker-compose down`

```
cd Get-Started-with-GA4GH-APIs/starterkits/part_2_dataconnect_passports
```
```
docker-compose down
```
