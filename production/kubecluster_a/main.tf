locals {
  name           = "kubecluster-a"
  project        = "${data.terraform_remote_state.networking.outputs["project_id"]}"
  network        = "${data.terraform_remote_state.networking.outputs["network_a"]}"
  subnetwork     = "${data.terraform_remote_state.networking.outputs["subnet_a1"]}"
  cluster_range  = "${data.terraform_remote_state.networking.outputs["subnet_a1_pod_ip_cidr_range_name"]}"
  services_range = "${data.terraform_remote_state.networking.outputs["subnet_a1_srv_ip_cidr_range_name"]}"
  region         = "${data.terraform_remote_state.networking.outputs["subnet_a1_region"]}"
  zone1          = "${data.terraform_remote_state.networking.outputs["subnet_a1_zone1"]}"
  zone2          = "${data.terraform_remote_state.networking.outputs["subnet_a1_zone2"]}"
  node_locations = ["${local.zone1}", "${local.zone2}"]
}

module "kubecluster_a" {
  source         = "github.com/runonautomation/terraform-google-gke-private"
  name           = "${local.name}"
  network        = "${local.network}"
  subnetwork     = "${local.subnetwork}"
  project        = "${local.project}"
  location       = "${local.region}"
  node_locations = "${local.node_locations}"
  cluster_range  = "${local.cluster_range}"
  services_range = "${local.services_range}"
  manc           = {
    "World" : "0.0.0.0/0"
  }
}
