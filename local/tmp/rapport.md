

# Cadre du projet
## Intitulé du sujet
Il s'agit de construire une architecture réseau IPv4 permettant à des machines virtuelles de communiquer, de manière transparente, entre elles, avec la machine physique qui les héberge ainsi qu'avec les machines du segment réseau sur lequel est intégrée la machine physique.

L'objectif est de pouvoir effectuer des TP d'administration système utilisant plusieurs machines (en mode *serveur* ou *poste de travail*) sur le même réseau sans trop de difficulté pour l'étape de construction des machines, mais en conservant un minimum de flexibilité (accès extérieur, manipulation des interfaces des machines de TP).

## Contrainte
L'architecture doit être déployable sur une machine physique [Debian](https://www.debian.org) via l'installation d'un paquet au format Debian. 
Elle doit permettre d'accéder à tous les ports des machines virtuelles sans être obligé de mettre en place des redirections de ports. Les seuls accès `root` qu'elle doit nécessiter sont au moment de son installation et de l'installation des outils de virtualisation. 
Un utilisateur standard doit être capable de créer et démarrer des machines virtuelles sans droit d'administration.

Le réseau doit permettre *a minima* de connecter des machines virtuelles gérées par [VirtualBox](https://www.virtualbox.org/). 
L'objectif étant de permettre au final de pouvoir y connecter des machines virtuelles gérées par [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html), [QEMU](https://www.qemu.org)/[KVM](http://www.linux-kvm.org) ainsi que des containers Linux [LXC](https://linuxcontainers.org).

À défaut d'une automatisation complète par la fourniture de commande de création de machine virtuelle adéquates, des explications simples permettant à un utilisateur de créer et connecter sa machine virtuelle à ce réseau doivent être fournies sous la forme de documentation adaptée à chaque cas géré.


# Organisation
## Règles de gestion du projet
- L'intégralité du travail est géré dans un dépôt GIT.
    - un dépôt particulier fait **référence** pour l'avancement du projet : celui accessible par le serveur GitLab de l'IUT ;
    - dans la mesure du possible chaque participant du projet y pousse ses modifications *au moins* une fois par jour (en fin de journée) ;

- Un compte-rendu d'activité hebdomadaire est déposé, via un *commit* particulier, chaque fin de semaine sur le dépôt.

    - il détaille les tâches effectuées et leur responsable ;
    - il liste les éventuels points bloquants ;
    - il liste sommairement les tâches planifiées pour la semaine suivante ;
    - il précise la date et le lieu de la prochaine rencontre avec les tuteurs.

- Des [conventions](conventions.md) de nommage et de codage sont respectées.

## Outils utilisés pour la gestion du projet
- [GIT](https://git-scm.com)

- Pour la rédaction des documentations et présentations
    - [Markdown](https://daringfireball.net/projects/markdown)
        - [GitHub Flavored Markdown](https://github.github.com/gfm)
        - [Mastering Markdown](https://guides.github.com/features/mastering-markdown)
    - Mdoc
        - https://manpages.bsd.lv/mdoc.html
        - man(7), mdoc(7), groff(7)

# Etude des solutions existantes
## Recherche sur les différents type d'hyperviseurs
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

LXC (contraction de l'anglais de LinuX Containers) est un système de vitualisation utilisant l'isolation au niveau système d'exploitation comme méthode de cloisonement. 
Son but et de créer un environement aussi proche que possible d'une installation Linux standard mais sans avoir besoin d'un noyau séparé.
Les conteneurs LXC sont souvent considérés comme quelque chose entre un chroot et une machine virtuelle à part entière.

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

# Mise en oeuvre du projet
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

## Documentation sur le fonctionnement du paquet

## Difficultés rencontrés


# Procédure de test
## Installation de notre paquet

## Test avec Virtualbox

## Test avec QEMU/KVM

## Test avec VMplayer

# Conclusion