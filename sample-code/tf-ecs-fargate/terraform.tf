provider "aws" {
  region = "ap-southeast-1"  # Singapore
}

locals {
  application_name = "tf-sample-application"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name = local.application_name
}

resource "aws_ecs_task_definition" "my_task_definition" {
  family                   = local.application_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn      = "arn:aws:iam::255945442255:role/ecsTaskExecutionRole"  # Update with your actual role ARN

  container_definitions = jsonencode([
    {
      name  = local.application_name
      image = "${aws_ecr_repository.my_ecr_repo.repository_url}:latest"
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
      essential = true
    }
  ])

  cpu    = "512"
  memory = "1024"
}

resource "aws_ecs_cluster" "my_ecs_cluster" {
  name = "${local.application_name}-cluster"
}

resource "aws_ecs_service" "my_ecs_service" {
  name            = "${local.application_name}-service"
  cluster         = aws_ecs_cluster.my_ecs_cluster.id
  task_definition = aws_ecs_task_definition.my_task_definition.arn
  launch_type     = "FARGATE"
  network_configuration {
    subnets        = ["subnet-04056e91a09a5b4bf", "subnet-bea677f6", "subnet-29ed7170"]
    assign_public_ip = true
    security_groups = ["sg-b4db57fc"]
  }
  scheduling_strategy = "REPLICA"
  desired_count       = 1
  platform_version    = "LATEST"
  deployment_controller {
    type = "ECS"
  }
  deployment_maximum_percent = 200
  deployment_minimum_healthy_percent = 100
  enable_ecs_managed_tags = true
}
