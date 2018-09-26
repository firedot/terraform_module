variable "instance_type" {}
variable "ami" {}
resource "aws_instance" "db" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
}

output "public_ip" {
  value = "${aws_instance.db.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.db.public_dns}"
}
