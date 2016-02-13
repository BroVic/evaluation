# Training Evaluation for NAFDAC Gender Workshop, Enugu, 6 October 2015

# Load dataset
load(file = "eval_clean_2.RData")

#Exploratory
View(core)
summary(core)
plot(core)

#Learning objectives met
learn <- table(core$learn)
round(prop.table(learn),2)
barplot(prop.table(learn)*100,
        ylim = c(0,.5 )*100,
        main = "Meeting of Learning Objectives",
        ylab = "Percentage",
        xlab = "Score")
rm(learn)

#Did exercises help?
exer <- table(core$exer)
round(prop.table(exer),2)
barplot(prop.table(exer)*100,
        ylim = c(0,.5 )*100,
        main = "How much the exercises helped",
        ylab = "Percentage",
        xlab = "Score")
rm(exer)

#How good was group facilitation
grp <- table(core$grp)
round(prop.table(grp),2)
barplot(prop.table(grp)*100,
        ylim = c(0,.5 )*100,
        main = "How good was group facilitation",
        ylab = "Percentage",
        xlab = "Score")
rm(grp)

#Session on track with time
trk <- table(core$trk)
round(prop.table(trk),2)
barplot(prop.table(trk)*100,
        ylim = c(0,.5 )*100,
        main = "Session on track with time",
        ylab = "Percentage",
        xlab = "Score")
rm(trk)

#Materials, handouts, audio-visuals
mat <- table(core$mat)
round(prop.table(mat),2)
barplot(prop.table(mat)*100,
        ylim = c(0,.6 )*100,
        main = "Materials, handouts, audiovisuals",
        ylab = "Percentage",
        xlab = "Score")
rm(mat)

#Time given for discussions
time <- table(core$time)
round(prop.table(time),2)
barplot(prop.table(time)*100,
        ylim = c(0,.5 )*100,
        main = "Time given for discussions",
        ylab = "Percentage",
        xlab = "Score")
rm(time)

#Appropriate methodology and technique
method <- table(core$method)
round(prop.table(method),2)
barplot(prop.table(method)*100,
        ylim = c(0,.5 )*100,
        main = "Appropriate methodology and technique",
        ylab = "Percentage",
        xlab = "Score")
rm(method)

#Venue conducive
venue <- table(core$venue)
round(prop.table(venue),2)
barplot(prop.table(venue)*100,
        ylim = c(0,.6)*100,
        main = "Venue Conducive?",
        ylab = "Percentage",
        xlab = "Score")
rm(venue)

#How Training was rated
rating <- table(core$rating)
round(prop.table(rating),2)
barplot(prop.table(rating)*100,
        ylim = c(0,.5 )*100,
        main = "How training was rated generally",
        ylab = "Percentage",
        xlab = "Score")
rm(rating)

# Analyse scoring
# Convert characters to integer
core_num <- apply(core, 2, function(x) as.integer(x))

# create new variable the total scores assigned by individual participants
indiv.score <- apply(core_num, 1, sum)
core_num <- as.data.frame(cbind(core_num, indiv.score))
rm(indiv.score)
max(core_num$indiv.score); min(core_num$indiv.score) #obtain max/min scores

#plot total scores after sorting in ascending order
plot(sort(core_num$indiv.score),
     type = "s",
     col = "red",
     lwd = 2,
     ylim = c(25, 45),
     xlim = c(1, 34),
     main = "Total scores of individual participants",
     sub = "Total score possible = 45",
     ylab = "Total Score Given",
     xlab = "Participant",
     axes = FALSE)
axis(2, las = 2)
axis(1)
grid(); box()

#Assess total scoring for different questions asked
ques.score <- apply(core_num[ , -10], 2, sum)
ques.score
barplot(sort(ques.score),
        ylim = c(0, 160),
        col = "red",
        axes = F)
abline(a = max(ques.score),
       b = 0,
       lty = "dashed",
       col = "lightblue",
       lwd = 1.5)
axis(2, las = 2)
which(ques.score == max(ques.score))
which(ques.score == min(ques.score))

rm(list = ls())

#END 
