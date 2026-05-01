# 🚀 Flask DevOps Pipeline — Docker | Kubernetes | CI/CD | AWS ECS | Terraform

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

A production-style DevOps project built from scratch — a Python Flask app containerized with Docker, orchestrated with Kubernetes, deployed to **AWS ECS Fargate**, with static files on **S3**, secure access via **IAM roles**, and infrastructure provisioned using **Terraform**.

---

## 🏗️ Architecture

```
Developer (git push)
        │
        ▼
GitHub Actions (CI/CD Pipeline)
        │
        ├── Install dependencies
        ├── Build Docker image
        └── Push to Docker Hub
                │
                ▼
        AWS ECS Fargate (Live Deployment)
                │
                ├── Pulls image from Docker Hub
                ├── Runs Flask container (port 5000)
                └── Serves static files from AWS S3
                        │
                        └── IAM Role → secure S3 access
```

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Application | Python 3.10, Flask |
| Containerization | Docker |
| Orchestration | Kubernetes (Minikube) |
| CI/CD | GitHub Actions |
| Container Registry | Docker Hub |
| Cloud Deployment | AWS ECS Fargate |
| Static Files | AWS S3 |
| Access Control | AWS IAM Roles |
| Infrastructure as Code | Terraform |

---

## ✨ Features

- ✅ Flask app containerized with Docker
- ✅ Kubernetes deployment with 2 replicas (local)
- ✅ Automated CI/CD — every push triggers build & push to Docker Hub
- ✅ Live deployment on AWS ECS Fargate
- ✅ Static assets served from AWS S3
- ✅ IAM role attached to ECS task for secure S3 access
- ✅ EC2 + Security Group provisioned via Terraform (IaC)

---

## 📁 Project Structure

```
├── app/
│   ├── app.py                  # Flask application
│   ├── requirements.txt        # Python dependencies
│   └── Dockerfile              # Docker image definition
├── k8s/
│   ├── deployment.yaml         # Kubernetes deployment (2 replicas)
│   └── service.yaml            # Kubernetes NodePort service
├── terraform/
│   ├── main.tf                 # EC2 + Security Group resources
│   ├── variables.tf            # Input variables
│   └── outputs.tf              # Output values (public IP)
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI/CD pipeline
└── README.md
```

---

## ⚙️ CI/CD Pipeline

Triggered automatically on every push to `main`:

```
git push → Install deps → Build Docker image → Push to Docker Hub
```

**Secrets required in GitHub → Settings → Actions:**

| Secret | Value |
|--------|-------|
| `DOCKER_USERNAME` | Docker Hub username |
| `DOCKER_PASSWORD` | Docker Hub access token |

---

## 🐳 Docker

```bash
# Build image
cd app
docker build -t sna-app .

# Run locally
docker run -p 5000:5000 sna-app
```

Visit: `http://localhost:5000`

Live image: `docker.io/syedmaaz001/sna-app:latest`

---

## ☸️ Kubernetes (Local)

```bash
# Start cluster
minikube start

# Deploy
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

# Access app
minikube service sna-service
```

---

## ☁️ AWS ECS Fargate Deployment

| Service | Purpose |
|---------|---------|
| ECS Fargate | Serverless container hosting |
| ECR | Private Docker image registry |
| S3 (`sna-static-files`) | Static file storage |
| IAM (`sna-ecs-s3-role`) | Secure S3 read access for ECS |
| Security Group | Allow inbound traffic on port 5000 |

IAM Role `sna-ecs-s3-role` with `AmazonS3ReadOnlyAccess` is attached to the ECS Task Definition for secure, role-based S3 access.

---

## 🏗️ Terraform (Infrastructure as Code)

```bash
cd terraform
terraform init      # Download providers
terraform plan      # Preview changes
terraform apply     # Create infrastructure
terraform destroy   # Clean up
```

**What Terraform creates:**
- EC2 instance (`t3.micro`) with Docker pre-installed
- Security Group allowing port 5000 and SSH
- Auto-pulls Docker image and starts Flask app via `user_data`

---

## 🚀 Quick Start

```bash
git clone https://github.com/MaazAhmed47/Containerized-Flask-Kubernetes.git
cd Containerized-Flask-Kubernetes
cd app
docker build -t sna-app .
docker run -p 5000:5000 sna-app
```

---

## 👨‍💻 Author

**Syed Maaz Ahmed** — IT Student, SSUET Karachi, Pakistan

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/maaz-ahmed-abb422295)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=flat&logo=github&logoColor=white)](https://github.com/MaazAhmed47)
