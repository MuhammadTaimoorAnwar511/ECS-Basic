# modules/ecs-taskdef/variables.tf
variable "family" {
  description = "Task definition family"
  type        = string
}

variable "cpu" {
  description = "Task-level CPU units"
  type        = string
}

variable "memory" {
  description = "Task-level memory (MB)"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "container_image" {
  description = "Image URI of the container"
  type        = string
}

variable "container_port" {
  description = "Port the container listens on"
  type        = number
}

variable "container_cpu" {
  description = "Container-level CPU units"
  type        = number
  default     = 0
}

variable "gpu" {
  description = "Number of GPUs to allocate to the container"
  type        = string
  default     = ""
}

variable "memory_hard_limit" {
  description = "Hard memory limit for container (MB)"
  type        = number
  default     = 512
}

variable "memory_soft_limit" {
  description = "Soft memory limit for container (MB)"
  type        = number
  default     = 256
}
variable "environment" {
  description = "Optional environment variables for the container"
  type        = list(object({
    name  = string
    value = string
  }))
  default     = []
}
variable "region" {
  description = "AWS region"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
