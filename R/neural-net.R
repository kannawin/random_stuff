maxs = apply(College[,2:18], 2, max)
mins = apply(College[,2:18], 2, min)

scaled.data = as.data.frame(scale(College[,2:18],center = mins , scale=maxs - mins))

Private = as.numeric(College$Private) - 1
data = cbind(Private,scaled.data)

set.seed(101)

split = sample.split(data$Private, SplitRatio = .7)

train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

feats = names(scaled.data)
f = paste(feats,collapse=' + ')
f = paste('Private ~',f)
f = as.formula(f)

nn = neuralnet(f,train,hidden=c(10,10,10),linear.output=FALSE)

predicted.nn.values = compute(nn,test[2:18])
predicted.nn.values$net.result = sapply(predicted.nn.values$net.result, round, digits=0)
table(test$Private, predicted.nn.values$net.result)