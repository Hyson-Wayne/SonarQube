#!/bin/bash

# SonarQube Installation and Setup on an AWS EC2 Red Hat Instance

# Step 1: Create Sonar User
sudo useradd sonar
echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
sudo hostnamectl set-hostname sonar

# Step 2: Enable Password Authentication
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart

# Step 3: Install Java JDK 17 and Essential Software
cd /opt
sudo yum -y install unzip wget git
sudo yum install java-17-openjdk-devel -y

# Verify Java installation
java -version

# Step 4: Download and Extract SonarQube
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.8.100196.zip
sudo unzip sonarqube-9.9.8.100196.zip
sudo rm -rf sonarqube-9.9.8.100196.zip
sudo mv sonarqube-9.9.8.100196 sonarqube

# Step 5: Grant Permissions
sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/

# Step 6: Start SonarQube Server
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start

# Step 7: Verify SonarQube is Running
curl -v localhost:9000

# Display Access Details
echo "Access SonarQube at: http://<your-public-ip>:9000"
echo "Default credentials: Username - admin, Password - admin"
