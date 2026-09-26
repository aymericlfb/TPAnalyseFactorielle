
##Ex1)

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

