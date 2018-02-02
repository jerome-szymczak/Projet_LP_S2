---
title: md2beamer
author:
- Bruno BEAUFILS
date: 16 mars 2017
logo:
- file: logo-cgir
  width: .15
- file: logo-univ-lille
...

# Introduction

## Guide rapide

### Un exemple

- Cette présentation est produite à partir de `modele-diaporama.md`
- Elle est conçue pour des présentations simples

### Un modèle

- Elle constitue un *modèle* pour faire d'autre présentations :
    1. créer un nouveau dossier
    2. y copier, renommer puis modifier le fichier `modele-diaporama.md`
    3. mettre les images utilisées dans le répertoire `img`
    4. créer la présentation via la commande
    
            ../bin/md2beamer nom-du-fichier.md img


# Faire une présentation avec `md2beamer`


## Introduction

- [Markdown](https://daringfireball.net/projects/markdown) est un langage de **balisage** *simple*
    - facile à lire et écrire par les humains et les programmes
    - qui permet de transformer un fichier balisé vers HTML ou PDF *automatiquement*
    - dont il existe plusieurs [variantes](https://flavoredmarkdown.com/)
    
- [Pandoc](https://pandoc.org) est un logiciel de conversion de documents
    - il permet de convertir des fichiers d'un format de balisage à un autre

- [LaTeX](https://www.latex-project.org) est un outil de composition de texte

- [Beamer](https://github.com/josephwright/beamer) est un paquet LaTeX pour préparer des présentations

- **`md2beamer`** est un simple script shell qui
    - *enveloppe* la conversion d'un fichier Markdown vers un un fichier PDF
    - utilise `pandoc` pour convertir le fichier en LaTeX avec la classe Beamer
    - utilise `pdflatex` pour convertir le fichier LaTeX en PDF
    - ajoute quelques extensions (et en active de `pandoc`)


## Utiliser `md2beamer` pour faire une présentation

- Conseils
    1. construire la structure (plan) de la présentation en premier
    2. remplir le contenu ensuite sans trop surcharger le texte
    3. ne pas s'occuper de la mise en forme (`md2beamer` s'en occupe) 
    4. avoir un peu de discipline
        - être attentif aux indentations des lignes
        - espacer les sections de diapositives 
        - préférer les images vectoriels (SVG) aux matricielles
        - préférer le format PNG pour les images matricielles 

. . .

- Avantages
    - construction **très rapide** de présentation propre
    - forme déportée vers le thème

- Inconvénients
    - pas de constructions complexes (solution : LaTeX/Beamer directement)
    - pas d'utilisation simple de caractères unicode exotique 
    - difficile à débugger sans maîtriser la chaîne `pandoc`--`pdflatex`
        - l'option `-d` peut aider (sources dans `/tmp/md2beamer`)


# Une courte référence


## Markdown

La syntaxe de Markdown permet 

- de donner une **structure** au document
    - **paragraphes** : séparation par des lignes vides
    - **titres de différents niveaux** : lignes débutant par des `#`
    - **listes libres** : indentation de paragraphe avec lignes débutant par des `-` ou des `*`
    - **listes ordonnées** : indentation avec lignes débutant par des `1.`
    - **blocs de citations** : paragraphes préfixés `> `
    - **blocs de codes** : paragraphes indentés par 4 espaces

- d'inclure des éléments de mise en forme logique 

    *emphase*, **accentuation forte** et `code`

- d'inclure des liens vers des URL
    - <https://daringfireball.net/projects/markdown>
    - [Markdown à la sauce Github](https://guides.github.com/features/mastering-markdown)

    
Elle est décrite en détails ailleurs (cf liens de cette diapo)


## Markdown : images

`![Texte alternatif pour HTML](img/tex-friendly-zone.svg)`

![Texte alternatif pour HTML](img/tex-friendly-zone.svg)


## Markdown : images

`![Texte alternatif pour HTML](img/tex-friendly-zone.svg)`

![Texte alternatif pour HTML](img/tex-friendly-zone.svg)


## `md2beamer` : images

- centre les images horizontalement 
- ajuste la largeur automatiquement (attention à la hauteur, cf diapo précédente)
- convertit automatiquement les références `.svg` en `.pdf` (qui doivent exister)
- permet de spécifier une largeur ou une hauteur relative pour une image

  `![TeX Friendly Zone](img/tex-friendly-zone.svg){ width=30% }`

  ![TeX Friendly Zone](img/tex-friendly-zone.svg){ width=30% }


## {.plain}

![Tux](img/tux.svg)

Une diapo nommé `{.plain}` n'a ni titre, ni pied de page


## `md2beamer` : tableaux

- Un support très basique des tableaux est inclus
    - utilisation de l'option `pipe_tables` de `pandoc`
    
| **Outil**  | **Utilité**                                                 |
|------------|-------------------------------------------------------------|
| `pandoc`   | conversion de formats                                       |
| `pdflatex` | composition de LaTeX en PDF                                 |
| `beamer`   | jeux de balisage LaTeX pour la composition de présentation  |


## `md2beamer` : réglages `pandoc` utilisés

- les diapositives sont les élements de niveau 2
    - niveaux supérieurs sont les sections du diaporama
    - niveaux inférieurs sont des blocs 
    - modifiable avec l'option `-s`

    . . .

- affichage incrémental

    > - pause via un paragraphe avec une ligne de trois points
    > 
    >         . . .
    > 
    > - des items de listes dans des blocs de citations
    > 
    >         > -

    . . .
    
- le document peut commencer par un bloc [YAML](http://yaml.org/)
    - `title`, `subtitle`, `author`, `date`
    - `logo` :  logos sur la page de titre 
        - `file` : fichier sans extension
        - `width` : largeur en pourcentage (<1) de largeur diapo (0.1 par défaut)
        - `nl` : passage à la ligne après le logo


## `md2beamer` : utilisation

- plusieurs thèmes inclus 
    - choix du thème via l'option `-t`
    - par défaut thème `ulille`
- documentation
    - intégrée

            md2beamer -h

    - lire la section *Structuring the slide show* de `pandoc(1)` aide vraiment
