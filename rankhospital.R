#Part Three

work_dir <- "C:/Users/Aspire A314-32/Desktop/ACADS/ACADS T.T/STAT 197- Data Science/3rd course assignment"

setwd(work_dir)

rankhospital<- function(state, outcome, num = "best")
{
  #Check that state and outcome are valid
 outcome1<- read.csv(file='outcome-of-care-measures.csv', 
                   colClasses = 'character', na.strings = c("NA", "Not Available"))
  if(!any(state == outcome1$State)){
    stop("state is invalid")}
  else if((outcome %in% c("heart attack", "heart failure",
                          "pneumonia")) == FALSE) {
    stop("outcome is invalid")
  }
  outcome2 <- subset(outcome1, State == state)
  if (outcome == "heart attack") {
    colnum <- 11
  }
  else if (outcome == "heart failure") {
    colnum <- 17
  }
  else if(outcome == "pneumonia") {
    colnum <- 23
  }
  outcome2[ ,colnum] <- as.numeric(outcome2[ ,colnum])
  outcome3 <- outcome2[order(outcome2[ ,colnum],outcome2[,2]), ]
  outcome3 <- outcome3[(!is.na(outcome3[ ,colnum])),]
  if(num == "best"){
    num <- 1
  }            
  else if (num == "worst"){
    num <- nrow(outcome3)
  }      
  return(outcome3[num,2])
}

# example output:
rankhospital("TX", "heart failure", 4)
rankhospital("MD", "heart attack", "worst")
rankhospital("MN", "heart attack", 5000)
