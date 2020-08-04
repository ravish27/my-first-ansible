#!/bin/bash
#
# author: Gary A. Stafford
# site: https://programmaticponderings.com
# license: MIT License
# purpose: Create GCP VM instance and associated resources
# usage: sh ./part1_create_vm.sh

# Constants - CHANGE ME!
readonly PROJECT='devops-training-281306'
readonly SERVICE_ACCOUNT='demo-gcp-gce-ansible@devops-training-281306.iam.gserviceaccount.com'
readonly ZONE='us-central1-a'

time gcloud config set account demo-gcp-gce-ansible@devops-training-281306.iam.gserviceaccount.com
time gcloud auth activate-service-account demo-gcp-gce-ansible@devops-training-281306.iam.gserviceaccount.com --key-file /home/rsehgal/devops-training-281306-a5aae0650847.json

time gcloud compute instances create web-ravish27-devops \
--project=$PROJECT \
--zone=$ZONE \
--machine-type n1-standard-1 \
--network default \
--subnet default \
--network-tier STANDARD \
--service-account=$SERVICE_ACCOUNT \
--tags apache-http-server \
--image-family=ubuntu-1604-lts \
--boot-disk-size 10GB \
--image-family=ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--metadata-from-file startup-script=../gcp-create/files/startup.sh \
#--image=ubuntu-1604-xenial-v20200729 \

gcloud compute instances add-tags web-ravish27-devops --tags http-server,https-server --zone $ZONE --project $PROJECT
 
# Create GCE VM with disk storage
#time gcloud compute instances create web-1 \
#  --project $PROJECT \
#  --zone $ZONE \
#  --machine-type n1-standard-1 \
#  --network default \
 # --subnet default \
 # --network-tier STANDARD \
 # --service-account $SERVICE_ACCOUNT \
 # --tags apache-http-server \
#  --image-family ubuntu-1604-lts	\
 # --boot-disk-size 10GB 
 
#time gcloud compute firewall-rules update default-allow-http --allow tcp:80
#time gcloud compute firewall-rules update default-allow-https --allow tcp:443
 
 #time gcloud compute firewall-rules create default-allow-http-https \
#--project $PROJECT \
#--description 'Allow http / https from anywhere' \
#--direction INGRESS \
#--priority 1000 \
#--network default \
#--action ALLOW \
#--rules tcp:80 \
#--source-ranges 0.0.0.0/0 \
#--allow tcp:80,443
#--target-tags cont-http

# Create firewall rule to allow ingress traffic from port 80
#time gcloud compute firewall-rules create default-allow-cont-http \
#--project $PROJECT \
#--description 'Allow http from anywhere' \
#--direction INGRESS \
#--priority 1000 \
#--network default \
#--action ALLOW \
#--rules tcp:80 \
#--source-ranges 0.0.0.0/0 \
#--target-tags cont-http

#time gcloud compute firewall-rules create default-allow-docker-tcp \
#--project $PROJECT \
#--description 'Allow tcp from anywhere' \
#--direction INGRESS \
#--priority 1000 \
#--network default \
#--action ALLOW \
#--rules tcp:2375 \
#--source-ranges 0.0.0.0/0 \
#--target-tags docker-tcp
