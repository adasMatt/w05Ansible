# This is for Code Platoon Alpha DevOps cohort '23.

## Ansible and Terraform Assessment for CP Alpha DevOps 
See files for this project in the [mattAssess2AnsibleTF/](https://github.com/adasMatt/w05Ansible/tree/master/mattAssess2AnsibleTF) directory.
A brief summary:
- Used Terraform to launch EC2 instances with only ssh permission for master node, http & desired port forwarding (9876 for this project) permission for target nodes (see [terraform files](https://github.com/adasMatt/w05Ansible/tree/master/mattAssess2AnsibleTF/terraform) for more details)
- Create ansible playbooks within master node EC2 instance using ssh, push instructions to target nodes (including important instruction to clone application repo from GitHub)
- Install reverse proxy/webserver (nginx) on target nodes 
- Add load balancer through AWS console (could be automated with terraform as alternative method)

## Basic Inventory Files To Setup Master-Target Node Relation of EC2 Instances
See files for this project in the mattAnsible/ directory.

What I did:
Launched 3 EC2 instances from AWS console, default VPC, same security group for all 3 allowing ssh and http, user data only updates yum. Code in terminal history pictured requires careful thought, lines have been deleted and may be presented out-of-order. 

Written commands for various ansible group listings:
- List all the hosts: ansible all --list-hosts -i inventory
- List only the web servers: ansible webservers --list-hosts -i inventory
- List only the db servers: ansible dbservers --list-hosts -i inventory

Other thoughts:
Log in as root to make changes in ansible.cfg but how? I don't think I set a password but it is not allowing root access.
Maybe a bit of a rabbit hole for the purpose of this assignment?: http://www.freekb.net/Article?id=2844 

### Setting up Ansible in master EC2
Here are the commands run on the master EC2 instance for the Ansible assignment. Keep in mind lines have been deleted from history and are presented out-of-order:
![picture describing terminal code for setting up master EC2 instance with Ansible](https://github.com/adasMatt/w05Ansible/blob/master/images/mattAnsibleMasterEC2.jpg "Setup Ansible master server")

## Bonus
As a bonus, here is how to create a repo in your WSL2 Ubuntu and push to GitHub all from a Linux terminal. Before follow the steps pictured below, run `git init` in whichever directory you would like to make a repo out of and put onto GitHub. 

![picture describing terminal code for creating and pushing locally created git repo to GitHub](https://github.com/adasMatt/w05Ansible/blob/master/images/ghRepoCreate.png "Create new git repo and push to GitHub from terminal")

After following the prompts in this image, add, commit, and push files:
```
git init
git add .
git commit -m 'initial commit'
gh repo create
git push --set-upstream origin master
```

And as another bonus, here's an example of inlcuding images in a readme.md:

![inlcuding images in a readme.md](https://github.com/adasMatt/w05Ansible/blob/master/images/readmeMarkdownWithImages.png "Inlcuding images in a readme.md")

And here is an example of how to insert links into text:
```
Chandra's amazing [To do list application repo](https://github.com/chandradeoarya/todo-list) 
```
...will show as:
Chandra's amazing [To do list application repo](https://github.com/chandradeoarya/todo-list) 