myplot <- function(parameter,rows=1:10){
  Data <- parameter[rows,,drop=F]
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4,6))
  legend("bottomleft", inset = 0.01, legend = Players[rows], col = c(1:4,6),pch = 15:18, horiz = FALSE)
}

#Salary
myplot(Salary)
myplot(Salary/Games)
myplot(Salary/FieldGoals)

#In-Game Metrics
myplot(MinutesPlayed)
myplot(Points)

#In-Game Metrics Normalized
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

#Intresting Observations
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is valuable
myplot(FieldGoals/MinutesPlayed)

#Player Style
myplot(Points/FieldGoals)

#Player Style
myplot(Points/FieldGoals)
