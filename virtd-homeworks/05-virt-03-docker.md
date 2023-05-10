## Задача 1. 
1. Был скачен официальный образ Nginx  из dockerhub:
```
docker pull nginx
```
2. Сформировали Dockerfile, указав исходный образ для сборки и инструкцию RUN для записи html-кода в index.html:
```
FROM nginx
RUN echo "<html><head>Hey, Netology</head><body><h1>I’m DevOps Engineer!</h1></body></html>" >/usr/share/nginx/html/index.html
```
3. Запустил сборку образа, указав тэг образа:
```
sudo docker build -t midzaru2011/my-nginx:1.0 .
```
4. Запускаем контейнер из созданного образа, используя флаги -d (запуск контейнера в режиме демона), -p(маппинг портов локального хоста и контейнера):
```
docker run -d -p 127.0.0.1:8080:80 midzaru2011/nginx:1.0
```
5. Проверка исполнения инструкции:
```
curl 127.0.0.1:8080
```
6. Остановка контейнера:
```
docker stop 64e0e553140f
```
7. Отправка созданого докер образа в репозиторий Dockerhub:
```
sudo docker push midzaru2011/nginx:1.0
```
8. Ссылка [midzaru2011](https://hub.docker.com/r/midzaru2011/my-nginx)

## Задача 2.
Посмотрите на сценарий ниже и ответьте на вопрос: «Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?»

Детально опишите и обоснуйте свой выбор.

--

#### Высоконагруженное монолитное Java веб-приложение;
Так как приложение монолитное, то очень требовательное к ресурсам, к тому же, сложно разбить на микросервисы и управлять на уровне контейнеров. Лучше подойдет использование физической или виртуальной машины.

#### Nodejs веб-приложение;
Контейнеризация лучше всего подойдет для данного сценария, так как позволит собрать в изолированную среду многочисленные компоненты веб-приложения, обеспечит легкость раскатки, масштабирования, отказоустойчивость.

#### Мобильное приложение c версиями для Android и iOS;
Иследуя источники, не нашел информации относительно примененеия контейнеризации для разработки приложений под iOS. Разработка ослжожняеться тем, что возможна только в периметре macOS, поэтому, наиболее подходящее и стабильное решение это использование физ.машины или виртуальной. Для Android есть успешно применяемые решения с применнением контейнерезации. 

#### Шина данных на базе Apache Kafka;
Docker отлично подойдет для создания и управления кластером Kafka. Возможность масштабирования, обеспечение отказоустойчивости, быстрый откат в случаи необходимости восстановить предыдущее работоспособное состояние.

#### Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;
Docker подходит очень хорошо - готовые образы, быстрая настройка, удобное управление кластером.

#### Мониторинг-стек на базе Prometheus и Grafana;
Так же как и предыдущая задача, отлично подойдет контейнеризация. Гибкая настройка сети, изоляция ресурсов контейнера, быстрая развертка на других машинах. 

#### MongoDB как основное хранилище данных для Java-приложения;
Для среды разработки вполне подойдет использование БД в контейнерах. Но на пром среде, я считаю, все же лучше использовать физическую либо виртуальную машины, так как они обеспечивают большую производительность. Но и допускаю использование контейнеров и в Проме, не зря же на DockerHub есть официальный образ Mongo.

#### Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry;
Есть так же официальный докер образ для быстрого развертывания приватного реестра образов. Другие процессы CI/CD так же удобнее и быстрее запускат и обслуживать через докер контейнерыю.

## Задача 3.
Запуск контейнера my-centos на основе образа centos:
```shell
zag1988@ubuntu-2204:~$ docker run -it -d -v /data:/data --name my-centos centos

Unable to find image 'centos:latest' locally

latest: Pulling from library/centos

a1d0c7532777: Pull complete 

Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177

Status: Downloaded newer image for centos:latest

5419b27ed3ab6aff3baff302abe99a704915de47512ee65e3353dc3fd88188be

```
Создание файла в контейнере my-centos в каталоге /data:

```shell
zag1988@ubuntu-2204:~$ sudo docker exec -it my-centos bash

[root@174d39a865dd /]# cat data/myfile.html 

Hi, it is test file!

```

Запуск контейнера из образа debian:

```shell
zag1988@ubuntu-2204:~$ docker run -it -d -v /data:/data --name my-debian debian

f80985393e702b34c6ac3f7f0d183ae70ce8c7b9e7fcdd6836bb06451d65127c

```

Листинг каталога /data в контейнере my-debian

```shell
root@f80985393e70:/data# ls -l

total 4

-rw-r--r-- 1 root root 21 May  8 09:12 myfile.html

root@f80985393e70:/data# exit

exit

```
#### Задача 4.
Сборка образа контейнера из dockerfile:

```shell
zag1988@ubuntu-2204:~/docker-nginx/task4$ sudo docker build -t midzaru2011/ansible:1.01 .

[+] Building 242.7s (9/9) FINISHED                                                                                                                         
 => [internal] load .dockerignore                                                                                                                                                                     0.0s
 => => transferring context: 2B                                                                                                                                                                       0.0s
 => [internal] load build definition from dockerfile                                                                                                                                                  0.0s
 => => transferring dockerfile: 1.10kB                                                                                                                                                                0.0s
 => [internal] load metadata for docker.io/library/alpine:3.14                                                                                                                                        1.8s
 => [auth] library/alpine:pull token for registry-1.docker.io                                                                                                                                         0.0s
 => [1/4] FROM docker.io/library/alpine:3.14@sha256:0f2d5c38dd7a4f4f733e688e3a6733cb5ab1ac6e3cb4603a5dd564e5bfb80eed                                                                                  0.8s
 => => resolve docker.io/library/alpine:3.14@sha256:0f2d5c38dd7a4f4f733e688e3a6733cb5ab1ac6e3cb4603a5dd564e5bfb80eed                                                                                  0.0s
 => => sha256:0f2d5c38dd7a4f4f733e688e3a6733cb5ab1ac6e3cb4603a5dd564e5bfb80eed 1.64kB / 1.64kB                                                                                                        0.0s
 => => sha256:71859b0c62df47efaeae4f93698b56a8dddafbf041778fd668bbd1ab45a864f8 528B / 528B                                                                                                            0.0s
 => => sha256:9e179bacf43c4d3428d57cf459799ba0285b901945f9eccb17b6da056d3532c7 1.47kB / 1.47kB                                                                                                        0.0s
 => => sha256:f7dab3ab2d6ec29aa28769bec35331fb485b5837501b1e8556413d8b5a79c9c8 2.83MB / 2.83MB                                                                                                        0.7s
 => => extracting sha256:f7dab3ab2d6ec29aa28769bec35331fb485b5837501b1e8556413d8b5a79c9c8                                                                                                             0.1s
 => [2/4] RUN CARGO_NET_GIT_FETCH_WITH_CLI=1 &&     apk --no-cache add         sudo         python3        py3-pip         openssl         ca-certificates         sshpass         openssh-client   236.1s
 => [3/4] RUN mkdir /ansible &&     mkdir -p /etc/ansible &&     echo 'localhost' > /etc/ansible/hosts                                                                                                0.4s
 => [4/4] WORKDIR /ansible                                                                                                                                                                            0.0s 
 => exporting to image                                                                                                                                                                                3.5s 
 => => exporting layers                                                                                                                                                                               3.5s 
 => => writing image sha256:cf4cd72908305b6e1aa167a1f8f3e1a3eb9ef9308165f97942f49265de9d91a4                                                                                                          0.0s 
 => => naming to docker.io/midzaru2011/ansible:1.01                                             
 
 ```
Публикация образа на DockerHub

```shell
zag1988@ubuntu-2204:~/docker-nginx/task4$ docker push midzaru2011/ansible:1.01
The push refers to repository [docker.io/midzaru2011/ansible]
5f70bf18a086: Mounted from etidev/elk-docker 
8b76dd874751: Pushed 
661992bcb220: Pushed 
9733ccc39513: Mounted from library/alpine 
1.01: digest: sha256:7b8479d3c994db7f0110f94ef3022f4760df9017b9a49afb8731d447fa408484 size: 1153
```
Ссылка [midzaru2011](https://hub.docker.com/r/midzaru2011/ansible)
