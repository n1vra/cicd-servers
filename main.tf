provider "aws" {
}

#Jenkins Server
resource "aws_instance" "jenkinsserver" {
  ami                    = "ami-07fd6ce15690a8805"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.40.109"
  subnet_id              = "subnet-1f2b1e53"

  tags = {
    Name  = "Jenkins-Server"
    Owner = "Arv1nC"
  }
}

#Tomcat Server
resource "aws_instance" "tomcatserver" {
  ami                    = "ami-09275615588206bf0"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.39.105"
  subnet_id              = "subnet-1f2b1e53"

  tags = {
    Name  = "Tomcat-Server"
    Owner = "Arv1nC"
  }
}


#Docker Server
resource "aws_instance" "dockerserver" {
  ami                    = "ami-0cb2436f0fa9abc4f"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.27.137"
  subnet_id              = "subnet-c08548bd"
  user_data              = <<EOF
#!/bin/bash
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd reload
EOF

  tags = {
    Name  = "Docker-Server"
    Owner = "Arv1nC"
  }
}

#Ansible Server
resource "aws_instance" "ansibleserver" {
  ami                    = "ami-01fed288ad7718cee"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.16.183"
  subnet_id              = "subnet-c08548bd"
  user_data              = <<EOF
#!/bin/bash
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd reload
EOF

  tags = {
    Name  = "Ansible-Server"
    Owner = "Arv1nC"
  }
}
