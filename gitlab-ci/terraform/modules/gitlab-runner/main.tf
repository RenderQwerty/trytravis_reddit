resource "google_compute_instance" "gitlab-runner" {
  count        = "${var.instance_count}"
  name         = "gitlab-runner${count.index}"
  machine_type = "n1-standard"
  zone         = "${var.zone}"
  tags         = ["gitlab-runner"]

  metadata {
    ssh-key = "appuser:${file(var.public_key_path)}"
  }

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }
}

  connection {
    host        = "${google_compute_instance.gitlab-runner.network_interface.0.access_config.0.assigned_nat_ip}"
    type        = "ssh"
    user        = "appuser"
    agent       = "false"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/deploy.sh"
  }


resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["${var.puma_port}"]
  }

  source_ranges = ["${var.source_range}"]
  target_tags   = ["reddit-app"]
}
