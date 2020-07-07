# terraform-aws-vpc-ec2-project #

## Project 1 architecture & overview ##
![alt text](https://github.com/olivierots/terraform-aws-vpc-project/blob/master/vpc_ec2_project/VPC%20EC2%20Project%20Architecture.jpg)
```
* we have a user trying to connect through ssh to a public ec2 using an IP address 
* I have a VPC located in the us-east-1 region with its own IP range 
* the VPC has one availability zone & two subnets (a private & public one) in that avalaibility zone
  with their own IP ranges
* we an ec2 inside the public subnet which acts like a front end app (customer facing )
* we have an internet gateway connected to the VPC
* we have a public route table which is linked to the public ec2 which then route traffic to the internet gateway
  to reach the internet 
* we aslo have a private ec2 instance that does not allow inbound traffic from the outside world (backend) but
  allow outbound traffic to the internet  
* the private ec2 is located in the private subnet and has a private route table linked the a NAT gateway inside  
  the public subnet which then route the traffic to the public route table for outbound traffic 
  
```
## Project 2 ##
![alt text](https://github.com/olivierots/terraform-aws-vpc-project/blob/master/loadalancing_autoScaling_project/LoadBalancer%20AutoScaling%20Project%20Architecture.jpeg)




