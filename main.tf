provider "multipass" {}

terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.4.2"
    }
  }
}

resource "multipass_instance" "galactus" {
  name   = "galactus"
  cpus   = 1
  image  = "jammy"
}

resource "null_resource" "get_ip" {
  depends_on = [multipass_instance.galactus]

  provisioner "local-exec" {
    command = "multipass info galactus | grep 'IPv4' | awk '{print $2}'"
  }
}

output "instance_ip" {
  value = null_resource.get_ip
}
