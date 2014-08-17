#plot2.R
setwd("F:/applis/workspace-r/data-analysis/peerAssessmentGit/ExData_Plotting1")

# Loading Data
source("common.R")
dataPlot <- generateDataPlot()

# Plotting Plot2
png("plot2.png", width = 480, height = 480, units="px")
plot(x = dataPlot$DateTime, y = dataPlot$Global_active_power, type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
