# LinkedOn

Este repo contiene la app a usarse para el workshop Kafka on Rails del Nearsoft Con. 
Trabajaremos en base a esta app agregando la funcionalidad para conectarse con Kafka y mandar mensajes
a los consumers. 
La app esta distribuida en 4 Docker containers los cuales configuran y corrren Kafka, Zookeper, Postgres 
y la aplicación LinkedOn.

## Setup

1. Instala git en tu computadora (Omite este paso si ya lo tienes) https://git-scm.com/book/es/v1/Empezando-Instalando-Git

2. Clona el proyecto con el siguiente comando:

```bash
$ git clone https://github.com/fer9305/kafka-producer-init.git
```

3. Instala Docker dependiendo de tu sistema operativo:

Windows: https://enmilocalfunciona.io/instalando-y-probando-docker-en-windows-10/
Linux (De preferencia usar Ubuntu 18.04): https://ubunlog.com/como-instalar-docker-en-ubuntu-18-04-y-derivados/
Mac: https://platzi.com/tutoriales/1432-docker/1779-como-instalar-docker-en-windows-y-mac/

4. Ejecuta el siguiente comando para construir los containers de Docker (esto puede tardar ~15mins dependiendo de la velocidad de tu internet)

```bash
$ docker-compose build
$ docker-compose up
```
