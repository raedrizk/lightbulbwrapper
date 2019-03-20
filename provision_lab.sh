#!/bin/bash

echo "How many students would you like to provision the lab for?"
read STUDENTS

echo "Who is the instructor?"
read INSTRUCTOR

 echo "users:" > users.yml &&
 for NUM in $(seq -f "%02g" 1 $STUDENTS); do
   echo "  - name: Student${NUM}" >> users.yml
   echo "    username: student${NUM}" >> users.yml
   echo "    email: instructor@acme.com" >> users.yml
   echo >> users.yml
 done

ansible-playbook provision_lab.yml -e @extra_vars.yml -e @users.yml

echo "" >> instructor_inventory.txt
echo "[tower]" >> instructor_inventory.txt 
grep 'student[0-9][0-9]-ansible' instructor_inventory.txt  >> temp.txt 
cat temp.txt >> instructor_inventory.txt
rm temp.txt

ansible-playbook -i instructor_inventory.txt prepare_workshop_site.yml -e student_count=$STUDENTS -e instructor_name="$INSTRUCTOR"

ansible-playbook -i instructor_inventory.txt install_tower.yml



