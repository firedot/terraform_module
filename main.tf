variable "access_key" {
}

variable "secret_key" {
}

variable "region" {
  default = "us-east-2"
}

variable "ami" {
  default = "ami-941a1ff1"
}

variable "instance_type" {
default = "t2.micro"
}

module "ec2launcher" {
  #source can be any URL of file_path
  source        = "./modules/"
  instance_type = "${var.instance_type}"
  ami           = "${var.ami}"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
output "address_from_module" {
  value = "${module.ec2launcher.public_ip}"
}

output "dns_from_module" {
  value = "${module.ec2launcher.public_dns}"
}
