# What do the following expressions do?
temp_F <- temp_C * 9/5 - 32
#converts celcius to farenheit
rect_area <- rect_length * rect_width
#finds the area of a rectangle

# Fill in the question marks to complete these expressions
tri_area <- 1/2 * base * height
cylinder_volume <- pi * radius^2 * height

  # What are the errors in these expressions?
  speed_m_s <- distance_m * time_s
  #the formula for speed is distance / time
acceleration m s2 <- speed_m_s / time_s
#the formula for acceleration is speed/time^2
#variable is not one word
force_N < mass + acceleration_m_s2
#the formula for force is mass * acceleration
#< instead of <-

# The energy density of market squid is 4850 joules per gram[1]. If a 225 kg
# Risso's dolphin needs 5 million joules of energy per day[2] and a typical
# market squid is 35 g[1], then how many squid does a Risso's dolphin need to
# eat each day? Solve the above word problem in R. Consider how many variables
# you need to create, what to name them to make the code readable, and how to
# combine them into expressions.

energy_density_squid <- 4850
dolphin_energy_j <- 5000000
squid_g <- 35
squid_energy_j <- squid_g * energy_density_squid
squid_num <- dolphin_energy_j/squid_energy_j
#30 squid


# [1] Price et al. 2024 https://doi.org/10.3389/fmars.2023.1345525
# [2] Barlow et al. 2008 https://doi.org/10.3354/meps07695

