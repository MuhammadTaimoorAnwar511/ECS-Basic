# (ROOT)variables.tf
# VPC
variable "region" { type = string }
variable "vpc_name" { type = string }
variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "private_subnets" { type = list(string) }
# ALB SG
variable "sg_name" { type = string}
# Target Group
variable "target_group_name" { type = string }
# ALB
variable "alb_name" { type = string }
# CLUSTER NAME
variable "cluster_name" { type = string}
# wether you want to create taskdefination and service or not
variable "want_to_create_taskdef_and_service" {
  type = bool 
  default = true 
}
# ECS Task Definition
variable "task_family" { type = string }
variable "task_cpu" { type = string }
variable "task_memory" { type = string }
variable "container_name" { type = string }
variable "container_image" { type = string }
variable "container_port" { type = number }
variable "container_cpu" { type = number }
variable "gpu" { type = string }
variable "memory_hard_limit" { type = number }
variable "memory_soft_limit" { type = number }
# ECS Service SG
variable "ecs_service_sg_name" { type = string }
# ECS Service
variable "ecs_service_name" { type = string }
variable "desired_count"    { type = number }
variable "min_count"        { type = number }
variable "max_count"        { type = number }
variable "scaling_policy_name" { type = string }
variable "scaling_metric" {
  type    = string
  default = "ECSServiceAverageCPUUtilization"
}


# Env + Tags
variable "environment" { type = string }
variable "owner" { type = string }

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
