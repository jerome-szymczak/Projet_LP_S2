#!/bin/bash 
PS3="Entrez votre choix : "
select action in "Envoyer" "Recevoir" "Status" "Historique" "Annuler"
do
	echo "Vous avez choisi de $action"
	if test $REPLY -eq 1
		then
			git add *
			echo "Votre commentaire :"
			read commentaire
			git commit -m "$commentaire"
			git push
			break
	elif test $REPLY -eq 2
		then
			git pull
			break
	elif test $REPLY -eq 3
		then
			git status
			break
	elif test $REPLY -eq 4
		then
			git log
			break
	elif test $REPLY -eq 5
		then
			echo "Au revoir"
			exit 0
	else 
		echo "Mauvais choix, recommencez"

	fi
done
exit 0