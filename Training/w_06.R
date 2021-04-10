MaxValue <- function(x, y) {
  val <- ifelse(x > y, x, y);
  return (val);
}
print(MaxValue(10, 7));


setwd("./");
source("w_06_myFunc.R")

print(Division(10, 7));

result <- MultiCalculate(5, 8)
s <- result$sum
m <- result$mul
cat('5+8=', s, '\n');
cat('5*8=', m, '\n');

#조건에 맞는 데이터 위치 찾기
score <- c(76, 84, 69, 50, 95, 60, 82, 71, 88, 84, 69)
which(score==69) #성적이 69인 학생의 위치 (모든 위치)
which(score >= 85) #성적이 85이상인 학생들의 위치 
max(score) #최고점 
which.max(score) #최고점 위치 
min(score) #최저점
which.min(score) #최저점 위치

#성적이 69이면 100으로 조정함
idx <- which(score == 69)
score[idx] <- 100
score

idx <- which(iris[,1:4]>5.0, arr.ind = TRUE) # 1~4열의 값 중 5 보다 큰 값의 행과 열의 위치
idx

#단일변수 범주형 자료 
#todo. fall에서 왜 '안해야 오류 안날까?
thefavorite <-c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER’, FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
thefavorite # favorite의 내용 출력
table(thefavorite) # 도수분포표 계산
table(thefavorite)/length(thefavorite) # 비율 

ds <- table(thefavorite)
ds
barplot(ds, main='favorite season') #막대그래프
pie(ds, main='favorite season') #파이그래프

favorite.color <- c(2, 3, 2, 1, 1, 2, 2, 1, 3, 2, 1, 3, 2, 1, 2)
ds <- table(favorite.color)
ds
barplot(ds, main='favorite color')
colors <- c('green', 'red', 'blue')
names(ds) <- colors #자료값 1,2,3을 green, red, blue로 변경하기 위함
ds
barplot(ds, main='favorite color', col=colors) # 색 지정 막대그래프
pie(ds, main='favorite color', col=colors) # 색 지정 원그래프

#단일변수 연속형 자료 
weight <- c(60, 62, 64, 65, 68, 69)
weight.heavy <- c(weight, 120)
weight
weight.heavy

mean(weight) #평균
mean(weight.heavy) #평균

median(weight) #중앙값
median(weight.heavy) # 중앙값

mean(weight, trim=0.2) #절사평균 상하위 20% 제외
mean(weight.heavy,trim =0.2) #절사평균 상하위 20% 제외

mydata <- c(60, 62, 64, 65, 68, 69, 120)
quantile(mydata) #4분위수 
quantile(mydata, (0:10)/10) # 10% 단위로 구간을 나누어 계산
summary(mydata) 

mydata <- c(60, 62, 64, 65, 68, 69, 120)
var(mydata) #분산 - 흩어져 있는 정도 
sd(mydata) #표준편차
range(mydata ) #값의 범위
diff(range(mydata)) # 최댓값, 최솟값의 차이


#퀴즈
#01
Add <- function(x, y) {
  return(x + y)
}
sum <- Add(10, 7)
print(sum);
