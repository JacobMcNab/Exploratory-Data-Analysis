
R version 3.2.1 (2015-06-18) -- "World-Famous Astronaut"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin10.8.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.66 (6956) x86_64-apple-darwin10.8.0]

[Workspace restored from /Users/jacobmcnab/.RData]
[History restored from /Users/jacobmcnab/.Rapp.history]

> dataDoc <- "./household_power_consumption.txt"
> data <- read.table(dataDoc, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
> subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
> str(subData)
'data.frame':	2880 obs. of  9 variables:
 $ Date                 : chr  "1/2/2007" "1/2/2007" "1/2/2007" "1/2/2007" ...
 $ Time                 : chr  "00:00:00" "00:01:00" "00:02:00" "00:03:00" ...
 $ Global_active_power  : chr  "0.326" "0.326" "0.324" "0.324" ...
 $ Global_reactive_power: chr  "0.128" "0.130" "0.132" "0.134" ...
 $ Voltage              : chr  "243.150" "243.320" "243.510" "243.900" ...
 $ Global_intensity     : chr  "1.400" "1.400" "1.400" "1.400" ...
 $ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
 $ Sub_metering_2       : chr  "0.000" "0.000" "0.000" "0.000" ...
 $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
> datetime <- strptime(paste(subData$Date, subData$Time, sep" "), "%d/%m/%Y %H:%M:%S")
Error: unexpected string constant in "datetime <- strptime(paste(subData$Date, subData$Time, sep" ""
> datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
> GlobalActivePower <- as.numeric(subData$Global_active_power)
> png("plot2.png", width=480, height=480)
> plot(datatime, GlobalActivePower, type="1", xlab="", ylab="Global Active Power (kilowatts)")
Error in plot(datatime, GlobalActivePower, type = "1", xlab = "", ylab = "Global Active Power (kilowatts)") : 
  object 'datatime' not found
> plot(datetime, GlobalActivePower, type="1", xlab="", ylab="Global Active Power (kilowatts)")
Error in plot.xy(xy, type, ...) : invalid plot type '1'
> plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
> dev.off()
null device 
          1 
> 