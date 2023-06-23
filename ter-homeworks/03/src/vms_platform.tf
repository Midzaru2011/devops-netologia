variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "vm_web_name" {
  type = string
  default = "web"
  description = "Instance name web"
}

variable "vm_db_name" {
  type = string
  default = "db"
  description = "Instance name db"
}

variable "vm_web_image" {
  type = string
  default = "ubuntu-2004-lts"
  description = "image for VM"
}

variable "vm_db_image" {
  type = string
  default = "ubuntu-2004-lts"
  description = "image for VM"
}

variable "vm_web_platform" {
  type = string
  default = "standard-v1"
  description = "Platform name"
}

variable "vm_db_platform" {
  type = string
  default = "standard-v1"
  description = "Platform name"
}

variable "vm_web_resources" {
  type = map(number)
  default = {
    "cores" = 2,
    "memory"= 1,
    "core_fraction"= 5
  }
  description = "resources for DB VM"
}

variable "vm_db_resources" {
  type = map(number)
  default = {
    "cores" = 2,
    "memory"= 2,
    "core_fraction"= 20
  }
  description = "resources for DB VM"
}

variable "vm_web_network_interface_nat" {
  type = bool
  default = true
  description = "Network_interface"
}

variable "vm_db_network_interface_nat" {
  type = bool
  default = true
  description = "Network_interface for DB"
}

variable "vm_web_scheduling_policy" {
  type = bool
  default = true
  description = "scheduling_policy"
}

variable "vm_db_scheduling_policy" {
  type = bool
  default = true
  description = "scheduling_policy_db"
}

variable "vm_ssh" {
  type = map
  default = {
    "serial-port-enable" = 1
    "ssh-key" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRqpmsI9ISyEaoiodjUgXWaErcYOvdNsMu4XhFUwHlLjE8GHrnsLQBo/icvGaVdFwNarHnzoSQr6ZMOQzUZov93hxGMykYi6C5G/RAlRIcC+VsGLSyy7RZ1Y+Y1MH91CkxTERidryWcizKvgo0ufG1MCcLBqPmVAYYUiz5kyT9nengrNdAkPyP3QwpTKHFQF49MwATVdJoyiY/8u6LIys6Q4Ot6d6FbyHlWC4G+xxwyAUt+kyXhoCD1OobnkiPdefUgqvcMM10rXJd4xwQC7O9X2jg491RScR7BuRbg4+seQadkqKuvWHuzOy764AlZNxK0WXCk+cGDgWHkesdcAejCyafL22dffVhD5kgLRAiGxFVZmKHwYxJ5uxKHQBBByxprl+xhzc1ULYm7UzOoFyBeVBshUZRoARsTOEfh/kTid5W2sV05EN9sywS6guctCyoueu91W8cIYaZiNQhEJHNMY7qvl3IeEFdsY/jvNkZrcZeoMXuYw5NXMgMD7XMB9U= zag1988@mytest"
  }
  description = "ssh parametrs"
}

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDRqpmsI9ISyEaoiodjUgXWaErcYOvdNsMu4XhFUwHlLjE8GHrnsLQBo/icvGaVdFwNarHnzoSQr6ZMOQzUZov93hxGMykYi6C5G/RAlRIcC+VsGLSyy7RZ1Y+Y1MH91CkxTERidryWcizKvgo0ufG1MCcLBqPmVAYYUiz5kyT9nengrNdAkPyP3QwpTKHFQF49MwATVdJoyiY/8u6LIys6Q4Ot6d6FbyHlWC4G+xxwyAUt+kyXhoCD1OobnkiPdefUgqvcMM10rXJd4xwQC7O9X2jg491RScR7BuRbg4+seQadkqKuvWHuzOy764AlZNxK0WXCk+cGDgWHkesdcAejCyafL22dffVhD5kgLRAiGxFVZmKHwYxJ5uxKHQBBByxprl+xhzc1ULYm7UzOoFyBeVBshUZRoARsTOEfh/kTid5W2sV05EN9sywS6guctCyoueu91W8cIYaZiNQhEJHNMY7qvl3IeEFdsY/jvNkZrcZeoMXuYw5NXMgMD7XMB9U= zag1988@mytest"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_ssh_user" {
  type = string
  default = "ubuntu"
  description = "Root user for OS"
}
variable "size_hdd_disk" {
  type = number
  default = 1
  description = "Size hdd disk"
}