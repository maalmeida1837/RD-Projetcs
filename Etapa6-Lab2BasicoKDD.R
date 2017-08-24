#
# Analise de Dados com R
#
# Marcos Almeida ago2017 
#

# parte 2 - Exploração de Dados

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
# Capitulo 3 da referencia [5] “RDM: Examples and Case Studies” 
# 


#
# dados multivariados/ data frames
#
#[4] SimpleR pagina 32


#
#limpa ambiente
rm(list = ls())
gc()


#
# Vamos usar o pacote dataset
#


require(datasets)

dim(iris)

# o que é a iris?
# analise multivariada feita R Fisher em dados coletados por Edgar Anderson(1936)

#Fisher, R. A. (1936) The use of multiple measurements in taxonomic problems. Annals of Eugenics, 7, Part II, 179–188.
#The data were collected by Anderson, Edgar (1935). The irises of the Gaspe Peninsula, Bulletin of the American Iris Society, 59, 2–5.
help("iris")

#metadados
attributes(iris)



# olhando os dados

#registros iniciais
head(iris)

#registros finais
tail(iris)

###############
#Analise de uma variável (coluna específica)

#dez primeiros valores de uma coluna
iris[1:10,"Sepal.Length"]
iris$Sepal.Length[1:10]
# um resumo do dataset
#  media, mediana quartiles

summary(iris)

#media,mediana e min e max
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
range(iris$Sepal.Length)

#quartiles
quantile(iris$Sepal.Length)

#variancia
var(iris$Sepal.Length)

#########################
#visualizando uma variável

#histograma

hist(iris$Sepal.Length)

#gráfico da função densidade de distribuiçõa de valores de uma variavel

plot(density(iris$Sepal.Length))


#####################
# analise multivarida

barplot(table(iris$Species))

#tudojunto


pairs(iris[1:4])



##
# sobre o Trabalho de Bloco

# esta análise pode ser feita com o arquivo do trabalho de vcs

##############
# para consultar (filtrar) os registros podemos usar o dplyr 


# capitulo 2 da referencia [5] “RDM: Examples and Case Studies”
# data import and export


