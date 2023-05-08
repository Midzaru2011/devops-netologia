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
