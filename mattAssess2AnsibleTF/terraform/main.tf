# master and target nodes
# 22 for master node
# 80 and other applicable for target nodes

resource "aws_instance" "matt-master-server" {
  # ubuntu master server
  ami           = "ami-0ec7f9846da6b0f61"
  instance_type = "t2.micro"
  key_name      = "actual-first-key"

  vpc_security_group_ids = [aws_security_group.master_sg_ssh_only.id]
  tags = {
    Name = "masterBby",
   
  }
}

resource "aws_instance" "matt-node-servers" {
  # ubuntu nodes server
  ami           = "ami-0ec7f9846da6b0f61"
  instance_type = "t2.micro"
  key_name      = "actual-first-key"

  vpc_security_group_ids = [aws_security_group.target_nodes_sg_ssh_http.id]

  count = 2
  
  tags = {
    Name = "targetBby${count.index}",
    
  }
}

resource "aws_security_group" "master_sg_ssh_only" {
  name        = "allow_ssh_only"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH from public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "target_nodes_sg_ssh_http" {
  name        = "allow_http_ssh"
  description = "Allow HTTP and SSH inbound traffic"

  ingress {
    description = "9876 from public"
    from_port   = 9876
    to_port     = 9876
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from public"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from public"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
