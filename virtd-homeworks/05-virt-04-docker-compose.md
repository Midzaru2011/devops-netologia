### Задача 1
Создайте собственный образ любой операционной системы (например ubuntu-20.04) с помощью Packer (инструкция).

-Скриншот страницы с созданным образом из личного кабинета YandexCloud.
![image](https://github.com/Midzaru2011/devops-netologia/assets/102572340/8e9ddba6-0a3c-4704-8683-9e065a04bc4b)

### Задача 2
Создать вашу первую виртуальную машину в Яндекс.Облаке.

-Скриншот созданной ВМ с помощью Terraform: 
![image](https://github.com/Midzaru2011/devops-netologia/assets/102572340/f88cf7bc-a848-46ea-8cec-10e4b13aba77)

```shell
zag1988@ubuntu-2204:~/Terraform/terraform$ terraform apply

yandex_vpc_network.default: Refreshing state... [id=enpgls1567q0hn5grlao]

yandex_vpc_subnet.default: Refreshing state... [id=e9b0oouvbpguabjutodv]


Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:

  + create

Terraform will perform the following actions:
  # yandex_compute_instance.node01 will be created
  + resource "yandex_compute_instance" "node01" {
      + allow_stopping_for_update = true
      + created_at                = (known after apply)
      + folder_id                 = (known after apply)
      + fqdn                      = (known after apply)
      + gpu_cluster_id            = (known after apply)
      + hostname                  = "node01.netology.cloud"
      + id                        = (known after apply)
      + metadata                  = {
          + "ssh-keys" = <<-EOT
                centos:"centos"
            EOT
        }
      + name                      = "node01"
      + network_acceleration_type = "standard"
      + platform_id               = "standard-v1"
      + service_account_id        = (known after apply)

      + status                    = (known after apply)
      + zone                      = "ru-central1-a"
      + boot_disk {
          + auto_delete = true
          + device_name = (known after apply)
          + disk_id     = (known after apply)
          + mode        = (known after apply)
          + initialize_params {
              + block_size  = (known after apply)
              + description = (known after apply)
              + image_id    = "fd8diifib4139251duuu"
              + name        = "root-node01"
              + size        = 50
              + snapshot_id = (known after apply)
              + type        = "network-nvme"
            }
        }
      + network_interface {
          + index              = (known after apply)
          + ip_address         = (known after apply)
          + ipv4               = true
          + ipv6               = (known after apply)
          + ipv6_address       = (known after apply)
          + mac_address        = (known after apply)
          + nat                = true
          + nat_ip_address     = (known after apply)
          + nat_ip_version     = (known after apply)
          + security_group_ids = (known after apply)
          + subnet_id          = "e9b0oouvbpguabjutodv"
        }
      + resources {
          + core_fraction = 100
          + cores         = 8
          + memory        = 8
        }
    }
Plan: 1 to add, 0 to change, 0 to destroy.
Changes to Outputs:
  ~ external_ip_address_node01_yandex_cloud = "158.160.61.59" -> (known after apply)
  ~ internal_ip_address_node01_yandex_cloud = "192.168.101.25" -> (known after apply)
Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
  Enter a value: yes
yandex_compute_instance.node01: Creating...
yandex_compute_instance.node01: Still creating... [10s elapsed]
yandex_compute_instance.node01: Still creating... [20s elapsed]
yandex_compute_instance.node01: Still creating... [30s elapsed]
yandex_compute_instance.node01: Still creating... [40s elapsed]
yandex_compute_instance.node01: Creation complete after 49s [id=fhmmka9t401199082sn4]
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
Outputs:
external_ip_address_node01_yandex_cloud = "158.160.102.74"
internal_ip_address_node01_yandex_cloud = "192.168.101.7"
```
