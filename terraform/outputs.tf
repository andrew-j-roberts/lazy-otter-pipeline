################################################################################################################################
# outputs.tf
#
# This file exports the ARN of the cluster so that it can be used in the other GitHub action steps.
################################################################################################################################

output "cluster_arn" {
  value = module.cluster.arn
}
