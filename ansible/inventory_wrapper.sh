#!/bin/bash
# Description: this is shell wrapper around this project https://github.com/adammck/terraform-inventory
# It parsing output from tfstate file and generates ansible inventory in json format

# variable section
tf_dir=../terraform/stage
current_dir=$(pwd)
tf_inventory=$current_dir/bin/terraform-inventory
TF_STATE=$current_dir/terraform.tfstate

cd $tf_dir && terraform state pull  > $TF_STATE

if [[ "$1" == '--list' ]]; then
    $tf_inventory --list

elif [[ "$1" == '--host' ]]; then
    $tf_inventory --host $2
fi
