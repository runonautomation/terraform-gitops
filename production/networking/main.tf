locals {
  ## TODO: For production, reference a project structure remote state
  project    = "${var.networking_project}"
  name       = "network-a"
  subnet_a1_region     = "us-east1"
  subnet_a1_zone1      = "us-east1-c"
  subnet_a1_zone2      = "us-east1-b"
  subnet_a1_core_ip_cidr_range = "10.1.0.0/16"
  subnet_a1_srv_ip_cidr_range = "10.101.0.0/16"
  subnet_a1_srv_ip_cidr_range_name = "services1"
  subnet_a1_pod_ip_cidr_range = "10.201.0.0/16"
  subnet_a1_pod_ip_cidr_range_name = "pods1"
}

resource "google_compute_network" "network_a" {
  name                    = "${local.name}"
  project                 = "${local.project}"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet_a1" {
  name          = "${local.name}"
  region        = "${local.subnet_a1_region}"
  project       = "${local.project}"
  network       = "${google_compute_network.network_a.id}"
  ip_cidr_range = "${local.subnet_a1_core_ip_cidr_range}"
  secondary_ip_range {
    range_name    = "${local.subnet_a1_srv_ip_cidr_range_name}"
    ip_cidr_range = "${local.subnet_a1_srv_ip_cidr_range}"
  }
  secondary_ip_range {
    range_name    = "${local.subnet_a1_pod_ip_cidr_range_name}"
    ip_cidr_range = "${local.subnet_a1_pod_ip_cidr_range}"
  }
  private_ip_google_access = "true"
}

resource "google_storage_bucket" "testgitops" {
  name          = "testgitopasds"
  location      = "EU"
  project       = "${local.project}"
}