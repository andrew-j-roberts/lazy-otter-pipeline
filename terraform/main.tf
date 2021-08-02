################################################################################################################################
# main.tf
#
# This is the entry point configuration file for the project. It includes the top level modules required for this project.
# In the module declaration blocks, input variables are set to the values of the variables defined in variables.tf.
# Input variables are how you pass environment variables, modules outputs, and/or static default values to child modules.
#
# Learn more by reading the docs: https://www.terraform.io/docs/configuration/modules.html
################################################################################################################################

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# providers
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# terraform settings and state bucket
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

terraform {
  backend "s3" {
    bucket = "lazy-otter-pipeline-tf-backend"
    key    = "main"
    region = "us-east-1"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "lazy-otter-pipeline-tf-backend"

  versioning {
    enabled = true
  }
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# modules
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-

module "cluster" {
  source = "./modules/cluster"

  project_name = var.project_name
  tag_owner    = var.tag_owner
  tag_purpose  = var.tag_purpose
  tag_days     = var.tag_days
}

module "services" {
  source = "./modules/services"

  cluster_arn          = module.cluster.arn
  cluster_name         = module.cluster.name
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

