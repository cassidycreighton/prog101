# What does the following code do?
# Tip: `%%` is the remainder operator. E.g. 10 %% 4 is 2.
instrument_deployed_hm <- c(730, 915, 1345)
#creates vector
#military time
#13:45 as 1345
instrument_deployed_h <- floor(instrument_deployed_hm / 100)
#how many whole hours
instrument_deployed_hdec <- (instrument_deployed_hm %% 100) / 60
#how many fraction of hours

instrument_deployed <- instrument_deployed_h + instrument_deployed_hdec
#how many hours after midnight


# Based on the code above, calculate the duration of instrument deployments
# using the instrument recovery times below. What units do the durations have?
instrument_recovered_hm <- c(1600, 1920, 2015)
instrument_recovered_h <- floor(instrument_recovered_hm / 100)
#how many whole hours
instrument_recovered_hdec <- (instrument_recovered_hm %% 100) / 60
#hours
instrument_recovered <- instrument_recovered_h + instrument_recovered_hdec

instrument_durations <- instrument_recovered - instrument_deployed

# Which site had the longest duration? Use conditional indexing.
site <- c("Santa Cruz", "Santa Rosa", "San Miguel")
site[which.max(instrument_durations)]

site[max(instrument_durations) == instrument_durations]

