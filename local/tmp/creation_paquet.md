# Recherche sur les paquets Debian

Dans un paquet débian on peut trouver au minimum deux dossiers un 'DEBIAN' et un 'usr'.

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
- un fichier md5sums
	C'est un fichier qui permet la vérification de l'intégralité des données récupérées.
