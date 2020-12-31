realKIndex <- function(val, kval){
  distances = list()
  for(i in kval){
    dist = abs(i - val)
    distances = append(distances,dist)
  }
  mini = min(unlist(distances))
  for(i in 1:length(distances)){
    if(mini == distances[i]){
      return(i)
    }
  }
  return(1)
}


n = 100000
knum = 7

iterations = 30


x = runif(n,0,100)
y = runif(n,0,100)

xlist = list()
ylist = list()
kval = runif(knum,0,100)
avg = list()
denom = list()



kval = sort(unlist(kval), decreasing = FALSE)

col = palette(rainbow(knum))

plot(0,ylim=c(-1,101),xlim=c(-1,101))

for(a in 1:iterations){
  avg = list()
  denom = list()
  for(i in 1:length(kval)){
    avg = append(avg,0)
    denom = append(avg,0)
  }
  for(j in x){
    avg[[realKIndex(j,kval)]] = avg[[realKIndex(j,kval)]] + j
    denom[[realKIndex(j,kval)]] = denom[[realKIndex(j,kval)]] + 1
  }
#  avg = append(avg,z)
#  denom = append(denom,p)
  for(i in 1:knum){
    ##need to get the middle of it
    avgValue = avg[[i]]
    bottom = denom[[i]]
    current = avgValue / bottom
    kval[i] = current
  }
  
}


plot(x,y,col= 'white',pch=19)
for(i in 1:length(x)){
  points(x[i],y[i],col=col[realKIndex(x[i],kval)], pch='.')
}
