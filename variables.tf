variable "name" {
  description = "Metastore cluster name."
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud folder ID. If null, the provider default folder is used."
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "VPC subnet IDs attached to the Metastore cluster."
  type        = set(string)
}

variable "security_group_ids" {
  description = "Security group IDs applied to the Metastore cluster."
  type        = set(string)
  default     = []
}

variable "service_account_id" {
  description = "Service account ID used by Metastore. It must have the managed-metastore.integrationProvider role."
  type        = string
}

variable "resource_preset_id" {
  description = "Metastore compute resource preset ID, for example c2-m8."
  type        = string
}

variable "warehouse_config" {
  description = "Warehouse configuration. Required for HMS version 4.2 and later."
  type = object({
    s3 = object({
      bucket = string
      path   = optional(string)
    })
  })
  default = null
}

variable "metastore_version" {
  description = "Metastore server version."
  type        = string
  default     = null
}

variable "description" {
  description = "Metastore cluster description."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Protect the cluster from accidental deletion."
  type        = bool
  default     = false
}

variable "labels" {
  description = "Labels assigned to the Metastore cluster."
  type        = map(string)
  default     = {}
}

variable "maintenance_window" {
  description = "Maintenance window configuration."
  type = object({
    type = string
    day  = optional(string)
    hour = optional(number)
  })
  default = null
}

variable "logging" {
  description = "Cloud Logging configuration. Exactly one of folder_id or log_group_id should be set."
  type = object({
    enabled      = bool
    folder_id    = optional(string)
    log_group_id = optional(string)
    min_level    = optional(string)
  })
  default = null
}

variable "timeouts" {
  description = "Optional Terraform operation timeouts."
  type = object({
    create = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
