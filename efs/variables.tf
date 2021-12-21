variable "envrionment" {
  type = string
  description = "The current envrionment"
}

variable "kms_alias" {
  type = string
  description = "The alias for the kms key"
}


variable "creation_token" {
  type = string
  description = "A unique name (a maximum of 64 characters are allowed) used as reference when creating the Elastic File System to ensure idempotent file system creation."
}

variable "encrypted" {
  type = bool
  description = "If the disk will be encrypted or not."
}
variable "eks_cluster" {
  type = string
  description = "The name of the eks cluster."
}

variable "performance_mode" {
  type         = string
  description = "The file system performance mode. Can be either generalPurpose or maxIO"
  default     = "generalPurpose"
}

variable "throughput_mode" {
  type        = string
  description = "Throughput mode for the file system, valid values are bursting, provisioned."
  default     = "bursting"
}

variable "vpc_id" {
  type        = string
  description = "The id of the  prod vpc"
}

variable "cluster_security_group" {
  type        = string
  description = "The sg of the uat cluster."
}


variable "created_by" {
  type        = string
  description = "Who created the terraform and applied it"
}