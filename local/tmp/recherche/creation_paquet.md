# Recherche sur les paquets Debian

Le paquet nécessaire pour faire ses propre paquets est dpkg. Le programme dpkg-deb qui est contenu dans le paquet dpkg est le programme qui construit un fichier .deb . Cependant, ne vous inquiétez pas, le paquet est installé par défaut sur votre Debian.
Pour créer le paquet une fois que tout les fichier sont renseigner il faut faire la commande
~~~
dpkg-deb --build monpaquet
~~~

## l'Arborescence d'un paquet Debian
- myscript/
    - DEBIAN/
	    - control (fichier décrivant les informations relatives à notre paquet)
        - postinst (script exécuté après l'installation du paquet)
        - postrm (script exécuté après la désinstallation du paquet)
        - md5sums (permet la vérification de l'intégralité des données récupérées)
    - usr/
        - bin/
            - myscript (notre script, exposé ci-dessus)
        - share/
            -doc/
                - README (informations relatives à l'utilisation de myscript)
                - copyright 
                - changelog (changements apportés par rapport à la dernière version)
                - changelog.Debian (idem, mais seulement pour le paquet Debian)


## Le dossier DEBIAN 
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

## Voici un exemple de paquet simple 

[mon-paquet](local/tmp/myecho)