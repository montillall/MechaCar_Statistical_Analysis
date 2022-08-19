library(dplyr)

# Deliverable 1: Linear Regression to Predict MPG
mecha_car <- read.csv('MechaCar_mpg.csv') #import and read files as dataframe
head(mecha_car)

# Perform linear regression using lm() function. Pass in all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car)

# Determine p-value and r-squared for the linear regression model using summary
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_car))


# Deliverable 2: Visualizations for the Trip Analysis
suspension_coil <- read.csv('Suspension_Coil.csv') #import and read files as dataframe
head(suspension_coil)

# Create total_summary table using the summarize() function to get the mean, median, variance, 
#and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_coil %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))


# Create a lot_summary dataframe using the group_by() and the summarize() functions to group each 
#manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s 
#PSI column
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# Deliverable 3: T-Tests on Suspension Coils

# t.test to determine if the psi across all manufacturing lots is statistically different from the population mean 1500 psi
# Randomly Sample 50 data points
suspension_coil_sample <- suspension_coil %>% sample_n(50)
# Compare sample versus population means
t.test(suspension_coil_sample$PSI,mu=1500)

# t.test by lots. Samples by lots
lot1 <- subset(suspension_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_coil, Manufacturing_Lot=="Lot3")

# Lots comparison sample versus population means
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)













