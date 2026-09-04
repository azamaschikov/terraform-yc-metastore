resource "yandex_metastore_cluster" "this" {
  name               = var.name
  folder_id          = var.folder_id
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
  service_account_id = var.service_account_id

  cluster_config = {
    resource_preset_id = var.resource_preset_id

    warehouse_config = var.warehouse_config == null ? null : {
      s3 = {
        bucket = var.warehouse_config.s3.bucket
        path   = var.warehouse_config.s3.path
      }
    }
  }

  version             = var.metastore_version
  description         = var.description
  deletion_protection = var.deletion_protection
  labels              = var.labels

  maintenance_window = var.maintenance_window == null ? null : {
    type = var.maintenance_window.type
    day  = var.maintenance_window.day
    hour = var.maintenance_window.hour
  }

  logging = var.logging == null ? null : {
    enabled      = var.logging.enabled
    folder_id    = var.logging.folder_id
    log_group_id = var.logging.log_group_id
    min_level    = var.logging.min_level
  }

  dynamic "timeouts" {
    for_each = var.timeouts == null ? [] : [var.timeouts]
    content {
      create = timeouts.value.create
      update = timeouts.value.update
      delete = timeouts.value.delete
    }
  }
}
