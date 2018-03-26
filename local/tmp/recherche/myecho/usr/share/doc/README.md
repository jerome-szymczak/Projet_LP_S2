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

- Pour vérifier que la paquet a bien été installé
~~~
ls /usr/bin/ | grep myecho    ou    dpkg -l myecho
~~~

- Pour executer la commande
~~~
myecho
~~~

- Pour désintaller le paquet
~~~
apt-get remove myecho
~~~

- Pour vérifier que la suppression a bien été effectué
~~~
ls /usr/bin/ | grep myecho    ou    dpkg -l myecho
~~~

