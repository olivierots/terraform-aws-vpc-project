resource "aws_instance" "my_ec2_instance_from_terraform" {
  ami = "ami-0d8e27447ec2c8410"
  instance_type = "t2.micro"
  tags = {
      Name = "prod_ec2"
  }
  key_name = "terraform_key_pair"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi there , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

