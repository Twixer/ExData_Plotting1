#plot1.R
setwd("F:/applis/workspace-r/data-analysis/peerAssessmentGit/ExData_Plotting1")

# Loading Data
source("common.R")
dataPlot <- generateDataPlot()

# Plotting Plot1
png("plot1.png", width = 480, height = 480, units="px")
hist(dataPlot$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

