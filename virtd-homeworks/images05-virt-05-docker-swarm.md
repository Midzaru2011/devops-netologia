Домашнее задание к занятию 5. «Оркестрация кластером Docker контейнеров на примере Docker Swarm»
Задача 1
Дайте письменые ответы на вопросы:

В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?
Какой алгоритм выбора лидера используется в Docker Swarm-кластере?
Что такое Overlay Network?

Задача 2
Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.
Чтобы получить зачёт, предоставьте скриншот из терминала (консоли) с выводом команды:

[centos@node03 ~]$ sudo docker node ls
ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
l0udhugu1sva10jw5zygm9nab     node01.netology.yc   Ready     Active         Leader           24.0.0
rbg6erfwrdx48gs06i500qnxn     node02.netology.yc   Ready     Active         Reachable        24.0.0
x3ohco97h3xdgssahkhk7md2d *   node03.netology.yc   Ready     Active         Reachable        24.0.0
r2xletjo5hxguz4t2shylj2u0     node04.netology.yc   Ready     Active                          24.0.0
1msopx0shxeepbkq0hfm2a0bh     node05.netology.yc   Ready     Active                          24.0.0
mpzi5gx56iyefknnhzfojy9yu     node06.netology.yc   Ready     Active                          24.0.0

Задача 3
Создайте ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.
Чтобы получить зачёт, предоставьте скриншот из терминала (консоли), с выводом команды:

[centos@node03 ~]$ sudo docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
znvn70rbxlhd   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0    
8trqc57pyd4t   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
pznx7vo5kzlm   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest                         
rnethlz2edkz   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest                      
mxvwwvls678e   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4           
bieqobpzft4k   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0   
xead2g4vcyhb   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0       
hysyiiit95ho   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0                        

Задача 4 (*)
Выполните на лидере Docker Swarm-кластера команду, указанную ниже, и дайте письменное описание её функционала — что она делает и зачем нужна:

[centos@node01 ~]$ sudo docker swarm update --autolock=true
Swarm updated.
To unlock a swarm manager after it restarts, run the `docker swarm unlock`
command and provide the following key:

    SWMKEY-1-8r37RBr68PDsHwu68nsXa0nlCWxB/Taj0JpyWYo4XnA

Please remember to store this key in a password manager, since without it you
will not be able to restart the manager.



