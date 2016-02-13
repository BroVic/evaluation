library(Amelia)

# Load data
load(file = "eval_clean_1.RData")
core

#Looking for missing values
apply(core,2, function(x) sum(is.na(x)))

#map missing values
missmap(core)

#replace missing categorical values with mode
# write a function for the mode
Mode <- function(x, na.rm){
  xtab <- table(x)
  xmode <- names(which(xtab == max(xtab)))
  if(length(xmode) > 1) xmode <- "> 1 mode"
  return(xmode)
}

#replacing the NAs in the dataframe
core$rating[is.na(core$rating)] <- Mode(core$rating)
core$venue[is.na(core$venue)] <- Mode(core$venue)
core$method[is.na(core$method)] <- Mode(core$method)
core$mat[is.na(core$mat)] <- Mode(core$mat)
core$exer[is.na(core$exer)] <- Mode(core$exer)


missmap(core) #check new map
#cleaning up and saving session
detach(package:Amelia, unload = TRUE)
search() 

save(core, file = "eval_clean_2.RData")
rm(core, Mode)
