##Ex1)

##Q1)
a <- c(10, 5, 3, 6, 21)

##Q2)
b <- matrix(c(1,1,1,1,1),ncol=1)

##Q3)
c <- matrix(rep(1, 5), ncol = 1)

##Q4)
d <- seq(from=1, to=10, by=2)

##Q5)
e <- seq(1:5)

##Q6)
f <- diag(seq(from=1, to=10, by=4),3,3)

# f <- diag(seq(from=1, to=10, by=4))
# f <- diag(c(1, 5, 9))

##Q7)
g <- matrix(c(1,0,0,0,1,2,0,3,1),nrow=3,byrow=TRUE)

##Ex2)

##Q1)
print(2*a+b+1)

##Q2)
print(e[3])

##Q3)
print(cos(a))
print(exp(a))

##Q4)
print(a*e)
print(a%*%e)

##Q5)

print(b%*%e)

##Q6)
print(dim(f))
print(f[2,3])
print(f[,3])
#print(f[2:5,])
#print(f[2:3,4])

##Q7)
print(cbind(b,e))

##Q8)
print("-----------")
print(c(a,b))

##Ex3)

##Q1)
Lst <- list(name="Fred", wife="Mary", no.children=3,child.ages=c(9,7,4))
print(Lst)

##Q2)
print(Lst[[1]])
print(Lst$name)

##Q3)
print(Lst[[4]])
print(Lst[[4]][3])

##Ex4)

##Q1)
A <- matrix(c(1,0,0,0,1,2,0,3,1),nrow=3,byrow=TRUE)
print(det(A))
b1 <- c(1,2,1)

##Q2)
print(solve(A,b1))

##Q3)
print( eigen(A, symmetric=FALSE, only.values = FALSE))

D <- diag(eigen(A, symmetric=FALSE, only.values = TRUE)$values)
P <- eigen(A, symmetric=FALSE, only.values = FALSE)$vectors

###Q4)

P_inv=solve(P)
A2 <- P%*%D%*%P_inv


##Ex7)

##Q1)
sal<-read.csv("salaires.csv")
print(sal)

##Q2)

print("-----------1-------------")
print(sal$salaire)
print("-----------2-------------")
print(sal[,5])
print("-----------3-------------")
print(attach(sal))
print("-----------4-------------")
print(salaire)

##Q3)
print("---------5---------")
print(boxplot(salaire))
print("--------6---------")
print(boxplot(salaire~SEXE))

##Q4)
boxplot(salaire~CS1)
boxplot(salaire~SEXE)

##Q5)
hist(salaire)

##Ex8)

##Q1)
x <- seq(0,2*pi,0.01)

##Q2)
plot(x,sin(x),type="l",col="blue",ylim=c(-1,1))

##Q3)
lines(x,cos(x),col="red")

##Q4)
lines(x,sin(x),type="p",col="blue",ylim=c(-1,1))

##Ex9)

##Q1)
x <- rnorm(1000, mean = 0, sd = 1)

boxplot(x)
hist(x)

##Q2)
print(1 - pbinom(8, size = 10, prob = 0.7))
print(pbinom(3, size = 10, prob = 0.7))

##Q3)
print(qexp(0.95,2))

##Ex10)

##Q1)

m <- c(5,3,10)
S <- matrix(c(3,-0.5,3,-0.5,1.25,0.5,3,0.5,5),nrow=3,byrow=TRUE)