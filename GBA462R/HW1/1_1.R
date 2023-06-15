library(reshape)
dat <- data.frame(id = c(1,1,1,2,2,3,3),
                  sport = c("r100","r200","r400","r100","r200","r100","r400"),
                  rank = c(2,1,1,1,2,3,2))
run_800m <- data.frame(id = c(2,3),
                       run_800m = c(2,1))
dat <- cast(data = dat, formula = id ~sport, value = "rank")
dat
merge(dat, run_800m, by = "id",all.x = T)

typeof(T)

test_df<- data.frame(x = c(1.2,2.3,10.4),y = c(1,2.2,4),z = c(T,F,T))
test_df
length(test_df)
coerce_integer <- function(x){
    for(i in 1:length(x)){  
    x[[i]] = ifelse(typeof(x) == "logical", x, as.integer(unlist(x)))
}            

    }
 
test_df <- coerce_integer(test_df)
test_df



inc <- data.frame(id = c(1,1,1,2,2,2),
                  year = c(2011,2012,2013,2010,2011,2012),
                  income = c(19,21,22,16,NA,19))
inc
for(i in 1:length(unique(inc$id))){
    avg_income[i] <- mean(inc$income[inc$id == i & !is.na(inc$income)])
}
avg_income
df <- data.frame(id = c(1,2),
                 avg_income = avg_income)
df



stock <- data.frame(id = c(1,1,1,1,1,1),
                    week = c(1,2,3,4,5,6),
                    price = c(0.1,0.2,0.3,0.4,0.5,0.6))
for (i in 1:length(unique(stock$id)){
    for (w in 1:length(stock$week[stock$id == i]-1))
        { 
    stock$ma_price[i] <- mean(c(stock$price[stock$week == w & stock$id = i ],
                              stock$price[stock$week == w+1 & stock$id = i], 
                              stock$price[stock$week == w + 2 & stock$id = i]),
                              na.rm = T)
    }}

pnorm(3,mean=2.5,sd=0.37) 
1-pnorm(3,mean=2.5,sd=0.37) 
pnorm(2.5,mean=2.5,sd=0.37) 
pnorm(2,mean=2.5,sd=0.37) 
qnorm(0.99,mean=2.5,sd=0.37) 
2.5 - 1.96*0.37
2.5 + 1.96*0.37 
