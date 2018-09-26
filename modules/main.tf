variable "instance_type" {}
variable "ami" {}

resource "aws_instance" "ubuntu-1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
}

output "public_ip" {
  value = "${aws_instance.ubuntu-1.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.ubuntu-1.public_dns}"
}
