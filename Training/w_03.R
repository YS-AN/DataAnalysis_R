score <- c(90, 80, 70) #백터터
score

names(score) #NULL
names(score) <- c("John", "Tom", "Jane") #각각의 값에 이름을 
names(score) #부여된 이름만 출력된
score #이름 + 백터 값값
#names(score) <- c("John", "Tom", "Jane", "Eric") #백터보다 많은 이름을 부여하면 오류

score[1] #백터는 1-base (1부터 시작함)
score[2]
score[3]
score[4] #NA = missing value

d <- c(10, 20, 30, 40, 50, 60, 70, 80, 90)
d[c(1,3,5)]
d[1:3]
d[seq(1,7,3)]
d[-2] #2번째 값 제외하고 출력
d[c(-2, -7, -5)]
d[-c(4:6)] #4~6번째 값을 제외하고 출력 

#리스트
idol <- list("TheBoys", c("Q", "New", "Sun", "Moon"), c(981105, 980426, 000412, 980223), "TRUE")
names(idol) <- c("Name", "Member", "Brith", "Check") #이름부여
idol$Name #이름으로 접근
idol[1]
idol$Member
idol$Brith
idol[3]
idol[4]


#팩터
theboys <- c("Q", "New", "Sun", "Moon", "Q", "q") #문자열 백터 정의
theboys.new <- factor(theboys) #팩터 정의

theboys.new #팩터 내용 출력  - 정렬됨
theboys[3]
levels(theboys.new) #팩터에 저장 된 값 모두 출력
as.integer(theboys.new) #팩터의 문자값을 숫자로 바꿈 (레벨 숫자로 바뀜)
theboys.new[7] <- "New" #팩터의 신규 값 추가
theboys.new[8] <- "P" #팩터의 신규 값 추가 
#오류 : 기존 팩터 값과 다른 값이 들어오면 오류 남 
#팩터는 범주형 데이터를 표현하기 위한 데이터 타입이기 때문
#[8]에는 NA가 들어감
theboys.new