# La virtualisation :

## Q'est ce que c'est quoi?

Par définition la virtualisation consiste en la création d'une version virtuelle (par opposition à réelle) d'un ou de plusieurs éléments, tel qu'un système d'exploitation, un serveur, un dispositif de stockage ou des ressources réseau sur un même système physique.

## Pourquoi faire cha?

Le principal objectif est économique. Il y a encore quelques années on séparé chaque services sur une machine physique distinct et l'utilisation moyenne du matériel était de l'ordre de 10%. Aujourd'hui, l'augmentation du nombre de coeurs au sein d'un même processeur et l'augmentation des capacités mémoires nous permettent de faire cohabiter au sein d'un même matériel plusieurs services.

Un autre objectif est celui de la faciliter d'administration, en effet le processus d'installation d'un système est une opération lourde, gourmande en temps, et présente un risque de petites variations de configuration. Ainsi, la virtualisation permet de déplacer un serveur virtuel d’un hôte à un autre de manière très aisée, y compris sur des environnements matériels très hétérogènes, puisque les couches matérielles dans les serveurs virtuels sont le plus souvent génériques.


Il faut differencier :

- L'hyperviseur: 

 - **Hyperviseur Type 1** : (Ex: VMware Vsphere, Oracle VM, Microsoft Hyper-V Server ) : C'est un logiciel qui s’insère entre le matériel et les différents systèmes d’exploitation virtualisés assurant ainsi directement la communication avec ce dernier.

 - **Hyperviseur Type 2** : (Ex: VMware Workstation, Oracle VirtualBox ) : C'est un logiciel qui s’insère entre le système d'exploitation hote et les différents systèmes d’exploitation vitualisés. c'est le système d'exploitation hote qui assure la communication avec le materiel .

- **L'isolateur** : (Ex: chroot, LXC, Docker ) : C'est un logiciel permettant de créer un environnement utilisateur cloisonné au sein d'un système d'exploitation. Cet environnement peut alors exécuter des programmes sans que leur exécution ne perturbe le système d'exploitation de la machine en cas de dysfonctionnement. Ces environnements sont appelés des contextes ou bien des zones d'exécution. 

- **L'émulateur** : (Ex: QEMU ) : C'est un logiciel qui consiste à simuler l’exécution d’un programme en interprétant chacune des instructions destinées au micro-processeur. Il est possible d’émuler ainsi n’importe quel processeur et l’environnement complet.


Schèma de fonctionnement :

Système d'exploitation
![systemExploitation](local/tmp/jerome.szymczak/ink-diagram-com-sys-exp.pdf){ width=5% }

Hyperviseur Type 1
![systemExploitation](local/tmp/jerome.szymczak/ink-diagram-com-sys-virt.pdf){ width=5% }

Hyperviseur Type 2
![systemExploitation](local/tmp/jerome.szymczak/ink-diagram-com-sys-virt2.pdf){ width=5% }

Isolateur
![systemExploitation](local/tmp/jerome.szymczak/ink-diagram-com-sys-exp-cont.pdf){ width=5% }