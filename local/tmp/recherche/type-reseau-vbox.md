# Le réseau virtuel

## Les adaptateurs virtuels

-VirtualBox offre pour chaque machine virtuelle huit cartes réseaux et peut virtualiser 6 types de cartes réseaux suivants: 
-AMD PCNet PCI II (Am79C970A) , AMD PCNet FAST III (Am79C973, par défaut) elle est supportée par presque tous les systèmes d’exploitation.
-Intel PRO/1000 MT Desktop (82540EM) , Intel PRO/1000 T Server(82543GC) , Intel PRO/1000 MT Server (82545EM) Le type Intel PRO/1000 MT Desktop fonctionne avec Windows Vista et les versions supérieures.
-Adaptateur réseau paravirtualisé (virtio-net) VirtualBox fournit un support des pilotes réseaux du standard industriel “virtio”, qui font partie du projet libre KVM. Une interface est créée lors de l’installation des pilotes dans le système invité. Ils sont déjà inclus dans le noyau Linux mais il est nécessaire de les installer sur Microsoft Windows.

## Le NAT
Le NAT est la manière la plus simple d’accéder à un réseau externe à partir d’une machine virtuelle. C’est le mode réseau par défaut de VirtualBox.C'est le DHCP intégré à VirtualBox qui fournit l'adresse à la machine virtuelle.
L’inconvénient du mode NAT la machine virtuelle est invisible et injoignable depuis le réseau .La machine virtuelle utilise la connexion réseau du système hôte pour communiquer avec internet. Toutefois il est possible de rediriger les ports afin d'accéder à la machine virtuelle.

## Le réseau Host-only
Le réseau Host-only est un mode réseau « interne ». Les machines virtuelles sont isolées et ne peuvent pas se connecter sur le réseau externe, ni sur internet.Le mode réseau host-only, crée une nouvelle interface logicielle “loopback” sur l’hôte.

## Le réseau interne
Ce mode permet à plusieurs machines virtuelles d'être dans un réseau isolé, comme un VLAN. Les machines virtuelles doivent être sur le même hôte pour se voir. Il n’y a pas de configuration DHCP

## Le bridge ou accès par pont
L’accès par pont utilise un pilote de périphérique sur le système hôte qui filtre les données de l’adaptateur réseau physique. VirtualBox intercepte les données du réseau physique et les envoie à
l’invité, via une interface réseau logicielle.
La machine virtuelle est directement connectée sur le réseau physique. Elle a accès à toutes les machines du réseau physique. Elle peut donc offrir des services réseau.





