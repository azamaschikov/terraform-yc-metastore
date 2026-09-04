# Terraform module: Yandex Cloud Metastore

Terraform module for creating a managed Apache Hive Metastore cluster in Yandex Cloud.

The module wraps `yandex_metastore_cluster` and exposes the resource configuration as typed module variables.

## Requirements

- Terraform >= 1.3.0
- Yandex Cloud Terraform provider >= 0.213.0

## Usage

```hcl
module "metastore" {
  source = "./modules/metastore"

  name               = "metastore"
  folder_id          = var.folder_id
  subnet_ids         = [yandex_vpc_subnet.metastore.id]
  security_group_ids = [yandex_vpc_security_group.metastore.id]
  service_account_id = yandex_iam_service_account.metastore.id

  resource_preset_id = "c2-m8"

  warehouse_config = {
    s3 = {
      bucket = "my-metastore-warehouse"
      path   = "data/warehouse"
    }
  }

  version = "4.2"

  maintenance_window = {
    type = "WEEKLY"
    day  = "MON"
    hour = 12
  }

  logging = {
    enabled   = true
    folder_id = var.folder_id
    min_level = "INFO"
  }
}
```

## Notes

- `warehouse_config` is required by Yandex Cloud for HMS version 4.2 and later.
- For Cloud Logging, exactly one of `logging.folder_id` or `logging.log_group_id` should be configured.
- `maintenance_window.day` and `maintenance_window.hour` are required when `type = "WEEKLY"`.
- The service account used by the cluster needs the `managed-metastore.integrationProvider` role.

## Import

```bash
terraform import module.metastore.yandex_metastore_cluster.this <cluster-id>
```