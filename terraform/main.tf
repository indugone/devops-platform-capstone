
module "network" {
  source             = "./modules/network"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  availability_zone  = var.availability_zone
}

module "security" {
  source = "./modules/security"
  vpc_id = module.network.vpc_id
}

module "jenkins" {
  source            = "./modules/compute-jenkins"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.jenkins_sg
}

module "sonarqube" {
  source            = "./modules/compute-sonarqube"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.sonarqube_sg
}

module "nexus" {
  source            = "./modules/compute-nexus"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.nexus_sg
}

module "docker" {
  source            = "./modules/compute-docker"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.network.public_subnet_id
  security_group_id = module.security.docker_sg
}
