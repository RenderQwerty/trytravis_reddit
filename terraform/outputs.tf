output "app_external_ip" {
  value = "${google_compute_instance.app.network_interface.0.access_config.0.assigned_nat_ip}"
}

output "image_family" {
  value = "${google_compute_instance.app.boot_disk.0.initialize_params.0.image}"
}
