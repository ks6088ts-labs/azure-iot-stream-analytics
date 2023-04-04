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

variable "job_name" {
  description = "The name of the Stream Analytics job to create."
  type        = string
}

variable "iothub_namespace" {
  description = "The name of the input IoT Hub namespace."
  type        = string
}

variable "iothub_shared_access_policy_key" {
  description = "The shared access policy key for the input IoT Hub namespace"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account."
  type        = string
}

variable "storage_account_key" {
  description = "The name of the storage account key."
  type        = string
}

variable "storage_container_name" {
  description = "The name of the storage container."
  type        = string
}
