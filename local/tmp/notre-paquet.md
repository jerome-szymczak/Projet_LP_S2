# myscript/

- DEBIAN/
	- control
		- package : nom du paquet
		- version : 1.0
		- maintainer : B.Beaufils 
		- description : 
		- pre-depends : les dépendances qui doivent être installé avant notre paquet
		- depends : les dépendences du paquet
		- homepage : https://www.iut-info.univ-lille1.fr/~beaufils/

	- preinst

	- postinst
		création du fichier /etc/default/lxc-net
	- prerm
		suppression du fichier /etc/default/lxc-net
	 -postrm

- usr/
	- bin/
		myscript(notre script) : les commande pour créer et configurer notre interface tap0
	- share/doc
		README : comment marche notre paquet(interface)
		tuto-kvm : 
		tuto-virtualbox : 
