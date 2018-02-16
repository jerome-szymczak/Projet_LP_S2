# Comparaison des différentes solutions déjà existantes 


// ce qu'il faut : description succinte, les dépendances(si il y en a), comment ça fonctionne, complexité(1 à 5), avantages et inconvéniants  
## vmnet de VMware


## libvirt


## LXC


## Fonction TUN/TAP
**Description :** TUN/TAP est une fonction de réception et de transmission de paquets entre le noyau et les programmes de l'espace utilisateur. 
Cette fonction peut être vue comme une simple interface point à point ou Ethernet qui, au lieu de recevoir les paquets d'un média physique, les reçoit du programme de l'espace utilisateur. De même, cette interface au lieu d'envoyer les paquets vers un média physique, les transmet au programme de l'espace utilisateur. Cette fonction permet donc une communication réseau entre le système hôte et des machines virtuelles.

**Dépendances :** bridge-utils & uml-utilities

**Comment ça fonctionne :** http://debian-facile.org/doc:reseau:interfaces:tapbridge

**Complexité :** 3

**Avantages :** 

**Inconvéniants :** 


## Conclusion
parler de brctl, choix retenu, avantages et inconvéniants

### Sources

**vmnet** 
- http://g.urroz.online.fr/doc/ch03s02.html

**libvirt**
- https://libvirt.org/
- https://wiki.libvirt.org/page/Main_Page
- https://wiki.libvirt.org/page/VirtualNetworking

**lxc-net** 
- https://wiki.debian.org/fr/LXC/SimpleBridge 
- http://tech.novapost.fr/lxc-demystification.html

**TUN/TAP** 
- https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html
- http://debian-facile.org/doc:reseau:interfaces:tapbridge

