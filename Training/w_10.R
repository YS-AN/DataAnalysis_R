library(mlbench)
data("BostonHousing") #보스턴 지역 주택 정보
myds <- BostonHousing[, c("crim", "rm", "dis", "tax", "medv")] #crim : 범죄율 / rm : 1가구당 방 개수 / dis : 5개 직업 센터까지 거리 / tax : 재산세율 / medv : 주택 가격
myds

#주택 가격 상(H, 25.0이상), 중(M, 17.0 이상), 하(L)로 분류 
grp <- c()
for(i in 1:nrow(myds)) {
  if (myds$medv[i] >= 25.0) {
    grp[i] <- "H"
  } else if (myds$medv[i] >= 17.0) {
    grp[i] <- "M"
  } else {
    grp[i] <- "L"
  }
}
grp <- factor(grp) #문자 벡터를 팩터 타입으로 변경한다
grp <- factor(grp, levels=c("H", "M", "L")) #레벨의 순서를 H, M, L로 세팅 (기존에는 알파벳 순서로 되어 있음)
myds <- data.frame(myds, grp) #grp열 추가 
myds

str(myds)
head(myds)
table(myds$grp) #주택 가격 그룹별 분포

par(mfrow=c(2,3)) #화면을 2x3으로 분할 

colors = c("red", "orange", "yellow", "green", "blue")

#히스토르그램으로 관측값의 분호 확인 (컬럼별 히스토그램 추출)
for(i in 1:5) {
  hist(myds[, i], main=colnames(myds)[i], col=colors[i])
}

#t상자그림에 의한 관측값 분포 확인
for(i in 1:5) {
  boxplot(myds[, i], main=colnames(myds)[i], col=colors[i])
}

par(mfrow=c(1,1)) #화면 분할 해제

#그룹별 관측값 분포 확인
boxplot(myds$crim~myds$grp, main="1인당 범죄율")
boxplot(myds$rm~myds$grp, main="방의 개수")

#다중 산점도 통한 변수 간 상관관계 
pairs(myds[, -6])

#그룹 정보를 포함한 변수 간 상관관계 확인
point <- as.integer(myds$grp)
pairs(myds[, -6], pch=point, col=colors[point])

#변수 간 상관계수 확인
cor(myds[, -6])


#결측값 : 데이터를 수짛바고 저장하는 과젖ㅇ에서 저장할 값을 얻지 못하는 경우 발생함
#결측값 처리 
#   1. 결측값을 제거하거나 제외하고, 데이터를 분석
#   2. 결측값을 추정하여 적당한 값으로 치환한 후, 데이터를 분석

#결측값 특성과 존재 여부 확인
z <- c(1,2,3,NA,5,NA,8)  # 결측값이 포함된 벡터 z
sum(z) # 정상 계산이 안됨 (result : NA)
is.na(z) # NA 여부 확인
sum(is.na(z)) # NA의 개수 확인
sum(z, na.rm=TRUE) # NA를 제외하고 합계를 계산

#결측값 대체 및 제거
z1 <- c(1,2,3,NA,5,NA,8) # 결측값이 포함된 벡터 z1
z2 <- c(5,8,1,NA,3,NA,7) # 결측값이 포함된 벡터 z2
z1[is.na(z1)] <- 0 # NA를 0으로 치환 
z1             
z3 <- as.vector(na.omit(z2)) # NA를 제거하고 새로운 벡터 생성
z3

z4 <- c(5,8,1,NA,3,NA,7) 
na.omit(z4)

# NA를 포함하는 test 데이터 생성
x <- iris
x[1,2]<- NA; x[1,3]<- NA
x[2,3]<- NA; x[3,4]<- NA  
head(x)

# for문을 이용한 방법
for (i in 1:ncol(x)) {
  this.na <- is.na(x[,i]) 
  cat(colnames(x)[i], "\t", sum(this.na), "\n")
}

# apply를 이용한 방법
col_na <- function(y) {
  return(sum(is.na(y)))
}
na_count <-apply(x, 2, FUN=col_na)
na_count

#데이터프레임 행별 결측값 확인
rowSums(is.na(x)) # 행별 NA의 개수  
sum(rowSums(is.na(x))>0) # NA가 포함된 행의 개수 
sum(is.na(x)) # 데이터셋 전체에서 NA 개수

#결측값 제외하고 새로운 데이터셋 만들기
head(x)
x[!complete.cases(x),] # NA가 포함된 행들 출력
y <- x[complete.cases(x),] # NA가 포함된 행들 제거
head(y)


#특이값 : 정상적이라 생각되는 데이터의 분포 범위 밖에 위치하는 값들을 말함. '이상치'라고도 부른다.

#상자그림을 이용한 특이값 확인
st <- data.frame(state.x77)
boxplot(st$Income)
boxplot.stats(st$Income)$out

#특이값 포함한 행 제거
out.val <- boxplot.stats(st$Income)$out # 특이값 추출
st$Income[st$Income %in% out.val] <- NA # 특이값을 NA로 대체
head(st)
newdata <- st[complete.cases(st),] # NA가 포함된 행 제거
head(newdata) 


#퀴즈2. 특이값을 찾아 특이값을 NA로 변경하고 NA가 있는 행을 삭제하는 소스코드를 작성하시오.
data <- iris[,-5]
data[3,1] <- 10.1
boxplot(data$Sepal.Length)
head(data)

out.val <- boxplot.stats(data$Sepal.Length)$out
data$Sepal.Length[data$Sepal.Length %in% out.val] <- NA 
head(data)
newdata <- data[complete.cases(data),]
head(newdata) 
