provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "gitlab-runner" {
  source               = "../modules/gitlab-runner"
  public_key_path      = "${var.public_key_path}"
  private_key_path     = "${var.private_key_path}"
  zone                 = "${var.zone}"
  source_range         = "${var.source_range}"
  disk_image           = "${var.disk_image}"
  provision_status     = "${var.provision_status}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["${var.source_range}"]
}
