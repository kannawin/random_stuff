text = readLines("C:\\users\\kannas11\\Desktop\\stuff\\Twain.txt")

textReal = list()

for(a in text){
  if(nchar(a) > 1){
    x<-str_replace_all(a, "[\\[\\],.'()/*?_^;:&$\"!-`]", "")
    textReal = append(textReal,x)
  }
}
real = unlist(textReal)

for(x in 1:length(real)){
  temp = real[[x]]
  for(i in 1:5){
    temp <- str_replace_all(temp,"  ", "")
  }
  real[[x]] = temp
}

words = list()
for(i in 1:length(real)){
  a = strsplit(real[[i]],' ')
  for(j in 1:length(a)){
    words = append(words,a[[j]])
  }
}
wordsReal = list()

for(i in 1:length(words)){
  if(nchar(words[[i]]) > 0){
    wordsReal = append(wordsReal,words[[i]])
  }
}
y = as.character(wordsReal)

chars = c()
num = c()

for(a in y){
  x = strsplit(a,"")
  for(b in x){
    chars = append(chars,b)
  }
}

charTable = table(chars)
barplot(charTable,col=col)

