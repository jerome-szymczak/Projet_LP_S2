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
        - control* (fichier décrivant les informations relatives à notre paquet)
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

 * *C'est un fichier principal de contrôle qui contient un certain nombre de champs. chaque champs commence par une étiquette suivie de ':' et du contenu du champ.*

## Description sur le fonctionnement du paquet
### Installation et désintallation de notre paquet
Installation du paquet
~~~
# dpkg -i tarr-steps.deb
# apt install -f
~~~
Lors de l'installation notre script postinst va s'éxécuter en créant un fichier de configuration de lxc-net, il va aussi démarrer une interface tap.

Désintallation du paquet
~~~
# apt remove tarr-steps
~~~
Lors de la désintallation, notre script prerm va arreter l'interface tap0 pour permettre ensuite de désinstaller notre paquet et ses dépendances.
**Attention** : Lors de la désintallation de notre parquet les dépendances ne seront pas désintaller, il faudra le faire à la main

### Fonctionnement de notre script
Notre script peut se lancer avec des arguments et permet de configurer de l'interface créer par lxc-net.

Voici les options qui peuvent être utilisé sur notre script.

    -h,  --help           affiche ce message d'aide
    -ip, --ip             change l'adresse ip du switch
    -l,  --liste          liste les informations liées au switch
    -c,  --check          vérifie que l'interface tap a bien été créer
    -st, --start          start sur le script lxc-net
    -sp, --stop           stop sur le script lxc-net
    -r,  --reload         reload sur le script lxc-net

## Difficultés rencontrés
