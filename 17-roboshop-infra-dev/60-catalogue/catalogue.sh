#!/bin/bash
component=$1
dnf install ansible -y 
ansible-pull -U https://github.com/surekhareddybana/ansible-roles.git -e component=$1 main.yaml -e app_version=1.0.0