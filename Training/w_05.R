#파일 데이터 읽기
setwd("../../materials") #작업 폴더 지정
air <- read.csv("airquality.csv", header = F) 
#header : 기본값은 TRUE로 첫 줄을 변수명으로 읽을 것인지 결정
# T = 헤더가 변수명 / F = 헤더가 첫번째 행행
head(air)

#파일 데이터 쓰기 
my.iris <- subset(iris, Species = 'Setosa') #Setosa 품종 데이터만 추출
write.csv(my.iris, "my_iris.csv", row.names=F) 
#row.names = F : 저장할 행 번호를 붙이지 않음
write.csv(my.iris, "my_iris02.csv", row.names=T) #A열에 행번호 들어감

job.type <- 'A'
if(job.type == 'B'){
  bouns <-200
} else if(job.type == "C") {
  bouns <- 100
} else {
  bouns <- 0
}
print(bouns)

a<-10
b<-25
if(a>1 & b>30) {
  print(a+b)
} else if(a>1 | b>30) {
  print(a*b)
} else {
  print(a-b)
}

nrow <- nrow(iris)
mylabel <- c() #비어있는 백터 선언
for(i in 1:nrow){
  if(iris$Petal.Length[i] <= 1.6){
    mylabel[i] <- 'L'
  } else if (iris$Petal.Length[i] >= 5.1) {
    mylabel[i] <- 'H'
  } else {
    mylabel[i] <- 'M'
  }
}
print(mylabel)
newds <- data.frame(iris$Petal.Length, mylabel) #꽃잎의 길이와 레이블 결함 
head(newds)

sum <- 0
i <- 1
while(i<=100){
  sum <- sum + i
  i <- i + 1
}
print(sum)

sum <- 0
i <- 1
for(i in 1:100)
{
  sum <- sum+i
}
print(sum)

#apply() : 반복 잡업이 매트릭스나 데이터 프레임의 행, 열인 경우에는 apply를 이용하여 반복 작업 가능 
#apply(데이터 셋, 행/열방향 지정, 적용함수)
apply(iris[, 1:4], 1, mean) #행(1)방향으로 합수 적용 (mean :평균구하기)
apply(iris[, 1:4], 2, mean) #열(2)방향으로 합수 적용

colMeans(iris[, 1:4])

#사용자 정의 함수 
myMax <- function(x, y){
  num.max <- x
  
  if(y > x) {
    num.max <- y
  }
  
  return (num.max)
}
myMax(3, 9)

#다른 스크립트에 있는 사용자 정의 함수 불러오기  
setwd("./")
source("w_05_myFunc.R")

result <- myFunc(4, 10)
s <- result$sum
m <- result$mul
cat('4 + 10 = ', s, '\n')
cat('4 x 10 = ', m, '\n')


score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84, 69)
which(score == 69) #성적이 69인 학생은 몇 번째에 있나?
max(score) #최고점 (값)
which.max(score) #최고점 위처
min(score) #최소점 (값)
which.min(score) #최소점 위치 

idx <- which(iris[, 1:4] > 5.0, arr.ind = TRUE) #1~4열 중 값이 5보다 큰 값의 행과 열 위치 
idx

idx <- which(iris[, 1:4] > 5.0, arr.ind = FALSE) #arr.ind = FALSE 하면 행 위치만 나옴
idx

#퀴즈 1번 
nrow <- nrow(iris)
dsv <- c()
i <- 1
inx <- 1
for(i in 1:nrow){
  if(iris$Petal.Length[i] > 1.5) {
    dsv[inx] = iris$Petal.Length[i];
    inx <- inx + 1
  }
}
print(dsv)