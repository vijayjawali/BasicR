FieldGoals
t(FieldGoals)
Players
matplot(t(FieldGoals), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6),pch = 15:18, horiz = FALSE)

matplot(t(FieldGoals/Games), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6),pch = 15:18, horiz = FALSE)

matplot(t(FieldGoals/FieldGoalAttempts), type = "b", pch = 15:18, col = c(1:4,6))
legend("bottomleft", inset = 0.01, legend = Players, col = c(1:4,6),pch = 15:18, horiz = FALSE)
