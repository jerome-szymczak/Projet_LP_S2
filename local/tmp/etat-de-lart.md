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
include local/tmp/recherche/VirtualBox.md

### VMware Player
include local/tmp/jerome.szymczak/etat-de-lart-vmware.md

### KVM/QEMU
**KVM** (Kernel-based Virtual Machine) est un hyperviseur libre de type I pour Linux qui permet la virtualisation simultanée de différents systèmes d'exploitation sur la même machine hôte. KVM est intégré dans le noyau Linux depuis la version 2.6.20. KVM est une instance de QEMU¹ qui lui permet la virtualisation simultanée de différents systèmes d'exploitation sur la même machine hôte.

C'est un système optimisé pour la virtualisation de serveur. Pour virtualiser des systèmes de type desktop, on peut lui préférer virtualbox. KVM semble en effet plus performant en consommation de processeur mais plus lent pour l'émulation du périphérique graphique. L'utilisation d'un bureau virtualisé dans VirtualBox pourra donc laisser une meilleure impression à l'utilisateur. Vous pouvez tout de même préférer KVM pour sa meilleure compatibilité avec des système d'exploitations anciens ou peu populaires.

### Proxmox

**Proxmox** (Proxmox Virtual Environment) est un logiciel libre de virtualisation, plus précisément un hyperviseur de machines virtuelles. 
Proxmox permet donc de monter facilement un serveur de virtualisation dont l'administration se fera via une interface web.
Proxmox VE installe les outils complets du système d'exploitation et de gestion en 3 à 5 minutes (dépend du matériel utilisé).
C'est une solution de virtualisation "bare metal"³.

[Comparatif](local/tmp/img/comparatif-virtualiseur.svg)

## Recherche sur les solutions exitantes
### LXC
**LXC** (contraction de l'anglais de Linux Containers) est un système de virtualisation utilisant l'isolation au niveau système d'exploitation comme méthode de cloisonnement. 
Son rôle est de créer un environnement aussi proche que possible d'une installation Linux standard, mais sans avoir besoin d'un noyau séparé. Les conteneurs LXC sont souvent considérés comme un compromis entre le mode "chroot²" et une machine virtuelle. LXC est donc un ensemble de processus qui nous permettent d'isolés des éléments du reste du système. 
Il aura également accès à sa propre interface réseau, sa table de routage. Mais la différence notable, contrairement à Xen et KVM c'est l'absence d'un deuxième noyau. LXC va utiliser le même noyau que la machine hôte (Dom0). Les avantages de cette solution sont un gain de performances en l'absence d'hyperviseur et de noyau intermédiaire. L’autre avantage est la faible occupation de la ressource mémoire.  

Les conteneurs LXC ne fournissent pas une isolation complète, c’est dû au fait que le noyau est partagé entre le Dom0 et les conteneurs. L’autre désavantage est une mise en place plus complexe qu’une installation sur machine virtuelle. 
Après la mise en place quelques prérequis nécessaire au bon fonctionnement, il s'agira de mettre en fonctionnement notre configuration réseau. 
Ainsi chaque conteneur aura une interface réseau virtuelle et la connexion au vrai réseau passera par un pont. Il existe deux manières de se connecter à l’interface virtuelle, soit branchée sur l'interface physique de la machine hôte (directement sur le réseau), soit branchée sur une autre interface virtuelle de l'hôte(pourra router le trafic). Les deux solutions passent par le biais du paquet  bridge-utils dont dépend LXC. C’est la seconde solution que nous avons retenu.

Dans un premier temps il faut configurer le fichier lxc-net afin qu’il crée le switch. Puis dans un second temps on crée l’interface virtuelle tap0 et enfin un tunnel entre tap0 et le switch est créé par lxc-net. L'hôte fera donc office de passerelle pour que nos machines virtuelles puissent communiquer avec l'extérieur. 



### Fonction TUN/TAP


### vmnet de VMware
include local/tmp/jerome.szymczak/etat-de-lart-vmware.md

Notes : 

1. *QEMU est un logiciel libre de machine virtuelle, pouvant émuler un processeur et, plus généralement, une architecture différente si besoin. Il permet d'exécuter un ou plusieurs systèmes d'exploitation via les hyperviseurs KVM et Xen, ou seulement des binaires, dans l'environnement d'un système d'exploitation déjà installé sur la machine.*

2. *Cette commande permet d'isoler l'exécution d'un programme.*

3. *Bare metal (metal nu) signifie que vous commencez à partir d'un serveur vide et qu'il n'y a donc nul besoin d'installer un système d'exploitation auparavant.*