provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source               = "../modules/app"
  public_key_path      = "${var.public_key_path}"
  private_key_path     = "${var.private_key_path}"
  zone                 = "${var.zone}"
  source_range         = "${var.source_range}"
  app_disk_image       = "${var.app_disk_image}"
  db_address           = "${module.db.db_internal_ip}"
  app_provision_status = "${var.app_provision_status}"
}

module "db" {
  source           = "../modules/db"
  public_key_path  = "${var.public_key_path}"
  private_key_path = "${var.private_key_path}"
  zone             = "${var.zone}"
  db_disk_image    = "${var.db_disk_image}"
  ssh_port         = "${var.ssh_port}"
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["${var.source_range}"]
}
