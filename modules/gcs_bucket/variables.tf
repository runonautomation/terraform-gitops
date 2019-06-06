variable "name" {
  default = ""
  description = "Exact name of the storage bucket to create"
}

variable "generateName" {
  default = "bucket"
  description = "Bucket name prefix"
}

variable "location" {
  default = "EU"
  description = "Location of the storage bucket"
}

variable "project" {
  description = "Project for the bucket creation"
}