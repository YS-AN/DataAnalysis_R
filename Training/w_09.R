mydata <- c(60, 62, 64, 65, 68, 69, 120)
var(mydata) #분산
sd(mydata) #표준편차
range(mydata) #값의 범위
diff(range(mydata)) #최댓값, 최솟값의 차이

#히스트그램. 연속형 자료의 분포를 시각화 할 때 사용. 막대 그래프와 비슷한 모습
dist <- cars[,2 ]
dist
hist(dist, 
     main = "Histogram for 제동거리", 
     xlab = "제동거리",
     ylab = "빈도수",
     border = "blue",
     col = "green",
     las = 2,
     breaks = 5)
#hist (자료, [main : 제목], [xlab : x축 레이블], [ylba : y축 레이블], 
#       [border : 막대 태두리 색], [col : 막대 색], 
#       [las : x축 글씨 방향 : 0~3], [breaks : 막대 개수 조절])

#상자 그림: 사분위수를 시각화하여 그래프 형태로 나타난 것
boxplot(dist, main = "자동차 제동거리")
boxplot.stats(dist)
#s $tats : 최소, 1사분위, 중앙값, 3사분위, 최대값
# $n : 관측 값의 개수
# $conf : 중앙값의 신뢰구간
# $out : 특이 값

boxplot(Petal.Length~Species, data = iris, main="품종별 꽃잎의 길이")

#한화면에 그래프 여러개 그리기
par(mfrow=c(1,3)) # !x3 가상화면 분할
barplot(table(mtcars$carb), main="Barplot of Carburetors", xlab = "#of carburetors", ylab = "frequency", col = "blue")
barplot(table(mtcars$cyl), main="Barplot of Cylender", xlab = "#of cylender", ylab = "frequency", col = "red")
barplot(table(mtcars$gear), main="Barplot of Grar", xlab = "#of gears", ylab = "frequency", col = "green")
par(mfrow=c(1, 1))


#산점도
wt <-mtcars$wt # 중량 자료
wt
mpg <- mtcars$mpg # 연비 자료
mpg


plot(wt, mpg, main="중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=19) #산점도              
# plot(2개 변수(x축, y축), [main : 제목], [xlab : x레이블 명], [ylab : y레이블 명], [col : point의 color], [pch : point의 종류])

#여러 변수들 간의 산점도
vars <- c("mpg","disp","drat","wt") # 대상 변수 
target <- mtcars[,vars]
head(target)
pairs(target,  main="Multi Plots")  # target : 대상 데이터     

#그룹정보가 있는 두 변수의 산점도 : 그룹별로 다른 색과 점의 모양으로 표시 가능함.
iris.2 <- iris[,3:4]# 데이터 준비
point <- as.numeric(iris$Species) # 점의 모양
point 
color <- c("red","green","blue") # 점의 컬러
plot(iris.2, 
     main="Iris plot",
     pch=c(point),
     col=color[point]) 


#상관분석 : 얼마나 선형성을 보이는지 수치상으로 나타낼 수 있는 방법
beers = c(5,2,9,8,3,7,3,5,3,5)               
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07, 0.06,0.02,0.05)
tbl <- data.frame(beers,bal) # 데이터프레임 생성
tbl                                
plot(bal~beers,data=tbl) # 산점도 
res <- lm(bal~beers,data=tbl) # 회귀식 도출
abline(res)  # 회귀선 그리기
cor(beers,bal)  # 상관계수 계산
cor(iris[,1:4]) # 4개 변수 간 상관성 분석

#선그래프
month = 1:12
late  = c(5,8,7,9,4,6,12,13,8,6,6,4) 
plot(month,                         
     late,                          
     main="지각생 통계",
     type= "l",
     lty=4,
     lwd=1,
     xlab="Month",
     ylab="Late cnt"
)
#plot(x data, y data, [main : 제목], [type : 그래프의 종류 선택], [lty : 선의 종류], [lwd : 선의 굵기 선택], [col : 선의 색상 지정], [xlab : x축 이름], [ylab : y축 이름])

#복수 선 그래프 작성
month = 1:12
late1  = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2  = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month,                               
     late1,                               
     main="Late Students",
     type= "b",
     lty=1,
     col="red",
     xlab="Month ",
     ylab="Late cnt",
     ylim=c(1, 15) # y축 값의 (하한, 상한) (y값의 범위 지정)
)
lines(month,  
      late2,
      type = "b", 
      col = "blue") 




#퀴즈2. iris데이터 중 품종별 꽃잎의 길이를 구하는 코드를 작성하시오.
iris$Petal.Length
iris$Species
tb <- data.frame(iris$Species,iris$Petal.Length)
tb #품종별 꽃입의 길이를 구한 dataframe
boxplot(Petal.Length~Species, data = iris, main="품종별 꽃잎의 길이") #품종별 꽃입의 길이를 나타낸 상자그림

#퀴즈3. mtcars 데이터셋에서 중량과 연비사이의 관계를 볼 수 있는 산점도 그래프를 작성하시오.또한 중량 대비 연비의 회귀선을 도출하는 선을 추가하세요.
wt <-mtcars$wt # 중량 자료
mpg <- mtcars$mpg # 연비 자료
tb <- data.frame(wt, mpg)
plot(wt, mpg, main="중량-연비 그래프", xlab="중량", ylab="연비(MPG)", col="red", pch=19) #산점도              
res <- lm(mpg~wt,data=tbl) # 회귀식 도출
abline(res)  # 회귀선 그리기



