#plot3.R
setwd("F:/applis/workspace-r/data-analysis/peerAssessmentGit/ExData_Plotting1")

# Loading Data
source("common.R")
dataPlot <- generateDataPlot()

# Plotting Plot3
png("plot3.png", width = 480, height = 480, units="px")

plot(x = dataPlot$DateTime, y = dataPlot$Sub_metering_1, type = "l", col="black", xlab="", ylab = "Global Active Power (kilowatts)")
lines(x = dataPlot$DateTime, y = dataPlot$Sub_metering_2, col="red")
lines(x = dataPlot$DateTime, y = dataPlot$Sub_metering_3, col="blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()
