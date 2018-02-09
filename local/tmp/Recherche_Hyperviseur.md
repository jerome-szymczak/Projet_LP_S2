# Différents outils de virtualisation

## VirtualBox

Oracle VM VirtualBox est un logiciel libre de type II publié par Oracle.
VirtualBox est libre d'utilisation pour sa partie principale mais les Add-on, quant à eux, sont disponibles uniquement pour un usage privé, à titre privé. En bref, il est interdit d'utiliser les Add-on en entreprise ou en université.

## VMware Player

VMware Workstation Player, est un logiciel de virtualisation pour ordinateurs sous Microsoft Windows ou Linux, fourni gratuitement par Vmware. 
Il utilise le même noyau de virtualisation que VMware Workstation, un programme similaire avec plus de fonctionnalités(payant). VMware Player est disponible pour un usage personnel non commercial.

## KVM/QEMU

KVM (Kernel-based Virtual Machine) est un hyperviseur libre de type I pour Linux. KVM est intégré dans le noyau Linux depuis la version 2.6.20. 
KVM est une instance de QEMU, grâce à son module KQEMU, il permet d'exécuter du code machine directement sur le processeur hôte afin d'accélérer l'émulation.

## LXC

## Proxmox
Proxmox Virtual Environment est un logiciel libre de virtualisation, plus précisément un hyperviseur de machines virtuelles. Proxmox permet donc de monter facilement un serveur de virtualisation dont l'administration se fera via une interface web.
Proxmox VE installe les outils complets du système d'exploitation et de gestion en 3 à 5 minutes (dépend du matériel utilisé).
C'est une solution de virtualisation "bare metal". Le terme de « bare metal » (metal nu) signifie que vous commencez à partir d'un serveur vide et qu'il n'y a donc nul besoin d'installer un système d'exploitation auparavant.
## Comparatif des différents hyperviseurs

[Comparatif](local/tmp/img/comparatif.png)