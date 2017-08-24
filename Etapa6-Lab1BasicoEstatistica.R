#
# Analise de Dados com R
#
# Marcos Almeida ago2017 
#

# parte 1 - Basico Estatística

#meus agradecimentos a:

#[1]
#An Introduction to Statistical Learning (ISLR)
#with Applications in R
#Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani
#http://www-bcf.usc.edu/~gareth/ISL/data.html

#[2]
#simpleR Using R for Introdutory Statists
#Jonh Verzani
#https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf

#[3]
# Handbook Statistical foundations of machine learning
#Gianluca Bontempi
#http://www.ulb.ac.be/di/map/gbonte/mod_stoch/syl.pdf

#[4]
#Introduction to Probability and Statistics Using R
#G. Jay Kerns
#2011
#https://cran.r-project.org/web/packages/IPSUR/vignettes/IPSUR.pdf

#outras fontes no CRAN em https://cran.r-project.org/other-docs.html


#definições básicas:

# fenomeno aleatório -> um envento que o resultado não pode ser previsto a priori.
# variavel aleatória -> resultado de cada evento
# espaço amostral (omega) -> conjunto (finito ou infinito) de todos os valores possíveis (dominio da variável)
# função probabilidade atribui um valor (real) 0<p(evento)<1 
#       e atende a 
#               p(omega)=1 e;
#               p(e1 ou e2 ou ...en)=p(e1)+p(e2)+...p(en) onde e1,e2,...en pertencem a omega

#exemplo jogar um dado

#o fenomeno aleatório é o lançamento de um dado
#o espaço amostral (omega) é o conjunto dos valores inteiros de 1 a 6 correspondentes a cada face do dado
#a variável aleatória é o valor da face de cima do dado em um determinado lançamento
# a probabilidade a priori (teórica esperada) de qualquer uma das faces é 1/6 
1/6
# a probabilidade de um determinado lançamento dar 3 ou 5 é
2/6
# a probalidade de um determinado lançamento dar 1 ou 2 ou 3 ou 4 ou 5 ou 6 é
6/6



###############################
#  simulando amostras aletórias com funções RGNs(Pseudo Random Number Generators)
#
# sample,rnorm
#




################################
# simulando o lançamento de dados
# distribuição uniforme discreta (sample inteiros)




d<-sample(1:6, 100, replace=TRUE)
d

#mostrando a função densidade de distribuição (quantas vezes uma face aparece)
hist(d)

# aproximando do modelo -> aumentando o mumero de lançamentos 
n=1000 # numero de lançamentos
d<-sample(1:6, n, replace=TRUE)

#
hist(d,main=paste("# de lançamentos : ",n))

##################################
#repitir na console para n maiores


##### saber mais ? ver Teoria - Teorema Limite Central [4] IPSR cap 5

#


##############################
# media,soma,variação e desvio
##############################

# soma dos valores obtidos nos lançamentos dos dados 
sum(d)

# count(d) numero de lançamentos (previamente estipulado)
length(d)

# média = somas dos valores / numero de lançamentos
mean(d)

# variancia - medida de 
var(d)


##################
## lançado 2 dados
#

#
# se lançarmos 2 dados, e somarmos o valor do lançamento anterior como fica o experimento?
#

d1<-(sample(1:6, n, replace=TRUE))
d2<-(sample(1:6, n, replace=TRUE))
d<-d+d1+d2

#
hist(d)



# se lançarmos +2,+2,+2 e assim sucessivamente como fica?

###################
#repitir na console


#### saber mais ? ver Teoria - Teorema Limite Central [4] IPSR cap 8

#############
#simular uma distribução normal
#rnorm
n<-rnorm(1000,0,.5)
summary(n)
hist(n)

n<-rnorm(1000,0,.01)
summary(n)
hist(n)

