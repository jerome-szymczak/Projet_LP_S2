### VirtualBox

Virtualbox est une application de virtualisation, c’est ce qu’on appelle un hyperviseur “type 2” est un logiciel qui s'exécute à l'intérieur d'un autre système d'exploitation. 
Alors qu’un hyperviseur “bar-métal” ou du “type 1” se lance directement sur le matériel, Virtualbox a besoin d’être installé sur le système d’exploitation. 
Il peut alors exécuter toutes les applications sur cet hôte.Virtualbox n’exige pas une architecture processeur complexe. 
Il n’a pas besoin des jeux d’instructions tels que Intel VT-x ou AMD-V, contrairement à beaucoup d’autres solutions de virtualisation. 
Virtualbox fonctionne de manière identique sur toutes les plateformes hôtes. Il utilise les mêmes formats de fichiers et d’images. 
Ceci permet d’exécuter des machines virtuelles créées sur un hôte possédant un système d’exploitation différent. Vous pouvez ainsi créer une machine virtuelle sur Windows et l’utiliser sous Linux. 
De cette façon, vous pouvez lancer des logiciels écrits pour un système d’exploitation dans un autre. 
Virtualbox offre une grande souplesse  d’usage, on peut geler, copier, sauvegarder et créer des instantanés. Il peut-être exécute soit en mode graphique ou ligne de commandes « VboxManage ». 
Il est possible d’installer les suppléments invités «pack d'extension » de Virtualbox afin d’accroître les performances et la communication avec la machine hôte (dossier partage). 
Virtualbox offre un bon support matériel cela inclut  les contrôleurs de disques IDE, SCSI, SATA, le support USB 2.0 3.0.... . 
Attention cette extension est sous licence (GPL2, CDDL et VPUEL pour Virtualbox Personal use and Evaluation License). 
Virtualbox est libre d'utilisation pour sa partie principale mais les extensions, quant à eux, sont disponibles uniquement pour un usage privé. 
Il est possible d’organiser ses machines virtuelles en créant des groupes en sachant qu’une  machine virtuelle peut appartenir à plusieurs groupes. 
Cela permet entre autres de commander toutes les machines (démarrer,arrêter, sauvegarder, …).
Le format d’enregistrement est le VDI(VirtualBox Disk Image) , il peut avoir une forme fixe ou dynamique. 

Le NAT:

Lorsque l’on crée une machine virtuelle pour la première fois, Virtualbox sélectionne le mode “Network address Translation” (NAT), c’est le mode par défaut .
Cela permet d’accéder au réseau externe à partir d’une machine virtuelle. L'adresse IP était fournie par le DHCP de Virtualbox. 
Ce mode a un inconvénient de la machine virtuelle est invisible et injoignable depuis le réseau.
Elle utilise la connexion réseau du système hôte pour communiquer avec internet. Il est possible de pallier ce problème en redirigeant les ports afin d'accéder à la machine hôte.

Le bridge ou l’accès par pont:

VirtualBox intercepte les données du réseau physique et les envoie à l’invité, via une interface réseau logicielle. La machine virtuelle est directement connectée sur le réseau physique. 
Elle a accès à toutes les machines du réseau physique et peut ainsi offrir des services réseau.
Cependant, VirtualBox est extrêmement flexible quant à la manière de virtualiser le réseau. Il supporte de nombreuses cartes réseaux par machine virtuelle, les quatre premières peuvent être
configurées en détail dans la fenêtre du gestionnaire. Des cartes réseaux supplémentaires peuvent être configurées en ligne de commande avec VBoxManage.
La version 5.0 prend en charge les plus récents systèmes d’exploitation invités ou hôtes, y compris : 
les dernières versions des systèmes d’exploitation GNU/Linux, Mac OS X Yosemite, Windows 10, Oracle Linux et Oracle Solaris, ainsi que d’autres systèmes d’exploitation existants.

Les nouvelles fonctionnalités majeures d’Oracle VM VirtualBox 5.0 sont :

- Amélioration du support de la para-virtualisation pour les Invités Linux et Windows.
- Amélioration de l’utilisation des dernières caractéristiques des CPU.
- Support complet des périphériques USB 3.0 en plus des USB 1.1 et 2.0. 
- Support complet des fonctions bidirectionnelles Glisser-Déposer, toutes plateformes confondues.
- Encryptage en temps réel des disques virtuels (AES 256-bit clés DEK) 