# #TP 2

# #Exercice 1)

# #Chargement des données
# bank <- read.csv(file= "bankFailures.csv", sep = "\t", stringsAsFactors = FALSE)

# #Nettoyage des données de R8CosVen
# bank$R8CosVen <- suppressWarnings(as.numeric(bank$R8CosVen))
# bank$R8CosVen[is.na(bank$R8CosVen)] <- median(bank$R8CosVen, na.rm = TRUE)

# #On ne garde que les colonnes 3 à 11 pour l'ACP
# X <- bank[, 3:11]

# #Réalisation de l'ACP 
# #scale=True pour standardiser les variables les mettre à la meme échelle
# acp <- prcomp(X, scale. = TRUE)

# #Analyse des valeurs propres (variances associées à chaque axe)
# val_propres <- acp$sdev^2
# print(val_propres)

# #Pourcentage de variance expliquée par chaque composante
# variance_expliquee <- (val_propres / sum(val_propres)) * 100
# print("Pourcentage de variance expliquée:")
# print(variance_expliquee)

# #Affichage des graphiques demandés
# #Éboulis des valeurs propres
# plot(acp, main = "Éboulis des valeurs propres")

# # Double graphique (Biplot) combinant individus et variables
# biplot(acp, main = "Biplot de l'ACP - Banques Espagnoles")

# #Calcul et affichage du centre de gravité des groupes (Faillite vs Survie)
# scores <- acp$x[, 1:2] # Récupération des coordonnées sur les deux premiers axes principaux
# centre_gravite <- aggregate(scores ~ bank$Output, FUN = mean)
# colnames(centre_gravite)[1] <- "Indicateur_Sortie (Output)"

# print("Centres de gravité des groupes")
# print(centre_gravite)


# # /!\ code servant uniquement à mettre en évidence les banques en faillite et les banques saines sur le biplot. Il n'est pas nécessaire pour l'ACP elle-même.

# # # 1. Définir une couleur et un symbole pour chaque banque en fonction de son 'Output'
# # # Output == 1 (Faillite) -> Rouge, triangle (pch = 17)
# # # Output == 0 (Survie)   -> Bleu, rond (pch = 19)
# # couleurs <- ifelse(bank$Output == 1, "red", "blue")
# # symboles <- ifelse(bank$Output == 1, 17, 19)

# # # 2. Récupérer les coordonnées des individus sur les axes 1 et 2
# # scores <- acp$x

# # # 3. Afficher le nuage de points avec ces couleurs et symboles
# # plot(scores[, 1], scores[, 2], 
# #      col = couleurs, 
# #      pch = symboles, 
# #      cex = 1.2, # Taille des points
# #      xlab = "Composante 1", 
# #      ylab = "Composante 2", 
# #      main = "ACP : Distinction des banques en faillite")

# # # 4. Ajouter une grille et une légende explicative
# # abline(h = 0, v = 0, col = "grey", lty = 2)
# # legend("topright", 
# #        legend = c("Banques saines (0)", "Banques en faillite (1)"), 
# #        col = c("blue", "red"), 
# #        pch = c(19, 17))


# #Exercice 2)

# #Chargement des données
# A <- read.table("villesAmericaines.txt", header = TRUE, sep = "", stringsAsFactors = FALSE)
# # #On selectionne les colonnes pour l'ACP
# X <- A[, 2:10]

# #ACP sans standardisation
# acp_sans_std <- prcomp(X, scale. = FALSE)

# print("ACP SANS standardisation : Valeurs propres:")
# val_propres_sans <- acp_sans_std$sdev^2
# print(val_propres_sans)

# print("Variance expliquée (%) SANS standardisation:")
# print((val_propres_sans / sum(val_propres_sans)) * 100)


# #ACP avec standardisation
# acp_avec_std <- prcomp(X, scale. = TRUE)

# print("ACP AVEC standardisation : Valeurs propres:")
# val_propres_avec <- acp_avec_std$sdev^2
# print(val_propres_avec)

# print("Variance expliquée (%) AVEC standardisation:")
# print((val_propres_avec / sum(val_propres_avec)) * 100)


# #Visualisation

# scores <- pca_avec_std$x

# plot(scores[, 1], scores[, 2], 
#      col = "blue", pch = 19, cex = 0.8,
#      xlab = "Composante 1 (CP1)", 
#      ylab = "Composante 2 (CP2)", 
#      main = "ACP des villes américaines (Plan factoriel)")
# abline(h = 0, v = 0, col = "grey", lty = 2)


