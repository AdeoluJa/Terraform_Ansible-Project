# **3RD SEMESTER MINI-PROJECT**

## __TERRAFORM SCRIPT__
<li> Terraform is an IAC used to automate the infrastructure. Belows shows the terraform scripts written in different tf files for easy access. 

<br>

*See the screenshot below - general terraform file*
<br>
![Terraform1](./images/terra1.png)
![Terraform2](./images/terra2.png)
![Terraform3](./images/terra3.png)
![Terraform4](./images/terra4.png)
<br>
<br>

## __ANSIBLE SCRIPT__
<li> Ansible is an IAC used to automate the configuration of server and is a configuration management tool. Belows shows the general ansible script used to configure the EC2 instances.

<br>

*See the screenshot below*
<br>
![AnsilbeFile](./images/ansible.png)
<br>
<br>

## __OUTCOME OF TERRAFORM SCRIPT__
<br>

### __*VPC Created*__
<li> VPC created via terraform and its other associations.

<br>

*See the screenshot below*
<br>
![VPC](./images/VPC.png)
<br>
![Subnet](./images/Subnets.png)
<br>
![RouteTable](./images/RouteTable.png)
<br>
![InternetGateway](./images/IGW.png)
<br>
<br>

### __*Security Group Created*__
<li> Security groups for both the EC2 instances and load balancer was created via terraform.

<br>

*See the screenshot below*
<br>
![SecurityGroup](./images/SecurityGroup.png)
<br>
![SecurityGroupALB](./images/SecurityGroupALB.png)
<br>
<br>
<br>

### __*EC2 Instances Created*__
<li> Using count 3 EC2 instances where created and name tags where added for identification purposes. 

<br>

*See the screenshot below*
<br>
![EC2 Instance](./images/EC2.png)
<br>
<br>

### __*Load Balancer Created*__
<li> ALB was created by terraform and it displays the content of the EC2 instances and displays content available by the instances one at a time.

<br>

*See the screenshot below*
<br>
![LoadBalancer](./images/ALB.png)
<br>
![TargetGroup](./images/TargetGroup.png)
<br>
<br>

### __*Route 53 Created*__
<li> This was created with terraform and the content displayed by the ALB will be routed via route 53 to the domain name.

<br>

*See the screenshot below*
<br>
![HostedZone](./images/HostedZone.png)
<br>
<br>

## __OUTCOME OF ANSIBLE SCRIPT__
<br>

### __*Install Apache2*__
<li> Apache2 was installed on each of the 3 EC2 Instances.

<br>

### __*Set Timezone*__
<li> Timezone was updated Africa/Lagos.

<br>

### __*Simple HTML Page*__
<li> Content of the HTML page was echoed into the /var/www/html/index.html to show the hostname of each of the instances.

<br>
<br>

## __DOMAIN__
<br>

### __*ALB IN DOMAIN NAME - "terraform-test.adeoluja.live"*__

<br>

![Server1](./images/Server1.png)
![Server2](./images/Server2.png)
![Server3](./images/Server3.png)

<br>
<br>
