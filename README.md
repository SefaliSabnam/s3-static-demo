AWS S3 STATIC WEBSITE HOSTING WITH TERRAFORM AND JENKINS
Project Overview
This project automates the deployment of a static website on AWS S3 using Terraform, with a Jenkins multi-branch pipeline for continuous deployment. The website is hosted on an S3 bucket and configured for public access. Terraform is used for infrastructure provisioning, and Jenkins automates the deployment process.
Table of Contents
•	- Architecture
•	- Prerequisites
•	- Project Structure
•	- Terraform Setup
•	- Jenkins Automation
•	- Deployment Workflow
•	- Destroying the Infrastructure
Architecture
![alt text](<terraform s3.drawio (1).png>)
•	- GitHub: Stores Terraform and Jenkins configuration files.
•	- Visual Studio Code: Used for writing and managing Terraform and Jenkins files.
•	- Jenkins: Triggers the Terraform deployment process upon code merge.
•	- Terraform: Provisions the AWS resources, including IAM roles and S3 buckets.
•	- AWS Cloud (ap-south-1): Hosts the S3 bucket containing the static website files.
•	- IAM Policy: Manages access to AWS resources.
•	- HTML Files: The website content is stored in the S3 bucket and served publicly.
Prerequisites
•	- Install Terraform [(Download)]
•	- Install Jenkins [(Setup Guide)]
•	- Configure AWS CLI
Project Structure
```
├── index.html           # Main HTML file for the website
├── error.html           # Custom error page
├── main.tf              # Terraform configuration
├── provider.tf          # Terraform provider settings
├── variables.tf         # Terraform variables
├── Jenkinsfile          # Jenkins pipeline definition
├── README.docx          # Project documentation
```
Terraform Setup
•	- Define the AWS provider and required variables in `provider.tf` and `variables.tf`.
•	- Create an S3 bucket for static website hosting in `main.tf`.
•	- Configure public access and bucket policies.
•	- Upload `index.html` and `error.html` to the S3 bucket.
•	- Store the Terraform state file in an S3 backend (if applicable).
Jenkins Automation
•	- Add the repository to Jenkins.
•	- Set up a multibranch pipeline.
•	- Use the provided `Jenkinsfile` for automation.
Deployment Workflow
•	- Jenkins fetches the Terraform code from GitHub.
•	- Runs Terraform commands (`init`, `apply`) to create/update infrastructure.
•	- Deploys website files (`index.html`, `error.html`) to S3.
•	- Validate website availability via the S3 static website URL.
•	- Use AWS CloudWatch for monitoring and logging.
Destroying the Infrastructure
To remove all AWS resources created by Terraform:
```sh
terraform destroy -auto-approve
```
License
This project is licensed under the MIT License. See `LICENSE` for details.
Contribution
Feel free to contribute to this project by submitting pull requests.
