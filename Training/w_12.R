#install.packages("treemap") #패키지 설치 

library(treemap) # treemap 패키지 불러오기
data(GNI2014) # 데이터 불러오기 (GNI2014 : 년도의 전 세계 국가별 인구 , 국민총소득 (GNI), 소속 대륙의 정보를 담고 있음)
head(GNI2014) # 데이터 내용보기 

#트리맵 : 사각타일 형태로 구성 / 각 타일의 크기와 색깔로 데이터 크기 나타냄. / 계층 구조도 표현 가능 
treemap(GNI2014,
        index=c("continent","iso3"), # 계층구조 설정(대륙-국가)
        vSize="population",          # 타일의 크기 (인구수)
        vColor="GNI",                # 타일의 컬러 (소득)
        type="value",                # 타일 컬러링 방법 (방법 : index. comp, dens, value)
        bg.labels="yellow",          # 레이블의 배경색
        title="World's GNI")         # 트리맵 제목  

library(treemap) # treemap 패키지 불러오기
st <- data.frame(state.x77)       # 매트릭스를 데이터프레임으로 변환
st <- data.frame(st, stname=rownames(st)) # 주 이름 열 stname을 추가 

treemap(st,
        index=c("stname"),       # 타일에 주 이름 표기
        vSize="Area",            # 타일의 크기
        vColor="Income",         # 타일의 컬러
        type="value",            # 타일 컬러링 방법
        title="USA states area and income" ) # 트리맵의 제목

#버블차트 : 산점도 위에 버블의 크기로 정보를 표시
#           산점도는 2개 변수에 의한 위치 정보 표현 / 버블차트는 3개의 변수 정보를 하나의 그래프에 표시 
st <- data.frame(state.x77)       # 매트릭스를 데이터프레임으로 변환
symbols(st$Illiteracy, st$Murder, # 원의 x, y 좌표의 열
        circles=st$Population,    # 원의 반지름의 열 (인구 수)
        inches=0.3,               # 원의 크기 조절값 - 값이 클수록 원이 크게 그려짐
        fg="white",               # 원의 테두리 색 
        bg="lightgray",           # 원의 바탕색
        lwd=1.5,                  # 원의 테두리선 두께
        xlab="rate of Illiteracy", #x축 레이블 지정
        ylab="crime(murder) rate", #y축 레이블 지정
        main="Illiteracy and Crime") #그래프 제목 지정 
#버블 차트위에 텍스트 표기        
text(st$Illiteracy, st$Murder,    # 텍스트가 출력될 x, y 좌표
     rownames(st),                # 출력할 텍스트
     cex=0.6,                     # 폰트 크기
     col="brown")                 # 폰트 컬러


head(mtcars) 

#모자이크 플롯 : 다중변수 범주형 데이터에 대해 각 변수의 그룹별 비율을 면적으로 표시
mosaicplot(~gear+vs, data = mtcars, color=TRUE, main ="Gear and Vs")


#install.packages("ggplot2") #패키지 설치 
#보다 미적인 그래프 작성을 하려면 주로 ggplot2 패키지를 이용한다.
#복잡하고 화려한 그래프 작성이 가능하지만 배우기 어렵다.ㅠ
library(ggplot2) 

month <- c(1,2,3,4,5,6)
rain  <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)           # 그래프를 작성할 대상 데이터
df

#보통 여러개의 함수들이 +로 연결되어 하나의 그래프를 완성한다. 
#막대 그래프 
ggplot(df, aes(x=month,y=rain)) +      # 그래프를 그릴 데이터 지정 (x축, y축 지정)
  geom_bar(stat="identity",            # 막대의 높이는 y축에 해당하는 열의 값  
           width=0.7,                  # 막대의 폭 지정
           fill="steelblue")           # 막대의 색 지정

#막대 그래프 꾸미기
ggplot(df, aes(x=month,y=rain)) +      # 그래프를 그릴 데이터 지정
  geom_bar(stat="identity",            # 막대 높이는 y축에 해당하는 열의 값  
           width=0.7,                  # 막대의 폭 지정
           fill="steelblue") +         # 막대의 색 지정
  ggtitle("월별 강수량") +             # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) + #그래프에 대한 제목 폰트 크기, 색을 지정
  labs(x="월",y="강수량") +            # 그래프의 x, y축 레이블 지정
  coord_flip()                         # 그래프를 가로 방향으로 출력


#히스토그램 작성
library(ggplot2)
ggplot(iris, aes(x=Petal.Length)) +     # 그래프를 그릴 데이터 지정
  geom_histogram(binwidth=0.5)          # 히스토그램 작성 (binwidth : 데이터 구간 - 구간을 0.5간격으로 나눠 히스토그램 작성)

#그룹별 히스토그램 작성 
library(ggplot2)
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species)) +
  geom_histogram(binwidth = 0.5, position="dodge") +  #(position : 동일 구간의 막대를 어떻게 그릴지 결정 / dodge : 막대들을 겹치지 않고 병렬로 그리도록 지정)
  theme(legend.position="top")

#산점도 작성
library(ggplot2)
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width)) + 
  geom_point()

#그룹이 구분되는 산점도 작성
library(ggplot2)
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width,
                      color=Species)) + 
  geom_point(size=3) +
  ggtitle("꽃잎의 길이와 폭") +              # 그래프의 제목 지정
  theme(plot.title = element_text(size=25, face="bold", colour="steelblue")) 


#상자그림 작성
library(ggplot2)
ggplot(data=iris, aes(y=Petal.Length)) + geom_boxplot(fill="yellow") 

#그룹별 상자그림 작성
library(ggplot2)
ggplot(data=iris, aes(y=Petal.Length, fill=Species)) + geom_boxplot() 

#선 그래프 작성
library(ggplot2)
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt) # 데이터 준비
head(df)
ggplot(data=df, aes(x=year,y=cnt)) + geom_line(col="red") # 선그래프 작성


#차원 축소 (데이터의 차원을 축소하면 원래 가지고 있던 정보 손실이 일어남.)
library(Rtsne)
library(ggplot2)

ds <- iris[,-5] # 품종 정보 제외

## 중복 데이터 제거 -> t-sne를 이용하려면 중복된 데이터가 있으면 안됨!
dup = which(duplicated(ds)) #중복된 행번호 추출 
dup 
ds <- ds[-dup,]
ds.y <- iris$Species[-dup] # 중복을 제외한 품종 정보

## t-SNE 실행
tsne <- Rtsne(ds, dims=2, perplexity=10) 
#dims : 몇차원으로 축소할지 지정 (일반적으로는 2, 3으로 축소함)
#perplexity : 축소 과정에서 데이트 샘플링할는데, 이 때 샘플의 개수를 몇 개로 할지 지정 (보통 데이터 행의 수 / 3 보다 작게 지정)

## 축소결과 시각화
df.tsne <- data.frame(tsne$Y)
head(df.tsne)
ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y)) + 
  geom_point(size=2) 


#4차원 데이터를 3차원 산점도로 작성
install.packages(c("rgl", "car"))
library("car")
library("rgl")

tsne <- Rtsne(ds,dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

# 회귀면이 포함된 3차원 산점도
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3)

# 회귀면이 없는 3차원 산점도
points <- as.integer(ds.y)
color <- c('red','green','blue')
scatter3d(x=df.tsne$X1, y=df.tsne$X2, z=df.tsne$X3,
          point.col = color[points],   # 점의 색을 품종별로 다르게 
          surface=FALSE)               # 회귀면을 표시하지 않음 



#installed.packages() #설치된 패키지 정보 확인 

#패키지 삭제