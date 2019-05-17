
Healthy <- 
  read.table("C:/Users/Laman Valizada/Desktop/normal_skin_8genes_10samples.txt",
   header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE)
Disease <- 
  read.table("C:/Users/Laman Valizada/Desktop/psoriasis_skin_8genes_10samples.txt",
   header=TRUE, sep="", na.strings="NA", dec=".", strip.white=TRUE)

TransposeHealthy <- t(Healthy)
numSummary(TransposeHealthy[,c("GAGE4", "GAGE5", "KRTAP7-1", "KRTAP8-1", "TSIX", "XIST", "KRTAP19-3", "MIR2117"), drop=FALSE], statistics=c("mean", "sd"), quantiles=c(0,.25,.5,.75,1))
TransposeDisease <- t(Disease)
numSummary(TransposeDisease[,c("GAGE4", "GAGE5", "KRTAP7-1", "KRTAP8-1", "TSIX", "XIST", "KRTAP19-3", "MIR2117"), drop=FALSE], statistics=c("mean", "sd"), quantiles=c(0,.25,.5,.75,1))

Combined <- merge(Healthy, Disease, all=TRUE, by="row.names")
rownames(Combined) <- Combined$Row.names
Combined$Row.names <- NULL
TransposeCombined <- t(Combined)
Boxplot( ~ GAGE4, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ GAGE5, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ KRTAP193, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ KRTAP71, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ KRTAP81, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ MIR2117, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ TSIX, data=TransposeCombined, id=list(method="y"))
Boxplot( ~ XIST, data=TransposeCombined, id=list(method="y"))

cor(TransposeHealthy[,c("GAGE4", "GAGE5", "KRTAP7-1", "KRTAP8-1", "TSIX", "XIST", 
  "KRTAP19-3", "MIR2117")], use="complete")
cor(TransposeDisease[,c("GAGE4", "GAGE5", "KRTAP7-1", "KRTAP8-1", "TSIX", "XIST", 
  "KRTAP19-3", "MIR2117")], use="complete")
cor(TransposeCombined[,c("GAGE4", "GAGE5", "KRTAP71", "KRTAP81", "TSIX", "XIST", 
  "KRTAP193", "MIR2117")], use="complete")



