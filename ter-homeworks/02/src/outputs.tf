output "web" {
    value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}
output "db" {
    value = yandex_compute_instance.platform-1.network_interface.0.nat_ip_address
}