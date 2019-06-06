variable allowed_master_cidr_01 {
  default     = "127.0.0.1/32"
  description = "Allowed CIDR 01"
}

variable allowed_master_cidr_01_name {
  default     = "Localhost"
  description = "Allowed CIDR 01 name"
}

variable remote_state_bucket {
  description = "Bucket to load remote state for the infrastructure component"
}
