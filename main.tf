variable "access_key" {
  type = "string"
}

variable "secret_key" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "us-east-2"
}

variable "ami" {
  default = "ami-941a1ff1"
}

module "my-module" {
  #source can be any URL of file_path
  source        = "./my-module/"
  instance_type = "t2.micro"
  ami           = "${var.ami}"
}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}
output "address_from_module" {
  value = "${module.my-module.public_ip}"
}

output "dns_from_module" {
  value = "${module.my-module.public_dns}"
}
