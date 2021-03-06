#
# Analise de Dados com R
#
# Marcos Almeida set2017 
#

# parte 3 - B�sico R  - operadores matem�ticos logicos

#meus agradecimentos a

##[2] #simpleR Using R for Introdutory Statists
##Jonh Verzani
##https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf


## [5] “R and Data Mining: Examples and Case Studies” 
## by Yanchang Zhao (PDF, 2013-04-26, 160 pages).
## https://cran.r-project.org/doc/contrib/Zhao_R_and_data_mining.pdf
## Email:   yanchang@RDataMining.com
## Website: http://www.RDataMining.com
## Date:    17 May 2017



#
#limpa ambiente
rm(list = ls())
gc()

######################################
#  se n�o testou o Material da Etapa 8  
######################################


#
# Opera��es matem�ticas (revis�o)
#

1+3
1-2
6*5
2/2
4^5
sqrt(4)
4^.5
4^(1/10)

# 
(4 + 5 ) * 7 - (36/18)^3
(2 * ( 2 * ( 2 * (3-4))))

# opera��es com algumas fun��es

abs( - 1 )              # M�dulo ou valor absoluto
log( 10 )               # Logaritmo natural ou neperiano
log( 10, base = 10)     # Logaritmo base 10
log10(10)               # Tamb�m logaritmo de base 10
log( 10, base = 3.4076) # Logaritmo base 3.4076
exp( 1 )                # Exponencial

#  arredondamento

ceiling( 4.3478 )
floor( 4.3478 )
round( 4.3478 )
round( 4.3478 , digits=3)
round( 4.3478 , digits=2)

# numeros not�veis...
pi


# operadores para compara��es (relacionais)

# ==              igual
# !=              n�o igual ... ou difeente ;)
# >, < , >= , <=  respctivamente mior , menor , maior ou igual , menor ou igual



a = 2 + 2
a

a>5
a+1>=5


a == 4
a == 2+2
a == 2
a = a == 4
a



#brincando com l�gica ....

b = FALSE


a
b

a&b
a|b
a&!b
!a&b
!(a&b)

# coisas estranhas ...



1/0 # infinito ou indeterminado

# 
#NaN - indeterminado (Not a Number), normalmente resultado de uma opera��o matem�tica indeterminada;
#NA  - indeterminado (Not Available), normalmente caracterizando uma observa��o perdida (missing value).
#Na  - opera��es matem�ticas, NaN e NA atuam sempre como indeterminado.

#is.na(a) https://stat.ethz.ch/R-manual/R-devel/library/base/html/NA.html

a="marcos"
is.na(a)
a=""
is.na(a)
a=c(1,"",3) 

a
is.na(a)

a=c(1,NA,3) 
a
is.na(a)
