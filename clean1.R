# Training Evaluation for NAFDAC Gender Workshop, Enugu, 6 October 2015
# Data cleaning 1

#Import dataset
eval <- read.csv("Eval.csv",
                 na.strings="",
                 stringsAsFactors=FALSE)

#Explore
head(eval)
tail(eval)
str(eval)

#Type-checking
eval[,2:10] <- apply(eval[,2:10], 2, function(x) as.factor(x))

#extract core data points for analysis
core <- eval[, 2:10]

#save dataset
save(core, file = "eval_clean_1.RData")
rm(core, eval)
