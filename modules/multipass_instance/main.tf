terraform {
  required_providers {
    multipass = {
      source  = "larstobi/multipass"
      version = "~> 1.4.2"
    }
  }
}

resource "multipass_instance" "instance" {
  name   = var.name
  cpus   = var.cpus
  image  = var.image
}

resource "null_resource" "get_ip" {
  depends_on = [multipass_instance.instance]

  provisioner "local-exec" {
    command = "multipass info ${var.name} | grep 'IPv4' | awk '{print $2}'"
  }
}
