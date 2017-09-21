#
# Analise de Dados com R
#
# Marcos Almeida set2017 
#

# Etapa9  - trabalhando com gráficos

# meus agradecimentos 

# http://www.statmethods.net/graphs
# https://cran.r-project.org/doc/contrib/Shipunov-visual_statistics.pdf


#limpa ambiente
rm(list = ls())
gc()
sessionInfo()

#
#  Graficos com R
#

# 
# device gráfico
#

help(dev.cur)
dev.cur()

#criando um gráfico com parametros globais defaults

plot(x=1:10,y=11:20) # especificando argumentos "x" e "y" do comando plot
dev.cur()

# quais são os parametros ?
?par
par()
#quais são os defaults?
#plot(x, y = NULL, type = "p",  xlim = NULL, ylim = NULL,
#     log = "", main = NULL, sub = NULL, xlab = NULL, ylab = NULL,
#     ann = par("ann"), axes = TRUE, frame.plot = axes,
#     panel.first = NULL, panel.last = NULL, asp = NA, ...)

?plot.default


# o dispositivo continua aberto esperando receber 

# acrecentando um título
title(main = "teste",xlab="x",ylab = " y ",sub="subtitulo")

# criando um grafico com plot.
alfa=1
f = function(x) 1/(alfa + x)     # define a função
plot(f, from = 0, to = 1)     # plot a função entre 0 e 1
alfa
# com curve
curve(f, from = 0, to = 1)
#acrescentando linhas sucessivamente no mesmo grafico
alfa=0.9
x=(1:10)/10
x
#usando lines
lines(x,y=f(x))
#alterando alfa da noss função
alfa=0.8
lines(x,y=f(x))
#
for (i in 7:1) {alfa=i/10;lines(x,y=f(x))}

#exemplos do material

### hist
### fonte: https://cienciapratica.wordpress.com/2014/12/02/r-uma-linguagem-gratuita-para-analise-e-visualizacao-de-dados/
exemplo <- rnorm(n = 1000, mean = 56, sd = 4)
hist(exemplo)
### boxplot
data(rock)
attach(rock)
head(rock)
boxplot(shape)
### barplot
hospital<-c(150,200,120,185)
UF<-c("MG","SP","RJ","ES")
barplot(hospital, names.arg=UF)
### pie *** o exemplo não estava funcionando ....
posto<-c(1548,2147,4715,1112,3362,1478)
bandeira<- c("shell","texaco","cosan","ipiranga","branca", "outros")
pie(posto,labels=bandeira)

### exemplos do http://www2.unifap.br/herondino/files/2014/04/Graficos_no_R.pdf

# criando um vetor com 501 elementos
x <-seq(-3, 3,length  = 501)
head(x)
summary(x)
# plotar y(x) função normal 
# ### dnorm(x, mean = 0, sd = 1, log = FALSE) ver mais em https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Normal.html
plot(x,  dnorm  (x),  axes= FALSE,type = "l",xlab="",ylab = "")
abline(h=0)
lines(c(0, 0), c(dnorm(0),-0.01))
lines(c(-1, 0), c(dnorm(-1),dnorm(-1))) 
arrows(-1,dnorm(-1), 0, dnorm(-1),code= 3,length= 0.1)
text(0.2, 0.2,expression (italic(mu)))
text(-0.5, 0.26,expression (italic(sigma)))


### mais exemplos bacanas
### fonte ### fonte: https://cienciapratica.wordpress.com/2014/12/02/r-uma-linguagem-gratuita-para-analise-e-visualizacao-de-dados/


### usando o lattice
library(lattice)

data(Orange)
Orange
head(Orange)

xyplot(circumference ~ age | Tree, Orange)

# mais gráficos legais pra testar em casa
# http://www.statmethods.net/advgraphs/trellis.html
#


#
# exemplo com ggplot2
#

attach(mtcars)
library(ggplot2) 
# provavelmente vcs vão ter que instalar este pacote
head(mtcars)
summary(mtcars)
# create factors with value labels 
mtcars$gear <- factor(mtcars$gear,levels=c(3,4,5),
                      labels=c("3gears","4gears","5gears")) # gears -> marchas
