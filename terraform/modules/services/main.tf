################################################################################################################################
# services/main.tf
#
# This file includes...
# - module configuration blocks for this project's onboarded services
# - shared IAM role resources
################################################################################################################################

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# Child modules - one per onboarded service, add a block here if you're on-boarding a service
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

# Template:

# module "unique-service-name" {
#   source = "./unique-service-name"
#
#   cluster_arn          = var.cluster_arn
#   execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
#   task_role_arn        = aws_iam_role.task_role.arn      # used by task container
#   aws_region           = var.aws_region
#   project_name         = var.project_name
#   tag_owner            = var.tag_owner
#   tag_purpose          = var.tag_purpose
#   tag_days             = var.tag_days
#   SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
#   SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
#   SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
#   SOLACE_HOST_REST     = var.SOLACE_HOST_REST
#   SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
#   SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
#   SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
#   SOLACE_PASSWORD      = var.SOLACE_PASSWORD
#   SOLACE_USERNAME      = var.SOLACE_USERNAME
# }

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-


module "faa-scds-feeds-simulator" {
  source = "./faa-scds-feeds-simulator"

  cluster_arn          = var.cluster_arn
  cluster_name         = var.cluster_name
  execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
  task_role_arn        = aws_iam_role.task_role.arn      # used by task container
  aws_region           = var.aws_region
  project_name         = var.project_name
  tag_owner            = var.tag_owner
  tag_purpose          = var.tag_purpose
  tag_days             = var.tag_days
  SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
  SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
  SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
  SOLACE_HOST_REST     = var.SOLACE_HOST_REST
  SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
  SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
  SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
  SOLACE_PASSWORD      = var.SOLACE_PASSWORD
  SOLACE_USERNAME      = var.SOLACE_USERNAME
}

module "package-scan-simulator" {
  source = "./package-scan-simulator"

  cluster_arn          = var.cluster_arn
  cluster_name         = var.cluster_name
  execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
  task_role_arn        = aws_iam_role.task_role.arn      # used by task container
  aws_region           = var.aws_region
  project_name         = var.project_name
  tag_owner            = var.tag_owner
  tag_purpose          = var.tag_purpose
  tag_days             = var.tag_days
  SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
  SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
  SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
  SOLACE_HOST_REST     = var.SOLACE_HOST_REST
  SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
  SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
  SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
  SOLACE_PASSWORD      = var.SOLACE_PASSWORD
  SOLACE_USERNAME      = var.SOLACE_USERNAME
}

module "ecommerce-order-simulator" {
  source = "./ecommerce-order-simulator"

  cluster_arn          = var.cluster_arn
  cluster_name         = var.cluster_name
  execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
  task_role_arn        = aws_iam_role.task_role.arn      # used by task container
  aws_region           = var.aws_region
  project_name         = var.project_name
  tag_owner            = var.tag_owner
  tag_purpose          = var.tag_purpose
  tag_days             = var.tag_days
  SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
  SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
  SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
  SOLACE_HOST_REST     = var.SOLACE_HOST_REST
  SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
  SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
  SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
  SOLACE_PASSWORD      = var.SOLACE_PASSWORD
  SOLACE_USERNAME      = var.SOLACE_USERNAME
}

module "cdc-order-source" {
  source = "./cdc-order-source"

  cluster_arn          = var.cluster_arn
  cluster_name         = var.cluster_name
  execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
  task_role_arn        = aws_iam_role.task_role.arn      # used by task container
  aws_region           = var.aws_region
  project_name         = var.project_name
  tag_owner            = var.tag_owner
  tag_purpose          = var.tag_purpose
  tag_days             = var.tag_days
  SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
  SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
  SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
  SOLACE_HOST_REST     = var.SOLACE_HOST_REST
  SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
  SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
  SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
  SOLACE_PASSWORD      = var.SOLACE_PASSWORD
  SOLACE_USERNAME      = var.SOLACE_USERNAME
}

module "order-validation-processor" {
  source = "./order-validation-processor"

  cluster_arn          = var.cluster_arn
  cluster_name         = var.cluster_name
  execution_role_arn   = aws_iam_role.execution_role.arn # used by ECS cluster for container lifecycle operations
  task_role_arn        = aws_iam_role.task_role.arn      # used by task container
  aws_region           = var.aws_region
  project_name         = var.project_name
  tag_owner            = var.tag_owner
  tag_purpose          = var.tag_purpose
  tag_days             = var.tag_days
  SOLACE_HOST_AMQP     = var.SOLACE_HOST_AMQP
  SOLACE_HOST_MQTT     = var.SOLACE_HOST_MQTT
  SOLACE_HOST_MQTT_WSS = var.SOLACE_HOST_MQTT_WSS
  SOLACE_HOST_REST     = var.SOLACE_HOST_REST
  SOLACE_HOST_SMF      = var.SOLACE_HOST_SMF
  SOLACE_HOST_WSS      = var.SOLACE_HOST_WSS
  SOLACE_MESSAGE_VPN   = var.SOLACE_MESSAGE_VPN
  SOLACE_PASSWORD      = var.SOLACE_PASSWORD
  SOLACE_USERNAME      = var.SOLACE_USERNAME
}


# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# IAM resources shared across all services - do not update below this flag
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

# Create an IAM role that task containers can assume
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "task_role" {
  name               = "task_role"
  assume_role_policy = <<-POLICY_DEFINITION
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ecs-tasks.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  POLICY_DEFINITION
}

# Create an IAM Policy that states the task container's permissions and attach it to task_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy
resource "aws_iam_role_policy" "task_role" {
  name   = "task_role"
  role   = aws_iam_role.task_role.id
  policy = <<-POLICY_DEFINITION
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "dynamodb:*",
          "kinesis:*",
          "lambda:*",
          "polly:*",
          "rds:*",
          "rekognition:*",
          "s3:*",
          "sns:*",
          "sqs:*",
          "textract:*",
          "transcribe:*",
          "translate:*"
        ],
        "Resource":"*"
      }
    ] 
  }
  POLICY_DEFINITION
}

# Create an IAM role that the ECS container agent and Docker daemon can assume
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role
resource "aws_iam_role" "execution_role" {
  name               = "execution_role"
  assume_role_policy = <<-POLICY_DEFINITION
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": "sts:AssumeRole",
        "Principal": {
          "Service": "ecs-tasks.amazonaws.com"
        },
        "Effect": "Allow",
        "Sid": ""
      }
    ]
  }
  POLICY_DEFINITION
}

# Attach the AWS managed AmazonECSTaskExecutionRolePolicy to execution_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment
resource "aws_iam_role_policy_attachment" "execution_role" {
  role       = aws_iam_role.execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
