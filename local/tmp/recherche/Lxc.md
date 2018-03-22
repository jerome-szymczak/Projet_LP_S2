###LXC :
**LXC**(contraction de l'anglais de Linux Containers) est un système de virtualisation utilisant l'isolation au niveau système d'exploitation comme méthode de cloisonnement. Son rôle est de créer un environnement aussi proche que possible d'une installation Linux standard, mais sans avoir besoin d'un noyau séparé. Les conteneurs LXC sont souvent considérés comme un compromis entre le mode "chroot*" et une machine virtuelle. LXC est donc un ensemble de processus qui nous permettent d'isolés des éléments du reste du système. Il aura également accès à sa propre interface réseau, sa table de routage. Mais la différence notable, contrairement à Xen et KVM c'est l'absence d'un deuxième noyau. LXC va utiliser le même noyau que la machine hôte (Dom0). Les avantages de cette solution sont un gain de performances en l'absence d'hyperviseur et de noyau intermédiaire.
L’autre avantage est la faible occupation de la ressource mémoire.  
 
Les conteneurs LXC ne fournissent pas une isolation complète, c’est dû au fait que le noyau est partagé entre le Dom0 et les conteneurs. L’autre désavantage est une mise en place plus complexe qu’une installation sur machine virtuelle. 
Après la mise en place quelques prérequis nécessaire au bon fonctionnement, il s'agira de mettre en fonctionnement notre configuration réseau. 
Ainsi chaque conteneur aura une interface réseau virtuelle et la connexion au vrai réseau passera par un pont. Il existe deux manières de se connecter à l’interface virtuelle, soit branchée sur l'interface physique de la machine hôte (directement sur le réseau), soit branchée sur une autre interface virtuelle de l'hôte(pourra router le trafic). Les deux solutions passent par le biais du paquet  bridge-utils dont dépend LXC. C’est la seconde solution que nous avons retenu.

Dans un premier temps il faut configurer le fichier lxc-net afin qu’il crée le switch. Puis dans un second temps on crée l’interface virtuelle tap0 et enfin un tunnel entre tap0 et le switch est créé par lxc-net. L'hôte fera donc office de passerelle pour que nos machines virtuelles puissent communiquer avec l'extérieur. 

* *Cette commande permet d'isoler l'exécution d'un programme.*
