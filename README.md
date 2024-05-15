# Setup Virtual Environment

```python
conda create -n jenkins-env python=3.10 -y
conda activate jenkins-env
pip install -r requirements.txt
pip install .
```

# Test the FASTAPI

```json

{
  "Gender": "Male",
  "Married": "No",
  "Dependents": "2",
  "Education": "Graduate",
  "Self_Employed": "No",
  "ApplicantIncome": 5849,
  "CoapplicantIncome": 0,
  "LoanAmount": 1000,
  "Loan_Amount_Term": 1,
  "Credit_History": "1.0",
  "Property_Area": "Rural"
}


```

# Docker Commands
```
docker build -t loan_pred:v1 .
docker build -t harishkumarshivaramappa/cicd:latest . 
docker push harishkumarshivaramappa/cicd:latest

docker run -d -it --name modelv1 -p 8005:8005 harishkumarshivaramappa/cicd:latest bash

docker exec modelv1 python prediction_model/training_pipeline.py

docker exec modelv1 pytest -v --junitxml TestResults.xml --cache-clear

docker cp modelv1:/code/src/TestResults.xml .

docker exec -d -w /code modelv1 python main.py

docker exec -d -w /code modelv1 uvicorn main:app --proxy-headers --host 0.0.0.0 --port 8005


```

# Installation of Jenkins

```bash
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins

sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
```

`
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
`

```bash
#update the ubuntu package list 
sudo apt update && sudo apt upgrade -y
# add the docker package repository / install the common required packages 

sudo apt install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
# download the docker package 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# Add the oficial repository 
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#update the system 
sudo apt update
# install the docker CE on AWS Ec2 Ubuntu
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
#check the version of docker 
docker -v 
# check the status of the docker running 
systemctl status docker --no-pager -l

# provide the root user permission for the docker and the jenkins 
sudo usermod -a -G docker jenkins
sudo usermod -a -G docker $USER

newgrp docker
###### ! Reboot the ec2 instance 

# run the hello-world image in the docker 
docker run hello-world
```

# Admin password Jenkins

`sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

# Payload URL format in github repo webhook

`http://<public-ipv4 address>:8080/github-webhook/` #replace it with ur own public-ipv4 address

```


# Additional Improvements

docker remove $(docker ps -a -q)
docker images --format "{{.ID}} {{.CreatedAt}}" | sort -rk 2 | awk 'NR==1{print $1}'



# Create Stage Branch
`git checkout -b staging`
`git push `



