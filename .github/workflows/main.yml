@echo off
echo Starting Minikube...
minikube start

echo Deploying application...
kubectl apply -f k8s\deployment.yaml
kubectl apply -f k8s\service.yaml

echo Opening service...
minikube service sna-service
