# Installation de Virtualbox
**Attention** Si vous avez des machines VirtualBox en route, KVM ne voudra pas lancer de VM.

Si vous voulez utiliser un système invité en 64 bits, il est nécessaire que l'ordinateur supporte la virtualisation matérielle (VT-x [vmx] ou AMD-V [svm])


## Prérequis:
Installation de du transport https
~~~
# apt-get install apt-transport-https
~~~

## Installation de VirtualBox

1. Récupération de la clef de signature du dépôt de VirtualBox
~~~
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
~~~

2. Ajout du dépôt d'Oracle dans /etc/apt/source.list.d/
~~~
# echo "deb https://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"|tee /etc/apt/sources.list.d/virtualbox.list
~~~
Mise à jour de la liste des paquets
~~~
# apt-get update
~~~

3. Installation de VirtualBox
~~~
# apt-get install virtualbox-5.2.8
~~~

## Optimisation de VirtualBox avec le Pack d'extension Oracle VM VirtualBox :
Prise en charge des périphériques USB 2.0 et USB 3.0, VirtualBox RDP, cryptage de disque, démarrage NVMe et PXE pour les cartes Intel.Téléchargement en root
~~~
 version=$(VBoxManage --version|cut -dr -f1|cut -d'_' -f1) && wget -c http://download.virtualbox.org/virtualbox/$version/Oracle_VM_VirtualBox_Extension_Pack-$version.vbox-extpack
~~~
Il faudra ensuite installer le pack dans la VM :
~~~
     cd /media/cdrom/
     sh ./VBoxLinuxAdditions.run
~~~
## Installation d'une VM en ligne de commande
1. Création d'une machine
~~~
$ VBoxManage createvm --name debian9.4 --ostype Debian_64 --register
~~~
(--register : ajoute la machine à l’inventaire)
(--name : spécifie un nouveau nom de machine virtuelle)

2. Création du disque 10G
~~~
$ VBoxManage createhd --filename debian9.4.vdi --size 10000
~~~

3. Attacher le disque
~~~
$ VBoxManage storagectl debian9.4 --name "SATA Controller" --add sata --controller IntelAHCI
$ VBoxManage storageattach debian9.4 --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium debian.vdi
~~~

4. Ajouter le lecteur DVD 
~~~
$ VBoxManage storagectl debian9 --name "IDE Controller" --add ide
~~~
5. Ajout de l'image iso
~~~
$ VBoxManage storageattach debian9 --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium/home/simon/Documents/ISO/Linux/Debian 9.2.1amd641.iso
~~~
 
6. Modification de la taille memoire ram et vidéo:
~~~
$ VBoxManage modifyvm debian9 --memory 1024 --vram 64
~~~

7. Voir les information de la VM:
~~~
$  VBoxManage showvminfo debian9.4|less
~~~


## Commandes supplémentaires et explications de VBoxHeadless et de VBoxManage

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

VBoxManage :
- Est l’interface en ligne de commande de VirtualBox.
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
- Déterminer le type de l’OS:

~~~
	VBoxManage list ostypes
~~~

## Changer l’UUID d’une VM:

- Cette commande est necessaire si on fait un copier coller de l’image d’un disque virtuel (fichier .vdi)
pour éviter de ré-installer un système d’exploitation à partir de zéro sans passer par clonehd.

~~~
    VBoxManage internalcommands sethduuid vmfilename
~~~

## Cloner une VM:

- Cette commande permet de dupliquer l'image de disque dur virtuel enregistré avec un nouvel identificateur unique (UUID).

~~~
    VBoxManage clonehd src_vmfilename dst_vmfilename
~~~

## Agrandir le VDI:

 - un disque de 8Go  à 25Go

~~~
	VBoxManage modifymedium --resize 25000 debian.vdi
~~~
