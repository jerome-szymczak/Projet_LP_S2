---
title : Réseau pour machines virtuelles

author :
- Cyril Gerard
- Sczymczak Jerome
- Salecki Simon
- Dusart Clément

date: 16 mars 2018

...

# Introduction

## But du projet

- Il s'agit de construire une architecture réseau IPv4 permettant à des machines virtuelles de communiquer.

- L'objectif est de pouvoir effectuer des TP d'administration système utilisant plusieurs machines sur le même réseau.

![TeX Friendly Zone](img/schéma-reseau-projet.svg){ width=10% }

## Organisation du projet

- Dépot Git

- Mise en place d'un fichier ToDo

- Compte rendu hebdomadaire

- Respect d'une convention de nommage

# Recherche

## Les hyperviseurs

- [VirtualBox](https://www.virtualbox.org/)

- [VMware Player](https://www.vmware.com/products/workstation-player.html)

- [KVM/QEMU](https://www.linux-kvm.org/page/Main_Page)

- [Proxmox](https://www.proxmox.com/en/)

![TeX Friendly Zone](img/comparatif-virtualiseur.svg){ width=10% }

## Virtualbox
Les différents réseaux de virtualbox :
- 

Vbox manage :
- 


## Les solutions existantes

- [VMnet de VMware](http://g.urroz.online.fr/doc/ch03s02.html)

- [Libvirt](https://libvirt.org/)

- [LXC](https://wiki.debian.org/fr/LXC/SimpleBridge)

- [TUN/TAP](https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html)

- [Bridge-utils](https://wiki.debian.org/fr/BridgeNetworkConnections)

## Paquet Debian
**Description :**
Un paquet .deb est en fait un dossier compressé contenant les éléments à installer et des informations sur le paquet. 
Comme l'indique l'extension, un paquet .deb est utilisé sur les systèmes reposant sur Debian.
**L'arborescence :**
Un paquet Debian est constitué de deux parties notables : 
- Un dossier contenant le nom du paquet, ses dépendances, etc.
- Les fichiers du programme.

**dossier-du-paquet/**
 - DEBIAN/
    - control
    - preinst
    - postinst
    - prerm
    - postrm
 - usr/
    - bin/
        - le-programme
    - share/doc/
        - README
        - autres fichiers

# Comparatif

## Test des différentes solutions existantes

- LXC-net :
- Tun/TAP :
- Libvirt :
- VMnet :

## Choix pour notre solution


# Mise en oeuvre du projet

## Création d'une interface
Comment créer notre interface

## Configuration de tap0
Configuration et notre interface et fichiers à modifier

## Documentation du projet
Readme, Documenter sur comment marche lxc-net

## Implémentation d'un paquet Debian
Comment créer un paquet et comment l'installer

# Conclusion
Ce que nous avons appris de ce projet !