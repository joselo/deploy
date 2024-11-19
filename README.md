# Local deployment example

This repo is an example about create a multipass machine with terraform and provide the software with ansible:

Ping to the galactus machine:

    ansible -i hosts.yml galactus -m ping


# Ansible gallery

    ansible-galaxy collection install community.crypto
