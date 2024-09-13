## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(timeSeriesDataSets)

library(ggplot2)

## -----------------------------------------------------------------------------
# Install the package from CRAN
# install.packages("timeSeriesDataSets")

# Load the package
library(timeSeriesDataSets)


## ----AirPassengers------------------------------------------------------------
# Load the dataset
data("AirPassengers_ts")

# Check the class of the dataset
class(AirPassengers_ts)

# Display the first few rows of the dataset
head(AirPassengers_ts)


## ----ggplot2------------------------------------------------------------------

# Convert AirPassengers to a data frame for use with ggplot2
air_df <- data.frame(
  Month = time(AirPassengers_ts),
  Passengers = as.numeric(AirPassengers_ts)
)

# Time series plot
ggplot(air_df, aes(x = Month, y = Passengers)) +
  geom_line(color = "blue") +
  labs(title = "International Airline Passengers (1949-1960)",
       x = "Date", y = "Number of Passengers") +
  theme_minimal()

## ----trend_airpassengers------------------------------------------------------

# Decompose the time series
decomposed_ap <- decompose(AirPassengers_ts)

# Extract trend and seasonality
trend <- decomposed_ap$trend
seasonal <- decomposed_ap$seasonal

# Create a data frame for ggplot2
decomposed_df <- data.frame(
  Month = time(AirPassengers_ts),
  Passengers = as.numeric(AirPassengers_ts),
  Trend = trend,
  Seasonal = seasonal
)

# Plot trend and seasonality
ggplot(decomposed_df, aes(x = Month)) +
  geom_line(aes(y = Passengers), color = "blue", alpha = 0.6) +
  geom_line(aes(y = Trend), color = "red", linetype = "dashed") +
  geom_line(aes(y = Seasonal + mean(Passengers)), color = "green", linetype = "dotted") +
  labs(title = "Trend and Seasonality in AirPassengers Dataset",
       x = "Date", y = "Number of Passengers") +
  theme_minimal()




