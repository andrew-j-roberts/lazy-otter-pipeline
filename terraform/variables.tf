################################################################################################################################
# variables.tf
#
# This is the root module's variables configuration file. 
# The values specified here are used by the provider block in main.tf and are passed to child modules as input parameters.
# 
# Learn more by reading the docs: https://www.terraform.io/docs/configuration/variables.html
################################################################################################################################

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# Static project variables
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "lazy-otter-pipeline"
}

variable "tag_owner" {
  default = "Andrew Roberts"
}

variable "tag_purpose" {
  default = "lazy-otter-pipeline managed infra.. keep your paws off it"
}

variable "tag_days" {
  default = 120
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# Environment variables set using CLI
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

variable "SOLACE_USERNAME" {
  type = string
}

variable "SOLACE_PASSWORD" {
  type = string
}

variable "SOLACE_MESSAGE_VPN" {
  type = string
}

variable "SOLACE_HOST_AMQP" {
  type = string
}

variable "SOLACE_HOST_MQTT" {
  type = string
}

variable "SOLACE_HOST_MQTT_WSS" {
  type = string
}

variable "SOLACE_HOST_REST" {
  type = string
}

variable "SOLACE_HOST_SMF" {
  type = string
}

variable "SOLACE_HOST_WSS" {
  type = string
}
