variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the public key used to connect to instance"
}

variable zone {
  description = "Zone"
}

variable disk_image {
  description = "Disk image for gitlab runner"
  default     = "gitlab-runner"
}

variable "source_range" {
  type        = "list"
  description = "allow access from this addresses"
}
variable "provision_status" {
  description = "enable or disable provision scripts"
  default     = "true"
}
