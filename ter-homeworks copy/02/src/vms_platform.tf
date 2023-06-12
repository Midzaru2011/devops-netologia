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

variable "vm_web_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILc4+LMgEeUZLBqtvUAi0lVLLJugXMSKd31Os62fwGGR zag1988@ubuntu-2204"
  description = "ssh-keygen -t ed25519"
}

variable "vm_db_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILc4+LMgEeUZLBqtvUAi0lVLLJugXMSKd31Os62fwGGR zag1988@ubuntu-2204"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_ssh_user" {
  type = string
  default = "ubuntu"
  description = "Root user for OS"
}

variable "vm_db_ssh_user" {
  type = string
  default = "ubuntu"
  description = "Root user for OS"
}