# This is for Code Platoon Alpha DevOps cohort '23.

## Assignment 
See final inventory files in mattAnsible/ directory.
What I did:
Launched 3 instances from AWS console, default VPC, same security group for all 3 allowing ssh and http, user data only updates yum. Code in terminal history pictured requires careful thought, lines have been deleted and may be presented out-of-order. 

Submit the written commands for following actions.
List all the hosts: ansible all --list-hosts -i inventory
List only the web servers: ansible webservers --list-hosts -i inventory
List only the db servers: ansible dbservers --list-hosts -i inventory

Other thoughts:
Log in as root to make changes in ansible.cfg but how? I don't think I set a password but it is not allowing root access.
Maybe a bit of a rabbit hole for the purpose of this assignment?: http://www.freekb.net/Article?id=2844 

### Setting up Ansible in master EC2
Here are the commands run on the master EC2 instance for the Ansible assignment.
![picture describing terminal code for setting up master EC2 instance with Ansible](https://github.com/adasMatt/w05Ansible/blob/master/images/mattAnsibleMasterEC2.jpg "Setup Ansible master server")

## Bonus
As a bonus, here is how to create a repo and push to GitHub all from a Linux terminal

![picture describing terminal code for creating and pushing locally created git repo to GitHub](https://github.com/adasMatt/w05Ansible/blob/master/images/ghRepoCreate.png "Create new git repo and push to GitHub from terminal")

And as another bonus, here's an example of inlcuding images in a readme.md

![inlcuding images in a readme.md](https://github.com/adasMatt/w05Ansible/blob/master/images/readmeMarkdownWithImages.png "Inlcuding images in a readme.md")
