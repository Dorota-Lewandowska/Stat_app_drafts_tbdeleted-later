0. if DF is null - replace with values, else - take the one selected into accoun
1.Reactive values - change table when button is pressed, rather than when value is being changed
  b) All columns get changed, not the last one
2.Change - so the whole table changes, rather than last rows
3.Add additional columns and format
4.Add 'download' button
5.Add 'clean' button



#### http://stackoverflow.com/questions/33617842/shiny-reactive-a-column-in-a-data-frame/33618463#33618463



dats<-data.frame(matrix(NA, nrow=10, ncol=5))

names(dats)<-c("des", " p1" , "n1", "p2", "n2")


dats[,1]<-as.character(dats[,1])
dats[,2]<-as.numeric(dats[,2])
dats[,4]<-as.numeric(dats[,4])
dats[,3]<-as.integer(dats[,3])
dats[,5]<-as.integer(dats[,5])


####this will have to be updated - so all calculated columns are being calculated

calculate<-function(dataset){
  
  dataset[,6]<-dataset[,1]
  dataset[,7]<-dataset[,2]*0.33
  
  names(dataset)<-c("des", " p1" , "n1", "p2", "n2", "cal1", "cal2")
  return(dataset)
}

