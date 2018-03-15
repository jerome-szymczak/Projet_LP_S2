# myscript/

- DEBIAN/
	- control
		- package : OK
		- version : OK
		- maintainer : OK 
		- description : KO
		- pre-depends : KO
		- depends : KO
		- homepage : OK

	- preinst : KO

	- postinst : KO
		création du fichier /etc/default/lxc-net
	- prerm : KO
		suppression du fichier /etc/default/lxc-net
	- postrm : KO

- usr/
	- bin/
		- myscript(notre script) : KO
            les commande pour créer et configurer notre interface tap0
	- share/doc
		- README : KO
		- tuto-kvm : OK
		- tuto-virtualbox : KO
