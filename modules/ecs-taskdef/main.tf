# modules/ecs-taskdef/main.tf
resource "aws_ecs_task_definition" "this" {
  family                   = var.family
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole"

  container_definitions = jsonencode([
    {
      name      = var.container_name
      image     = var.container_image
      essential = var.container_essential

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]

      # Conditional resource limits
      resourceRequirements = (
        length(var.gpu) > 0 ?
        [{ type = "GPU", value = var.gpu }] : []
      )

      cpu               = var.container_cpu
      memoryReservation = var.memory_soft_limit
      memory            = var.memory_hard_limit
      # ✅ Environment variables (optional)
      environment = var.environment

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/${var.family}"
          awslogs-region        = var.region
          awslogs-stream-prefix = var.container_name
        }
      }
      # ✅ Startup Dependency Ordering (optional)
      dependsOn = (
        length(var.container_dependencies) > 0 ?
        var.container_dependencies : null
      )
    }
  ])
}

data "aws_caller_identity" "current" {}

resource "aws_cloudwatch_log_group" "ecs_task" {
  name              = "/ecs/${var.family}"
  retention_in_days = 7
  tags              = var.tags
}
