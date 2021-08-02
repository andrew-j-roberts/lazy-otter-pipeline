################################################################################################################################
# services/_template/variables.tf
#
# This is a template for a service module's variables configuration file. 
# The values specified here are used by resource blocks in main.tf
################################################################################################################################

variable "service_name" {
  default = "ecommerce-order-simulator" # you need to update this - must match repository name
}

# - If set to permanent, a CloudWatch Alarm will be provisioned and desired_count will be set to 1 on the service instead of defaulting to 0.
# - If set to temporary, you'll have to manaually start the service, and deployments of new services to the cluster (a rereun of terraform apply) will reset your desirec_count to 0
variable "service_status" {
  default = "temporary"
  # default = "permanent" 
}

variable "service_threshold" {
  default = 1 # you can update this, threshold of # of tasks that must be running before alerting - N/A if service_status is not permanent
}

variable "sns_emails" {
  default = ["youremail@hotmail.com"] # you need to update this if service_status is set to "permanent"
}

variable "sns_protocol" {
  default = "email"
  # default = "email-json"
}

variable "fargate_cpu" {
  default = 256 # you can update this
}

variable "fargate_memory" {
  default = 512 # you can update this
}

variable "app_port" {
  default = 8080 # you can update this
}

variable "security_groups" {
  default = [""] # update this
}

variable "subnetids" {
  default = [""] # update this
}

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
# do not update below this flag, these variables are set as input variables by root module
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
variable "cluster_arn" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "execution_role_arn" {
  type = string
}
variable "task_role_arn" {
  type = string
}
variable "aws_region" {
  type = string
}
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
