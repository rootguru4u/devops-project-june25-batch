# Project 1: Infrastructure (Terraform)

This project creates the AWS infrastructure using Terraform with a modular approach.

## 🏗️ Architecture Overview

```mermaid
graph TB
    subgraph "Terraform Cloud"
        TFC[Terraform Cloud<br/>Workspace: infra-workspace]
        Outputs[Infrastructure Outputs<br/>• ALB DNS<br/>• RDS Endpoint<br/>• Redis Endpoint<br/>• S3 Bucket]
    end
    
    subgraph "AWS Infrastructure (ap-south-1)"
        subgraph "Network Module"
            VPC[VPC<br/>10.0.0.0/16]
            Subnets[Public Subnets<br/>subnet-12345, subnet-67890]
            SG[Security Group<br/>sg-12345678]
        end
        
        subgraph "Compute Module"
            ALB[Application Load Balancer<br/>alb-example-123456.ap-south-1.elb.amazonaws.com]
        end
        
        subgraph "Data Layer Module"
            RDS[(PostgreSQL RDS<br/>rds-example.abcdefg.ap-south-1.rds.amazonaws.com)]
            Redis[(ElastiCache Redis<br/>redis-example.abcdefg.ap-south-1.cache.amazonaws.com)]
            S3[S3 Bucket<br/>my-app-bucket-12345]
        end
    end
    
    TFC --> VPC
    TFC --> ALB
    TFC --> RDS
    TFC --> Redis
    TFC --> S3
    TFC --> Outputs
    
    VPC --> Subnets
    VPC --> SG
    
    style TFC fill:#8e44ad
    style VPC fill:#3498db
    style ALB fill:#e74c3c
    style RDS fill:#27ae60
    style Redis fill:#f39c12
    style S3 fill:#16a085
```

## 📦 Module Structure

```mermaid
graph LR
    subgraph "Root Module"
        Main[main.tf]
        Vars[variables.tf]
        Out[outputs.tf]
    end
    
    subgraph "Network Module"
        NetMain[modules/network/main.tf<br/>• VPC Creation<br/>• Stub Outputs]
    end
    
    subgraph "Compute Module"
        CompMain[modules/compute/main.tf<br/>• ALB DNS Output]
    end
    
    subgraph "Data Layer Module"
        DataMain[modules/data-layer/main.tf<br/>• RDS Endpoint<br/>• Redis Endpoint<br/>• S3 Bucket]
    end
    
    Main --> NetMain
    Main --> CompMain
    Main --> DataMain
    
    NetMain --> Out
    CompMain --> Out
    DataMain --> Out
    
    style Main fill:#e8f5e8
    style NetMain fill:#fff2e8
    style CompMain fill:#f0f8ff
    style DataMain fill:#ffeaa7
```

## 🚀 CI/CD Pipeline

```mermaid
graph LR
    subgraph "Development"
        Dev[Developer]
        Code[Code Changes]
        PR[Pull Request]
    end
    
    subgraph "CI Pipeline"
        CI[Infra CI<br/>• terraform fmt -check<br/>• terraform validate<br/>• terraform plan]
    end
    
    subgraph "CD Pipeline"
        Merge[Merge to main]
        CD[Infra CD<br/>• terraform init<br/>• terraform apply -auto-approve]
    end
    
    subgraph "Terraform Cloud"
        TFC[Remote Backend<br/>State Management]
        Store[Store Outputs<br/>for App Project]
    end
    
    Dev --> Code
    Code --> PR
    PR --> CI
    CI --> Merge
    Merge --> CD
    CD --> TFC
    TFC --> Store
    
    style CI fill:#f39c12
    style CD fill:#27ae60
    style TFC fill:#8e44ad
```

## 📋 Resources Created

| Module | Resource Type | Output | Description |
|--------|---------------|--------|-------------|
| **Network** | VPC | vpc_id | Virtual Private Cloud |
| | Subnets | public_subnets | Public subnet IDs (stubbed) |
| | Security Group | alb_sg | ALB security group (stubbed) |
| **Compute** | ALB | alb_dns | Application Load Balancer DNS |
| **Data Layer** | RDS | rds_endpoint | PostgreSQL database endpoint |
| | Redis | redis_endpoint | ElastiCache Redis endpoint |
| | S3 | s3_bucket | S3 bucket name |

## 🛠️ Usage

### Prerequisites
- Terraform Cloud account
- AWS credentials configured in TFC
- GitHub repository with Actions enabled

### Setup Steps

1. **Configure Terraform Cloud Backend**
   ```hcl
   # Update organization and workspace in main.tf
   terraform {
     backend "remote" {
       organization = "your-tfc-org"
       workspaces {
         name = "infra-workspace"
       }
     }
   }
   ```

2. **Set Variables in TFC**
   - `aws_region` = "ap-south-1"
   - `vpc_cidr` = "10.0.0.0/16"
   - `db_username` = "admin"
   - `db_password` = "your-secure-password" (sensitive)

3. **Deploy Infrastructure**
   ```bash
   # Create PR → CI runs (format, validate, plan)
   git checkout -b feature/infrastructure
   git add .
   git commit -m "Add infrastructure code"
   git push origin feature/infrastructure
   
   # Merge to main → CD runs (apply)
   ```

### Infrastructure Outputs

After deployment, these outputs are available in TFC:

```bash
alb_dns = "alb-example-123456.ap-south-1.elb.amazonaws.com"
rds_endpoint = "rds-example.abcdefg.ap-south-1.rds.amazonaws.com"
redis_endpoint = "redis-example.abcdefg.ap-south-1.cache.amazonaws.com"
s3_bucket = "my-app-bucket-12345"
```

## 🔗 Integration with Project 2

The application project (Project 2) automatically fetches these outputs via Terraform Cloud API during deployment:

```bash
# App CD workflow fetches outputs
curl --header "Authorization: Bearer $TFC_TOKEN" \
     https://app.terraform.io/api/v2/workspaces/infra-workspace/outputs
```

## 📁 File Structure

```
infra-project/
├── terraform/
│   ├── main.tf                    # Root module with provider config
│   ├── variables.tf               # Input variables
│   ├── outputs.tf                 # Infrastructure outputs
│   ├── userdata.sh               # EC2 bootstrap script
│   └── modules/
│       ├── network/main.tf        # VPC and networking (stub)
│       ├── compute/main.tf        # ALB configuration (stub)
│       └── data-layer/main.tf     # RDS, Redis, S3 (stub)
└── .github/workflows/
    ├── ci-infra.yml              # Pull request validation
    └── cd-infra.yml              # Main branch deployment
```

This infrastructure provides the foundation for the Flask application in Project 2! 🚀