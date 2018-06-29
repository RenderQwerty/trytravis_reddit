variable "project" {
  description = "Project id"
}

variable "region" {
  description = "Region"
  default     = "europe-west1-b"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "private_key_path" {
  description = "Path to private ssh key for provisioners"
}

variable "disk_image" {
  description = "Disk image"
}
