#!/bin/bash
# Description: script for generating json inventory for ansible
# Author: https://github.com/RenderQwerty


# Variable Section
tmpfile=/tmp/inst_list
#instance_count=0

#ARGS="$1"

#if [[ -z $ARGS ]]; then
#    echo "You need pass arguments to this script"
#    exit 1
#fi

# get list of all instances 
instances=$(gcloud compute instances list --filter="STATUS:RUNNING" --format="csv(NAME, EXTERNAL_IP)" | awk '{if (NR!=1) {print}}')
echo "$instances" > $tmpfile

# here we read out instance list from file and pass it to array. We need this to count number of instances
arr=( $(cat "$tmpfile") )
for i in "${arr[@]}"
do
  let "instance_count++"
  declare instance_$instance_count="$i"
  instance_index=instance_$instance_count

  echo "$instance_index - $i"
done


