provider "aws" {
}

#Jenkins Server
resource "aws_instance" "jenkinsserver" {
  #  ami                    = "ami-07fd6ce15690a8805"
  ami                    = "ami-0500fd8e09bc4d758"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.40.109"
  subnet_id              = "subnet-1f2b1e53"
  user_data              = <<EOF
#!/bin/bash
echo "jenkins-server" > /etc/hostname
hostname "jenkins-server"
EOF

  tags = {
    Name  = "Jenkins-Server"
    Owner = "Arv1nC"
  }
}

#Tomcat Server
resource "aws_instance" "tomcatserver" {
  #  ami                    = "ami-09275615588206bf0"
  ami                    = "ami-0c3f30550916203ae"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.39.105"
  subnet_id              = "subnet-1f2b1e53"
  user_data              = <<EOF
#!/bin/bash
echo "tomcat-server" > /etc/hostname
hostname "tomcat-server"
EOF

  tags = {
    Name  = "Tomcat-Server"
    Owner = "Arv1nC"
  }
}


#Docker Server
resource "aws_instance" "dockerserver" {
  #  ami                    = "ami-0cb2436f0fa9abc4f"
  ami                    = "ami-01c7038273b52fbd3"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.27.137"
  subnet_id              = "subnet-c08548bd"
  user_data              = <<EOF
#!/bin/bash
echo "docker-server" > /etc/hostname
hostname "docker-server"
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
  #  ami                    = "ami-01fed288ad7718cee"
  ami                    = "ami-004c83b2404094e94"
  instance_type          = "t2.micro"
  key_name               = "Devops_Project"
  vpc_security_group_ids = ["sg-028057907e1c51131"]
  private_ip             = "172.31.16.183"
  subnet_id              = "subnet-c08548bd"
  user_data              = <<EOF
#!/bin/bash
echo "ansible-server" > /etc/hostname
hostname "ansible-server"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd reload
EOF

  tags = {
    Name  = "Ansible-Server"
    Owner = "Arv1nC"
  }
}
