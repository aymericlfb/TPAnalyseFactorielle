#Ex1)

library(jpeg)
img = readJPEG("Joconde.jpg")

#plot(1:2,type="n")
#rasterImage(img,1.2,1.27,1.8,1.73)

##Extraction des couleurs
img_r <- img[,,1]
img_g <- img[,,2]
img_b <- img[,,3]

##Decomposition svd de chaque couleur
decomp_r <- svd(img_r)
decomp_g <- svd(img_g)
decomp_b <- svd(img_b)


#Calcul des valeurs singulières
val_sing_img_r <- decomp_r$d

val_sing_img_g <- decomp_g$d

val_sing_img_b <- decomp_b$d

#Choix du k
k <- 5

#tronquage des matrices

#red
val_sing_img_r_tronque <- diag(val_sing_img_r[1:k])
matrice_U_r_tronque <- decomp_r$u[, 1:k]
matrice_V_r_tronque <- decomp_r$v[, 1:k]

#green
val_sing_img_g_tronque <- diag(val_sing_img_g[1:k])
matrice_U_g_tronque <- decomp_g$u[, 1:k]
matrice_V_g_tronque <- decomp_g$v[, 1:k]

#blue
val_sing_img_b_tronque <- diag(val_sing_img_b[1:k])
matrice_U_b_tronque <- decomp_b$u[, 1:k]
matrice_V_b_tronque <- decomp_b$v[, 1:k]

#recomposition des matrices pour chaque couleur (UAV^t) 
recomp_r <- matrice_U_r_tronque%*%val_sing_img_r_tronque%*%t(matrice_V_r_tronque)
recomp_g <- matrice_U_g_tronque%*%val_sing_img_g_tronque%*%t(matrice_V_g_tronque)
recomp_b <- matrice_U_b_tronque%*%val_sing_img_b_tronque%*%t(matrice_V_b_tronque)

#reassemblage de l'image
img_compressee <- array(0, dim = dim(img))

img_compressee[,,1] <- recomp_r
img_compressee[,,2] <- recomp_g 
img_compressee[,,3] <- recomp_b

#Etape necessaire car lors du produit matricielle certaines valeur sont soit devenue négative ou supérieur à 1 
img_compressee <- pmin(pmax(img_compressee, 0), 1)


plot(1:2,type="n")
rasterImage(img_compressee,1.2,1.27,1.8,1.73)

#Ex 2)

library(Matrix)
library(irlba)
library(ggplot2)


#Chargement des données
A <- readMM("C:/Users/aymmu/Documents/GitHub/TPAnalyseFactorielle/TP1/bbc/bbc.mtx")
terms <- readLines("C:/Users/aymmu/Documents/GitHub/TPAnalyseFactorielle/TP1/bbc/bbc.terms")

#Chargement des classes
dossier_data <- "C:/Users/aymmu/Documents/GitHub/TPAnalyseFactorielle/TP1/bbc/"

#sert à pointer bbc.classes en passant par dessus les commentaires
classes_file <- paste0(dossier_data, "bbc.classes")
#stringAsFactors=False sert à garder les valeurs en string et non en facteur
classes_data <- read.table(classes_file, header = FALSE, skip = 4, stringsAsFactors = FALSE)

#Extraction de la colonne des classes pour les graphiques
classes <- as.factor(classes_data$V2)

#Choix du K
k <- 20

# Calcul de la décomposition SVD
svd_res <- irlba(A, nv = k)

U <- svd_res$u  # Matrice des termes (mots)
D <- svd_res$d  # Vecteur des valeurs singulières
V <- svd_res$v  # Matrice des documents

# Tronquage des matrices
D_tronquee <- diag(D[1:k])
U_tronque <- U[, 1:k]
V_tronque <- V[, 1:k]

#recomposition de la matrice
A_recomp <- U_tronque %*% D_tronquee %*% t(V_tronque)


#Graphique valeurs singulières
# plot(1:k, D, type = "b", pch = 19, col = "darkblue",
#      xlab = "Composante", ylab = "Valeur Singulière",
#      main = "valeurs singulières")
# grid()

#creation d'un tableau pour projejter les docs sur les 2 axes
docs_coords <- data.frame(
  Dim1 = V_tronque[, 1],
  Dim2 = V_tronque[, 2],
  Classe = classes
)

#tracé projection
# Tracé de la projection avec ggplot2
plot(docs_coords$Dim1, docs_coords$Dim2, 
     col = as.numeric(docs_coords$Classe), # Attribue une couleur différente par classe
     pch = 16,                             # Forme des points (ronds pleins)
     cex = 0.7,                            # Taille des points
     xlab = "Axe 1", ylab = "Axe 2",
     main = "Projection des documents BBC sur les 2 premiers axes")


top_mots <- function(dimension, u_matrix, mots, n = 10) {
  indices <- order(abs(u_matrix[, dimension]), decreasing = TRUE)[1:n]
  return(mots[indices])
}

cat("Mots les plus représentatifs de l'Axe 1: ")
print(top_mots(1, U_tronque, terms, n = 10))

cat("Mots les plus représentatifs de l'Axe 2")
print(top_mots(2, U_tronque, terms, n = 10))

#Ex 3)

# 1)

library(MASS)


#paramètre de la loi
mu <- c(0, 0) #esperance
sigma <- matrix(c(9, 0, 0, 1), nrow = 2, byrow = TRUE) #matrice de covariance

points <- mvrnorm(n = 100, mu = mu, Sigma = sigma)

# Affichage du nuage de points
plot(points[, 1], points[, 2], 
     col = "blue", pch = 19, 
     xlab = "X1", ylab = "X2", 
     main = "Nuage de 100 points",
     asp = 1) # asp = 1 pour respecter l'échelle (équivalent de axis='equal')
 
#2)
teta=pi/4

matrice_rotation <- matrix(c(cos(teta), -sin(teta), sin(teta), cos(teta)), nrow = 2, byrow = TRUE)

points_rotated <- points %*% matrice_rotation

points(points_rotated[, 1], points_rotated[, 2],
     col = "red", pch = 19,
     xlab = "X1", ylab = "X2",
     main = "Nuage de 100 points après rotation",
     asp = 1)

correlation <- cor(points_rotated[, 1], points_rotated[, 2])

#3)

#calcul matrice covariance
S <- cov(points)

#decomposition spectrale
dec_spectrale <- eigen(S)

print(dec_spectrale$values)
print(dec_spectrale$vectors)


##Ex 4)

library(scatterplot3d)

#Chargement des données
A <- read.table("donnees1aSuperposer.txt", header = FALSE)
B <- read.table("donnees2aSuperposer.txt", header = FALSE)

# Conversion en matrices
A <- as.matrix(A)
B <- as.matrix(B)

# 2. Réalisation de l'ACP pour chaque objet
acp_A <- prcomp(A, center = TRUE, scale. = FALSE)
acp_B <- prcomp(B, center = TRUE, scale. = FALSE)

#Coordonnées nouvelles bases
A_new <- acp_A$x
B_new <- acp_B$x


s <- scatterplot3d(A_new, 
                   xlim = c(-5, 5), ylim = c(-5, 5), zlim = c(-5, 5), 
                   color = "red", pch = 19,
                   main = "Superposition des objets via ACP",
                   xlab = "CP1", ylab = "CP2", zlab = "CP3")



#AJout du second objet dans le repère
s$points3d(B_new, col = "blue", pch = 20)
