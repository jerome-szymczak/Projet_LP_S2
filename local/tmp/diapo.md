---
title : Réseau pour machines virtuelles

author :
- GERARD Cyril
- SZYMCZAK Jerome
- SALECKI Simon
- DUSART Clément
- HERBAUT Djezon

date: 16 mars 2018

...

# Cadre du projet

## Intitulé du sujet


## Contrainte


## Gestion du projet


# Etat de l'art

## Différents virtualisateurs

- [VirtualBox](https://www.virtualbox.org/)
 ![TeX Friendly Zone](img/comparatif-virtualiseur.svg){ width=10% }

- [VMware Player](https://www.vmware.com/products/workstation-player.html)

- [KVM/QEMU](https://www.linux-kvm.org/page/Main_Page)

- [Proxmox](https://www.proxmox.com/en/)

## Comparatif

![TeX Friendly Zone](img/comparatif-virtualiseur.svg){ width=10% }

## Virtualbox


## Les solutions existantes

- [VMnet de VMware](http://g.urroz.online.fr/doc/ch03s02.html)

- [Libvirt](https://libvirt.org/)

- [LXC](https://wiki.debian.org/fr/LXC/SimpleBridge)

- [TUN/TAP](https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html)

- [Bridge-utils](https://wiki.debian.org/fr/BridgeNetworkConnections)

'logo des solutions à droites des noms'

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

## Solution retenu


# Mise en oeuvre du projet

## Création des fichiers de paquet

Comment créer notre interface


## Création du script

Configuration et notre interface et fichiers à modifier


## Description sur le fonctionnement du paquet


# Procédure de Test

## Test d'installation de notre paquet


## Test avec les virtualisateurs


# Conclusion
Ce que nous avons appris de ce projet et ce qu'il nous a apporté

