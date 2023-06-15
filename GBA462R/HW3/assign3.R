library(readxl)
install.packages("dplyr")
library(dplyr) 
install.packages("lubridate")
library(lubridate)

##########HD#############

setwd("C:/Users/yijia/Desktop/Courses/Core Statistics for MS Students Using R/assign/assign3")
hd= read.csv("HD.csv")

hd = hd %>% select(Date,Adj.Close)
hd$Date = ymd(hd$Date)
hd$Adj.Close= as.numeric(hd$Adj.Close)

hd = hd %>% mutate( return =(Adj.Close - lag(Adj.Close))/ lag(Adj.Close) ) 
hd =na.omit(hd)

mkt_data = read_excel("mkt_data.xlsx")
mkt_data$Date = ym(mkt_data$time)
mkt_data$mkt_rf= as.numeric(mkt_data$mkt_rf)
mkt_data$rf= as.numeric(mkt_data$rf)

mkt_data=mkt_data %>% mutate(mkt_rf=mkt_rf/100, rf=rf/100) 

hd_mkt=merge(hd,mkt_data,by="Date")

hd_mkt=hd_mkt %>% filter(Date<="1999-12-31" & Date>= "1990-01-01")

hd_mkt=hd_mkt %>% mutate(excess_return=return-rf)

ols=lm(excess_return~mkt_rf,data=hd_mkt)
summary(ols)
#Call:
#lm(formula = excess_return ~ mkt_rf, data = hd_mkt)

#Residuals:
#    Min        1Q    Median        3Q       Max 
#-0.139552 -0.054260  0.004051  0.045888  0.197814 

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 0.018525   0.006547   2.830  0.00548 ** 
#mkt_rf      1.069000   0.160871   6.645 1.01e-09 ***
#    ---
#Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.06856 on 117 degrees of freedom
#Multiple R-squared:  0.274,	Adjusted R-squared:  0.2678 
#F-statistic: 44.16 on 1 and 117 DF,  p-value: 1.008e-09

mean(hd_mkt$return,na.rm=TRUE)
#0.03469761

##########APPLE############
setwd("C:/Users/yijia/Desktop/Courses/Core Statistics for MS Students Using R/assign/assign3")
ap= read.csv("AAPL.csv")

ap = ap %>% select(Date,Adj.Close)
ap$Date = ymd(ap$Date)
ap$Adj.Close= as.numeric(ap$Adj.Close)

ap = ap %>% mutate( return =(Adj.Close - lag(Adj.Close))/ lag(Adj.Close) ) 
ap =na.omit(ap)

mkt_data = read_excel("mkt_data.xlsx")
mkt_data$Date = ym(mkt_data$time)
mkt_data$mkt_rf= as.numeric(mkt_data$mkt_rf)
mkt_data$rf= as.numeric(mkt_data$rf)

mkt_data=mkt_data %>% mutate(mkt_rf=mkt_rf/100, rf=rf/100) 

ap_mkt=merge(ap,mkt_data,by="Date")

ap_mkt=ap_mkt %>% filter(Date<="1999-12-31" & Date>= "1990-01-01")

ap_mkt=ap_mkt %>% mutate(excess_return=return-rf)

ols=lm(excess_return~mkt_rf,data=ap_mkt)
summary(ols)
#Call:
#lm(formula = excess_return ~ mkt_rf, data = ap_mkt)

#Residuals:
#    Min       1Q   Median       3Q      Max 
#-0.30969 -0.08611 -0.01386  0.07909  0.38652 

#Coefficients:
#            Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 0.002702   0.012850   0.210 0.833830    
#mkt_rf      1.135456   0.315777   3.596 0.000475 ***
#    ---
#    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

#Residual standard error: 0.1346 on 117 degrees of freedom
#Multiple R-squared:  0.09951,	Adjusted R-squared:  0.09181 
#F-statistic: 12.93 on 1 and 117 DF,  p-value: 0.0004749
 
mean(ap_mkt$return,na.rm=TRUE)
#0.01963075