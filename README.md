# terraform-aws-vpc-ec2-alb-asg-highly-scalable-network-project #]

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
* 2 security groups (allow-ssh) will be created - one the for public ec2 & the other one for the private ec2
* the private ec2 is located in the private subnet and has a private route table linked the a NAT gateway inside  
  the public subnet which then route the traffic to the public route table for outbound traffic 
  
```
## Project 2 ##
![alt text](https://github.com/olivierots/terraform-aws-vpc-project/blob/master/loadalancing_autoScaling_project/LoadBalancer%20AutoScaling%20Project%20Architecture.jpeg)
```
 * in this project application load balancers & two availability zones were introduced 
 * The user will connect via both ssh & http 
 * I'm hosting two ec2 instances in each zones, one is public & the other one is private 
 * 4 subnets, two in each regions, one is public & the other one is private for front end & back end purposes
 * for redundancy puprpses, if one availability zone goes down, the users can still acess the app through a 
   different availability zone 
*  the application load balancers are placed in front of the public ec2 to distrubulte traffic evenly and scale 
   accordingly in case of a massive surge in load   
*  the loab balancers willa also perform healthchecks constantly 
*  2 security groups will be created - one the for ssh & the other one for http
*  the public ec2 will be provisionned with an apache web server, then echo their hostname using aws user-data
```


