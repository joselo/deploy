provider "multipass" {}

terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.4.2"
    }
  }
}

# Commands

resource "null_resource" "get_ip" {
  depends_on = [multipass_instance.galactus]

  provisioner "local-exec" {
    command = "multipass info galactus | grep 'IPv4' | awk '{print $2}'"
  }
}

resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = "ssh-keygen -t rsa -b 2048 -f ${path.module}/keys/id_rsa -N ''"
  }
}

# Instances

resource "multipass_instance" "galactus" {
  name   = "galactus"
  cpus   = 1
  image  = "jammy"

  provisioner "local-exec" {
    command = "multipass transfer ${path.module}/keys/id_rsa.pub galactus:/home/ubuntu/.ssh/authorized_keys"
  }
}

# Outputs

output "instance_ip" {
  value = null_resource.get_ip
}

output "ssh_public_key" {
  value = "${path.module}/keys/id_rsa.pub"
}
