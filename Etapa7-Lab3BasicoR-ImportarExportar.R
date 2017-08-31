#
# Analise de Dados com R
#
# Marcos Almeida ago2017 
#

# parte 2 - B·sico R - Importar Exportar dados 

#meus agradecimentos a

##[2] #simpleR Using R for Introdutory Statists
##Jonh Verzani
##https://cran.r-project.org/doc/contrib/Verzani-SimpleR.pdf


## [5] ‚ÄúR and Data Mining: Examples and Case Studies‚Äù 
## by Yanchang Zhao (PDF, 2013-04-26, 160 pages).
## https://cran.r-project.org/doc/contrib/Zhao_R_and_data_mining.pdf
## Email:   yanchang@RDataMining.com
## Website: http://www.RDataMining.com
## Date:    17 May 2017



#
#limpa ambiente
rm(list = ls())
gc()

##################################
# salavando o Ambiente de trabalho 
##################################
a <- 1:10

# O 
save(a, file="./dumData.Rdata")

#limpando a memÛria
rm(a)
print(a)
#recarregando o ambiente

load("./dumData.Rdata")
print(a)

# criando dataframe 
var1 <- 1:5
var2 <- (1:5) / 10
var3 <- c("prog", "big", "Data", "with", "R")
df1 <- data.frame(var1, var2, var3)
names(df1) <- c("VariableInt", "VariableReal", "VariableChar")
df1

################
# exportando csv
################

write.csv(df1, "./dummmyData.csv", row.names = FALSE)

##############
# reimportando
##############

df2 <- read.csv("./dummmyData.csv")
print(df2)


##################
# salvado como xlsx
##################

# talvez tenha que importar o pacote ...

require(xlsx)
write.xlsx(df2, "./dummmyData.xlsx", row.names = FALSE)


#mais sobre planilhas em
#
# https://cran.r-project.org/doc/manuals/R-data.html#Reading-Excel-spreadsheets
#



# mais sobre conectando a banco de dados em 
#
#  https://cran.r-project.org/doc/manuals/R-data.html#Relational-databases
#

## library(RODBC)
## connection <- odbcConnect(dsn="servername",uid="userid",pwd="******")
## query <- "SELECT * FROM lib.table WHERE ..."
## # or read query from file
## # query <- readChar("data/myQuery.sql", nchars=99999)
## myData <- sqlQuery(connection, query, errors=TRUE)
## odbcClose(connection)





