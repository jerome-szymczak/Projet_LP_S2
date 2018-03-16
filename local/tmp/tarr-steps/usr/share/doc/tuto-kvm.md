# Installation de KVM
**Attention** Si vous avez des machines VirtualBox en route, KVM ne voudra pas lancer de VM.


## Verification 
on va tout d'abord vérifier que votre microprocesseur permet une virtualisation avec KVM.
~~~
user@mamachine: ~
$ grep -E 'vmx|svm' /proc/cpuinfo &>/dev/null && echo "La virtualisation est possible." || echo "Cette machine ne permet pas d'utiliser la virtualisation avec KVM."
~~~

## Installation
On va maintenant les paquets.
~~~
root@mamachine: ~
# apt-get update && apt-get install qemu-kvm libvirt-daemon-system libvirt-dev libvirt-clients
~~~

## Ajout des utilisateurs aux groupes
Nous allons ajouter des utilisateurs aux groupes kvm et libvirt
~~~
root@mamachine: ~
# adduser user kvm && adduser user libvirt
~~~
*user* est le nom de l'utilisateur qui va créer des machines virtuelles

## Création d'une image disque
Nous allons créer une image disque qui va nous servir de disque dur
~~~
user@mamachine: ~
$ qemu-img create -f qcow2 monImage 10G
~~~
*monImage* est le nom que vous donnerez à votre image
*10G* est la taille alloué au disque

## Installation d'un système d'exploitation
Nous allons installer le système d'exploitation grâce à un fichier image ISO
~~~
user@mamachine: ~
$ kvm -m 2G -cpu host monImage -cdrom NomDuFichierTéléchargé.iso -boot d
~~~
*monImage* l'image que vous aurez créer précédement
*NomDuFichierTéléchargé.iso* fichier iso servant à l'installation

**Sur un PC à distance**
ajouter ça *--vnc :0 -k fr* à la fin de la ligne
il faut que vous possèdiez vncviewver sur votre PC

## Lancement de la VM
Vérifier que tap0 existe bien
Pour lancer votre VM sur notre réseau super génial.
~~~
user@mamachine: ~
$ kvm -net nic,model=rtl8139,vlan=0,macaddr=00:11:22:33:44:55 -net tap,vlan=0,ifname=tap0,script=no -enable-kvm -m 512 monImage
~~~

# Félicitation !