#Read in csv data 
coredata <- read.csv("Inputs/coredata.csv")

#Histogram to visualise data distribution and inform approrpiate statistical analyses (refer to thesis Appendix G and H)
ggplot(coredata, aes( x = mean))+geom_histogram()+facet_grid(season~newgroup)
+ labs(title = "TSSeq (mean) data distribution by site class and season", x = "TSSeq (mg/L)")
ggplot(coredata, aes( x = TC))+geom_histogram(bins = 40)+facet_grid(season~newgroup) 
+ labs(title = "Total Cover data distribution by site class and season", x = "Total Cover (%)")

Autocorrelation
#Autocorrelaiton to visually inspect for data individual serial correlation and grouped cross correlation to help inform appropriate statistical analyses (refer to thesis Appendix I, J and K)
acf(coredata$TC, main = "Autocorrelation of Monthly Total Cover", lwd=2)
acf(coredata$mean, main = "Autocorrelation of Monthly Mean TSSeq Values", lwd=2)
ccf(coredata$TC,coredata$mean, main = "Cross-correlation between monthly mean TSSeq and Total Cover", lwd=2)
