# LinkedOn

Este repo contiene la app a usarse para el workshop Kafka on Rails del Nearsoft Con. 
Trabajaremos en base a esta app agregando la funcionalidad para conectarse con Kafka y mandar mensajes
a los consumers. 
La app esta distribuida en 3 Docker containers los cuales configuran y corrren Kafka, Zookeper, Postgres.

## Setup

### Requisitos:

_Sistema operativo_: Ubuntu, Mac OS o Windows 10 con subsistema Ubuntu --> https://docs.microsoft.com/es-es/windows/wsl/install-win10 
(No se puede usar Windows debido a los problemas de compatilidad)
    

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

4. Ejecuta el siguiente comando desde la raíz del proyecto para construir los containers de Docker (esto puede tardar ~15mins dependiendo de la velocidad de tu internet)

    ```bash
    $ docker-compose up
    ```
    
    *NOTA:* Si te da algun error de que no se puede conectar al docker daemon, ejecutalo con sudo
    
    ```bash
    $ sudo docker-compose up
    ```

5. Instala `RVM (el cual nos ayudará a instalar multiples versiones de ruby)`

    ### Ubuntu
    
    En terminal ejecuta
    ```bash
    $ gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

    $ \curl -sSL https://get.rvm.io | bash -s stable --ruby
    ```
    *NOTA*: en caso de algun fallo sigue la guia oficial de RVM para fallos https://rvm.io/rvm/security
    
    Una vez completado instala `Ruby 2.5.1` (Si no reconoce el comando `rvm` reinicia la terminal)
    ```bash
    $ rvm install "ruby-2.5.1"
    ``` 
    
    Ahora instala los siguientes paquetes necesarios para configurar las gemas en Ubuntu:
    ```bash
    $ sudo apt-get update
    $ sudo apt-get install build-essential patch ruby-dev zlib1g-dev liblzma-dev
    $ sudo apt-get install -y bash-completion netcat nodejs redis-tools vim
    $ sudo apt-get install libpq-dev
    ```
    
    ### Mac
    
    Sigue la siguiente guia --> https://null-byte.wonderhowto.com/how-to/mac-for-hackers-install-rvm-maintain-ruby-environments-macos-0174401/
    
    Una vez completada la guia instala `Ruby 2.5.1`
    ```bash
    $ rvm install 2.5.1
    ``` 
    
6. Instala `Bundler` el manejador de dependencias de Ruby
   
    ```bash
    $ gem install bundler
    ```
    
7. En la raíz del proyecto ejecuta el siguiente comando para instalar las dependencias

    ```bash
    $ bundle install
    ```

8. Ejecuta los siguientes comandos para crear la base de datos y popular las tablas

    ```bash
    $ rails db:create
    $ rails db:migrate
    $ rails db:seed
    ```

9. Por ultimo ejecuta el servidor de Rails y ve a --> http://localhost:3000/
    
    ```bash
    $ rails s
    ```
