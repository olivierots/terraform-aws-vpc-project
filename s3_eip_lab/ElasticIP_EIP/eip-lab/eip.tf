 resource "aws_eip" "my_first_eip" {
  instance = "${aws_instance.my_ec2_instance_from_terraform.id}"
  vpc      = true
}

output "my_eip_address" {
  value = "${aws_eip.my_first_eip.public_ip}"
}
