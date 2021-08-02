################################################################################################################################
# cluster/main.tf
################################################################################################################################

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster https://aws.amazon.com/fargate/
resource "aws_ecs_cluster" "primary" {
  name               = "${var.project_name}-cluster"
  capacity_providers = ["FARGATE"]

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Project = var.project_name
    Owner   = var.tag_owner
    Purpose = var.tag_purpose
    Days    = var.tag_days
  }
}


