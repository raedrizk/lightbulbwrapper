#!/bin/sh

ansible-playbook teardown_lab.yml -e @extra_vars.yml -e @users.yml
rm users.yml
rm instructor_inventory.txt
rm student*-instances.txt 
