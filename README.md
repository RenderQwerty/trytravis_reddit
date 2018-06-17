## Задание
Исследовать способ подключения к someinternalhost в одну команду из вашего рабочего устройства, проверить работоспособность найденного решения и внести его в README.md в вашем репозитории

##### Решение: поднять на рабочем устройстве ssh-туннель и включить опцию ForwardAgent.
```
ssh -fN -L 127.0.0.1:7878:10.164.0.3:22 -A -i ~/.ssh/appuser appuser@35.204.231.19

После установки соединения, можно подключиться к someinternalhost через 127.0.0.1:7878.
ssh -i ~/.ssh/appuser appuser@127.0.0.1 -p 7878
```

## Доп. задание
Предложить вариант решения для подключения из консоли при помощи команды вида ssh someinternalhost из локальной консоли рабочего устройства, чтобы подключение выполнялось по алиасу someinternalhost и внести его в README.md в вашем репозитории.

##### Решение: использование параметров конфигурации ssh-клиента ( ~/.ssh/config) на рабочем устройстве (предварительно необходимо установить ssh туннель).

```
➜  ~ cat ~/.ssh/config 
Host *
 ForwardAgent yes

Host bastion
 HostName 35.204.231.192
 User appuser
 IdentityFile ~/.ssh/appuser

Host someinternalhost
 HostName 127.0.0.1
 Port 7878
 User appuser
 IdentityFile ~/.ssh/appuser

```