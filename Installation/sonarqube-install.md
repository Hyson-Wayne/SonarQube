# **<span style="color:green">SonarQube Installation and Setup on AWS EC2 Red Hat Instance</span>**

### **<span style="color:green">Contact Information</span>**
- **Phone:** +237 679638540
- **Email:** [nditafonhysonn@gmail.com](mailto:nditafonhysonn@gmail.com)

### **<span style="color:green">Prerequisites</span>**
Ensure you have the following before starting:
- **AWS account** with access to create EC2 instances.
- **Red Hat EC2 instance** (e.g., t2.medium) with at least **4GB RAM**.
- **Security Group** configured to allow necessary ports (e.g., port 9000 for SonarQube).
- **Java OpenJDK 17+** installed.

## **<span style="color:green">Step 1: Create Sonar User</span>**

1. **Create a new user called 'sonar':**
    ```bash
    sudo useradd sonar
    ```

2. **Grant sudo access to the 'sonar' user:**
    ```bash
    sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar
    ```

3. **Set the hostname for the SonarQube server:**
    ```bash
    sudo hostnamectl set-hostname sonar
    ```

4. **Switch to the 'sonar' user:**
    ```bash
    sudo su - sonar
    ```

## **<span style="color:green">Step 2: Enable Password Authentication</span>**

1. **Enable password authentication in the server:**
    ```bash
    sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
    ```

2. **Restart the SSH service:**
    ```bash
    sudo service sshd restart
    ```

## **<span style="color:green">Step 3: Install Java JDK 17+</span>**

1. **Navigate to the `/opt` directory and install necessary software:**
    ```bash
    cd /opt
    ```

2. **Install unzip, wget, and git:**
    ```bash
    sudo yum -y install unzip wget git
    ```

3. **Install Java JDK 17:**
    ```bash
    sudo yum install java-17-openjdk-devel -y
    ```

## **<span style="color:green">Step 4: Download and Extract SonarQube Server</span>**

1. **Download SonarQube:**
    ```bash
    sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.7.96285.zip
    ```

2. **Extract the SonarQube zip file:**
    ```bash
    sudo unzip sonarqube-9.9.7.96285.zip
    ```

3. **Remove the zip file to clean up:**
    ```bash
    sudo rm -rf sonarqube-9.9.7.96285.zip
    ```

4. **Rename the SonarQube directory:**
    ```bash
    sudo mv sonarqube-9.9.7.96285 sonarqube
    ```

## **<span style="color:green">Step 5: Grant File Permissions</span>**

1. **Change ownership of the SonarQube directory:**
    ```bash
    sudo chown -R sonar:sonar /opt/sonarqube/
    ```

2. **Change permissions of the SonarQube directory:**
    ```bash
    sudo chmod -R 775 /opt/sonarqube/
    ```

## **<span style="color:green">Step 6: Start SonarQube Server</span>**

1. **Start the SonarQube server:**
    ```bash
    sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start
    ```

2. **Check the status of the SonarQube server:**
    ```bash
    sh /opt/sonarqube/bin/linux-x86-64/sonar.sh status
    ```

## **<span style="color:green">Step 7: Ensure SonarQube is Running</span>**

1. **Check if SonarQube is running:**
    ```bash
    curl -v localhost:9000
    ```

2. **Default SonarQube credentials:**
    - **Username:** admin
    - **Password:** admin

**Access SonarQube on the browser using:** `http://<publicIP>:9000`, replacing `<publicIP>` with your instance's public IP address.
