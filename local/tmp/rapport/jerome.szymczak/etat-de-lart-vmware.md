## Recherche sur les différents type d'hyperviseurs

..........

### VMware Player
**VMware Player** est un hyperviseur de type 2, c’est l’outil gratuit mais propriétaire de VMware qui permet de découvrir la virtualisation. Il permet la création d'une ou plusieurs machines virtuelles au sein d'un même système d'exploitation (Windows ou Linux), ceux-ci pouvant être reliés au réseau local avec une adresse IP différente, tout en étant sur la même machine physique (machine existant réellement). Il est possible de faire fonctionner plusieurs machines virtuelles en même temps, la limite correspondant aux performances de l'ordinateur hôte. Pour des fonctions plus poussées (snapshot par exemple) vous devrez passer à VMware Workstation qui lui est payant.

## Recherche sur les solutions exitantes

..........

### vmnet de VMware
Suite à l'installation de VMWare Player, deux cartes réseau virtuelles sont ajoutées à l'ordinateur hôte : VMnet1 et VMnet8.
Lors de la configuration d'une interface réseau, VMWare Player propose 3 types de connections : 
- Bridged (pont) : La machine virtuelle est connectée réseau physique via la carte physique de la machine hôte. L'adressage de la carte peut se faire manuellement ou via le DHCP fournissant le réseau physique. 
- NAT (Network Address Translation) : La machine virtuelle est connectée à un réseau virtuel. La machine hôte est connectée à ce même réseau virtuel via la carte réseau VMnet8. Un routeur virtuel assure la communication etre le réseau virtuel et le réseau physique. Un DHCP virtuel permet l'attribution d'adresses aux machines virtuels presentent sur ce réseau
- Host-only : La machine virtuelle est connectée à un réseau virtuel. La machine hôte est connectée à ce même réseau virtuel par l'intermédiaire de la carte réseau VMnet1. Un DHCP virtuel permet l'attribution d'adresses aux machines virtuels presentent sur ce réseau mais l'absence de routeur permet l'isolation de ce réseau par rapport au réseau physique. 

Sources:
http://www.electro-info.ovh/index.php?id=60
https://fr.wikipedia.org/wiki/VMware
http://www.tuto-it.fr/PresentationProduitVMware.php
