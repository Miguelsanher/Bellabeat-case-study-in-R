##INSTALAMOS PAQUETES
install.packages("tidyverse")
library(tidyverse)
library(skimr)
library(here)
library(janitor)
##CAMBIAMOS EL DIRECTORIO
setwd("C:/Users/20mig/Desktop/FITBIT/Fitabase Data 4.12.16-5.12.16")
##CARGAMOS LA BASE DE DATOS
sleepDay_merged<-read_csv("sleepDay_merged.csv")
##LIMPIAMOS NOMBRES
clean_names(sleepDay_merged)
##VISTA PREVIA
skim_without_charts(sleepDay_merged)
##JUNTAMOS DATOS
sleep_activity<-merge(sleepDay_merged,dailyActivity,by=c("Id"))
head(sleep_activity)
view(sleep_activity)
##
ggplot(data=sleep_activity)+
  geom_point(mapping = aes(x=TotalMinutesAsleep,y=SedentaryMinutes))+
  geom_smooth(mapping = aes(x=TotalMinutesAsleep,y=SedentaryMinutes))+
  labs(title = "MINUTES ASLEEP X SEDENTARY TIME",subtitle = "NO CLEAR CORRELATION")
##
ggplot(data=sleep_activity)+
  geom_point(mapping = aes(x=TotalTimeInBed,y=TotalSteps))+
  geom_smooth(mapping = aes(x=TotalTimeInBed,y=TotalSteps))+
  labs(title = "TIME IN BED X TOTAL STEPS",subtitle = "NO CLEAR CORRELATION")


head(sleepDay_merged)