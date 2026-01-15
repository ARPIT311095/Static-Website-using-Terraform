# 🌐 Static Website Deployment on AWS S3 using Terraform

This project demonstrates how to deploy a **fully functional static website** on **Amazon S3** using **Terraform (Infrastructure as Code)**.  
The website is publicly accessible using the **S3 Static Website Hosting endpoint** and follows AWS best practices for configuration and permissions.

---

## 📌 Project Overview

- Infrastructure is provisioned using **Terraform**
- Website hosted on **Amazon S3 Static Website Hosting**
- Public access managed using **S3 Bucket Policy**
- Randomized bucket naming to avoid conflicts
- Clean and reusable Infrastructure as Code (IaC)
- Versioning 

---

## 🛠️ Technologies Used

- **AWS S3**
- **Terraform**
- **HashiCorp Random Provider**
- **HTML, CSS, JavaScript**
- **Git & GitHub**

---

## 🏗️ Architecture

User (Browser)<br>
|<br>
v<br>
S3 Static Website Endpoint<br>
|<br>
v<br>
Amazon S3 Bucket<br>
(index.html, style.css, script.js)<br>



---

## ⚙️ Terraform Resources Used

- `aws_s3_bucket`
- `aws_s3_bucket_public_access_block`
- `aws_s3_bucket_policy`
- `aws_s3_bucket_versioning`
- `aws_s3_bucket_website_configuration`
- `aws_s3_object`
- `random_id`

---

## 🚀 Deployment Steps

2️⃣ Initialize Terraform<br>
terraform init<br>
3️⃣ Apply the Configuration<br>
terraform apply<br>
Type yes when prompted.<br>

## 🌍 Access the Website

After successful deployment, Terraform will output the S3 Static Website URL:<br>
http://parth-bucket-a4378e9ea2bc0666.s3-website-us-east-1.amazonaws.com/
