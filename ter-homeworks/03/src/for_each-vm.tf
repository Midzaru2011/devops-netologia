
resource "yandex_compute_instance" "web" {
  for_each = { main = {cpu=4, ram=2, fraction=20}, replica = {cpu=4, ram=2, fraction=20} }
  depends_on = [ 
    yandex_compute_instance.webcou ]
  name        = "${each.key}"
  platform_id = var.vm_web_platform
  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
    core_fraction = "${each.value.fraction}"
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy
  }
  network_interface {
    nat       = var.vm_web_network_interface_nat
    subnet_id = yandex_vpc_subnet.develop.id
  }

   metadata = {
    serial-port-enable = var.vm_ssh["serial-port-enable"]
    ssh-keys           = var.vm_ssh["ssh-key"]
  }
}