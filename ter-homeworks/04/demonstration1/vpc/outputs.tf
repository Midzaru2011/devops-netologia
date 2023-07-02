output "vpc_id" {
  value = yandex_vpc_network.network.id
}

output "subnet_id" {
  value = yandex_vpc_subnet.subnet.id
}