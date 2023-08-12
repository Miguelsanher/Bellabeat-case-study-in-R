##INSTALAMOS PAQUETES
install.packages("tidyverse")
library(tidyverse)
library(skimr)
library(here)
library(janitor)
##CAMBIAMOS EL DIRECTORIO
setwd("C:/Users/20mig/Desktop/FITBIT/Fitabase Data 4.12.16-5.12.16")
##CARGAMOS LA BASE DE DATOS
weight<-read_csv("weightLogInfo_merged.csv")
##VISTA PREVIA
skim_without_charts(weight)
head(weight)
##limpiamos los nombres
clean_names(weight)
##JOIN
weight_Activity<-merge(weight,dailyActivity,by=c("Id"))
view(weight_Activity)
##
ggplot(data=weight_Activity)+
  geom_point(mapping = aes(x=TotalSteps,y=WeightKg))+
  geom_smooth(mapping = aes(x=TotalSteps,y=WeightKg))+
  labs(title="TOTAL STEPS X WEIGHT(KG)",subtitle="no clear correlation")