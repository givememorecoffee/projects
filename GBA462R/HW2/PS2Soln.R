##########################################################################################################
###                                      Assignment 2 Solutions                                        ###
##########################################################################################################

#==========Preparation area ===============
# Clear
rm(list=ls()); #deleting all objects from the memory
gc(); #garbage collection - releasing memory when an object is no longer used 

# Load libraries
library(readxl) #for reading "xlsx" files

# Set directory and read data
setwd(" ") # <--put in where you saved the data
df=read_excel("DeliveryTimes.xlsx") # read_excel function is provided by the library "readxl"

# Understand the dataset
head(df) #first 10 rows
summary(df) #summary statistics
class(df$DeliveryTime) #variable type

#==========Q1===============================
##### (a)
df_mean = mean(df$DeliveryTime)
df_mean
df_sd = sd(df$DeliveryTime)
df_sd
df_var = var(df$DeliveryTime)
df_var

##### (b)
# We know that the mean and variance of a uniform random variable distributed between 30 and 60 are:
unif_mean = (1/2)*(30+60)
unif_mean
unif_var = (1/12)*(60-30)^2
unif_var
# The sample variance we found above (6.10) is WAY smaller than 75, which strongly suggests that the distribution is not uniform.

##### (c)
## Normal distribution
# 95% interval
range_l_95 = qnorm(0.025, df_mean, df_sd) # Alternatively, df_mean - 1.96*df_sd
range_u_95 = qnorm(0.975, df_mean, df_sd) # Alternatively, df_mean + 1.96*df_sd
c(range_l_95, range_u_95)

# 80% interval
range_l_80 = qnorm(0.1, df_mean, df_sd)
range_u_80 = qnorm(0.9, df_mean, df_sd)
c(range_l_80, range_u_80)

## Uniform distribution
# 95% interval
range_l_95_unif = qunif(0.025, min=30, max=60)
range_u_95_unif = qunif(0.975, min=30, max=60)
c(range_l_95_unif, range_u_95_unif)

# 80% interval
range_l_80_unif = qunif(0.1, min=30, max=60)
range_u_80_unif = qunif(0.9, min=30, max=60)
c(range_l_80_unif, range_u_80_unif)

##### (d)
# Normal distribution
pnorm(45, df_mean, df_sd)
pnorm(40, df_mean, df_sd)
1-pnorm(50, df_mean, df_sd) # Alternatively pnorm(50, df_mean, df_sd, lower.tail=FALSE)

# Uniform distribution
punif(45, 30, 60)
punif(40, 30, 60)
1- punif(50, 30, 60) # Alternatively punif(50, 30, 60, lower.tail=FALSE)

##### (e)
# For sure. If the population is normal(45.1,6.10), you would only be giving away about 2.4% of the pizzas.
# If it is uniform, it is more like 33.3%. This is a big difference!

##### (f)
# Now you are computing a confidence interval. This is a statement about the population mean, not the full distribution.
# In particular, it is a statement about how confident you are in your estimate of the mean, which we can see above was about 45.1.
n = nrow(df)
sterr = df_sd/sqrt(n)
CI_l_95 = df_mean - 1.96*sterr
CI_u_95 = df_mean + 1.96*sterr
c(CI_l_95, CI_u_95)

# This is way narrower than what you found in part c. There are two reasons for this.
# First, and foremost, this is a confidence interval for the population mean, not a statement about the population as a whole.
# Second, you have a very large sample size here, so you should have a high degree of confidence in your estimate, which is reflected in the narrow interval.

##### (g)
# No, the formula for the confidence interval relies on the law of large numbers and the central limit theorem, which do not require knowing the population distribution.
# The same formula holds irrespective of what the underlying population distribution is.

##### (h)
# HO: mu = 50 vs. Ha: mu \= 50
t_stat = (df_mean-50)/sterr
t_stat

p_value = 2*pnorm(-abs(t_stat))
p_value
# We can reject the null at either the 5% or 1% levels, since the p-value is less than either .05 or .01.

