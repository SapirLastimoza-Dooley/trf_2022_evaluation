fDir= 'C:/Users/sapir/Desktop/SP_2019/GNSS/'
fNames=list.files(fdir, pattern = '.csv')
fPaths = paste0(fDir,fNames)
for (i in 1:length(fPaths)){
  tab = read.csv(fPaths[i])
  a=min(tab$Lon)
  b=min(tab$Lon+.0000068)
  c=min(tab$Lat)
  d=min(tab$Lat+.00000221)
  par(mar=c(6,6,4,6))
  plot(tab$Lon,tab$Lat,xlim = c(min(tab$Lon-.00000068),min(tab$Lon+.000007)),
       ylim = c(min(tab$Lat)-.000000221,min(tab$Lat)+.00000221),xlab = 'Longitude', 
       ylab='Latitude', xaxt='none',yaxt='none')
  title(main=tab$Title,line=-1)
  text(tab$Lon,tab$Lat,tab$i..Date,pos=3,cex=.7)
  xtick<-seq<-(c(min(tab$Lon),c(min(tab$Lon+.0000068)),by=c(.0000002)))
  axis(side=1,at=xtick,labes=F)
  text(x=xtick,par('usr')[3],labels=xtick,srt=0,pos=1,xpd=T)
  ytick<-seq<-(c(min(tab$Lat),c(min(tab$Lat+.000000221)),by=c(.0000002)))
  axis(side=2,at=ytick,labes=F)
  text(x=xtick,par('usr')[1],ytick,labels=ytick,srt=0,pos=2,xpd=T)
  points(tab$Lonp,tab$Latp,col='red')
  text(tab$Lonp,tab$Latp,tab$Datep,pos=3,cex=.7)
  legend('topleft',legend=c('Temporal Changes', 'Base Point'), col=c('black','red'),lty=c(1,1),cex=.8)
  
  plot(tab$Lonp,tab$Latp,xlab='Longitude',ylab='Latitude',xlim=c(min(tab$Lonp[1]),min(tab$Lonp[1]+.0000125998)),ylim=c(min(tab$Lato[1]),min(tab$Lato[1]+.00000503)))
  title(main=tab$Title,line=-1)
  points(tab$Lono,tab$Lato,col='red')
  legend('topright',leend=c('ITRF2008','NAD83'),col=c('black','red'),lty=c(1,1),cex=0.8)
}
