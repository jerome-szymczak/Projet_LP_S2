## Solution retenu

## Création du switch virtuel
La création du switch virtuel se fait grâce au script lxc-net compris dans LXC.
Nous devons tout d'abord copier l'en-tête du script et la mettre dans le fichier /etc/default/lxc-net
Puis changer les variables utiles(nom du switch, l'ip de l'interface, la plage d'IP servies par le DHCP,...).
Et nous pouvons ainsi lancer le script :
~~~
systemctl restart lxc-net
~~~
## Création et configuration de l'interface tap
Nous allons créer une interface tap en ligne de commande(dans notre paquet elle se fera grâce à un script)
Création d'une interface en mode TAP
~~~
ip tuntap add mode tap tap0
~~~
Connecter cette interface au switch crée par lxc-net
~~~
ip link set dev tap0 master lxcbr0
~~~
Activer l'interface TAP créée
~~~
ip link set tap0 up
~~~
## Implémentation d'un paquet Debian
Le paquet nécessaire pour faire ses propre paquets est dpkg. Le programme dpkg-deb qui est contenu dans le paquet dpkg est le programme qui construit un fichier .deb.

### L'arborescence d'un paquet Debian
- myscript/
    - DEBIAN/
        - control (fichier décrivant les informations relatives à notre paquet)
        - preinst (script exécuté après l'installation du paquet)
        - postinst (script exécuté après l'installation du paquet)
        - prerm (script exécuté après la désinstallation du paquet)
        - postrm (script exécuté après la désinstallation du paquet)
        - md5sums (permet la vérification de l'intégralité des données récupérées)
    - usr/
        - bin/
            - myscript (notre script, exposé ci-dessus)
        - share/doc/
                - README (informations relatives à l'utilisation de myscript)
                - copyright 
                - changelog (changements apportés par rapport à la dernière version)
                - changelog.Debian (idem, mais seulement pour le paquet Debian)

### Le dossier DEBIAN 
- un fichier control
C'est un fichier principal de contrôle qui contient un certain nombre de champs. chaque champs commence par une étiquette suivie de ':' et du contenu du champ. 
    - les informations necessaires
        - package : le nom du paquet
        - version : la version du programe
        - maintainer : le nom et l'email de celui qui s'occupe de la création du .deb
        - description : desciption du paquet
    - les informations optionnelles
        - architecture : les architectures pour lesquelles le paquet est compatible
        - pre-depends : les dépendances qui doivent être installé avant notre paquet
        - depends : les dépendences du paquet
        - conflicts : liste des paquet qui pourraient générer des conflits
        - suggest : liste des paquets qui pourraient être utile
        - priority : l'importance du paquet pour le système(pour nous optional)
        - homepage : l'adresse du site internet

## Documentation sur le fonctionnement du paquet

README
comment faire une man page
notre script


## Difficultés rencontrés

