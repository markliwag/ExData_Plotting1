```{r download, cache=TRUE}
download <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "temp")
unzip("temp")
unlink("temp")
```

```{r process, cache = TRUE}
hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$dt <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_sub <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
```

```{r plot3}
plot(hpc_sub$dt, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(hpc_sub$dt, hpc_sub$Sub_metering_2, type = "l", col = "red")
points(hpc_sub$dt, hpc_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
```


