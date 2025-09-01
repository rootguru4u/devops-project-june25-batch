# DevOps Project: Infrastructure + Application

This repository contains a complete DevOps project demonstrating Infrastructure as Code (Terraform) and Application Deployment with CI/CD pipelines.

## 🏗️ Project Structure

```
devops-proj/
├── infra-project/          # Project 1: Infrastructure (Terraform)
│   ├── terraform/          # Terraform modules and configuration
│   ├── .github/workflows/  # Infrastructure CI/CD pipelines
│   └── README.md          # Infrastructure documentation
│
├── app-project/           # Project 2: Application Deployment
│   ├── app-code/          # Flask application source code
│   ├── config/            # Application configuration
│   ├── .github/workflows/ # Application CI/CD pipelines
│   └── README.md          # Application documentation
│
└── README.md              # This file
```

## 🚀 Quick Start

### 1. Infrastructure Deployment (Project 1)
```bash
cd infra-project
# Configure Terraform Cloud backend
# Set up GitHub Actions secrets
# Push to trigger CI/CD
```

### 2. Application Deployment (Project 2)
```bash
cd app-project
# Ensure Project 1 is deployed first
# Configure TFC_TOKEN secret
# Push to trigger CI/CD
```

## 📚 Documentation

- **[Infrastructure Project](./infra-project/README.md)** - Terraform modules, AWS resources, CI/CD
- **[Application Project](./app-project/README.md)** - Flask app, Docker, deployment

## 🔧 Technologies Used

- **Infrastructure**: Terraform, AWS (VPC, ALB, RDS, Redis, S3)
- **Application**: Python Flask, Docker
- **CI/CD**: GitHub Actions, Terraform Cloud
- **Integration**: TFC API, Environment Variables

## 🎯 Learning Outcomes

This project demonstrates:
- ✅ Infrastructure as Code with Terraform
- ✅ Modular architecture design
- ✅ CI/CD pipeline implementation
- ✅ Infrastructure and application integration
- ✅ Cloud resource management
- ✅ Container deployment strategies

## 🔗 Integration Flow

1. **Infrastructure** (Project 1) provisions AWS resources via Terraform Cloud
2. **Application** (Project 2) fetches infrastructure outputs via TFC API
3. **Flask app** displays live infrastructure endpoints
4. **Users** access application through provisioned load balancer

Perfect for learning DevOps, Infrastructure as Code, and modern deployment practices! 🚀
