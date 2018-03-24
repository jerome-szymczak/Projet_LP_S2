## Recherche sur les différents type d'hyperviseurs

### Qu'est ce que la virtualisation

Par définition la virtualisation consiste en la création d'une version virtuelle (par opposition à réelle) d'un ou de plusieurs éléments, tel qu'un système d'exploitation, un serveur, un dispositif de stockage ou des ressources réseau sur un même système physique.

Le principal objectif est économique. Il y a encore quelques années on séparé chaque services sur une machine physique distinct et l'utilisation moyenne du matériel était de l'ordre de 10%. Aujourd'hui, l'augmentation du nombre de coeurs au sein d'un même processeur et l'augmentation des capacités mémoires nous permettent de faire cohabiter au sein d'un même matériel plusieurs services.

Un autre objectif est celui de la faciliter d'administration, en effet le processus d'installation d'un système est une opération lourde, gourmande en temps, et présente un risque de petites variations de configuration. Ainsi, la virtualisation permet de déplacer un serveur virtuel d’un hôte à un autre de manière très aisée, y compris sur des environnements matériels très hétérogènes, puisque les couches matérielles dans les serveurs virtuels sont le plus souvent génériques.


Il faut differencier :
- L'hyperviseur
- L'espace noyau, espace utilisateur
- L'émulateur

Avant toutes choses il est important de parler du principe d'un "système d'exploitation" car c'est celui ci qui gére les ressources matériels disponibles pour les attribuer aux applications qui en ont besoins.

![systemExploitation](local/tmp/jerome.szymczak/ink-diagram-com-sys-exp.pdf){ width=5% }

La virtualisation est un procédé informatique qui vise à séparer le matériel et le logiciel. Grace a elle nous pouvons reduire les couts de possession matériels en allouant les resssources physiques a different instance de logiciels

### VirtualBox

Oracle VM VirtualBox est un logiciel libre de type II publié par Oracle.
VirtualBox est libre d'utilisation pour sa partie principale mais les Add-on, quant à eux, sont disponibles uniquement pour un usage privé, à titre privé. 
En bref, il est interdit d'utiliser les Add-on en entreprise ou en université.

### VMware Player

VMware Workstation Player, est un logiciel de virtualisation pour ordinateurs sous Microsoft Windows ou Linux, fourni gratuitement par Vmware. 
Il utilise le même noyau de virtualisation que VMware Workstation, un programme similaire avec plus de fonctionnalités(payant). VMware Player est disponible pour un usage personnel non commercial.

### KVM/QEMU

KVM (Kernel-based Virtual Machine) est un hyperviseur libre de type I pour Linux. KVM est intégré dans le noyau Linux depuis la version 2.6.20. 
KVM est une instance de QEMU, grâce à son module KQEMU, il permet d'exécuter du code machine directement sur le processeur hôte afin d'accélérer l'émulation.

### LXC
**LXC**(contraction de l'anglais de Linux Containers) est un système de virtualisation utilisant l'isolation au niveau système d'exploitation comme méthode de cloisonnement. 
Son rôle est de créer un environnement aussi proche que possible d'une installation Linux standard, mais sans avoir besoin d'un noyau séparé. Les conteneurs LXC sont souvent considérés comme un compromis entre le mode "chroot*" et une machine virtuelle. LXC est donc un ensemble de processus qui nous permettent d'isolés des éléments du reste du système. 
Il aura également accès à sa propre interface réseau, sa table de routage. Mais la différence notable, contrairement à Xen et KVM c'est l'absence d'un deuxième noyau. LXC va utiliser le même noyau que la machine hôte (Dom0). Les avantages de cette solution sont un gain de performances en l'absence d'hyperviseur et de noyau intermédiaire. L’autre avantage est la faible occupation de la ressource mémoire.  

Les conteneurs LXC ne fournissent pas une isolation complète, c’est dû au fait que le noyau est partagé entre le Dom0 et les conteneurs. L’autre désavantage est une mise en place plus complexe qu’une installation sur machine virtuelle. 
Après la mise en place quelques prérequis nécessaire au bon fonctionnement, il s'agira de mettre en fonctionnement notre configuration réseau. 
Ainsi chaque conteneur aura une interface réseau virtuelle et la connexion au vrai réseau passera par un pont. Il existe deux manières de se connecter à l’interface virtuelle, soit branchée sur l'interface physique de la machine hôte (directement sur le réseau), soit branchée sur une autre interface virtuelle de l'hôte(pourra router le trafic). Les deux solutions passent par le biais du paquet  bridge-utils dont dépend LXC. C’est la seconde solution que nous avons retenu.

Dans un premier temps il faut configurer le fichier lxc-net afin qu’il crée le switch. Puis dans un second temps on crée l’interface virtuelle tap0 et enfin un tunnel entre tap0 et le switch est créé par lxc-net. L'hôte fera donc office de passerelle pour que nos machines virtuelles puissent communiquer avec l'extérieur. 

\* *Cette commande permet d'isoler l'exécution d'un programme.*

### Proxmox

Proxmox Virtual Environment est un logiciel libre de virtualisation, plus précisément un hyperviseur de machines virtuelles. 
Proxmox permet donc de monter facilement un serveur de virtualisation dont l'administration se fera via une interface web.
Proxmox VE installe les outils complets du système d'exploitation et de gestion en 3 à 5 minutes (dépend du matériel utilisé).
C'est une solution de virtualisation "bare metal". Le terme de « bare metal » (metal nu) signifie que vous commencez à partir d'un serveur vide et qu'il n'y a donc nul besoin d'installer un système d'exploitation auparavant.

[Comparatif](local/tmp/img/comparatif-virtualiseur.svg)

## Recherche sur les solutions exitantes
### LXC
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

sources :
- http://www.linuxembedded.fr/2013/07/configuration-reseau-de-lxc/
- https://wiki.debian.org/fr/LXC
- https://wiki.debian.org/fr/LXC/SimpleBridge

### Fonction TUN/TAP
**Description :** 
Un dispositif TUN/TAP peut être vu comme une interface réseau qui communique avec un programme utilisateur (dispositif logiciel).
Au lieu d'une vraie carte matérielle (TUN pour miner un périphérique point à point, TAP pour mimer un périphérique Ethernet).

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

sources : 
- http://debian-facile.org/doc:reseau:interfaces:tapbridge
- https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html

### vmnet de VMware
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
