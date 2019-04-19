# Servidor Tinc de Darkmesh
Darkmesh se está actualizando a Tinc 1.1 usando git como gestor de la configuración, esto ayudará a añadir nuevos nodos de dos formas:
* Las actualizaciones podrán hacerse al vuelo usando git. Al hacer un cambio en el repo, los nodos que usan la configuración dinámica se reiniciarán añadiendo los nuevos nodos, por lo que se podrán conectar de forma más rápida
* Usando el nuevo método, [invitaciones](https://www.tinc-vpn.org/documentation-1.1/Invitations.html), que permiten añadir nuevos nodos que únicamente se conectarán al mesh a través del nodo que realice la invitación.

# Cómo usar el servicio contenerizado
El servicio usa la configuración que tenga el nodo, usando el directorio de hosts del repositorio, por lo que los nuevos nodos añadidos podrán conectarse inmediatamente.
La autoconfiguración permite usar un repo git con acceso público o uno que necesite autenticación. Usa las siguientes variables para su configuración:
* GIT_URL: URL del servidor git tiene que ser accesible por https, ejemplo del valor esperado: git.darkme.sh/darkmesh/darkmesh.
* MESH: Nombre de la MESH a la que se conectará, ejemplo: darkmesh.
* GIT_USERNAME: usuario de acceso al git (sólo cuando se usa un servidor git privado).
* GIT_PASSWORD: contraseña de acceso al git (sólo cuando se usa un servidor git privado).

```bash
docker run -d --name tinc-darkmesh2 --net=host --device=/dev/net/tun --cap-add NET_ADMIN -v /root/darkmesh/:/etc/tinc/darkmesh -e GIT_URL="git.darkme.sh/darkmesh/darkmesh" -e MESH=darkmesh millaguie/tinc:1.1pre

```
