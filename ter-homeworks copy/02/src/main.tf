resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image
}
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
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
  scheduling_policy {
    preemptible = var.vm_web_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_network_interface_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vm_web_ssh_root_key}"
  }
}

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_image
}

resource "yandex_compute_instance" "platform-1" {
  name        = "netology-develop-platform-db"
  platform_id = var.vm_db_platform
  resources {
    cores         = var.vm_db_resources.cores
    memory        = var.vm_db_resources.memory
    core_fraction = var.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_scheduling_policy
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_db_network_interface_nat
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vm_db_ssh_root_key}"
  }
}