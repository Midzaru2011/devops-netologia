resource "yandex_compute_disk" "disk-hdd"{
    count = 3
    name = "disk-${count.index+1}"
    type = "network-hdd"
    size = var.size_hdd_disk
}

resource "yandex_compute_instance" "vm" {
    name = "storage"
    platform_id = var.vm_web_platform
  resources {
    cores         = var.vm_web_resources.cores
    memory        = var.vm_web_resources.memory
    core_fraction = var.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disk-hdd
    content {
        disk_id = yandex_compute_disk.disk-hdd[secondary_disk.key].id
    }
  }
    scheduling_policy {
    preemptible = var.vm_web_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_network_interface_nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    serial-port-enable = var.vm_ssh["serial-port-enable"]
    ssh-keys           = var.vm_ssh["ssh-key"]  
  }
}