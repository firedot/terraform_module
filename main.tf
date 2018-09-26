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
  type    = "string"
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

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"

  subnet_id              = "subnet-f090b498"
  vpc_security_group_ids = ["sg-0104bd2e830bc7973"]

  tags {
    "Identity" = "test-web-srv"
    "Name"     = "test"
  }
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}

output "address_from_module" {
  value = "${module.my-module.public_ip}"
}

output "dns_from_module" {
  value = "${module.my-module.public_dns}"
}
