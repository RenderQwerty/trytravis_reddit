#!/bin/bash

gcloud beta compute \
    --project=docker-123456 instances create gitlab-1 \
    --zone=europe-west4-a \
    --machine-type=n1-standard-1 \
    --subnet=default \
    --network-tier=PREMIUM \
    --maintenance-policy=MIGRATE \
    --service-account=1086246771173-compute@developer.gserviceaccount.com \
    --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
    --tags=gitlab,http-server,https-server \
    --image=docker-host-1534662058 \
    --image-project=docker-211515 \
    --boot-disk-size=100GB \
    --boot-disk-type=pd-standard \
    --boot-disk-device-name=gitlab-1

gcloud compute instances list
