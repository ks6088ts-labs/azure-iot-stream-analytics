variable "location" {
  description = "The supported Azure location where the resource deployed"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group to deploy resources into"
  type        = string
}

variable "tags" {
  description = "A list of tags used for deployed services."
  type        = map(string)
}

variable "iothub_name" {
  description = "The name of the Azure IoT Hub"
  type        = string
}

variable "sku" {
  description = "The name of the SKU used for this Azure IoT Hub"
  type        = string
  default     = "F1"
}

variable "capacity" {
  description = "The number of provisioned IoT Hub units"
  type        = string
  default     = "1"
}
