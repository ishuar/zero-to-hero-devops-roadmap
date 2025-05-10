- [Deploy a Highly Available and Scalable Web Application on Private Compute Instances](#deploy-a-highly-available-and-scalable-web-application-on-private-compute-instances)
  - [Project Problem Statement](#project-problem-statement)
  - [Requirements](#requirements)
  - [Suggested Cloud Services](#suggested-cloud-services)
    - [AWS Services](#aws-services)
    - [Azure Services](#azure-services)
    - [GCP Services](#gcp-services)
  - [Learning Focus](#learning-focus)

> [!Warning]
> The project could introduce some **costs** 💸 on your cloud account (AWS, Azure, or GCP). Please be cautious and **terminate/destroy** resources once you're done experimenting.

## Deploy a Highly Available and Scalable Web Application on Private Compute Instances

### Project Problem Statement

Design and deploy a **publicly accessible web application** using a **private virtual machine instance** running a web server (e.g., NGINX). The application should be resilient, scalable, and maintainable with the following requirements:

---

### Requirements

1. **Private Web Server Deployment**
   Deploy the web server on compute instances located in **private subnets**. These instances should not have direct internet access but must be able to update and install software.

2. **Public Access via Load Balancer**
   Ensure users can access the web application **publicly** using a **highly available entry point** (e.g., Load Balancer) that routes requests to private instances.

3. **High Availability & Fault Tolerance**
   Your application should remain available and continue functioning even if an instance or an entire availability zone/region becomes unavailable.

4. **Daily Backup Strategy**
   Implement a **24-hour backup window** to allow rollbacks in case of failure or misconfiguration.

5. **Load Distribution**
   Distribute incoming traffic evenly across multiple backend servers to optimize performance and reliability.

6. **Auto-Scaling Behavior**
   The backend servers should **scale out during peak hours** and **scale in during low-traffic periods** to optimize resource usage.

7. **Infrastructure as Code (Bonus)**
   Define your entire infrastructure using **Infrastructure as Code (IaC)** tools of your choice such as **CloudFormation (AWS)**, **Bicep or ARM Templates (Azure)**, or **Terraform**.

8. **Architecture Diagram (Optional)**
   Create an architecture diagram of your setup to visually explain how your components are connected and interact with each other.

---

### Suggested Cloud Services

#### AWS Services
* **Amazon EC2** – Host the web application
* **Amazon VPC** – Network Isolation with Private/public subnet configuration
* **Elastic Load Balancer (ALB)** – Public access point and load distribution
* **Auto Scaling Groups** – Scale backend instances automatically
* **AWS Backup** – Daily backup configuration
* **NAT Gateway** – Internet access for private instances
* **Security Groups** – Instance-level access control
* **CloudFormation / Terraform / AWS CDK** – Infrastructure as Code

#### Azure Services
* **Azure Virtual Machines (VMs)** – Host the web application
* **Azure Virtual Network (VNet)** – Network Isolation with Private/public subnet configuration
* **Azure Load Balancer / Application Gateway** – Load distribution
* **Virtual Machine Scale Sets (VMSS)** – Automatic scaling
* **Azure Backup** – Scheduled VM backups
* **NAT Gateway / Azure Bastion** – Internet access and secure management
* **Network Security Groups (NSGs)** – Access control
* **Bicep / ARM Templates / Terraform** – Infrastructure as Code

#### GCP Services
* **Google Compute Engine (VMs)** – Host the web application
* **VPC Network** – Network Isolation with Private/public subnet configuration
* **HTTP(S) Load Balancer** – Load distribution and global access
* **Managed Instance Groups (MIGs)** – Auto-scaling backend servers
* **Backup and DR / Snapshots** – Data protection and recovery
* **Cloud NAT** – Internet access for private VMs
* **Firewall Rules** – Traffic control
* **Deployment Manager / Terraform** – Infrastructure as Code

> [!Note]
> Feel free to explore other cloud services, add layers of automation, or expand this project creatively to suit real-world scenarios or advanced learning objectives.

---

### Learning Focus

1. Networking with private/public subnets and routing
2. Load balancing and traffic distribution
3. Compute instance provisioning and hardening
4. Auto-scaling and high availability design patterns
5. Backup planning and disaster recovery
6. Infrastructure automation and repeatable provisioning using IaC


> [!TIP]
> If you found this article helpful, please consider following me on GitHub 👉 and giving a star :star: to the repository for future updates.
---
