- [Deploy a Highly Available and Scalable Web Application on Private EC2 Instances](#deploy-a-highly-available-and-scalable-web-application-on-private-ec2-instances)
  - [Project Problem Statement](#project-problem-statement)
  - [Requirements](#requirements)
  - [Suggested AWS Services](#suggested-aws-services)
  - [Learning Focus](#learning-focus)


> [!Warning]
> The project could introduce some **costs** 💸 on your AWS account. Please be cautious and **terminate/destroy** resources once you're done experimenting.

## Deploy a Highly Available and Scalable Web Application on Private EC2 Instances

### Project Problem Statement

Design and deploy a **publicly accessible web application** using a **private EC2 instance** running a web server (e.g., NGINX). The application should be resilient, scalable, and maintainable with the following requirements:

---

### Requirements

1. **Private Web Server Deployment**
   Deploy the web server on EC2 instances located in **private subnets**. These instances should not have direct internet access but must be able to update and install software.

2. **Public Access via Load Balancer**
   Ensure users can access the web application **publicly** using a **highly available entry point** (e.g., Load Balancer) that routes requests to private instances.

3. **High Availability & Fault Tolerance**
   Your application should remain available and continue functioning even if an instance or an entire Availability Zone becomes unavailable.

4. **Daily Backup Strategy**
   Implement a **24-hour backup window** to allow rollbacks in case of failure or misconfiguration.

5. **Load Distribution**
   Distribute incoming traffic evenly across multiple backend servers to optimize performance and reliability.

6. **Auto-Scaling Behavior**
   The backend servers should **scale out during peak hours** and **scale in during low-traffic periods** to optimize resource usage.

7. **Infrastructure as Code (Bonus)**
   Define your entire infrastructure using **Infrastructure as Code (IaC)** tools such as **CloudFormation, Terraform, or AWS CDK** for automation and repeatability.
9. **Architecture Diagram (Optional)**
    Create an architecture diagram of your setup to visually explain how your components are connected and interact with each other.

---

### Suggested AWS Services

* **Amazon EC2** – Host the web application
* **Amazon VPC** – Network isolation with public/private subnets
* **Elastic Load Balancer (ALB)** – Public access point and traffic distributor
* **Auto Scaling Groups** – Automatic server management and scaling
* **AWS Backup** – Scheduled daily backups
* **NAT Gateway** – Enable internet access for private instances
* **Security Groups** – Control access between components
* **CloudFormation / Terraform / AWS CDK** – Infrastructure as Code (choose one)

---

### Learning Focus

* Networking with VPC/Subnets
* Load balancing and auto scaling concepts
* Server hardening and security isolation
* Backup planning and recovery strategies
* Automation and repeatability using IaC


> [!Note]
> Feel free to explore other AWS services, add layers of automation, or expand this project creatively to suit real-world scenarios or advanced learning objectives.
