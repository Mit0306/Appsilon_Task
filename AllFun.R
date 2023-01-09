library(dplyr)
library(data.table)
library(rvest)
library(reshape2)


Sp_dataset <- function(){
  print("Start Table Read")
  y <- fread("./biodiversity-data/occurence.csv",nrows = 500000)

 
  return(y)
}

disp_data <- function(){
  y <- Sp_dataset()
  y1 <- y %>% 
    select('kingdom','vernacularName','country','family') %>% 
    filter(country == 'Poland')
  return(y1)
}


myplot <- function(){
  data_set <- Sp_dataset()
  data_set <- data_set %>% 
    select('kingdom','individualCount','family','country') %>% 
    filter(country == 'Poland')
  data_set$kingdom <- as.factor(data_set$kingdom)
x <-  ggplot(data_set, aes(x= family  , y = individualCount , fill= kingdom))+
      geom_bar(stat="identity")+
      coord_polar()+
      xlab("")+ylab("")
  return(x)
  
}



