#Plot the 30-day mortality rates for Heart attack
work_dir <- "C:/Users/Aspire A314-32/Desktop/ACADS/ACADS T.T/STAT 197- Data Science/3rd course assignment"

setwd(work_dir)


outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11]) #column 11 in the outcome dataset
hist(outcome[, 11],xlab="30-day death rates from heart attack",
     main ="Histogram of the 30-day death rates from heart attack",
     col='violet',border='white')