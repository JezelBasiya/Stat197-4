#Part 2

work_dir <- "C:/Users/Aspire A314-32/Desktop/ACADS/ACADS T.T/STAT 197- Data Science/3rd course assignment"

setwd(work_dir)

best<- function(state, outcome)
{
  #Check that state and outcome are valid
  data <- read.csv(file='outcome-of-care-measures.csv', 
                   colClasses = 'character', na.strings = c("NA", "Not Available"))
 if(!any(state == data$State)) {
   stop('invalid')
 }
 
 if(outcome == 'heart attack') {
   col <- 11
 }
 else if(outcome == 'heart failure') {
   col <- 17
 }
 else if(outcome == 'pneumonia') {
   col <- 23
 }
 else {
   stop( 'invalid outcome')
 }
 
 
 #handle the ties
 data.state <- data[data$State == state, ]
 data.state[, col] <- as.numeric(x=data.state[, col])
 data.state <- data.state[complete.cases(data.state), ]
 

 return.names <- data.state[(data.state[, col] == min(data.state[, col])), ]$Hospital.Name
 
 sort(return.names)[1]
}
best("TX","heart attack")
best("TX","heart failure")
best("MD","heart attack")
best("MD","pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")
