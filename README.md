# Local deployment example

This repo is an example about create a multipass machine with terraform and provide the software with ansible:

Ping to the galactus machine:

    ansible -i hosts.yml galactus -m ping


# Ansible gallery

    ansible-galaxy collection install community.crypto


# Docker commands

Build a docker image

    docker tag blogx:latest galactus.test:8000/blogx:latest

Push the image to the registry

    docker push galactus.test:8000/blogx:latest
