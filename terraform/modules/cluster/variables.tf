################################################################################################################################
# cluster/variables.tf
#
# This is the cluster module's variables configuration file. These variables are set by input parameters in the main module.
################################################################################################################################

variable "project_name" {
  type = string
}

variable "tag_owner" {
  type = string
}

variable "tag_purpose" {
  type = string
}

variable "tag_days" {
  type = string
}

