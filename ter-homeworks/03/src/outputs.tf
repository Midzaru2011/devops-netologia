output "instance_ip_addr_webcou" {
    value = yandex_compute_instance.webcou[*].network_interface.0.nat_ip_address
}

output "instance_ip_addr_web_main" {
    value = yandex_compute_instance.web["main"].network_interface.0.nat_ip_address
}
output "instance_ip_addr_web_replica" {
    value = yandex_compute_instance.web["replica"].network_interface.0.nat_ip_address
}

output "instance_ip_addr_vm" {
  value = yandex_compute_instance.vm.network_interface.0.nat_ip_address
}
