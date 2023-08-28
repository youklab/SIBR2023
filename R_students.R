# Load necessary libraries
# install.packages("openxlsx")
library(openxlsx)

# File name: replace 'your_excel_file.xlsx' with the actual file's name
# filename <- 'your_excel_file.xlsx'
filename <- 'Low sampling/Low_sampling.xlsx'

# Read the first two columns of data from the first sheet
data <- read.xlsx(filename, sheet = 1, cols = 1:2)

x <- data[,1]  # 1st column of data 
y <- data[,2]  # 2nd column of data

# Moving average: arithmetic mean
N <- 200  # Window size for moving average (you can adjust this value as needed)
y_avg <- zoo::rollmean(y, k = N, fill = NA)

# Plot on linear scale
par(mfrow=c(2,1)) # Subplots with 2 rows

plot(x, y, col = "black", pch = 16, xlab = 'GFP', ylab = 'mCherry', main = 'Plot on linear scale')

# Plot on log-log scale
plot(x, y, col = "black", pch = 16, xlab = 'GFP', ylab = 'mCherry', main = 'Plot on log-log scale', log = "xy")

# Uncomment below to get more plots
# 
# # Plot with moving average on linear scale
# plot(x, y, col = "black", pch = 16, xlab = 'GFP', ylab = 'mCherry', main = 'Plot with moving average')
# lines(x, y_avg, col = "red", lwd = 2)
# 
# # Plot with moving average on log-log scale
# plot(x, y, col = "black", pch = 16, xlab = 'GFP', ylab = 'mCherry', main = 'Plot with moving average on log-log scale', log = "xy")
# lines(x, y_avg, col = "red", lwd = 2)
