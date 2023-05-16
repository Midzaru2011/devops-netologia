# Заменить на ID своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_cloud_id" {
  default = "b1g6a0ordi02m0u7i976"
}

# Заменить на Folder своего облака
# https://console.cloud.yandex.ru/cloud?section=overview
variable "yandex_folder_id" {
  default = "b1g7uad4bpp6ioe1fc7h"
}

# Заменить на ID своего образа
# ID можно узнать с помощью команды yc compute image list
variable "centos-7-base" {
  default = "fd8diifib4139251duuu"
}

variable "yandex_token" {
  default = "y0_AgAAAAAG2ukMAATuwQAAAADWA5H3f9ZKPKQdQq-sUuF9fpSzmGk8hsg"
}
