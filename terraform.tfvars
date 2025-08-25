# (ROOT)terraform.tfvars
# VPC
region          = "us-east-1"
vpc_name        = "project-vpc"
vpc_cidr        = "10.0.0.0/16"
azs             = ["us-east-1a", "us-east-1b"]
public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

# Security Group
sg_name         = "project-alb-sg"
# ECS Service SG
ecs_service_sg_name = "project-ecs-service-sg"

# Target Group
target_group_name = "project-tg"

# ALB
alb_name = "project-alb"

# ECS Cluster
cluster_name = "project-cluster"

# wether you want to create taskdefination and service or not
want_to_create_taskdef_and_service = true

# ECS Task Definition
task_family        = "project-task"
task_cpu           = "256" # 1024 CPU units = 1 vCPU.
task_memory        = "512" # task memory/ram  in MB

container_name     = "project-app"
container_image    = "084828600005.dkr.ecr.us-east-1.amazonaws.com/taimoor/project:latest" #image latest url
container_port     = 5000 # port on which container is running
container_cpu      = 128 # 1024 CPU units = 1 vCPU.
gpu                = ""
memory_hard_limit  = 512 #  container memory/ram  in MB
memory_soft_limit  = 256 #  container memory/ram  in MB

# ECS Service
ecs_service_name    = "project-service"
desired_count       = 2
min_count           = 1
max_count           = 4
scaling_policy_name = "project-scaling-policy"
scaling_metric      = "ECSServiceAverageCPUUtilization" # "ECSServiceAverageCPUUtilization" or "ECSServiceAverageMemoryUtilization"


# environment
environment     = "development"
owner           = "devops-team"
