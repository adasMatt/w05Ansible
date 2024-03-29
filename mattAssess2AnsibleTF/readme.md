# Assessment Walkthrough 
## Terraform IaC with main.tf and providers.tf files
main.tf includes 2 SGs, one for master node including ssh permissions and one for target nodes including http permissions.

## ssh into master node
* update apt and install ansible
    - Create env
    - Create ansible playbooks and run `ansible-playbook -i inventory.ini <insert-relevant-playbook>.yml` to push instructions to target nodes
        - Create and run updates.yml
        - Create and run packages.yml to install python, pip, nginx 
        - Create and run code.yml to clone github project and install listed requirements 
        - Create and run copyenv.yml to setup db in target nodes 
        - Create todolist.service, create and run gunicorn.yml to setup and start gunicorn daemon service
            - Service files can change and daemon needs to be restarted, handler part in gunicorn.yml playbook automates restarting daemon 
    - nginx, separately on each node
        - Create todolist file in target nodes and find public_ip
* AWS console for load balancer
    - Target groups: include target nodes port 9876, fix health check rules
    - Load balancer: listener on port 80 w/default action to forward to target group, use same security group as ec2 instances within the target group, all mappings for AZs even though in this example project the ec2 instances are all in 1b
![target nodes port 9876](https://github.com/adasMatt/w05Ansible/blob/master/images/loadBalancerTGs.jpg "Target nodes port 9876")  

<!--- ![rules for health check](https://github.com/adasMatt/w05Ansible/blob/master/images/changePortForHealthCheckStillDoesntWorkTho.jpg "rules for health check") --->

## Architecture
![Architecture behind deployment of To Do App](https://github.com/adasMatt/w05Ansible/blob/master/images/toDoAppTFAnsibleArch.jpg "To do app ")

## To Do
* Add load balancer to terraform code  
* Create new branch and add nginx
* Fix ALB TG health check errors

## Health Check Failures Still
![health check failure](https://github.com/adasMatt/w05Ansible/blob/master/images/healthChecksTGFailure404.jpg "health check failure")  
