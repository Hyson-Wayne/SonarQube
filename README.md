# **<span style="color:green">SonarQube Installation and Maven Integration Guide</span>**

## **<span style="color:green">Introduction</span>**

**SonarQube** is an open-source platform for continuous code quality inspection. It provides detailed reports on code duplications, bugs, security vulnerabilities, code smells, and technical debt, enabling development teams to identify and fix issues early in the software development lifecycle. Integrating SonarQube with a Maven project ensures automated code quality analysis, which is crucial for maintaining high standards in software development.

## **<span style="color:green">Why SonarQube is Important</span>**

- **Enhanced Code Quality**: SonarQube helps detect code issues such as bugs, vulnerabilities, and code smells.
- **Continuous Inspection**: Automates code review processes, ensuring code quality is maintained across versions.
- **Security Compliance**: Identifies potential security risks in your code, enabling proactive fixes.
- **Technical Debt Management**: Assists in monitoring and managing the technical debt of your project.
- **Integration with DevOps**: Fits seamlessly with CI/CD pipelines to facilitate continuous code analysis and feedback.

## **<span style="color:green">Prerequisites</span>**

Ensure you have the following before starting:
- **AWS account** with access to create EC2 instances.
- **Red Hat EC2 instance** with at least **4GB RAM**.
- **Java JDK 17+** installed.
- **Maven** installed and configured on your server.
- **SonarQube** installed and running on an EC2 instance.

## **<span style="color:green">Step 1: SonarQube Installation on AWS EC2 (Red Hat)</span>**

1. **Update the system and install required packages:**
    ```bash
    # Update system packages
    sudo yum update -y

    # Install wget and unzip for downloading and extracting SonarQube
    sudo yum install wget unzip -y
    ```

2. **Download and extract SonarQube:**
    ```bash
    # Navigate to the /opt directory
    cd /opt

    # Download SonarQube (specify the version as needed)
    sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.1.69595.zip

    # Extract the SonarQube package
    sudo unzip sonarqube-9.9.1.69595.zip

    # Rename the extracted folder for simplicity
    sudo mv sonarqube-9.9.1.69595 sonarqube
    ```

3. **Create a dedicated SonarQube user and set permissions:**
    ```bash
    # Create a new SonarQube user
    sudo useradd -m -d /opt/sonarqube sonarqube

    # Change ownership of the SonarQube directory
    sudo chown -R sonarqube:sonarqube /opt/sonarqube
    ```

4. **Start the SonarQube server:**
    ```bash
    # Switch to the SonarQube user
    sudo su - sonarqube

    # Start the SonarQube server
    /opt/sonarqube/bin/linux-x86-64/sonar.sh start
    ```

## **<span style="color:green">Step 2: Integrating SonarQube with Maven</span>**

1. **Configure the `pom.xml` file:**
    Add the following properties to your Maven project’s `pom.xml`:
    ```xml
    <properties>
        <sonar.host.url>http://your-sonarqube-ip:9000</sonar.host.url>
        <sonar.login>admin</sonar.login>
        <sonar.password>admin</sonar.password>
    </properties>
    ```

    **Note**: Replace `your-sonarqube-ip` with the IP address of your SonarQube server, and update credentials as needed.

2. **Run code analysis:**
    ```bash
    mvn sonar:sonar
    ```

## **<span style="color:green">How to Verify the Integration</span>**

- Open a web browser and navigate to `http://<your-sonarqube-ip>:9000`.
- Log in with your SonarQube credentials.
- Check the project dashboard for code analysis results.

## **<span style="color:green">Conclusion</span>**

By following this guide, you have successfully installed SonarQube on an AWS EC2 instance, configured it for use, and integrated it with your Maven project for automated code quality analysis. This integration ensures that your code maintains high standards of quality, security, and performance throughout the development lifecycle.
