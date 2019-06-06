data "terraform_remote_state" "networking" {
  backend = "gcs"
  config = {
    bucket = "${var.remote_state_bucket}"
    prefix = "terraform/state/production/networking"
  }
}