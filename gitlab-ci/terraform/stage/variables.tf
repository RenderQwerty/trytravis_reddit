variable "project" {
  description = "Project id"
}

variable "region" {
  description = "Region"
  default     = "europe-west4"
}

variable "zone" {
  description = "Zone"
  default     = "europe-west4-a"
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

variable "instance_count" {
  description = "Count of app instances for load balancing"
  default     = "1"
}

variable "source_range" {
  type        = "list"
  description = "allow access from this ip's"
  default     = ["0.0.0.0/0"]
}

variable "provision_status" {
  description = "enable or disable provision scripts"
  default     = "true"
}

variable "ssh_port" {
  description = "ssh port for mongo db instance"
}
