# ARCHIVED! NO LONGER NEEDED


## Ansible Lightbulb provisioner wrapper

This is meant to make provisioning the lab easier by having 1 script to provision, create a microsite hosted on node3 for student1 (the instructor) to serve student files, and install ansible tower for all students. The instances provisioned by default do not meet the minimum requirements for a tower install, so this upgrades the RHEL version and bypasses the memory total variable availanle to the playbook to meet the minimum requirements for the install while running on a smaller instance

1. Clone the original lightbulb repo
2. follow the setup steps for your keys, .awsconfig and extra_vars
3. clone the repo in your lghtbulb/tools/aws_lab_setup
4. run the provison_lab.sh and enter the number of students to provision the lab for
5. Distribute the IP of student01's node 3 to all students to open in a browser and get their inventory files and other useful links
6. when done, run teardown_lab.sh to destroy the environmnet and delete the files left behind by the provisioning 


