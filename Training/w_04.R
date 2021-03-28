mat01 <- matrix(1:20, nrow=4, ncol = 5) # (매트릭시초기화, 행, 열)
mat01

mat02 <- matrix(1:20, nrow=4, ncol = 5, byrow=T) #byrow = T : 데이터를 행 -> 열 순서로 채움
mat02

x <- 1:5
y <- seq(10, 50, 10)

mat <- cbind(x, y) #백터가 열방향(수직)으로 들어감
mat

mat <- rbind(x, y)  #백터가 행방향(수평평)으로 들어감
mat

z <- 0.1:0.5
mat <- rbind(x, y, z) #2개 이상 늘리는 것도 가능능
mat

mat <- cbind(mat02, x, y, z) #매트릭스와 백터 결합도 가능
mat

mat <- rbind(mat02, x, y, z) 
mat

mat[2,3] #2행 3열에 있는 값 호출
mat[1,4]
mat[2,] #2행 모두 출력
mat[,3] #3열 모두 출력

mat[6,] #행번호로는 접근 가능
mat[x,] #x가 1~5가 있기 때문에 행에서 1~5까지 출력 됨
mat['x', ] # 백터명으로 호출하려면 ''를 붙여주기  
mat[x,3] #1~5행의 3열을 출력한다.

mat[2, 1:3] #2행 1~3열 출력
mat[3, c(1,2, 4)] #3행 1,2,4열의 값을 출력 -> 열 범위 벗어나면 오류 남 
mat[, c(2,4,5)] #2, 4, 5열의 모든 값
mat[y, ]

rName <- c('cero', 'uno', 'dos', 'tres', 'cuatro', 'cinco', 'seis') #matrix 범위 벗어나면 오류 남 (많아도 안되고, 부족해도 않돼)
rownames(mat) <-rName
colnames(mat) <- c('JiQ', 'ChoiNew', 'Jacob', 'Kevin', 'Eric')
mat
mat['cuatro', ]
mat[, 'JiQ']
colnames(mat) #매트릭스 열이름만 가져오기 
rownames(mat) #행 이름만 가져오기
rownames(mat)[2] #행이름 중 2번째 값만 가져오기 

#매트리스  : 같은 자료형의 데이터 테이블 형태
#데이터프레임 : 다른 자료형이 가능한 데이터 테이블 형태

num <- c(82, 30, 67, 24, 11, 16, 98, 2, 9, 19, 22)
text <- c('OchentaYDos', 'Treinta', 'SesentaYSiete', 'Veinticuatro', 'Once', 'Dieciséis', 'NoventaYOcho', 'Dos', 'Nueve', 'Diecinueve', 'Veintidós')
number.info <- data.frame(num, text, c(0.82, 0.30, 0.67, 0.24, 0.11, 0.16, 0.98, 0.02, 0.09, 0.19, 0.22))
#백터를 바로 넣어줄 수 있지만, 그러면 데이트 프레임 열이름이 백터 값으로 나옴 -> 지저분해해
colnames(number.info)[3] <- 'decimalPoint' #결국 따로 이름을 세팅해줌줌
number.info
number.info[1:3, ]
number.info[,'text']
number.info[5,'text']

iris #r에서 제공하는 실습용 데이터
iris[, c("Sepal.Length", "Species")]

dim(iris) #행과 열의 개수 출력
nrow(iris) #행의 개수 출력
ncol(iris) #열의 개수 출력
nrow(number.info)
colnames(iris) #duf dlfma cnffur
head(iris) #데이터셋의 앞부분 일부 출력 
tail(iris) #데이터셋의 뒷부분 일부 출력 
head(number.info)

str(iris) #데이터셋 요약 정보
str(number.info)

unique(iris[1:5, ])
unique(iris[,5])
table(iris[, "Species"]) #Species열의 종류별 행의 개수 - 중복행 개수 세기

colSums(iris[, -5]) #열별 합계
colSums(number.info[, -2]) #열별합계 (열 숫자 지정할 때 숫자형 열의 개수 * -1로 지정해야함함)
colMeans(iris[, -5]) #열별 평균
colMeans(number.info[, -2])

rowSums(iris[, -5]) #행별 합계
rowSums(number.info[, -2])
rowMeans(iris[, -5]) #행별 평균균
rowMeans(number.info[, -2])

mat03 <- matrix(1:20, nrow=4, ncol = 5)
mat03
mat03 <- matrix(1:20, nrow=4, ncol = 5, byrow=T) #byrow = T : 데이터 출력 순서 변경경
mat03
t(matrix(1:20, nrow=4, ncol = 5)) #행과 열 자체를 전환 

#조건에 맞춰 행,열 추출
numInfo <- subset(number.info, num > 50)
numInfo

#mat04 <- matrix(seq(5,100, 5), nrow=5, ncol = 4)
mat04 <- matrix(seq(5,100, 5), nrow=4, ncol = 5)
mat04

mat04-2.5 #전체적으로 모든 값에 -2.5하기기

#매트릭스끼리 계산할 때는 행, 열 크기가 동일해야 작업이 가능함함
mat04 + mat03 
mat04 - mat03
mat04 / mat03
mat04 * mat03

2*mat04 + mat03*3

class(iris) #데이터셋의 자료구조 확인 : data.frame
class(number.info) #data.frame
class #"matrix" "array" 

is.matrix(mat04) #자료구조가 매트릭스인지 확인 
is.matrix(number.info) 
is.data.frame(mat04) #자료구조가 매트릭스인지 확인 
is.data.frame(number.info) 

mat04 <- data.frame(mat04) #매트릭스를 데이터프레임으로 변환
class(mat04)
head(mat04)


mat$ChoiNew #매트릭스에서는 사용이 불가능 - 오류남
number.info$text #데이터프레임만 가능함함