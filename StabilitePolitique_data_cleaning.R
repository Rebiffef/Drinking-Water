StabPol <- as.data.frame(read.csv("StabilitePolitique.csv",dec=","))

StabPol<-StabPol[,!(colnames(StabPol) %in% c("Element.Code","Element","Note","Flag","Flag.Description","Item.Code","Unit"))]

StabPol<-StabPol %>% pivot_wider(names_from = "Item",values_from="Value")

StabPol$Year.Code<-as.integer(StabPol$Year.Code)

StabPol$Area.Code<-as.integer(StabPol$Area.Code)

StabPol$`Value of food imports in total merchandise exports (percent) (3-year average)`<-as.integer(StabPol$`Value of food imports in total merchandise exports (percent) (3-year average)`)

StabPol$`Per capita food supply variability (kcal/cap/day)`<-as.integer(StabPol$`Per capita food supply variability (kcal/cap/day)`)

StabPol$`Cereal import dependency ratio (percent) (3-year average)`<-as.double(StabPol$`Cereal import dependency ratio (percent) (3-year average)`
)

StabPol$`Percent of arable land equipped for irrigation (percent) (3-year average)`<-as.double(StabPol$`Percent of arable land equipped for irrigation (percent) (3-year average)`
)

StabPol$`Political stability and absence of violence/terrorism (index)`<-as.double(StabPol$`Political stability and absence of violence/terrorism (index)`
)

StabPol$`Per capita food production variability (constant 2004-2006 thousand int$ per capita)`<-as.double(StabPol$`Per capita food production variability (constant 2004-2006 thousand int$ per capita)`
)

write.csv(StabPol,"StabilitePolitique.csv")

