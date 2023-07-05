Slides: https://docs.google.com/presentation/d/1vaDbFvemBZ6HLxR9qF0-WmX2cxfkIcSOE9PsKWCvbSU/edit?usp=sharing

# Environment Set up and Check

## 1. SSH into the VM
To SSH into the VM, use the following command:
```
ssh {user_name}@{Public IP of your VM}
```
If prompted with `Are you sure you want to continue connecting?`, answer `yes`.
When asked for the password, enter the password associated with your SSH user.

After a successful login, run the following command to print the current working directory:
```
pwd
```
It should return `/home/{user_name}`

## 2. Python
Check the installed Python version by running the following command:
```
python3 --version
```
Make sure the version is 3.x.

## 3. sqlite3
Check the installed sqlite3 version by running the following command:
```
sqlite3 --version
```
Make sure it returns the installed sqlite3 version.

e.g. `3.37.2 2022-01-06 13:25:41 872ba256cbf61d9290b571c0e6d82a20c224ca3ad82971edc46b29818d5dalt1`

## 4. Docker
Check if Docker is properly installed by running the following command:
```
docker run hello-world
```
This will attempt find a local `hello-world` docker image. If the image doesn't exist, it will pull an image from `library/hello-world`.
If docker is running correctly, we should see a message that starts with "Hello from Docker!"

## 5. Download Docker images
Download the required Docker images by running the following command:
```
docker pull ga4gh/ga4gh-starter-kit-utils:0.1.2 &\
docker pull ga4gh/ga4gh-starter-kit-drs:0.3.1 &\
docker pull ga4gh/ga4gh-starter-kit-wes:0.3.2-nextflow &\
docker pull ga4gh/ga4gh-starter-kit-data-connect:0.1.1 &\
docker pull oryd/kratos:v0.9.0-alpha.2 &\
docker pull ga4gh/ga4gh-starter-kit-passport-ui-node:0.0.2 &\
docker pull oryd/mailslurper:latest-smtps &\
docker pull ga4gh/ga4gh-starter-kit-passport-broker:0.0.2
```
We will initially see 7 PID listed in the command line. Afterwards, the docker image pulling processes begin.
Once all the progress bars stop moving, hit `Enter` once to ensure that all `docker pull` commands status are `Done`.


## 6. Check if all the Docker images are successfully downloaded
Run the following command to list all the downloaded Docker images:
```
docker image ls
```

## 7. Clone the GitHub repository for the Starter Kit tutorial
Clone the `elwazi` branch of the `ga4gh/Get-Started-with-GA4GH-APIs` repository using the following command:
```
git clone -b elwazi https://github.com/ga4gh/Get-Started-with-GA4GH-APIs.git
```
```
cd Get-Started-with-GA4GH-APIs
```

Make sure you are on the "elwazi" branch. Running the below command should return `elwazi`
```
git branch
```
Make sure you have the latest code by running the following command:
```
git pull
```
Install the requirements
```
pip3 install -r starterkit-requirements.txt
```

## 8. Jupyter Notebook
Ensure you can access and log in to Jupyter Notebook from your local machine. Use a browser to go to the following URL:
http://{Public IP of your VM}:8080/
Login using your Jupyter Notebook password, and you should see the `Get-Started-with-GA4GH-APIs` repository listed there.
