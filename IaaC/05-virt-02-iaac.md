## Задача 1
***Опишите основные преимущества применения на практике IaaC-паттернов:***

- Увеличение скорости ввода продукта в промышленную среду, снижение time to market;
- Среда разработки, тестирования и эксплуатации более стабильны, так как снижается влияние человеческого фактора;
- В зависимости от изменения нагрузки на приложение, быстро и просто можно масштабировать среду, а декларативный способ развертывания, позволяет сохранить принцип 
идемпотентности, тоесть ожидаемость повторения результата.Поэтому основополагающий принцип — это идемпотентность, так как, это именно то что Iaac 
позволяет получить ожидаемый и стабильный  результат при различном количестве повторений.
___

## Задача 2
***Чем Ansible выгодно отличается от других систем управление конфигурациями:***

-Работает без агентов, использует SSH;
-Используется простой и интуитивно понятный язык yml;
-Большое колличество готовых к использованию playbooks;
-При запуске сценария  подробный логфайл для анализа возникших ошибок;
-Стабильность в работе и идемпотентность.

***Какой, на ваш взгляд, метод работы систем конфигурации более надёжный — push или pull:***

-Думаю, что более безопасен и надежен метод pull, так как получение и применение конфигурации происходит изнутри хоста/кластера 
и ни один внешний клиент не имеет прав на внесение изменений в кластер.

## Задача 3
***Приложите вывод команд установленных версий каждой из программ, оформленный в Markdown:***

```shell
zag1988@ubuntu-2204:~$ vboxmanage --version
6.1.38_Ubuntur153438
```

```shell
zag1988@ubuntu-2204:~$ vagrant version 
Installed Version: 2.2.19
Vagrant was unable to check for the latest version of Vagrant.
Please check manually at https://www.vagrantup.com
```

```shell
zag1988@ubuntu-2204:~$ ansible --version
ansible 2.10.8
  config file = None
  configured module search path = ['/home/zag1988/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0]
```

```shell
zag1988@ubuntu-2204:~$ terraform --version
Terraform v1.4.6
on linux_amd64
```

## Задача 4
***Воспроизвести практическую часть лекции самостоятельно:***

### Копируем файлы конфигурации в каталог откуда будет создана ВМ и запускаем создание командой `vagrant up`

```shell
zag1988@ubuntu-2204:~/VAGRANT$ vagrant up
Bringing machine 'server1.netology' up with 'virtualbox' provider...
==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
==> server1.netology: Matching MAC address for NAT networking...
==> server1.netology: Setting the name of the VM: server1.netology
==> server1.netology: Clearing any previously set network interfaces...
==> server1.netology: Preparing network interfaces based on configuration...
    server1.netology: Adapter 1: nat
    server1.netology: Adapter 2: hostonly
==> server1.netology: Forwarding ports...
    server1.netology: 22 (guest) => 20011 (host) (adapter 1)
    server1.netology: 22 (guest) => 2222 (host) (adapter 1)
==> server1.netology: Running 'pre-boot' VM customizations...
==> server1.netology: Booting VM...
==> server1.netology: Waiting for machine to boot. This may take a few minutes...
    server1.netology: SSH address: 127.0.0.1:2222
    server1.netology: SSH username: vagrant
    server1.netology: SSH auth method: private key
    server1.netology: Warning: Connection reset. Retrying...
    server1.netology: Warning: Remote connection disconnect. Retrying...
    server1.netology: Warning: Connection reset. Retrying...
    server1.netology: 
    server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
    server1.netology: this with a newly generated keypair for better security.
    server1.netology: 
    server1.netology: Inserting generated public key within guest...
    server1.netology: Removing insecure key from the guest if it's present...
    server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
==> server1.netology: Machine booted and ready!
==> server1.netology: Checking for guest additions in VM...
    server1.netology: The guest additions on this VM do not match the installed version of
    server1.netology: VirtualBox! In most cases this is fine, but in rare cases it can
    server1.netology: prevent things such as shared folders from working properly. If you see
    server1.netology: shared folder errors, please make sure the guest additions within the
    server1.netology: virtual machine match the version of VirtualBox you have installed on
    server1.netology: your host and reload your VM.
    server1.netology: 
    server1.netology: Guest Additions Version: 7.0.6
    server1.netology: VirtualBox Version: 6.1
==> server1.netology: Setting hostname...
==> server1.netology: Configuring and enabling network interfaces...
==> server1.netology: Mounting shared folders...
    server1.netology: /vagrant => /home/zag1988/VAGRANT
==> server1.netology: Running provisioner: ansible...
    server1.netology: Running ansible-playbook...

PLAY [nodes] *******************************************************************

TASK [Gathering Facts] *********************************************************
ok: [server1.netology]

TASK [Create directory for ssh-keys] *******************************************
ok: [server1.netology]

TASK [Adding rsa-key in /root/.ssh/authorized_keys] ****************************
An exception occurred during task execution. To see the full traceback, use -vvv. The error was: If you are using a module and expect the file to exist on the remote, see the remote_src option
fatal: [server1.netology]: FAILED! => {"changed": false, "msg": "Could not find or access '~/.ssh/id_rsa.pub' on the Ansible Controller.\nIf you are using a module and expect the file to exist on the remote, see the remote_src option"}
...ignoring

TASK [Checking DNS] ************************************************************
changed: [server1.netology]

TASK [Installing tools] ********************************************************
ok: [server1.netology] => (item=['git', 'curl'])

TASK [Installing docker] *******************************************************
changed: [server1.netology]

TASK [Add the current user to docker group] ************************************
changed: [server1.netology]

PLAY RECAP *********************************************************************
server1.netology           : ok=7    changed=3    unreachable=0    failed=0    skipped=0    rescued=0    ignored=1  

### Затем по SSH подключаемся к созданной ВМ и проверяем работу Docker командой `docker ps`

```shell
zag1988@ubuntu-2204:~/VAGRANT$ vagrant ssh
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-144-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed 03 May 2023 02:47:22 PM UTC

  System load:  0.96               Users logged in:          0
  Usage of /:   13.7% of 30.34GB   IPv4 address for docker0: 172.17.0.1
  Memory usage: 15%                IPv4 address for eth0:    10.0.2.15
  Swap usage:   0%                 IPv4 address for eth1:    192.168.56.11
  Processes:    148


This system is built by the Bento project by Chef Software
More information can be found at https://github.com/chef/bento
Last login: Wed May  3 14:44:23 2023 from 10.0.2.2
```
```shell
vagrant@server1:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
vagrant@server1:~$ 