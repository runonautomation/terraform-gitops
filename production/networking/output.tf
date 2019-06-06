output "project_id" {
  value       = "${local.project}"
  description = "Project ID"
}

output "network_a" {
  value       = "${google_compute_network.network_a.self_link}"
  description = "Network A identifier"
}

output "subnet_a1" {
  value       = "${google_compute_subnetwork.subnet_a1.self_link}"
  description = "Subnet Identifier"
}

output "subnet_a1_region" {
  value       = "${local.subnet_a1_region}"
  description = "Subnet Region"
}

output "subnet_a1_zone1" {
  value       = "${local.subnet_a1_zone1}"
  description = "Subnet suggested zone"
}

output "subnet_a1_zone2" {
  value       = "${local.subnet_a1_zone2}"
  description = "Subnet suggested zone"
}

output "subnet_a1_srv_ip_cidr_range_name" {
  value       = "${local.subnet_a1_srv_ip_cidr_range_name}"
  description = "Services range name"
}

output "subnet_a1_pod_ip_cidr_range_name" {
  value       = "${local.subnet_a1_pod_ip_cidr_range_name}"
  description = "Pods range name"
}

