
resource "random_id" "id" {
  count = "${var.name == "" ? 1 : 0 }"
  byte_length = 4
}

locals {
  genName = "${var.generateName}-${random_id.id.0.hex}"
  name  = "${var.name == "" ? local.genName : var.name }"
}

resource "google_storage_bucket" "bucket" {
  name     = "${local.name}"
  location = "${var.location}"
  project  = "${var.project}"
}