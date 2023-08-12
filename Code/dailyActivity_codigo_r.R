##INSTALAMOS PAQUETES
install.packages("tidyverse")
library(tidyverse)
library(skimr)
library(here)
library(janitor)
##CAMBIAMOS EL DIRECTORIO
setwd("C:/Users/20mig/Desktop/FITBIT/Fitabase Data 4.12.16-5.12.16")
##CARGAMOS LA BASE DE DATOS
dailyActivity<-read_csv("dailyActivity_merged.csv")
##VISTA PREVIA
skim_without_charts(dailyActivity)
##limpiamos los nombres
clean_names(dailyActivity)
##arreglamos los tipos
dailyActivity$ActivityDate<-as.Date(dailyActivity$ActivityDate,format = "%m/%d/%Y")
##observamos que hay algunos id que tienen mas registros que otros y 
##que hay 33 ids unicos
dailyActivity%>%
  group_by(Id)%>%
  count(Id)
##OBSERVAMOS UN AUMENTO DE USO EN ABRIL PERO UNA DISMINUCION EN MAYO
ggplot(data=dailyActivity)+
  geom_bar(mapping = aes(x=ActivityDate))+
  labs(title="RECORDS X TIME",subtitle = "increase in April, decrease in May")
##OBSERVAMOS UNA CORRELACIÓN ENTRE LAS TOTAL STEPS Y LAS CALORIAS
ggplot(data=dailyActivity)+
  geom_point(mapping = aes(x=TotalSteps,y=Calories),color='black')+
  geom_smooth(mapping = aes(x=TotalSteps,y=Calories),method = 'loess')+
  labs(title="TOTAL STEPS X CALORIES",subtitle = "increase in total steps = increase in calories")


head(dailyActivity)


view(dailyActivity)