###################################################################################################################################
# services/_template/main.tf
#
# This is the configuration file that describes the resources needed to run a demo service.
# You only need to edit this file if you know basic settings won't cut it for your service.
# If your use case is basic and you just need to run a container somewhere, all you need to do is update the values in variables.tf
###################################################################################################################################

# +-+-+-+-+-+-
# ECR
# +-+-+-+-+-+-

# Create an Elastic Container Registry Repository to host the service's image
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository
resource "aws_ecr_repository" "primary" {
  name = var.service_name

  tags = {
    Project = var.project_name
    Owner   = var.tag_owner
    Purpose = var.tag_purpose
    Days    = var.tag_days
  }
}

# +-+-+-+-+-+-
# ECS
# +-+-+-+-+-+-

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_task_definition
resource "aws_ecs_task_definition" "primary" {
  family                   = var.service_name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.fargate_cpu
  memory                   = var.fargate_memory

  container_definitions = <<DEFINITION
[
      {
      "name": "${var.service_name}",
      "image": "${aws_ecr_repository.primary.repository_url}:latest",
      "essential": true,
      "portMappings": [
        {
          "hostPort": ${var.app_port},
          "containerPort": ${var.app_port},
          "protocol": "tcp"
        }
      ],
      "environment": [
        { "name": "SOLACE_USERNAME", "value": "${var.SOLACE_USERNAME}" },
        { "name": "SOLACE_PASSWORD", "value": "${var.SOLACE_PASSWORD}" },
        { "name": "SOLACE_MESSAGE_VPN", "value": "${var.SOLACE_MESSAGE_VPN}" },
        { "name": "SOLACE_HOST_AMQP", "value": "${var.SOLACE_HOST_AMQP}" },
        { "name": "SOLACE_HOST_MQTT", "value": "${var.SOLACE_HOST_MQTT}" },
        { "name": "SOLACE_HOST_MQTT_WSS", "value": "${var.SOLACE_HOST_MQTT_WSS}" },
        { "name": "SOLACE_HOST_REST", "value": "${var.SOLACE_HOST_REST}" },
        { "name": "SOLACE_HOST_SMF", "value": "${var.SOLACE_HOST_SMF}" },
        { "name": "SOLACE_HOST_WSS", "value": "${var.SOLACE_HOST_WSS}" }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.primary_ecs_task.name}",
          "awslogs-region": "${var.aws_region}",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
]
DEFINITION

  execution_role_arn = var.execution_role_arn # used by ECS cluster for container lifecycle operations
  task_role_arn      = var.task_role_arn      # used by task container
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_service
resource "aws_ecs_service" "primary" {
  name            = var.service_name
  cluster         = var.cluster_arn
  task_definition = aws_ecs_task_definition.primary.arn
  desired_count   = var.service_status == "permanent" ? 1 : 0
  launch_type     = "FARGATE"

  network_configuration {
    security_groups  = var.security_groups
    subnets          = var.subnetids
    assign_public_ip = true
  }
}


# +-+-+-+-+-+-
# CloudWatch
# +-+-+-+-+-+-

# Create a CloudWatch Log
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group
resource "aws_cloudwatch_log_group" "primary_ecs_task" {
  name = var.service_name

  tags = {
    Project = var.project_name
    Owner   = var.tag_owner
    Purpose = var.tag_purpose
    Days    = var.tag_days
  }
}

# CloudWatch Metric Alarm
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm
# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/Container-Insights-metrics-ECS.html <- good resource 
resource "aws_cloudwatch_metric_alarm" "task_count_less_than_1" {
  count = var.service_status == "permanent" ? 1 : 0

  alarm_name          = "${var.service_name}-task-count"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "RunningTaskCount"
  statistic           = "SampleCount"
  period              = 60
  treat_missing_data  = "breaching"
  namespace           = "ECS/ContainerInsights"
  threshold           = var.service_threshold
  alarm_description   = "Number of running tasks < 1"
  alarm_actions       = var.service_status == "permanent" ? [module.sns-email.arn] : []

  dimensions = {
    ClusterName = var.cluster_name
    ServiceName = var.service_name
  }

  tags = {
    Project = var.project_name
    Owner   = var.tag_owner
    Purpose = var.tag_purpose
    Days    = var.tag_days
  }
}

module "sns-email" {
  source = "./../../sns-email"

  sns_emails = ["youremail@hotmail.com"]

  service_name = var.service_name
  project_name = var.project_name
  tag_owner    = var.tag_owner
  tag_purpose  = var.tag_purpose
  tag_days     = var.tag_days
}
