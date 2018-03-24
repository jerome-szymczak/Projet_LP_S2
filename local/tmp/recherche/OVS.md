### OpenVSwitch

Open vswitch est un commutateur logiciel multicouche sous licence open source Apache 2. 
Il est bien adapté pour fonctionner comme un commutateur virtuel, qui fournit des fonctionnalités avancées de commutation, mais également de QoS, 
d’agrégation de liens, de Vlan, de collecte de données. 
Il a été conçu pour prendre en charge la distribution sur plusieurs serveurs physiques. Open vswitch prend en charge plusieurs technologies de virtualisation basées sur Linux, 
notamment Xen / Xen Server, KVM et Virtualbox.La majeure partie du code est écrite en C indépendant de la plate-forme et peut-être facilement transférée vers d'autres environnements.
OpenvSwitch est un commutateur virtuel compatible avec les chipsets des switchs modernes commutateur administrable avec le protocole Open flow.
Il supporte le VLAN 802.1 Q, isolation et filtre de traffics agrégation de lien, lac, Channel boding, gestion des flux et QoS Bande passante.
Il est conçu pour prendre en charge la distribution sur plusieurs serveurs physiques similaires au vswitch distribué de Vmware ou au Nexus 1000V de Cisco.

~~~
VMware a officialisé l’abandon prochain de son API VDS, qui permettait l’intégration de commutateurs virtuels tiers à vSphere. Selon la firme, 
l’API continuera à être supportée pour les clients VMware jusqu’à la version 6.5 update 1 de vSphere. Dans toutes les versions ultérieures, 
le support de l’API permettant le support de « vSwitches » tiers sera retiré.
source :"http://www.lemagit.fr"
~~~