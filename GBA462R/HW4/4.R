rm(list=ls()) 
gc()

library(readxl)
pj <- read_excel("C:/Users/yijia/OneDrive - University of Rochester/Desktop/Courses/Core Statistics for MS Students Using R/assign/4/ShipCaseData.xlsx")
head(pj)

summary(lm(SalePrice~Age,data=pj))
plot(pj$Age, pj$SalePrice) 
abline(lm(SalePrice~Age,data=pj), col="maroon")

summary(lm(SalePrice~DWT,data=pj))
plot(pj$DWT, pj$SalePrice) 
abline(lm(SalePrice~DWT,data=pj), col="maroon")

summary(lm(SalePrice~Cindex,data=pj))
plot(pj$Cindex, pj$SalePrice) 
abline(lm(SalePrice~Cindex,data=pj), col="maroon")

reg = lm(SalePrice~Age+DWT+Cindex,data=pj) 
summary(reg)

predict(reg, data.frame(Age=11,DWT=172,Cindex = 12,479, interval="none"))
predict(reg, data.frame(Age=11,DWT=172,Cindex = 12,479), interval="confidence")
predict(reg, data.frame(Age=11,DWT=172,Cindex = 12,479), interval="prediction")

predict(reg, data.frame(Age=6,DWT=172,Cindex = 12,479, interval="none"))
predict(reg, data.frame(Age=11,DWT=152,Cindex = 12,479, interval="none"))
predict(reg, data.frame(Age=11,DWT=172,Cindex = 8,735, interval="none"))
