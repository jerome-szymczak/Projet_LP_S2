# Annexe  

## Documents techniques

### Le cript de notre paquet Debian
~~~
#!/bin/bash
# Permet de configurer l'interface de l'interface créer par lxc-net
#
# usage: tarr-steps [OPTIONS] [VALEUR]
#
# OPTIONS
#
#     -h, --help           affiche ce message d'aide
#     -ip, --ip            change l'adresse ip du switch
#     -p, --plage          permet de modifier la plage d'adresse attribuer aux machines
#     -n, --nombre         modifie le nombre d'IP maximum au sein du réseau
#     -l, --liste          liste les informations liées au switch
#     -c, --check          vérifie que l'interface tap a bien été créer
#

IP="LXC_ADDR="
PLAGE="LXC_DHCP_RANGE="
NBIP="LXC_DHCP_MAX="
NETMASK="LXC_NETMASK="
NETWORK="LXC_NETWORK="
toto=$(ip a | grep tap0 | egrep -c "vswitch0|master")
change (){ sed -i "s@$1\".*\"@$1\"$2\"@g" "/etc/default/lxc-net" ; }
doc(){ sed -n '2,/^$/ { s/^ *#// ; s/^ //g ; t ok ; d ; :ok ; p }' <$0 ; }
check(){ 
if($toto -eq 1)
then 
	echo "Votre interface tap0 a bien été créée"
else
	echo "Votre interface fait des siennes"
fi
}
while [ ! -z "$1" ] ;
do
    case "$1" in
        "-h"|"--help") doc && exit ;;
		"-ip"|"--ip") change $IP $2 && exit ;;
		"-p"|"--plage") change $PLAGE $2 && exit ;;
		"-n"|"--nombre") change $NBIP $2 && exit ;;
        "-l"|"--list") cat /etc/default/lxc-net && exit ;;
        "-c"|"--check") check && exit ;;
        *) break;;
    esac
    shift
done
~~~

### Comparaison sur les différentes solutions existantes 
~~~
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
- Assez dur à comprendre comment le script fonctionne

**Comment ça fonctionne :** 
1. copier le début du code de /usr/lib/x86_64-linux-gnu/lxc/lxc-net dans /etc/default/lxc-net
2. Relancer le service lxc-net
3. Créer une interface tap0
4. Créer un tunnel entre tap0 et le switch créer par lxc-net
5. Mettre la machine virtual en accès par pont sur l'interface 'tap0'

## Fonction TUN/TAP
**Description :** 
Un dispositif TUN/TAP peut être vu comme une interface réseau qui communique avec un programme utilisateur (dispositif logiciel) au lieu d'une vraie carte matérielle (TUN pour miner un périphérique point à point, TAP pour mimer un périphérique Ethernet).

**Dépendances :** bridge-utils, uml-utilities

**Complexité :** 2

**Avantages :** 
- Très simple à metre en place

**Inconvénients :**
- Modification des interfaces existantes

**Comment ça fonctionne :** 
1. Installation des paquets
2. création d'une interface bridge
3. Création d'un tunnel entre le bridge et tap0
4. Mettre la machine en accès par pont sur l'interface 'tap0'

## vmnet de VMware
**Description :** 
- VMnet0 pour relier les VMs au réseau physique direct (Bridged mode)
- VMnet1 isole totalement les cartes qui lui sont reliées du reste du monde, mais pas entre elles (Host Only mode)
- VMnet8 relie les VMs au réseau physique en passant par de la translation d'adresses (NAT mode)

**Dépendances :** aucune

**Complexité :** 0

**Avantages :** 
- Facile à installer

**Inconvénients :** 
- On doit installer un hyperviseur complet

**Comment ça fonctionne :** 
- Installation de VMplayer
- Mettre la machine virtuelle en accès par pont sur l'nterface 'vmnet8'

sources : 
- http://g.urroz.online.fr/doc/ch03s02.html

~~~
## Sources

### Virtualisateurs

http://www.lemagit.fr/definition/Virtualisation
http://infrastructure.smile.eu/Tout-savoir-sur/Virtualisation-et-cloud/Les-principes-de-la-virtualisation


- 1.VirtualBox
 https://www.virtualbox.org/download/testcase/manual/UserManual_fr_FR.pdf

- 2.VMplayer
 

- 3.QEMU/KVM
 

### Solutions existantes
- 1.LXC
 http://www.linuxembedded.fr/2013/07/configuration-reseau-de-lxc/
 https://wiki.debian.org/fr/LXC
 https://wiki.debian.org/fr/LXC/SimpleBridge

- 2.TUN/TAP
 http://debian-facile.org/doc:reseau:interfaces:tapbridge
 https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html

- 3.vmnet
 http://g.urroz.online.fr/doc/ch03s02.html

