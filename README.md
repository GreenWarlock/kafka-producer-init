# LinkedOn

Este repo contiene la app a usarse para el workshop Kafka on Rails del Nearsoft Con. 
Trabajaremos en base a esta app agregando la funcionalidad para conectarse con Kafka y mandar mensajes
a los consumers. 
La app esta distribuida en 3 Docker containers los cuales configuran y corrren Kafka, Zookeper, Postgres.

## Setup

### Requisitos:

_Sistema operativo_: Ubuntu, Mac OS o Windows 10 con subsistema Ubuntu --> https://docs.microsoft.com/es-es/windows/wsl/install-win10 
(Usar Windows bajo su propio riesgo, esto debido a que correr Rails en Windows trae muchos problemas)
    

1. Instala git en tu computadora (Omite este paso si ya lo tienes) https://git-scm.com/book/es/v1/Empezando-Instalando-Git

2. Clona el proyecto con el siguiente comando:

```bash
$ git clone https://github.com/fer9305/kafka-producer-init.git
```

3. Instala Docker dependiendo de tu sistema operativo:

### Ubuntu 

Docker:
https://ubunlog.com/como-instalar-docker-en-ubuntu-18-04-y-derivados/

Docker compose:
https://linuxize.com/post/how-to-install-and-use-docker-compose-on-ubuntu-18-04/

### Mac: 

https://platzi.com/tutoriales/1432-docker/1779-como-instalar-docker-en-windows-y-mac/

4. Ejecuta el siguiente comando para construir los containers de Docker (esto puede tardar ~15mins dependiendo de la velocidad de tu internet)

```bash
$ docker-compose up
```

*NOTA:* Si algún comando falla en Linux ejecutalos usando sudo

```bash
$ sudo docker-compose up
```

5. Ejecuta los siguientes comandos para crear la base de datos y popular las tablas

```bash
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

6. Por ultimo ejecuta el servidor de Rails y ve a --> http://localhost:3000/
```bash
$ rails s
```
