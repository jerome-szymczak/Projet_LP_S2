Pour installer mon paquet Debian  
- On se place dans notre répertoire où se trouve le paquet

- On va maintenant créer le paquet .deb qui va nous servir pour l'installation(à utiliser en tant que root)
~~~
dpkg-deb --build myecho # Vous affiche normalement ceci "dpkg-deb: building package 'myecho' in 'myecho.deb'."
~~~

- Pour installer notre paquet maintenant créer, nous allons devoir utiliser
~~~
dpkg -i myecho.deb 
~~~

- Pour executer la commande
~~~
myecho
~~~

- Pour désintaller le paquet
*on n'a pas encore trouvé la solution car le --remove est en conflit avec le --purge quand on execute*
~~~
dpkg --remove --purge myecho
~~~