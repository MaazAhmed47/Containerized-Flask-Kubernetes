🚀 Containerized Flask App — DevOps Project
A production-style Flask web application containerized with Docker, orchestrated with Kubernetes, and deployed to AWS ECS Fargate with a fully automated CI/CD pipeline using GitHub Actions.

🏗️ Architecture Overview
Developer Push → GitHub Actions (CI/CD) → Docker Hub → AWS ECS Fargate
                                                            ↑
                                                     AWS S3 (Static Files)
                                                     AWS IAM (Secure Access)

🛠️ Tech Stack
LayerTechnologyAppPython, FlaskContainerizationDockerOrchestrationKubernetes (local)CI/CDGitHub ActionsContainer RegistryDocker HubCloud DeploymentAWS ECS FargateStatic FilesAWS S3Access ControlAWS IAM Roles

✨ Features

Flask web app served via Docker container
Kubernetes deployment with 2 replicas (local)
Automated CI/CD pipeline — every push triggers build & deploy
Docker image auto-pushed to Docker Hub
Live deployment on AWS ECS Fargate
Static assets (images, CSS) served from AWS S3
IAM role attached to ECS task for secure S3 access


📁 Project Structure
├── app/
│   ├── app.py              # Flask application
│   ├── requirements.txt    # Python dependencies
│   └── Dockerfile          # Docker image definition
├── k8s/
│   ├── deployment.yaml     # Kubernetes deployment (2 replicas)
│   └── service.yaml        # Kubernetes NodePort service
├── .github/
│   └── workflows/
│       └── ci.yml          # GitHub Actions CI/CD pipeline
└── README.md

⚙️ CI/CD Pipeline
The GitHub Actions pipeline triggers on every push to main:

✅ Checkout code
✅ Set up Python 3.10
✅ Install dependencies
✅ Build Docker image
✅ Push to Docker Hub (syedmaaz001/sna-app:latest)

yamlon:
  push:
    branches: [main]

🐳 Docker
Build locally
bashcd app
docker build -t sna-app .
Run locally
bashdocker run -p 5000:5000 sna-app
Visit: http://localhost:5000

☸️ Kubernetes (Local)
Start Minikube
bashminikube start
Deploy
bashkubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Access
bashminikube service sna-service

☁️ AWS Deployment
Services Used

ECS Fargate — Serverless container hosting
ECR — Private Docker image registry
S3 — Static file storage (sna-static-files bucket)
IAM — Role-based access (sna-ecs-s3-role) for ECS to read S3

Live URL
http://54.89.195.156:5000

🔐 Secrets Required
Add these to GitHub → Settings → Secrets → Actions:
SecretDescriptionDOCKER_USERNAMEDocker Hub usernameDOCKER_PASSWORDDocker Hub access token

🚀 Getting Started
bash# Clone the repo
git clone https://github.com/MaazAhmed47/Containerized-Flask-Kubernetes.git
cd Containerized-Flask-Kubernetes

# Run with Docker
cd app
docker build -t sna-app .
docker run -p 5000:5000 sna-app

👨‍💻 Author
Syed Maaz Ahmed
IT Student — Sir Syed University of Engineering & Technology, Karachi
LinkedIn | GitHub
