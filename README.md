# AWS_Infra_TerraForm
🚀 Complete AWS Infrastructure with NGINX Proxy Using Terraform 🚀

In this project, I’ll guide you through deploying an entire AWS infrastructure using Terraform. We’ll build a robust VPC, deploy EC2 instances across public and private subnets, and set up NGINX proxies using Network Load Balancers (NLB) and Application Load Balancers (ALB). Our infrastructure will also include state locking using S3 and DynamoDB to ensure safe, concurrent changes.

🛠️ Project Overview

We will create:

 VPC: A Virtual Private Cloud with a 10.0.0.0/16 CIDR block.
 
 AZs: Two availability zones (AZs) to distribute resources.
 
 Subnets: Public and private subnets across AZs:

    Public Subnets: 10.0.0.0/24 and 10.0.2.0/24
   
    Private Subnets: 10.0.1.0/24 and 10.0.3.0/24
        
 EC2 Instances: Four EC2 instances:
 
   2 in public subnets with NGINX configured as a reverse proxy.
   
   2 in private subnets with HTTP services running.
       
 Load Balancers:
 
   Network Load Balancer (NLB) for the public instances.
   
   Application Load Balancer (ALB) for the private instances.
        
 Provisioning:
 
   Public instances will have NGINX installed via file and remote-exec provisioners.
   
   Private instances will have HTTP installed using user-data.
        
 State Locking: Leverage S3 and DynamoDB for state locking to ensure safe collaboration and version control.

We are working in another workspace named "dev" instead of the "default" workspace:
![Screenshot 2024-09-25 024054](https://github.com/user-attachments/assets/70ea988a-135f-464d-9f79-d0e2e5ee304f)

The Proxy server configuration:
![image](https://github.com/user-attachments/assets/c7ef6058-6959-4477-987d-74419fd4273b)

To make sure the alb_dns is passed as a variable :
 ```
provisioner "file" {
    content     = templatefile("./modules/instances/provisioner.sh", { alb_dns_name = var.alb_dns_name })#"./modules/instances/provisioner.sh "
    destination = "/tmp/provisioner.sh"
  }
```
The alb_dns:
![Screenshot 2024-09-25 024536](https://github.com/user-attachments/assets/896176a4-64c1-4b68-b919-81784129bfb1)

The redirection:
![image](https://github.com/user-attachments/assets/ad011146-be40-4535-b211-c978e7381e11)

The state lock:
![Screenshot 2024-09-25 005013](https://github.com/user-attachments/assets/084389ea-60fc-4374-9417-7725d6c0e913)




