##########################################################################
## Driver: (Name) (GitHub Handle)                                       ##
## Navigator: (Name) (GitHub Handle)                                    ##
## Date: (YYYY-MM-DD)                                                   ##
##########################################################################

library(marinecs100b)

# Installed these packages in order to isolate date from date/time/zone
install.packages("tidyverse")
install.packages("lubridate")
library(lubridate)


#shetches
#https://docs.google.com/document/d/10Id_rbNV1mUp05d4fbuG8CrDAaPq5bhT8hHGHkbXCEo/edit?usp=sharing

# Guiding questions -------------------------------------------------------

# What does KEFJ stand for?
#Kenai Fjords

# How was temperature monitored?
#With HOBO V2 temperature loggers

# What's the difference between absolute temperature and temperature anomaly?
#Absolute temperatures are measured temperatures.
#Temperature anomalies are measurements that differ signifcantly from the
#mean of the absolute temperatures


# Begin exploring ---------------------------------------------------------

# How many kefj_* vectors are there?
#6
# How long are they?
#1295038
# What do they represent?
#date and time
#exposure
#season
#site
# Link to sketch

kefj_datetime
kefj_site
kefj_Aialik_datetime <- kefj_datetime[kefj_site == "Aialik"]
kefj_interval <- kefj_datetime[2:length(kefj_datetime)]-kefj_datetime[1:length(kefj_datetime)-1]
table(kefj_site)
#most common sampling interval: 30 minutes


# Problem decomposition ---------------------------------------------------

# When and where did the hottest and coldest air temperature readings happen?

# Link to sketch

# Plot the hottest day
hottest_idx <- which.max(kefj_temperature)
hottest_time <- kefj_datetime[hottest_idx]
hottest_day <- as_date(hottest_time)
hottest_site <- kefj_site[hottest_idx]
hotday_start <- as.POSIXct(paste(hottest_day, "0:00"), tz = "Etc/GMT+8")
hotday_end <- as.POSIXct(paste(hottest_day +1, "0:00"), tz = "Etc/GMT+8")
#put day end as start of next day because otherwise it gets cut off early
hotday_idx <- which(kefj_site == hottest_site &
  kefj_datetime >= hotday_start &
  kefj_datetime <= hotday_end)
hotday_datetime <- kefj_datetime[hotday_idx]
hotday_temperature <- kefj_temperature[hotday_idx]
hotday_exposure <- kefj_exposure[hotday_idx]
plot_kefj(hotday_datetime, hotday_temperature, hotday_exposure)
#for some reason the exposure at the end of the day does not show up on the plot
#but the same code works fine for the cold section
hotday_exposure
# Repeat for the coldest day

coldest_idx <- which.min(kefj_temperature)
coldest_time <- kefj_datetime[coldest_idx]
coldest_day <- as_date(coldest_time)
coldest_site <- kefj_site[coldest_idx]
coldday_start <- as.POSIXct(paste(coldest_day, "0:00"), tz = "Etc/GMT+8")
coldday_end <- as.POSIXct(paste(coldest_day +1 , "0:00"), tz = "Etc/GMT+8")
#put day end as start of next day because otherwise it gets cut off early
coldday_idx <- which(kefj_site == coldest_site &
                      kefj_datetime >= coldday_start &
                      kefj_datetime <= coldday_end)
coldday_datetime <- kefj_datetime[coldday_idx]
coldday_temperature <- kefj_temperature[coldday_idx]
coldday_exposure <- kefj_exposure[coldday_idx]
plot_kefj(coldday_datetime, coldday_temperature, coldday_exposure)


# What patterns do you notice in time, temperature, and exposure? Do those
# patterns match your intuition, or do they differ?
#temp spikes/dips when exposure is air or air/transition
#match my intuition, water as a high specific heat
#its temp is harder to change than air
# How did Traiger et al. define extreme temperature exposure?
#extreme warm: ≥25°C
# extreme cold: ≤−4°C
# Transition periods when it was unclear whether the loggers were submerged were omitted
# Translate their written description to code and calculate the extreme heat
# exposure for the hottest day.
hotday_exposed_idx <- which((hotday_exposure == "air" | hotday_exposure == "air/transition") & hotday_temperature >= 25)
hotday_exposed_idx
hotday_interval <- hotday_datetime[2:length(hotday_datetime)]-hotday_datetime[1:length(hotday_datetime)-1]
sum(hotday_interval[hotday_exposed_idx])

# Compare your answer to the visualization you made. Does it look right to you?
#yes
# Repeat this process for extreme cold exposure on the coldest day.
coldday_exposed_idx <- which((coldday_exposure == "air" | coldday_exposure == "air/transition") & coldday_temperature <= -4)
coldday_exposed_idx
coldday_interval <- coldday_datetime[2:length(coldday_datetime)]-coldday_datetime[1:length(coldday_datetime)-1]
sum(coldday_interval[coldday_exposed_idx])
length(coldday_interval)
# Putting it together (optional)------------------------------------------------

# Link to sketch

# Pick one site and one season. What were the extreme heat and cold exposure at
# that site in that season?

# Repeat for a different site and a different season.

# Optional extension: Traiger et al. (2022) also calculated water temperature
# anomalies. Consider how you could do that. Make a sketch showing which vectors
# you would need and how you would use them. Write code to get the temperature
# anomalies for one site in one season in one year.
