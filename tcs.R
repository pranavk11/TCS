a<- read.csv("dataset123.csv")
w<-by_state_wise <-a%>%group_by(state)%>%summarise(Avg_So2=mean(so2,na.rm=TRUE),
                                                   Avg_No2=mean(no2,na.rm=TRUE),
                                                   Avg_Rspm=mean(rspm,na.rm=TRUE),
                                                   Avg_Spm= mean(spm,na.rm=TRUE))
#View(w)
print('Enter the State you want to check air quality')
x=scan(what='character')
cus<-function(x)
{
  y<- w%>%filter(state==x)
  
  s<- (y$Avg_So2+y$Avg_No2+y$Avg_Rspm+ y$Avg_Spm)/4
  if(s> 0 && s < 50)
  {
    z<- "Good"
  }
  else if(s> 51 && s < 100)
  {
            z<- "Satisfactory"
  }
  else if(s> 101 & s < 200)
          {
            z<- "Moderately polluted"
  }
  else if(s> 201 && s < 300)
  {
    z<- "Poor"
  }
  else if(s> 301 && s < 400)
  {
    z<- "Very poor"
  }
  else
  {
    z<- "Severe"
  }
  return(z)
}
cus(x)

