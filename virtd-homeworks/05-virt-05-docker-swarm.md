Домашнее задание к занятию 5. «Оркестрация кластером Docker контейнеров на примере Docker Swarm»

### Задача 1
Дайте письменые ответы на вопросы:

## В чём отличие режимов работы сервисов в Docker Swarm-кластере: replication и global?
При развертывание сервиса в режиме `global`, контейнеры с сервисом будут распределены по всем нодам кластера, тоесть на всех нодах будет запущен один контейнер сервиса. Если у нас кластер будет состоять, к примеру, из 5 нод, то сервис будет запущен на каждой ноде по одному контейнеру. Таким образом, колличество реплик сервиса будет = 5, и при добавлении новой ноды в кластер, контейнер автоматически развернется на новой ноде.

При запуске режима `replication`, мы можем запустить желаемое колличество реплик сервиса, при этом, распределение реплиr будет происходить рандомно, тоесть контеqнеры могут быть все запущены на одной ноде, или разбиты по разным, но так чтобы сохранилось колличество обозначенных реплик. 

## Какой алгоритм выбора лидера используется в Docker Swarm-кластере?
В кластере может работать одновременно несколько управляющих нод, что позволяет своевременно заменить вышедшего из строя так называемаго лидера. Лидер в кластере выбирается на основе алгоритма консенсуса **Raft**, тоесть обеспечивается  принцип согласованности. Ноды в кластере стартуют со статусом `follower`, затем, если по прошествии определенного таймаута (от 150 до 300 мс) , `followers` не слышат лидера, они могут стать `candidate`. Затем `candidate` отправляет запросы к другим нодам, таким образом голосуя за себя. В итоге, `candidate` становится `leader`, если получил голоса от большинства нод. Затем `leader` начинает слать сообщения об своем статусе, а слушатель в свою очередь возращает ответ. Если лидер в какой то момент перестает отвечать, то нода в кластере становится `candidate`, и так же запускается процесс голосования. 
## Что такое Overlay Network?

### Задача 2
Создайте ваш первый Docker Swarm-кластер в Яндекс Облаке.
Чтобы получить зачёт, предоставьте скриншот из терминала (консоли) с выводом команды:

```shell
[centos@node03 ~]$ sudo docker node ls
ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
l0udhugu1sva10jw5zygm9nab     node01.netology.yc   Ready     Active         Leader           24.0.0
rbg6erfwrdx48gs06i500qnxn     node02.netology.yc   Ready     Active         Reachable        24.0.0
x3ohco97h3xdgssahkhk7md2d *   node03.netology.yc   Ready     Active         Reachable        24.0.0
r2xletjo5hxguz4t2shylj2u0     node04.netology.yc   Ready     Active                          24.0.0
1msopx0shxeepbkq0hfm2a0bh     node05.netology.yc   Ready     Active                          24.0.0
mpzi5gx56iyefknnhzfojy9yu     node06.netology.yc   Ready     Active                          24.0.0
```

### Задача 3
Создайте ваш первый, готовый к боевой эксплуатации кластер мониторинга, состоящий из стека микросервисов.
Чтобы получить зачёт, предоставьте скриншот из терминала (консоли), с выводом команды:

```shell
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
```

Задача 4 (*)
Выполните на лидере Docker Swarm-кластера команду, указанную ниже, и дайте письменное описание её функционала — что она делает и зачем нужна:

```shell
[centos@node01 ~]$ sudo docker swarm update --autolock=true
Swarm updated.
To unlock a swarm manager after it restarts, run the `docker swarm unlock`
command and provide the following key:

    SWMKEY-1-8r37RBr68PDsHwu68nsXa0nlCWxB/Taj0JpyWYo4XnA

Please remember to store this key in a password manager, since without it you
will not be able to restart the manager.
```


