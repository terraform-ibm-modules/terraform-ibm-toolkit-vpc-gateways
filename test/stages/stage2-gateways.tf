module "gateways" {
  source = "./module"

  resource_group_id = module.resource_group.id
  region            = var.region
  vpc_name          = module.vpc.name
  subnet_count      = var.vpc_subnet_count
  enabled           = var.enabled
}

resource null_resource print_enabled {
  provisioner "local-exec" {
    command = "echo -n '${var.enabled}' > .enabled"
  }
}
