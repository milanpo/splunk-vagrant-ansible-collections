#!/bin/sh

# Don't check for known_host
export ANSIBLE_HOST_KEY_CHECKING=False
export VAGRANT_HOME=`pwd`

echo "****************** Verifying ping connection: ******************"

# Check ping connection
ansible all -m ping --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

# run playbooks
echo "****************** Running: clean.yml ******************"
ansible-playbook --private-key=insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory clean.yml

echo "****************** Done, hosts map: ******************"
cat hosts | grep -v localhost
echo "******************************************************"

exit 0
