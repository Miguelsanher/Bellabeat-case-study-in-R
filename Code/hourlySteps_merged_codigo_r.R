##INSTALAMOS PAQUETES
install.packages("tidyverse")
library(tidyverse)
library(skimr)
library(here)
library(janitor)
##CAMBIAMOS EL DIRECTORIO
setwd("C:/Users/20mig/Desktop/FITBIT/Fitabase Data 4.12.16-5.12.16")
##CARGAMOS LA BASE DE DATOS
hourlySteps_merged<-read_csv("hourlySteps_merged.csv")
##LIMPIAMOS NOMBRES
clean_names(hourlySteps_merged)
##VISTA PREVIA
skim_without_charts(hourlySteps_merged)
##SEPARAMOS LA COLUMNA EN DOS
hourlySteps_merged<-separate(hourlySteps_merged,ActivityHour,into = c('Date','Hour'),sep=" ")
##ARREGLAMOS LOS FORMATOS
hourlySteps_merged$Date<- as.Date(hourlySteps_merged$Date,format = '%d','%m','%y')
##HOUR X STEPTOTAL
ggplot(data=hourlySteps_merged)+
  geom_boxplot(mapping = aes(x=Hour,y=StepTotal),color='black')+
  geom_smooth(mapping = aes(x=Hour,y=StepTotal))+
  labs(title="HOUR X STEPTOTAL",subtitle = "")
##MAYOR MEDIA:7, MAYOR MÁXIMO 2
hourlySteps_merged%>%
  group_by(Hour)%>%
  summarise(media=mean(StepTotal),maximun=max(StepTotal),minimun=min(StepTotal))


head(hourlySteps_merged)
