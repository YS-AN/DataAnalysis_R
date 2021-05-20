par(mar=c(1,1,1,1)) #그래픽 설정 중 여백의 설정 값을 초기화

#정렬 order는 정렬된 색인 값 반환 / sort는 정렬된 값을 반환 
v1 <- c(1,7,6,8,4,2,3)
order(v1) 
v1 <- sort(v1) # 오름차순
v1
v2 <- sort(v1, decreasing=T)# 내림차순 
v2

#매트릭스와 데이터프레임의 정렬 sort는 메트릭스, 데이터 프레임에서는 사용 불가 
head(iris)
order(iris$Sepal.Length)
iris[order(iris$Sepal.Length),] # 오름차순으로 정렬
iris[order(iris$Sepal.Length, decreasing=T),] # 내림차순으로 정렬
iris.new <- iris[order(iris$Sepal.Length),] # 정렬된 데이터를 저장
head(iris.new)
iris[order(iris$Species, decreasing=T, iris$Petal.Length),] # 정렬 기준이 2개

sp <- split(iris, iris$Species) # 품종별로 데이터 분리
sp
summary(sp) #요약
sp$setosa # setosa 품종의 데이터 확인

#특정 데이터 선택 
subset(iris, Species == "setosa")
subset(iris, Sepal.Length > 7.5)
subset(iris, Sepal.Length > 5.1 & Sepal.Width > 3.9)
subset(iris, Sepal.Length > 7.6, select=c(Petal.Length,Petal.Width))

#데이터 샘플링과 조합
#샘플링 - 값들 중 임의의 개수의 값들을 추출하는 작업
#복원추출 : 한번 뽑은 것을 다시 뽑을 수 있는 추출
#비복원추출 : 한번 뽑은 것을 다시 뽑을 수 없는 추출

#비복원 추출
x<-1:100
y<-sample(x, size=10, replace = FALSE) 
y
idx <- sample(1:nrow(iris), size=50, replace = FALSE)
iris.50 <- iris[idx,] # 50개의 행 추출
dim(iris.50) # 행과 열의 개수 확인
head(iris.50)

sample(1:20, size=5, replace = FALSE) #비복원
sample(1:20, size=5) #복원
sample(1:20, size=5)

set.seed(100) #같은 값이 추출되도록 고정하기 위해 사용 
sample(1:20, size=5) #아래 샘필링 값이 모두 동일한 값으로 추출 됨
set.seed(100)
sample(1:20, size=5)
set.seed(100)
sample(1:20, size=5)

#데이터 조합 - 데이터 값 중 몇 개씩 짝을 지어 추출하도록 작업 
combn(1:5,3) # 1~5에서 3개를 뽑는 조합 

x = c("red","green","blue","black","white")
com <- combn(x,2) # x의 원소를 2개씩 뽑는 조합 
com

for(i in 1:ncol(com)) {    # 조합을 출력
  cat(com[,i], "\n")
}

#데이터 집계 
iris[, 5] 
agg <- aggregate(iris[, 5], by=list(iris$Species),FUN=mean) #aggregate = 집계
#iris[, 5] : 데이터 셋
#by=list( iris$Species) #집계 작업 기준 - 품종 열의 값을 의미
#FUN=mean #집계 작업 내용 지정 / mean = 평균
agg


표준편차=iris$Species
표준편차
agg <- aggregate(iris[,-5], by=list(표준편차=iris$Species), FUN=sd) #sd = 표준편차
agg

head(mtcars)
agg <- aggregate(mtcars, by=list(cyl=mtcars$cyl,vs=mtcars$vs),FUN=max) #각변수의 최댓값 출력
agg

#데이터 병합
x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(name=c("a","b","d"), korean=c(75,60,90))
x
y
z <- merge(x,y, by=c("name"))
z
merge(x,y)
merge(x,y, all.x=T) # 첫 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all.y=T) # 두 번째 데이터셋의 행들은 모두 표시되게
merge(x,y, all=T) # 두 데이터셋의 모든 행들이 표시되도록

x <- data.frame(name=c("a","b","c"), math=c(90,80,40))
y <- data.frame(sname=c("a","b","d"), korean=c(75,60,90))
x # 병합 기준 열의 이름이 name
y # 병합 기준 열의 이름이 sname
merge(x,y, by.x=c("name"), by.y=c("sname")) 
