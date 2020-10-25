## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/jennjimenez/cybersecurity-project/blob/main/diagrams/Copy%20of%20Virtual%20Network%20ELKS.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Playbook file may be used to install only certain pieces of it, such as Filebeat.

  - ![ Filebeat Playbook](https://github.com/jennjimenez/cybersecurity-project/blob/main/ansible/filebeat-playbook.yml)
  - ![Metricbeat Playbook](https://github.com/jennjimenez/cybersecurity-project/blob/main/ansible/metricbeat-playbook.yml)
  - ![Install Elk Playbook](https://github.com/jennjimenez/cybersecurity-project/blob/main/ansible/install-elk.yml)
  
  This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available and reliable, in addition to restricting unwanted access to the network.

A load balancer secures the website from emerging threats, and it reduces the load on the web servers and efficiently manages traffic. The advantage of a Jump Box is that it provides controlled access between security zones.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.

Filebeat monitors the log files or locations specified, collects log events and forwards them to Elasticsearch and Kibana. Metricbeat records metrics from the operating system and from services running on the server. The metrics and statistics collected by Metricbeat output to Elasticsearch and Kibana

The configuration details of each machine may be found below.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box |Gateway   | 10.0.0.7   | Linux            |
| Web 1    |Server    | 10.0.0.5   | Linux            |
| Web 2    |Server    | 10.0.0.6   | Linux            |
| Web 3    |Server    | 10.0.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Load Balancer machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Only personal IP address is allowed.

Machines within the network can only be accessed by the Jump Box.
-Jump Box Machine public IP address 

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 10.0.0.5 10.0.0.6 10.0.0.4|
      
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because __________

The playbook implements the following tasks:
  - Installs docker io
  - Installs Python
  - Installs docker container called Elk

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps output](https://github.com/jennjimenez/cybersecurity-project/blob/main/ansible/docker%20ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
Web1:  10.0.0.5
Web2:  10.0.0.6
Web-3: 10.0.0.4

We have installed the following Beats on these machines:
Metricbeat and Filebeat

These Beats allow us to collect the following information from each machine:
-Filebeat collects log data about the the file system.
-Metricbeat collects metrics and statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the metricbeat.config file /etc/ansible/roles.
- Update the config file to include the private IP address of the Elk VM
- Run the playbook, and navigate to http://[ELK.VM.IP]:5601/app/kibana to check that the installation worked as expected.

