# Comparaison des différentes solutions déjà existantes 

## LXC
**Description :** 
LXC est conteneur Linux(ensemble de processus qui sont isolés du reste du système).
Dans LXC nous avons lxc.network qui est très utile pour pour avoir accès à internet
Les conteneurs doivent se connecter à une interface bridge sur l'hôte. Celle-ci peut avoir été créée par le paquetage(lxc-net), on pourra donc la créer manuellement.

**Dépendances :** liblxc1, python3-lxc, libapparmor1, libc6, libcap2, libgnutls30, libseccomp2, libselinux1, python3:any, lsb-base

**Complexité :** 3

**Avantages :** 
- N’est pas dépendant de l’architecture
- Est léger en consommation mémoire
- Simple à utiliser

**Inconvénients :** 
- Ne marche pas encore

**Comment ça fonctionne :** 
1. copier le début du code de /usr/lib/x86_64-linux-gnu/lxc/lxc-net dans /etc/default/lxc-net
2. Relancer le service lxc-net
3. Mettre la machine virtual en accès par pont sur l'interface 'lxcbr0'
4. Mais ça marche pas **¯\_(ツ)_/¯**


sources :
- http://www.linuxembedded.fr/2013/07/configuration-reseau-de-lxc/
- https://wiki.debian.org/fr/LXC
- https://wiki.debian.org/fr/LXC/SimpleBridge


## Fonction TAP
**Description :** 
Un dispositif TUN/TAP peut être vu comme une interface réseau qui communique avec un programme utilisateur (dispositif logiciel) au lieu d'une vraie carte matérielle (TUN pour miner un périphérique point à point, TAP pour mimer un périphérique Ethernet).

**Dépendances :** bridge-utils, uml-utilities

**Complexité :** 2

**Avantages :** 
- Très simple à metre en place

**Inconvénients :**
- Ne marche pas encore 

**Comment ça fonctionne :** 
1. Installation des paquets
2. Modification du fichier /etc/network/interfaces
3. Mettre la machine en accès par pont sur l'interface 'tap0'
4. Mais ça marhce pas **¯\_(ツ)_/¯**


sources : 
- http://debian-facile.org/doc:reseau:interfaces:tapbridge
- https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html


## vmnet de VMware
**Description :** 


**Dépendances :** 

**Complexité :** 0

**Avantages :** 
- Facile à installer

**Inconvénients :** 
- On doit installer un hyperviseur complet

**Comment ça fonctionne :** 
- Installation de VMplayer
- Mettre la machine virtuelle sur l'nterface 'vmnet8'
- Pas encore tester


sources : 
- http://g.urroz.online.fr/doc/ch03s02.html


## libvirt
**Description :** 
Libvirt est une boite à outil permettant d'interfacer des hyperviseurs, il offre la possibilite de création d'un switch virtuel.

**Dépendances :** 

**Complexité :**

**Avantages :** 

**Inconvénients :** 

**Comment ça fonctionne :** 


sources : 
- https://libvirt.org/
- https://wiki.libvirt.org/page/Main_Page
- https://wiki.libvirt.org/page/VirtualNetworking


## Conclusion
parler de brctl, choix retenu, pourquoi



