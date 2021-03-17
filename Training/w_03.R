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