mtcars$am <- factor(mtcars$am,levels=c(0,1),
                    labels=c("Automatic","Manual")) 
mtcars$cyl <- factor(mtcars$cyl,levels=c(4,6,8),
                     labels=c("4cyl","6cyl","8cyl")) 

# Kernel density plots for mpg 

# ### > Suaviza um histograma
# ### > mais sobre este assunto em http://www.cookbook-r.com/Graphs/Plotting_distributions_(ggplot2)/

# grouped by number of gears (indicated by color)
qplot(mpg, data=mtcars, geom="density", fill=gear, alpha=I(.5), 
      main="Distribution of Gas Milage", xlab="Miles Per Gallon", 
      ylab="Density")

head(mpg)

# mais gráficos deste tipo em ...
# http://ggplot2.tidyverse.org/reference/geom_density.html

# todas as cores usdas nos gráficos anteriores usaram definções default
# mas podemos mudar


#
# brincando com cores
#


## Example data
data=matrix(runif(100, 0, 5) , 10 , 10)

data
colnames(data)=letters[c(1:10)]
rownames(data)=paste( rep("row",10) , c(1:10) , sep=" ")


## 
par(mar=c(3,4,2,2)) # margens
levelplot(t(data[c(nrow(data):1) , ]))

data=matrix(seq(0, 5,length  = 100) , 10 , 10)
levelplot(t(data[c(nrow(data):1) , ]))

# padrões pkg lattice
show.settings()
trellis.par.get()
# mudando a paleta de cores
# ### http://www.magesblog.com/2012/12/changing-colours-and-legends-in-lattice.html
# ### http://data.library.virginia.edu/setting-up-color-palettes-in-r/
library(RColorBrewer)
display.brewer.all()

levelplot(t(data[c(nrow(data):1) , ]),
            col.regions=brewer.pal(n = 11, name = "Spectral"))
#menos cores
levelplot(t(data[c(nrow(data):1) , ]),
          col.regions=brewer.pal(n = 5, name = "Spectral"))
#outra paleta 
levelplot(t(data[c(nrow(data):1) , ]),
          col.regions=brewer.pal(n = 5, name = "Set1"))
# Oranges 
levelplot(t(data[c(nrow(data):1) , ]),
          col.regions=brewer.pal(n = 5, name = "Oranges"))

# fazendo a  saldada de cores ...

goiaba <- rgb(0.94, 0.41, 0.40)
goiaba.semitrans <- rgb(0.94, 0.41, 0.40, alpha = 0.5)
vitamina <- rgb(red = c(0.87, 0.70), green = c(0.83, 0.77),
                blue = c(0.71, 0.30), names = c("leite", "abacate"))
uva <- "#AD4DA3"
salada <- c(vitamina, uva, goiaba, goiaba.semitrans)


# usando  as cores da salada
levelplot(t(data[c(nrow(data):1) , ]),col.regions=salada)


#
# o resto do matrial do curso
#

plot(c(0, 2), c(0, 2), ylim = c(-0.4, 2.05), xlab = "", ylab = "")
points(1.5, 0.2)
text(1.5, 0.2, labels = c("esquerda", "direita"), pos = c(2, 4),
     offset = 1, col = c("red", "blue"))
text(0.16, 0.6, labels = "inclinado", srt = 46)
text(c(1.75, 1.25), c(1.25, 1.75), labels = c("pequeno", "grande"),
     cex = c(0.7, 1.3))
       
lines(c(0, 0, 2, 2, 0), c(0, 2, 2, 0, 0), col = "gray")
lines(c(1, 1), c(0, 2), col = "gray")
lines(c(0, 2), c(1, 1), col = "gray")

abline(0, 0.5, col = "brown")
abline(0, 1, col = uva)
abline(0, 2, col = "red")

polygon(c(0.3, 0.8, 0.5), c(1.7, 2.0, 1.2), col = goiaba)
rect(0, 1.5, 0.5, 2.0, col = vitamina["abacate"])
rect(0.2, 1.0, 1.0, 1.7, col = goiaba.semitrans)

#
# fim do material 
#
