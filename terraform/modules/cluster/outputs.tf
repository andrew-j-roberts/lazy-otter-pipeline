################################################################################################################################
# cluster/outputs.tf
#
# This file exports the ARN of the cluster from this module so that it can be used in the services module.
################################################################################################################################

output "arn" {
  value = aws_ecs_cluster.primary.arn
}

output "name" {
  value = "${var.project_name}-cluster"
}
