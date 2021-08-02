################################################################################################################################
# services/variables.tf - do not edit any of these values, they are set as input variables
################################################################################################################################

variable "cluster_arn" {
  type = string
}
variable "cluster_name" {
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
