---
title : Réseau pour machines virtuelles
author :
- Cyril Gerard
- Sczymczak Jerome
- Salecki Simon
date: 7 mars 2018

...

# Introduction

## But du projet

- Il s'agit de construire une architecture réseau IPv4 permettant à des machines virtuelles de communiquer.

- L'objectif est de pouvoir effectuer des TP d'administration système utilisant plusieurs machines sur le même réseau.

Mettre l'image du tableau blanc

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

![TeX Friendly Zone](local/tmp/img/comparatif.png){ width=20% }

## Les solutions existantes

- [VMnet de VMware](http://g.urroz.online.fr/doc/ch03s02.html)

- [Libvirt](https://libvirt.org/)

- [LXC](https://wiki.debian.org/fr/LXC/SimpleBridge)

- [TUN/TAP](https://www.inetdoc.net/guides/vm/vm.network.tun-tap.html)

- [Bridge-utils](https://wiki.debian.org/fr/BridgeNetworkConnections)

# Comparatif

## Test des différentes solutions existantes

- LXC-net :
- Tun/TAP :
- Libvirt :
- VMnet :

## Choix pour notre solution
Pourquoi ? Simplicité ? Libre ou non ? 

# Mise en oeuvre du projet

## Création d'une interface
Comment créer notre interface

## Configuration de Avignon0
Configuration et notre interface et fichiers à modifier

## Documentation du projet
Readme, Documenter sur comment marche lxc-net

## Implémentation d'un paquet Debian
Comment créer un paquet et comment l'installer

# Conclusion
Ce que nous avons appris de ce projet !