Asegurarse de tener instalado docker.

    docker run hello-world

Para acceder al ambiente de desarrollo ejecutar:

    docker-compose run --service-ports csd bash

Dentro veras dos carpetas (ls), template con la version base del proyecto para ejecutar ruby2.6.5 y projects

dentro de la carpeta projects podras poner todo lss archivos que quieras que queden compartidos entre tu maquina y la imagen docker.


Si necesitas construir el Dockerfile ( no es necesario por defecto, tambien deberas tener el proyecto template para que funcione):

    docker build -t <name> .


Comandos utiles:

Para ver imagenes que se estan ejecutando:

    docker ps

Para detener una imagen corriendo:

    docker stop <CONTAINER ID>

Si se ejecuta con -d ( en segundo plano), para entrar al bash:

    docker exec -it <container> bash