# text(scores[villes_data$Name == "Little-Rock,North-Little-Rock,AR", 1], 
#      scores[villes_data$Name == "Little-Rock,North-Little-Rock,AR", 2], 
#      labels = "Little Rock", pos = 3, col = "red", font = 2)


# #Exercice 3)

# #Chargement des données
# A <- read.table("oliveoil.txt", header = TRUE, sep = "", stringsAsFactors = FALSE)

# #On selectionne les colonnes pour l'ACP
# X <- A[, 3:10]

# #ACP sans standardisation
# acp_sans_std <- prcomp(X, scale. = FALSE)

# print("ACP SANS standardisation : Valeurs propres:")
# val_propres_sans <- acp_sans_std$sdev^2
# print(val_propres_sans)

# print("Variance expliquée (%) SANS standardisation:")
# print((val_propres_sans / sum(val_propres_sans)) * 100)


# #ACP avec standardisation
# acp_avec_std <- prcomp(X, scale. = TRUE)

# print("ACP AVEC standardisation : Valeurs propres:")
# val_propres_avec <- acp_avec_std$sdev^2
# print(val_propres_avec)

# print("Variance expliquée (%) AVEC standardisation:")
# print((val_propres_avec / sum(val_propres_avec)) * 100)


# #Visualisation

# scores <- acp_avec_std$x

# couleurs <- ifelse(A$région == "South", "red", "blue")


# plot(scores[, 1], scores[, 2], 
#      col = couleurs, pch = 19, cex = 0.8,
#      xlab = "Composante 1 (CP1)", 
#      ylab = "Composante 2 (CP2)", 
#      main = "ACP des huiles d'olive ")

# abline(h = 0, v = 0, col = "grey", lty = 2)

# # Ajout d'une légende pour distinguer les regroupements géographiques
# legend("topright", 
#        legend = c("Sud (South)", "Centre-Nord (Centre.North)"), 
#        col = c("red", "blue"), 
#        pch = 19)


#Exercice 4)

library(jpeg)
img = readJPEG("Joconde.jpg")

##Extraction des couleurs
img_r <- img[,,1]
img_g <- img[,,2]
img_b <- img[,,3]

#ACP sur les couleurs
acp_r <- prcomp(img_r, scale. = FALSE)
acp_g <- prcomp(img_g, scale. = FALSE)
acp_b <- prcomp(img_b, scale. = FALSE)

#Visualisation des valeurs propres pour chaque canal de couleur

# par(mfrow = c(1, 3))
# plot(acp_r$sdev^2, type = "l", main = "Éboulis - Canal Rouge", ylab = "Variance")
# plot(acp_g$sdev^2, type = "l", main = "Éboulis - Canal Vert", ylab = "Variance")
# plot(acp_b$sdev^2, type = "l", main = "Éboulis - Canal Bleu", ylab = "Variance")  
# par(mfrow = c(1, 3))


k <- 100

#Reconstruction pour chaque cannaux
reconstruire_canal <- function(acp_canal, original_matrix, k) {
  scores <- acp_canal$x[, 1:k]
  loadings <- acp_canal$rotation[, 1:k]
  img_approx <- scores %*% t(loadings) + rep(acp_canal$center, each = nrow(original_matrix))
  return(img_approx)
}

img_r_rec <- reconstruire_canal(acp_r, img_r, k)
img_g_rec <- reconstruire_canal(acp_g, img_g, k)
img_b_rec <- reconstruire_canal(acp_b, img_b, k)

# On réassemble les 3 canaux dans un tableau tridimensionnel
img_compressée <- array(0, dim = dim(img))
img_compressée[,,1] <- img_r_rec
img_compressée[,,2] <- img_g_rec
img_compressée[,,3] <- img_b_rec

img_compressée <- pmax(pmin(img_compressée, 1), 0)

# Affichage en respectant les proportions (n = hauteur, p = largeur, en pixels)
n <- dim(img)[1]; p <- dim(img)[2]
plot(NA, xlim = c(0, p), ylim = c(0, n), asp = 1, bty = "n",
     xaxt = "n", yaxt = "n", xlab = "", ylab = "",
     main = paste("Joconde compressée avec k =", k))
rasterImage(img_compressée, 0, 0, p, n)