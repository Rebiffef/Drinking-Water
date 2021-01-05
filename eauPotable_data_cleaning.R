EauPotable <- as.data.frame(read.csv("eauPotable.csv",dec=","))
library(tidyverse)
#EauPotable[nrow(EauPotable) + 1,]<- unlist(lapply(colnames(EauPotable),function(i){substr(i, 2, 5)}))
EauPotable<-EauPotable %>% pivot_longer(colnames(EauPotable)[-1], names_to='year',values_to='population')

EauPotable$year<-lapply(EauPotable$year, function(i){
  if (!(substring(i,6,6)==".")) {
    paste(i,"0",sep=".")
  }else{
    paste(i)
  }
})

EauPotable<-EauPotable%>%separate(year, into=c('year','type'), sep=6, convert = TRUE)

EauPotable$year<- unlist(lapply(EauPotable$year,function(i){substr(i, 2, 5)}))

EauPotable$'drinking-water services'<-unlist(lapply(EauPotable$type,function(i){
  if (i<3) {
    "least basic"
  }else{
    "safely managed"
  }
}))

EauPotable$type<-unlist(lapply(EauPotable$type,function(i){
  if (i %in% c(0,3)) {
    "Total"
  } else if (i %in% c(1,4)) {
    "Urban"
  } else if (i %in% c(2,5)) {
    "Rural"
  }
}))

colnames(EauPotable)[1]<-"country"

EauPotable<-EauPotable[!(EauPotable$country %in% c("","Country")),]

EauPotable$country<-as.factor(EauPotable$country)

EauPotable$type<-as.factor(EauPotable$type)

EauPotable$'drinking-water services'<-as.factor(EauPotable$'drinking-water services')
