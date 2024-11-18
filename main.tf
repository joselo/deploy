module "galactus" {
  source = "./modules/multipass_instance"
  name   = "galactus"
  cpus   = 1
  image  = "jammy"
}

module "glacius" {
  source = "./modules/multipass_instance"
  name   = "glacius"
  cpus   = 2
  image  = "jammy"
}

output "galactus_ip" {
  value = module.galactus.instance_ip
}

output "glasius_ip" {
  value = module.glacius.instance_ip
}
