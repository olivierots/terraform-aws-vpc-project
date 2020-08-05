# terraform-aws-vpc-ec2-alb-asg-highly-scalable-network--micro-service-project #

Throughout my terraform learning journey, i've provisioned & deployed so many different aws resources as per the code inside this repo,
however the below projects are probably the highlight and most complex ones.

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
## Project 2 architecture & overview ##
![alt text](https://github.com/olivierots/terraform-aws-vpc-project/blob/master/loadalancing_autoScaling_project/LoadBalancer%20AutoScaling%20Project%20Architecture.jpeg)
```
 * in this project application load balancers & two availability zones were introduced 
 * The user will connect via both ssh & http 
 * I'm hosting two ec2 instances in each zones, one is public & the other one is private 
 * 4 subnets, two in each regions, one is public & the other one is private for front end & back end purposes
 * for redundancy puprpses, if one availability zone goes down, the users can still acess the app through a 
   different availability zone 
*  the application load balancers are placed in front of the public ec2 to distribute traffic evenly and scale 
   accordingly in case of a massive surge in load   
*  the loab balancers will also perform healthchecks constantly 
*  2 security groups will be created - one the for ssh & the other one for http
*  the public ec2 will be provisionned with an apache web server, then echo their hostname using aws user-data
```

terraform notes & stuffs i've learnt throughout my terraform learning journey
```
1. steps to install terraform on Linux ==> link to the downloads for different Terraform Versions
   https://releases.hashicorp.com/terraform/ 
   sudo yum install unzip
   wget https://releases.hashicorp.com/terraform/0.12.27/terraform_0.12.27_linux_amd64.zip
   unzip terraform_0.12.27_linux_amd64.zip    
   sudo mv terraform /usr/local/bin/ ==> move the executable into a directory searched for executables
                                         so you can execute terraform anywhere on your machine 
      
2. what is terraform ?
   It's used for Infrastructure as code, its a multi-platform tool used to deploy an infrastructure accros many cloud
   providers such as aws, GCP & Azure. instead of going into the aws portal on aws and clicking different things to
   create a network we can simply write a code to manage, provision the tech stack for your application.
   Dev & Ops teams manage & provision the tech stack for an app through software, rather than using a manual process to
   configure HW devices & OS.
   
3. useful terraform commands  
   terraform --version ==> see currently installed terraform version
   terrafrom: start terraform & check whether its running
   terraform init: this initializes terraform in your current directory, download the plugins/modules & create a .terrafrom
                   directory. It’s the first command you need to execute
   terraform plan: This outputs the migration plan and is particularly useful for letting someone else validate the change
                   or to verify that there are no unwanted changes.
   terraform apply: Terraform applies a migration plan. (terraform apply --auto-approve can also be used to avoid be prompted
                    for a confirmation evrytime)
   terraform state list or show:  inspect Terraform state or plan
   terraform destroy: delete your infrastructure
   terraform validate: The validate command is used to validate/check the syntax of the Terraform files
   terraform workspace new <name>: create a new workspace
   terraform workspace select <name>: Select a Workspace
   terraform workspace list: list Workspaces
   terraform workspace show: show current Workspace
   terraform console: useful for testing interpolations before using them in configurations
   
4. other terraform important elements:
   state file: keep track of everything we've created & shouldnt be deleted when working on a project. There are two types
   of state files: remote or local.
   workspaces: To manage multiple distinct sets of infrastructure resources/environments. Instead of creating a directory
   for each environment to manage, we need to just create needed workspace.
   providers: this is where you configure your access keys for aws authentication 
   Variables: Variables can be defined by the Terraform files and provided when executing a command.They give more flexibility
              to our configurations and let us deploy the same elements in different zones or with different sizes depending on
              variable value.
  Resources:  Resources are elements you manage from Terraform, which can be an compute engine instance, a DNS record, a firewall
              rule, an external IP address for cloud providers, or even a table or a database.   
  outputs: we basically get the output of an attribute from our terraform infra that we've provisiooned
           say you're creating an s3 bucket or a vpc_id , instead of going back to the aws UI or look in the codeto find it, the
           code can output it for you.
  Modules:  this is basically a folder within a folder. its like a container for multiple resources that are used together. Every
            Terraform configuration has at least one module, known as its root module, which consists of the resources defined in
            the .tf files in the main working directory. Any module should include, at minimum, a main.tf , a variables.tf , and 
            an outputs.tf file
              
```
