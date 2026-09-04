output "id" {
  description = "Metastore cluster ID."
  value       = yandex_metastore_cluster.this.id
}

output "name" {
  description = "Metastore cluster name."
  value       = yandex_metastore_cluster.this.name
}

output "folder_id" {
  description = "Folder ID containing the cluster."
  value       = yandex_metastore_cluster.this.folder_id
}

output "network_id" {
  description = "VPC network ID attached to the cluster."
  value       = yandex_metastore_cluster.this.network_id
}

output "endpoint_ip" {
  description = "Metastore server balancer endpoint IP."
  value       = yandex_metastore_cluster.this.endpoint_ip
}

output "status" {
  description = "Current Metastore cluster status."
  value       = yandex_metastore_cluster.this.status
}

output "created_at" {
  description = "Cluster creation timestamp."
  value       = yandex_metastore_cluster.this.created_at
}
