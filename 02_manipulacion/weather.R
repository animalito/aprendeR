library(stringr)
library(reshape2)
library(plyr)
options(stringsAsFactors = FALSE)

  read.fwf2 <- function(path, cols) {
    raw_stations <- readLines(path)
    stations <- data.frame(matrix(ncol = 0, nrow = length(raw_stations)))
    
    for(i in 1:nrow(cols)) {
      field <- cols[i, ]
      stations[[field$name]] <- str_trim(str_sub(raw_stations, field$start, field$end))
    }
    stations[stations == ""] <- NA
    stations[] <- lapply(stations, type.convert, as.is = TRUE)
    
    stations
  }
  
  # Define format for fixed width file
  cols <- data.frame(
    name =  c("id", "year", "month", "element"),
    start = c(1,     12,    16,      18),
    end =   c(11,    15,    17,      21))
  
  names <- str_c(c("value", "mflag", "qflag", "sflag"), rep(1:31, each = 4), sep = "_")
  starts <- cumsum(c(22, rep(c(5, 1, 1, 1), 31)))
  starts <- starts[-length(starts)]
  ends <- c(starts[-1], starts[length(starts)] + 1) - 1
  
  values <- data.frame(name = names, start = starts, end = ends)
  cols <- rbind(cols, values)
  
  # Load data and subset to small example
  if (!file.exists("tidyr_datasets/weather.txt")) download.file("https://raw.githubusercontent.com/hadley/tidy-data/master/data/weather.txt",
                "tidyr_datasets/weather.txt")
  raw <- read.fwf2("tidyr_datasets/weather.txt",  cols)
  raw <- subset(raw, year == 2010 & element %in% c("TMIN", "TMAX")) 
  raw <- raw[, c(1:4, which(str_detect(names(raw), "value")))]
  raw$id <- str_c(str_sub(raw$id, 1, 2), str_sub(raw$id, -5, -1))
  
  names(raw)[-(1:4)] <- str_c("d", 1:31)
  raw[raw == -9999] <- NA
  raw[-(1:4)] <- raw[-(1:4)] / 10 
  rownames(raw) <- NULL
  raw$element <- tolower(raw$element)


