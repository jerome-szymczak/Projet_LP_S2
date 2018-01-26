# Réseau pour machines virtuelles

Il s'agit de construire une architecture réseau IPv4 permettant à des machines virtuelles de communiquer de manière transparente entre elles, avec la machine physique qui les héberge ainsi qu'avec les machines du segment réseau sur lequel est intégré la machine physique.

L'objectif est de pouvoir effectuer des TP d'administration système utilisant plusieurs machines (en mode *serveur* ou *poste de travail*) sur le même réseau sans trop de difficulté pour l'étape de construction des machines, mais en conservant un minimum de flexibilité (accès extérieur, manipulation des interfaces des machines de TP).

L'architecture doit être déployable sur une machine physique [Debian](https://www.debian.org) via l'installation d'un paquet au format Debian. Elle doit permettre d'accéder à tous les ports des machines virtuelles sans être obligé de mettre en place des redirections de ports. Les seuls accès `root` qu'elle doit nécessiter sont au moment de son installation et de l'installation des outils de virtualisation. Un utilisateur standard doit être capable de créer et démarrer des machines virtuelles sans droit d'administration.

Le réseau doit permettre *a minima* de connecter des machines virtuelles gérées par [VirtualBox](https://www.virtualbox.org/). L'objectif étant de permettre au final de pouvoir y connecter des machines virtuelles gérées par [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html), [QEMU](https://www.qemu.org)/[KVM](http://www.linux-kvm.org) ainsi que des containers Linux [LXC](https://linuxcontainers.org).

À défaut d'une automatisation complète par la fourniture de commande de création de machine virtuelle adéquates, des explications simples permettant à un utilisateur de créer et connecter sa machine virtuelle à ce réseau doivent être fournies sous la forme de documentation adaptée à chaque cas gérés.

Les solutions déjà existantes (les interfaces `vmnet` de VMware, [libvirt](https://libvirt.org), script `lxc-net`, etc.) seront étudiés, comparées et documentées. L'idée initial du projet est juste de simplifier le déploiement d'une solution simple : un pont réseau avec un service DNS et DHCP disponible sur ce pont pour les différentes machines qui s'y connectent.

Si le travail avance suffisament vite une version pour un environnement hôte Windows ou une version IPv6 sera envisagée.

# Projet CGIR

Le travail est dirigé par Bruno BEAUFILS et effectué par cinq étudiants de la licence professionnelle [CGIR](http://cgir.univ-lille1.fr) dans le cadre de leur projet de mise en oeuvre au cours de l'année 2017-2018 :

- Clément DUSART
- Cyril GERARD
- Djezon HERBAUT
- Simon SALECKI
- Jerome SZYMCZAK

Le projet est géré en respectant quelques [règles](local/regles.md).

# Contenu

- [`bin`](bin) contient les scripts et programmes créées ainsi que les outils utilisés
- [`doc`](doc) contient des documentations
- [`local`](local) contient les informations relatifs au déroulement du projet

# Droits

Copyright (C) 2018 Bruno BEAUFILS

Les scripts distribués ici le sont sous les termes de la *licence général publique GPL, version 2*, disponible dans le fichier [GNU-GPL](GNU-GPL).

Les autres documents distribués ici sont mis à disposition selon les termes de la *licence Creative Commons Attribution - Pas d’Utilisation Commerciale - Partage dans les Mêmes Conditions 4.0 International* (CC-BY-NC-SA), disponible dans le fichier [CC-BY-NC-SA](CC-BY-NC-SA).


