# myscript/

- DEBIAN/
	- control
		- package : OK
		- version : OK
		- maintainer : OK 
		- depends : OK
		- homepage : OK
        - description : OK
	
	- postinst : OK

	- prerm : KO
		suppression du fichier /etc/default/lxc-net

- usr/
	- bin/
		- myscript : OK
	- share/doc
		- tuto-kvm : OK
		- tuto-virtualbox : KO
