#TP 2

#Exercice 1)

#Chargement des données
bank <- read.csv(file= "bankFailures.csv", sep = "\t", stringsAsFactors = FALSE)

#Nettoyage des données de R8CosVen
bank$R8CosVen <- suppressWarnings(as.numeric(bank$R8CosVen))
bank$R8CosVen[is.na(bank$R8CosVen)] <- median(bank$R8CosVen, na.rm = TRUE)

#On ne garde que les colonnes 3 à 11 pour l'ACP
X <- bank[, 3:11]

#Réalisation de l'ACP 
#scale=True pour standardiser les variables les mettre à la meme échelle
acp <- prcomp(X, scale. = TRUE)

#Analyse des valeurs propres (variances associées à chaque axe)
val_propres <- acp$sdev^2
print(val_propres)

#Pourcentage de variance expliquée par chaque composante
variance_expliquee <- (val_propres / sum(val_propres)) * 100
print("Pourcentage de variance expliquée:")
print(variance_expliquee)

#Affichage des graphiques demandés
#Éboulis des valeurs propres
plot(acp, main = "Éboulis des valeurs propres")

# Double graphique (Biplot) combinant individus et variables
biplot(acp, main = "Biplot de l'ACP - Banques Espagnoles")

#Calcul et affichage du centre de gravité des groupes (Faillite vs Survie)
scores <- acp$x[, 1:2] # Récupération des coordonnées sur les deux premiers axes principaux
centre_gravite <- aggregate(scores ~ bank$Output, FUN = mean)
colnames(centre_gravite)[1] <- "Indicateur_Sortie (Output)"

print("Centres de gravité des groupes")
print(centre_gravite)


# /!\ code servant uniquement à mettre en évidence les banques en faillite et les banques saines sur le biplot. Il n'est pas nécessaire pour l'ACP elle-même.

# # 1. Définir une couleur et un symbole pour chaque banque en fonction de son 'Output'
# # Output == 1 (Faillite) -> Rouge, triangle (pch = 17)
# # Output == 0 (Survie)   -> Bleu, rond (pch = 19)
# couleurs <- ifelse(bank$Output == 1, "red", "blue")
# symboles <- ifelse(bank$Output == 1, 17, 19)

# # 2. Récupérer les coordonnées des individus sur les axes 1 et 2
# scores <- acp$x

# # 3. Afficher le nuage de points avec ces couleurs et symboles
# plot(scores[, 1], scores[, 2], 
#      col = couleurs, 
#      pch = symboles, 
#      cex = 1.2, # Taille des points
#      xlab = "Composante 1", 
#      ylab = "Composante 2", 
#      main = "ACP : Distinction des banques en faillite")

# # 4. Ajouter une grille et une légende explicative
# abline(h = 0, v = 0, col = "grey", lty = 2)
# legend("topright", 
#        legend = c("Banques saines (0)", "Banques en faillite (1)"), 
#        col = c("blue", "red"), 
#        pch = c(19, 17))
