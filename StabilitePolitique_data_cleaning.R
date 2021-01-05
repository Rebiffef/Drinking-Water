StabPol <- as.data.frame(read.csv("StabilitePolitique.csv",dec=","))

StabPol<-StabPol[,!(colnames(StabPol) %in% c("Element.Code","Element","Note","Flag","Flag.Description","Item.Code","Unit"))]

StabPol<-StabPol %>% pivot_wider(names_from = "Item",values_from="Value")

write.csv(StabPol,"StabilitePolitique.csv")

