setwd("F:/applis/workspace-r/data-analysis/peerAssessmentGit/ExData_Plotting1")

# ===========================
# Loading data
# ===========================
loadingDataFromFileAndSavingInRda <- function() {
    
    # Return the R file if data have already been uncompressed
    if (file.exists("./data/assignementData.rda")) {
        load("./data/assignementData.rda")
        
        return(assignementData)
    }
    
    # Unconpress and Read the CSV file
    exdata_data_household_power_consumption <- read.csv(unz("./data/exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header = T, sep=";")
    
    # Getting some piece of information on the dataset
    #     object.size(exdata_data_household_power_consumption)
    #     head(exdata_data_household_power_consumption)
    #     str(exdata_data_household_power_consumption)
    #     names(exdata_data_household_power_consumption)
    #     sapply(exdata_data_household_power_consumption, class)
    
    # Saving data into R structure file
    assignementData <- exdata_data_household_power_consumption
    save(assignementData, file = "./data/assignementData.rda")
    
    return(exdata_data_household_power_consumption)
}

# ===========================
# Selecting data
# ===========================
selectingData <- function(d = dataset) {
    
    # Selecting only the necessarly data => [2007-02-01 ; 2007-02-02]
    dataPlot <- subset(d, d$Date == "1/2/2007" | d$Date == "2/2/2007")
    #     head(d)
    #     tail(d)
    object.size(d)
    
    return(dataPlot)
}

# ===========================
# Cleaning data
# ===========================
cleaningData <- function(d=dataPlot) {
    rownames(d) <- 1:nrow(d)
    
    # Factor to Numeric :
    #   Global_active_power
    #   Global_reactive_power
    #   Voltage
    #   Global_intensity
    #   Sub_metering_1
    #   Sub_metering_2
    d$Global_active_power <- as.numeric(as.character(d$Global_active_power))
    d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
    d$Voltage <- as.numeric(as.character(d$Voltage))
    d$Global_intensity <- as.numeric(as.character(d$Global_intensity))
    d$Sub_metering_1 <- as.numeric(as.character(d$Sub_metering_1))
    d$Sub_metering_2 <- as.numeric(as.character(d$Sub_metering_2))
    
    # Date conversion
    d$Date <- as.character(d$Date)
    d$Time <- as.character(d$Time)
    d$DateTime <- paste(d$Date, d$Time, sep = " ")
    d$DateTime <- as.POSIXct(strptime(d$DateTime,"%d/%m/%Y %H:%M:%S"))
    
    return(d)
}

# ===========================
# Generating final data
# ===========================
generateDataPlot <- function() {
    # Return the R file if data have already been uncompressed
    if (file.exists("./data/dataPlot.rda")) {
        load("./data/dataPlot.rda")
        
        return(dataPlot)
    }
    
    fullData <- loadingDataFromFileAndSavingInRda()
    tmpData <- selectingData(fullData)
    dataPlot <- cleaningData(tmpData)
    
    save(dataPlot, file = "./data/dataPlot.rda")
    
    return(dataPlot)    
}
