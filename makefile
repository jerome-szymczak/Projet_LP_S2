all: help

SED=sed$(shell { sed v </dev/null >/dev/null 2>&1 && echo " -r" ; } || echo " -E" )

help:
	@eval $$($(SED) -n 's/^([a-zA-Z0-9_-]+):.*?## (.*)$$/printf "%-20s %s\\n" "\1" "\2";/ ;	ta; b; :a p' $(MAKEFILE_LIST))

sinclude makefile.$(shell uname -n)

.PHONY: check pull push boulgour clean

check:                          ## vérifier la présence des outils nécessaires
	@bin/check-tools && echo OK

todo:                           ## lister les tâches à réaliser (TODO: dans les fichiers)
	-@grep -r "TODO:" --exclude $(MAKEFILE_LIST) *

pull:                           ## récupérer les modifications depuis les dépôts git
	git pull origin
	git pull boulgour master

push: pull                      ## pousser les modifications vers les dépôts git
	git push --all origin
	git push --all boulgour

boulgour:                       ## récupérer les modifications depuis boulgour et synchroniser
	git pull boulgour master
	git push --all origin

clean:                          ## supprimer les fichiers inutiles
	-rm $(shell find . -name "*~")
