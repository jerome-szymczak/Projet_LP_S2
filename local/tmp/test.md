## Installation de notre paquet
- 1.Installation du paquet

 - Le paquet a bien été installé mais il manque les dépendances : OK
    
    ~~~
    # dpkg -i tarr-steps
    ~~~

 - Les dépendances se sont bien installé : OK
    
    ~~~
    # apt-get install -f
    ~~~

 - Vérification que le préinst s'éxécute
    
    ~~~
    $ cat /etc/default/lxc-net
    $ ip a
    ~~~

- 2.L'éxécution de notre script

 - affichage de l'aide à l'éxécution du script : OK
    
    ~~~
    $ tarr-steps -h
    ~~~

 - Configuration de l'dresse du switch et affichage de ces changements : OK
    
    ~~~
    $ tarr-steps -ip 192.168.194.1/24
    $ tarr-steps -l
    ~~~

 - Relance du script lxc-net pour mettre à jour le switch virtuel : OK
    
    ~~~
    $ tarr-steps -r 
    $ ip a
    ~~~

- 3.Désintallation de notre paquet

 - Le paquet a bien été désintaller
    
    ~~~
    # apt-get remove tarr-steps
    # dpkg -l tarr-steps
    ~~~

 - Vérification que le postrm s'éxécute : OK
    
    ~~~
    # cat /etc/default/lxc-net
    $ ip a
    ~~~

*Remarque :* 
Lors de la désintallation, les dépendances ne sont pas désintaller. 
On pourrait les désinaller avec un script 'posrrm' qui ferai un apt-get autoremove.

## Test avec Virtualbox
### Démarrage de deux machines virtuelles


### Test de la communication entre machines
1. ping d'une machine virtuelle à l'autre
2. ping sur la machine physique
3. ssh

## Test avec QEMU/KVM
