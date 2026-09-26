# TP 1 Analyse Factorielle:
## Introduction à R:
### Exercice 1:

#### 1) a[1] return l'élément d'indice 0 du vecteur, a[1,3] renvoie un erreur de dimension, a[c(1,3)] return les elements d'indices 0 et 2 du vecteur a

![Screen console](captures/Ex1Q1_1.png)

#### 2) créée une matrice b de 5 lignes et 1 colonnes remplies de 1

#### 4) créée un vecteur de contenant tout les chiffres de 1 à 10 avec un pas de 2 (1,3,5,7,9)

#### 6) la commande prend 3 arguments : le premier les valeurs, le deuxieme le nombre de ligne et le troisieme le nombre de colonne NB:les arguments de dimensions sont optionnel, on pourrait juste se contenter de mettre les valeurs (voir commentaires codes)

#### 7) dans matrix le premier arg est les valeurs, le deuxieme le nombre de ligne et le byrow sert à ce que la commande mette les valeurs par ligne et non par colonne (De base R met le parametre byrow à false ce qui au final crée la transposée de la matrice avec byrow=true)

### Exercice 2:

#### 1) la commande multiplie 2 fois le vecteur a du premier exercice, y ajoute le vecteur b puis rajoute 1 dans tout les composites

![Screen console](captures/Ex2Q1_1.png)

#### 2) la commande renvoie l'élément d'indice 2 du vecteur (1,2,3,4,5) donc 3

#### 3)les commandes renvoient les cos et l'exp de chaque valeurs du vecteur a

![Screen console](captures/Ex2Q3_1.png)

#### 4)a*e se contente de multiplier les composites entre eux tandis que a%*%e effectue le produit matricielle

![Screen console](captures/Ex2Q4_1.png)

#### 5)la commande créée la matrice de 5 fois le vecteur e en ligne

![Screen console](captures/Ex2Q5_1.png)

#### t(x) sert à transposer la matrice donnée en argument

#### 6)dim(f) renvoie la dim de la matrice f, f[2,3] renvoie l'elements [2,3] de f, f[,3] renvoie tout les elems de la ligne d'indice 2. Les deux dernieres commandes ne renvoient rien car la matrice n'est pas de dim suffisante

#### 7) cbind colle des objets cote à cote (en colonnes), rbind colle des objet les uns sur les autres(en ligne). il ne faut pas mélanger des matrices et des vecteurs car R va parfois interpréter des vecteurs en ligne ou en colonne car il n'y a pas de deuxieme dimension comme une matrice

#### 8)la commande c sert juste à concatener deux elements enseble

![Screen console](captures/Ex2Q8_1.png)

### Exercice 4:

#### 1) le det de A est -5 ducoup elle n'est pas inversible

#### 2) solve prend 2 paramètres : une matrice A et un vecteur b et renvoie la solution du systeme Ax=b

#### 3) eigen prend en paramètre une matrice A, si cette matrice est symétrique (par défaut R considère que c'est FALSE et utilise un algorithme plus lent pour calculer les vals propre d'une matrice non symétrique) et only.values (si only.values est en FALSE la commande va aussi renvoyer les vecteurs propres, si il n'y a que les vals propre qui nous interesse on doit mettre ce parametre en true)

### Exercice 7:

#### 1) bien penser à se mettre dans setwd("C:/Users/aymmu/Desktop/TP_M1/AF/TP1")  et pour vérifier le fichier dans lequel on se trouve on peut utiliser getwd()

#### 2) sal$salaire renvoie juste la colonne salaire, sal[,5] renvoie la 5eme colonne du tableau sal, attach(sal) attach() permet de chosir une colonne en la cherchant par son nom directement, grace à la commande attache salaire est reconnue comme una variable independante que l'on peut directement afficher 

#### 3) Boxplot(salaire) affiche un graphique de la distribution statistique globale de la variable salaire
#### Boxplot(salaire~SEXE) affiche deux graphiques des  distributions statistiques globale de la variable salaire pour les hommes et les femmes

#### 4) Grâce au graphique on peut voir que le salaire varie enormément en fonction de la CS, les salariés de catégorie 3 se détache nettement des autres catégories inférieures. Avec l'autre graphique on voit que les hommes sont en moyennes plus payé que les femmes.

#### 5) hist affiche l'histogramme des de la fréquence en fonction du salaire

### Exercice 8:

#### 2) la commande trace la courbe de sin(x).
#### x et sin(x) servent à choisir ce que l'on veut tracer, type="l" sert à dire que l'on veut une ligne plutot qu'une suite de point, col="blue" indique la couleur de la courbe, ylim= c(-1,1) definit les limites verticales (donc les vals min et max) 


#### 3) plot créée un nouveau graphique tandis que line rajoute une ligne sur un graphique existant, /!\ si on met line sans qu'il y ai un graphique existant cela génère une erreur

#### 4) cela fait une suite de point rapprochés les uns des autres au lieu d'une courbe continue