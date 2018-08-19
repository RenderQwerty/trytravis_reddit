#!/bin/bash

gcloud compute --project "docker-211515" instances create "gitlab-runner" \
    --zone "europe-west4-a" \
    --machine-type "f1-micro" \
    --tags "gitlab-runner" \
    --scopes "https://www.googleapis.com/auth/compute" \
    --image-family "docker-host" \
    --image-project "docker-211515" \
    --boot-disk-size "30" 
