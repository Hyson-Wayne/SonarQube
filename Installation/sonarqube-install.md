# **<span style="color:green">SonarQube Installation and Setup on an AWS EC2 Red Hat Instance</span>**

---

## **<span style="color:green">Contact Information</span>**

For further assistance or inquiries, click the buttons below:

- [![Name](https://img.shields.io/badge/Name-Nditafon%20Hyson%20Nuigho-brightgreen)](mailto:nditafonhysonn@gmail.com)
- [![Phone](https://img.shields.io/badge/Phone-%2B237679638540-brightgreen)](tel:+237679638540)
- [![Email](https://img.shields.io/badge/Email-nditafonhysonn%40gmail.com-blue)](mailto:nditafonhysonn@gmail.com)
- [![GitHub](https://img.shields.io/badge/GitHub-Hyson--Wayne-lightgrey?logo=github)](https://github.com/Hyson-Wayne)
- [![LinkedIn](https://img.shields.io/badge/LinkedIn-nditafon--hyson-blue?logo=linkedin)](https://www.linkedin.com/in/nditafon-hyson-762a6623b/)

---

## **<span style="color:green">Prerequisites</span>**
Ensure you have the following before starting:
- **AWS account** with access to create EC2 instances.
- **Security Group** configured to allow access (e.g., port 9000).
- **Red Hat EC2 instance** (e.g., t2.medium) with at least **4GB RAM**.
- **OpenJDK 17+** installed.

## **<span style="color:green">Step 1: Create Sonar User</span>**

**Create a new user and set hostname:**

```bash    
    # Create a new user 'sonar'
    sudo useradd sonar

    # Grant sudo access to 'sonar'
    sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar

    # Set the hostname to 'sonar' and switch to 'sonar' user
    sudo hostnamectl set-hostname sonar
    sudo su - sonar
```

## **<span style="color:green">Step 2: Enable Password Authentication</span>**

**Modify SSH configuration to allow password authentication:**

```bash    
    # Update sshd_config to enable password authentication
    sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config

    # Restart SSH service to apply changes
    sudo service sshd restart
```

## **<span style="color:green">Step 3: Install Java JDK 17 and Essential Software</span>**

**Install essential software and Java JDK:**

```bash    
    # Navigate to /opt directory
    cd /opt

    # Install unzip, wget, and Git
    sudo yum -y install unzip wget git

    # Install Java JDK 17
    sudo yum install java-17-openjdk-devel -y

    # Verify Java installation
    java -version
```

## **<span style="color:green">Step 4: Download and Extract SonarQube</span>**

**Download and extract SonarQube:**

```bash
    # Download SonarQube version 9.9.8
    sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.8.100196.zip

    # Extract SonarQube archive
    sudo unzip sonarqube-9.9.8.100196.zip

    # Remove the downloaded zip file
    sudo rm -rf sonarqube-9.9.8.100196.zip

    # Rename the extracted directory for simplicity
    sudo mv sonarqube-9.9.8.100196 sonarqube
```

## **<span style="color:green">Step 5: Grant Permissions</span>**

**Set ownership and permissions for the SonarQube directory:**

```bash
    # Change ownership of the SonarQube directory to 'sonar' user
    sudo chown -R sonar:sonar /opt/sonarqube/

    # Set permissions for the SonarQube directory
    sudo chmod -R 775 /opt/sonarqube/
```

## **<span style="color:green">Step 6: Start SonarQube Server</span>**

**Start the SonarQube server:**

```bash
    # Start SonarQube
    sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start

    # Check the status of SonarQube
    sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
```

## **<span style="color:green">Step 7: Verify SonarQube is Running</span>**

**Verify if SonarQube is accessible:**

```bash
    # Check if SonarQube is running by curling localhost
    curl -v localhost:9000
```

**Access SonarQube** in your browser at `http://<publicIP>:9000` using the default credentials:
- **Username:** admin
- **Password:** admin
