#
# Analise de Dados com R
#
# Marcos Almeida set2017 
#

# Etapa 8 - trabalhando com series temporais

# meus agradecimentos https://dadosdadosdados.wordpress.com/2015/09/25/trabalhando-com-series-temporais-no-r-parte-i-2/

library(readxl)
library(lubridate)

#limpa ambiente
rm(list = ls())
gc()

# coloque o default para onde está o arquivo
setwd("onde baixei meu arquivo???")

IBCBr <- read_excel("IBCBr.xls")
ibc2 <-c(parse_date_time(IBCBr$Data,"%Y.%m"),IBCBr$IBCBr)
ibc2
ibc2<-IBCBr
ibc2

ibc2$Data<- parse_date_time(ibc2$Data,"%y.%m")
plot(ibc2,"Ibc-br fonte ipeadata")
lines.default(ibc2)
