j = 40000
num = c(length = j)

for(n in 1:j){
  y = runif(n,0,1)
  x = runif(n,0,1)
  
  num[n] = 0
  above = list()
  
  for(i in 1:length(x)){
    tempY = y[i]
    tempX = x[i]
    if((tempX^2 + tempY^2) <= 1){
      num[n] = num[n] + 1
    }
  }
  
  
#  plot(x,y,col=ifelse((x^2 + y^2) < 1, 'goldenrod','blue'), pch = 19)
  
}
  plot(x,y,col=ifelse((x^2 + y^2) <= 1, 'goldenrod','blue'), pch = 19)

xy = seq(1:length(num))
plot(xy,(num/xy),col='red')
lines(xy,(num/xy),col='blue',pch='.')

num[5000]

yx = runif(length(num),pi/4,pi/4)