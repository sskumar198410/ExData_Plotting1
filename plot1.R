# Downloading the file

filename = "exdata-data-household_power_consumption.zip"

if (!file.exists(filename)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename,
                         method = "curl")
} 

# Reading the data from downloaded file

df1 <- read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                sep=";", stringsAsFactors=F, na.strings="?",
                colClasses=c("character", "character", "numeric",
                             "numeric", "numeric", "numeric",
                             "numeric", "numeric", "numeric"))

# Format the date 

df1$Date <- as.Date(df1$Date,format="%d/%m/%Y")

FromDate = as.Date("01/02/2007", format="%d/%m/%Y")
ToDate   = as.Date("02/02/2007", format="%d/%m/%Y")

# Subsetting the required rows

df1 <- df1[df1$Date >= FromDate & df1$Date <= ToDate, ]

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="plot1.png", width=480, height=480)

#Creating the histogram
hist(df1$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

#Device off
dev.off()