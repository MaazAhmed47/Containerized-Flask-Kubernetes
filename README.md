# Containerized Flask Application using Docker & Kubernetes

## 📌 Project Overview

This project demonstrates a cloud-native DevOps workflow by containerizing a Python Flask application using Docker and deploying it on Kubernetes using Minikube.

## 🛠️ Technologies Used

- Python (Flask)
- Docker
- Kubernetes (Minikube)
- kubectl
- Windows (local environment)

## ⚙️ Architecture

Browser → Kubernetes Service → Pods (Replicas) → Docker Container → Flask App

## 🚀 Features

- Containerized web application
- Kubernetes deployment with multiple replicas
- Load balancing via Kubernetes Service
- Visual proof of Kubernetes using pod hostname
- Automated deployment using script

## ▶️ How to Run

```bash
minikube start
kubectl apply -f k8s\deployment.yaml
kubectl apply -f k8s\service.yaml
minikube service sna-service

or run deploy.bat
```
