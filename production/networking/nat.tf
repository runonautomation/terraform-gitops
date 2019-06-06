##
# Regional routers / NAT
##
resource "google_compute_router" "router" {
  name    = "${local.name}"
  region  = "${local.subnet_a1_region}"
  project = "${local.project}"
  network = "${google_compute_network.network_a.id}"
  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat1" {
  name                               = "${local.name}"
  project                            = "${local.project}"
  router                             = "${google_compute_router.router.name}"
  region                             = "${local.subnet_a1_region}"
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}