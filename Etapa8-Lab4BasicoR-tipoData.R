#
# Analise de Dados com R
#
# Marcos Almeida set2017 
#

# parte 3 - Básico R  - trabalhando com datas

# meus agradecimentos a https://www.stat.berkeley.edu/~s133/dates.html



#
#limpa ambiente
rm(list = ls())
gc()

######################################
#  o tipo de dados de Datas  
######################################


# Internally, Date objects are stored as the number of days since January 1, 1970,
# using negative numbers for earlier dates.
# The as.numeric function can be used to convert a Date object to its internal form.


d1 <- strptime("2012-03-08", format = "%Y-%m-%d")
d1
as.numeric(d1)

d2 <- ISOdate("2012","03","12")                    # dia e hora default de hora 12:00
d2
as.numeric(d2)

d3 <- as.Date("14/03/2012", format = "%d/%m/%Y") # só dia
d3
as.numeric(d3)

difftime(d1,d3)




# pra quem não fez ...

ini <- c("03/05/96", "17/08/97")
fim <- c("1997-27-01", "1999-14-03")
ini <- as.Date(ini, format = "%d/%m/%y")
fim <- as.Date(fim, format = "%Y-%d-%m")
fim - ini

# criando uma sequencia de dias

dias <- as.Date(paste("2012","03",1:31, sep="-"))
dias

mar <- data.frame(dia = dias, dayofweek = weekdays(dias))
mar

mar[mar$dayofweek == "Friday",]



# homenagem aos estatisticos 
bdays = c(tukey=as.Date('1915-06-16'),fisher=as.Date('1890-02-17'),
          cramer=as.Date('1893-09-25'), kendall=as.Date('1907-09-06'))
bdays

