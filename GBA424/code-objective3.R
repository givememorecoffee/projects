library(readr)
edata <- read_csv("C:/Users/yijia/OneDrive - University of Rochester/Desktop/Courses/fallB/analytics design/case2/evals_data.csv")
edata$total <- edata$score_reading + edata$score_writing + edata$score_mathNoCalc + edata$score_mathCalc
install.packages("dplyr")
library("dplyr")

edata <- edata %>%
    group_by(student_id) %>%
    mutate(improvement_percentage_reading = (score_reading - lag(score_reading))/lag(score_reading)*100) 

edata <- edata %>%
    group_by(student_id) %>%
    mutate(improvement_percentage_writing = (score_writing - lag(score_writing))/lag(score_writing)*100) 

edata <- edata %>%
    group_by(student_id) %>%
    mutate(improvement_percentage_mathNoCalc = (score_mathNoCalc - lag(score_mathNoCalc))/lag(score_mathNoCalc)*100) 

edata <- edata %>%
    group_by(student_id) %>%
    mutate(improvement_percentage_mathCalc = (score_mathCalc - lag(score_mathCalc))/lag(score_mathCalc)*100) 

edata$year <- as.numeric(format(edata$date, "%Y"))
mean_reading_online_bf2018 <- mean(edata$improvement_percentage_reading[edata$year < 2018 & edata$location == "online"],na.rm = TRUE)
mean_reading_online_af2018 <- mean(edata$improvement_percentage_reading[edata$year >= 2018 & edata$location == "online"],na.rm = TRUE)

mean_reading_center_bf2018 <- mean(edata$improvement_percentage_reading[edata$year < 2018 & edata$location == "center"],na.rm = TRUE)
mean_reading_center_af2018 <- mean(edata$improvement_percentage_reading[edata$year >= 2018 & edata$location == "center"],na.rm = TRUE)

mean_writing_online_bf2018 <- mean(edata$improvement_percentage_writing[edata$year < 2018 & edata$location == "online"],na.rm = TRUE)
mean_writing_online_af2018 <- mean(edata$improvement_percentage_writing[edata$year >= 2018 & edata$location == "online"],na.rm = TRUE)

mean_writing_center_bf2018 <- mean(edata$improvement_percentage_writing[edata$year < 2018 & edata$location == "center"],na.rm = TRUE)
mean_writing_center_af2018 <- mean(edata$improvement_percentage_writing[edata$year >= 2018 & edata$location == "center"],na.rm = TRUE)

mean_mathNoCalc_online_bf2018 <- mean(edata$improvement_percentage_mathNoCalc[edata$year < 2018 & edata$location == "online"],na.rm = TRUE)
mean_mathNoCalc_online_af2018 <- mean(edata$improvement_percentage_mathNoCalc[edata$year >= 2018 & edata$location == "online"],na.rm = TRUE)

mean_mathNoCalc_center_bf2018 <- mean(edata$improvement_percentage_mathNoCalc[edata$year < 2018 & edata$location == "center"],na.rm = TRUE)
mean_mathNoCalc_center_af2018 <- mean(edata$improvement_percentage_mathNoCalc[edata$year >= 2018 & edata$location == "center"],na.rm = TRUE)

mean_mathCalc_online_bf2018 <- mean(edata$improvement_percentage_mathCalc[edata$year < 2018 & edata$location == "online"],na.rm = TRUE)
mean_mathCalc_online_af2018 <- mean(edata$improvement_percentage_mathCalc[edata$year >= 2018 & edata$location == "online"],na.rm = TRUE)

mean_mathCalc_center_bf2018 <- mean(edata$improvement_percentage_mathCalc[edata$year < 2018 & edata$location == "center"],na.rm = TRUE)
mean_mathCalc_center_af2018 <- mean(edata$improvement_percentage_mathCalc[edata$year >= 2018 & edata$location == "center"],na.rm = TRUE)
