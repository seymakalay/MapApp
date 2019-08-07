#
library(readxl);library(ggmap)
#
dataformap <- read_excel("dataformap.xlsx" )
#View(dataformap)
dataformap$addresses <-  do.call(paste, c(dataformap[c("COD_CAB_GEST", "INDIRIZZO", "DES_PROVINCIA_ABI_GEST")], sep = " ")) 


register_google(key = "AIzaSyAvOyQvCiqUeRzowS2M5d0EDngTmpCYw4Y")

# check if key is saved
has_goog_key()



# Select the file from the file chooser
fileToLoad <- file.choose(new = TRUE)

# Read in the CSV data and store it in a variable 
origAddress <- read.csv(fileToLoad, stringsAsFactors = FALSE)

# Initialize the data frame
geocoded <- data.frame(stringsAsFactors = FALSE)

# Loop through the addresses to get the latitude and longitude of each address and add it to the
# origAddress data frame in new columns lat and lon
for(i in 1:nrow(dataformap)) 
  
{
  # Print("Working...")
  result <- geocode(dataformap$addresses[i], output = "latlona", source = "google")
  dataformap$lon[i] <- as.numeric(result[1])
  dataformap$lat[i] <- as.numeric(result[2])
  dataformap$geoAddress[i] <- as.character(result[3])
}
# Write a CSV file containing origAddress to the working directory
write.csv(dataformap, "geocoded.csv", row.names=FALSE)