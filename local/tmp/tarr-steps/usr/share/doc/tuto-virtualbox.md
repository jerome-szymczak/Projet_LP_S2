# Installation de Virtaulbox
**Attention** Si vous avez des machines VirtualBox en route, KVM ne voudra pas lancer de VM.

Si vous voulez utiliser un système invité en 64 bits, il est nécessaire que l'ordinateur supporte la virtualisation matérielle (VT-x [vmx] ou AMD-V [svm])


## Prérequis:
Installation de du transport https
~~~
root@mamachine: ~
# apt-get install apt-transport-https
~~~

## Installation de VirtualBox

1. Récupération de la clef de signature du dépôt de VirtualBox
~~~
root@mamachine: ~
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
~~~

2. Ajout du dépôt d'Oracle dans /etc/apt/source.list.d/
~~~
root@mamachine: ~
# echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"|tee /etc/apt/sources.list.d/virtualbox.list
~~~
Mise à jour de la liste des paquets
~~~
root@mamachine: ~
# apt-get update
~~~

3. Installation de VirtualBox
~~~
root@mamachine: ~
# apt-get install virtualbox-5.2.8
~~~

## Optimisation de VirtualBox avec le Pack d'extension Oracle VM VirtualBox :
Prise en charge des périphériques USB 2.0 et USB 3.0, VirtualBox RDP, cryptage de disque, démarrage NVMe et PXE pour les cartes Intel.Téléchargement en root
~~~
root@mamachine: ~
# version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1) && wget -c http://download.virtualbox.org/virtualbox/$version/Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack
~~~

## Installation d'une VM en ligne de commande
1. Création d'une machine
~~~
user@mamachine: ~
$ VBoxManage createvm --name debian9.4 --ostype Debian_64 --register
~~~

2. Création du disque 10G
~~~
user@mamachine: ~
$ VBoxManage createhd --filename debian9.4.vdi --size 10000
~~~

3. Attacher le disque
~~~
user@mamachine: ~
$ VBoxManage storagectl debian9.4 --name "SATA Controller" --add sata --controller IntelAHCI
$ VBoxManage storageattach debian9.4 --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium debian.vdi
~~~

4. Ajouter le lecteur DVD 
~~~
user@mamachine: ~
$ VBoxManage storagectl debian9 --name "IDE Controller" --add ide
~~~
5. Ajout de l'image iso
~~~
user@mamachine: ~
$ VBoxManage storageattach debian9 --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium/home/simon/Documents/ISO/Linux/Debian 9.2.1amd641.iso
~~~
 
6. Modification de la taille memoire ram et vidéo:
~~~
user@mamachine: ~
$ VBoxManage modifyvm debian9 --memory 1024 --vram 64
~~~

**je sais pas ce que c'est en dessous**
 VBoxManage showvminfo debian9.4|less

## Commandes supplémentaires

VBoxHeadless :
- VirtualBox est fourni avec une interface appelée VBoxHeadless
- VirtualBox sans tête, VirtualBox sans interface graphique GUI
- VirtualBox démarre les machines en fond de taches
- Les machines sont accessibles via le VRDP ou ssh sous Linux et RDP,Remote Shell sous MS Windows.
- Toutes les opérations possibles avec l’interfaces graphique sont disponibles avec VBoxHeadless et même plus avec VBoxManage
- Deux commandes pour manipuler les vms :
~~~
	VBoxHeadless - Démarre les vms et gère le VRDP
	VBoxManage - Toutes opérations sur les vms 
~~~
VBoxManage est l’interface en ligne de commande de VirtualBox.
- Permet de contrôler totalement VirtualBox depuis la ligne de commandes de votre système d’exploitation hôte.
- VBoxManage supporte toutes les fonctionnalités auxquelles vous donne accès l’interface graphique
- Acceder a l’aide
~~~
	VBoxManage list --help
~~~	
- Lister les vms
~~~
	VBoxManage list vms
~~~
- Démarrer une vms
~~~
	VBoxManage startvm debian9
~~~
- Arréter une vm
~~~
	VBoxManage controlvm debian9 apcipowerbutton
~~~
- Créer une vm
~~~
	VBoxManage createvm –name debian9
~~~
- Création de VM avec VBoxManage :
Déterminer le type d’OS
~~~
	VBoxManage list ostypes
~~~
- Création de la VM
~~~
	VBoxManage createvm --name debian9 --ostype Debian_64 --register
(--register : ajoute la machine à l’inventaire)
(--name : spécifie un nouveau nom de machine virtuelle)
~~~
- Création du disque avec VBoxManage:
~~~
	VBoxManage createhd --filename Ubuntu.vdi --size 30000
~~~
-Ajout d’un contrôleur SATA et du disque
- Ajout d’un controleur SATA
~~~
	VBoxManage storagectl debian --name "SATA Controller" --add sata --controller IntelAHCI
~~~
-Ajout d’un controleur SATA
~~~
	VBoxManage storageattach debian --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium debian.vdi
~~~

## Agrandir le VDI:
- un disque de 8Go  à 25Go
~~~
	VBoxManage modifymedium --resize 25000 debian.vdi
~~~