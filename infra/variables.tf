variable "location" {
  description = "The supported Azure location where the resource deployed"
  type        = string
  default     = "japaneast"
}

variable "environment_name" {
  description = "The name of the azd environment to be deployed"
  type        = string
  default     = "iot-stream-analytics"
}
