Solution

Dans une galaxie lointaine très lointaine, deux solutions exités. Mais de jeunes aventuriers, on dûe faire un choix, soit passer par le biais d'un script deja réalisé(lxc-net), soit en créant leur propre script. Leur choix ne fût pas un mince à faire mais en prenant conscience de leurs capacités, ils choissirent la solution facile, le script deja fait. Cette solution comprennait plusieurs avantages tel que ne pas dépendre de l'architecture en place sur la machine, un léger cout en consommation de mémoire et une utilisation assez simple. Mais ces jeunes aventuriers se rendirent compte que le script ne suffisait pas et qu'il devait ajouter une fonction de transmission et de réception de paquet. 

Les deux solutions 

Pour choisir notre solution, nous avions deux solutions réalisable en respectant les contraintes fixéq dans le cahier de charges, soit passer par le biais d'un script existant(lxc-net), soit créer notre propre script permettant la création d'un switch virtuel. 


Les deux solutions passent par le biais du paquet  bridge-utils dont dépend LXC. C’est la seconde solution que nous avons retenu.
Dans un premier temps il faut configurer le fichier lxc-net afin qu’il crée le switch. Puis dans un second temps on crée l’interface virtuelle tap0 et enfin un tunnel entre tap0 et le switch est créé par lxc-net. L'hôte fera donc office de passerelle pour que nos machines virtuelles puissent communiquer avec l'extérieur.


LXC-net

- pas dépendants de l'architecture
- léger en conso de mémoire
- simple d'utilisation

TUN/TAP

- Très simple à mettre en place
- Permet une transmission et reception des paquets