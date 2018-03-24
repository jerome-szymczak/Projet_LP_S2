# Cadre du projet
## Intitulé du sujet
Il s'agit de construire une architecture réseau IPv4 permettant à des machines virtuelles de communiquer, de manière transparente, entre elles, avec la machine physique qui les héberge ainsi qu'avec les machines du segment réseau sur lequel est intégrée la machine physique.

L'objectif est de pouvoir effectuer des TP d'administration système utilisant plusieurs machines (en mode *serveur* ou *poste de travail*) sur le même réseau sans trop de difficulté pour l'étape de construction des machines, mais en conservant un minimum de flexibilité (accès extérieur, manipulation des interfaces des machines de TP).

## Contrainte
L'architecture doit être déployable sur une machine physique [Debian](https://www.debian.org) via l'installation d'un paquet au format Debian. 
Elle doit permettre d'accéder à tous les ports des machines virtuelles sans être obligé de mettre en place des redirections de ports. Les seuls accès `root` qu'elle doit nécessiter sont au moment de son installation et de l'installation des outils de virtualisation. 
Un utilisateur standard doit être capable de créer et démarrer des machines virtuelles sans droit d'administration.

Le réseau doit permettre *a minima* de connecter des machines virtuelles gérées par [VirtualBox](https://www.virtualbox.org/). 
L'objectif étant de permettre au final de pouvoir y connecter des machines virtuelles gérées par [VMware Workstation Player](https://www.vmware.com/products/workstation-player.html), [QEMU](https://www.qemu.org)/[KVM](http://www.linux-kvm.org) ainsi que des containers Linux [LXC](https://linuxcontainers.org).

À défaut d'une automatisation complète par la fourniture de commande de création de machine virtuelle adéquates, des explications simples permettant à un utilisateur de créer et connecter sa machine virtuelle à ce réseau doivent être fournies sous la forme de documentation adaptée à chaque cas géré.

# Organisation
## Règles de gestion du projet
- L'intégralité du travail est géré dans un dépôt GIT.
    - un dépôt particulier fait **référence** pour l'avancement du projet : celui accessible par le serveur GitLab de l'IUT ;
    - dans la mesure du possible chaque participant du projet y pousse ses modifications *au moins* une fois par jour (en fin de journée) ;

- Un compte-rendu d'activité hebdomadaire est déposé, via un *commit* particulier, chaque fin de semaine sur le dépôt.

    - il détaille les tâches effectuées et leur responsable ;
    - il liste les éventuels points bloquants ;
    - il liste sommairement les tâches planifiées pour la semaine suivante ;
    - il précise la date et le lieu de la prochaine rencontre avec les tuteurs.

- Des [conventions](conventions.md) de nommage et de codage sont respectées.

## Outils utilisés pour la gestion du projet
- [GIT](https://git-scm.com)

- Pour la rédaction des documentations et présentations
    - [Markdown](https://daringfireball.net/projects/markdown)
        - [GitHub Flavored Markdown](https://github.github.com/gfm)
        - [Mastering Markdown](https://guides.github.com/features/mastering-markdown)
    - Mdoc
        - https://manpages.bsd.lv/mdoc.html
        - man(7), mdoc(7), groff(7)

## Plannification du travail

# Etat de l'art
include etat-de-lart.md

# Mise en oeuvre du projet
include mise-en-oeuvre.md *Manque problèmes rencontrés*

# Procédure de test
include test.md *Manque test sur VM*

# Conclusion

# Annexe
