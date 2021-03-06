# 난수 발생

x <- runif(1)  #난수 한개만 발생  
#x <- runif(10)  #난수 10개만 발생

# x가 0보다 크면 절대값 (abs())을 화면 출력
if(x>0){
  print(abs(x))
}

if(x>0) print(abs(x))


#x가 0.5보다 작으면 1-x를 출력하고 그렇지 않으면 x를 출력
if(x<0.5){
  print(1-x)
} else {
  print(x)  
}

#또는
if(x<0.5) print(1-x) else print(x)



#다중 조건문
avg <- scan()

if(avg >= 90){
  print("당신의 학점은 A입니다")
}else if(avg >= 80){
  print("당신의 학점은 B입니다")
}else if(avg >= 70){
  print("당신의 학점은 C입니다")
}else if(avg >= 60){
  print("당신의 학점은 D입니다")
}else {
  print("당신의 학점은 F입니다")
}

#switch(), which(), any(), all()

#[switch()]

a <- "중1"
switch(a, "중1" = print("14살"), "중2" = print("15살"))  
# 만약 a가 중1이면 = 실행, 중2면 =실행

switch(a, "중1"="14살", "중2"="15살", "중3"="15살")
#위랑 같음 

b <- 3
switch(b, "14살", "15살", "16살")



#avg <- 78/10   # 소수점까지 다 나옴
avg <- 78 %/% 10  # 몫만 저장
#avg <- 78 %% 10  # 나머지만 저장
result = switch(as.character(avg), "10"="A", "9"="B", "8"="C", "7"="D", "F")
#문자열로 바꿔줘야한다. 상당히 귀찮;
cat("당신의 학점은", result, "입니다.")


#[witch]
#특정값의 위치를 찾을 때
x <- c(2:20)
x

which(x==3)  #3인것의 위치를 알려주라
x[which(x==3)]  # 3위치의 인덱스는 x에서 어떤값인가.  물론 같겠지


##매트릭스에서 
m <- matrix(1:12, 3, 4)

m
which(m%%3)
which(m%%3 == 0, arr.ind=F)  
# arr.ind: 인덱스로 사용할것인가? F로 주면 위치를 안알려줌 T를 주면 위치를 알려줌
which(m%%3 == 0, arr.ind=T)  


#응용
data(trees)
head(trees)

#HEIGHT 컬럼이 70미만인 행의 위치
which(trees$Height < 70)


#HEIGHT 컬럼이 70미만인 행 출력
trees[which(trees$Height < 70),]

which.max(trees$Height)
which.min(trees$Height)



#x중에서 8이상이 있는가?
x <- runif(5)
x
any(x>=0.8)

#x의 값이 모두 0.9이하인가?
all(x<=0.9)



########################################################
###[반복문]
#for     
#while   
#repeat  

#[for]

sum <- 0
for(i in seq(1, 10, by=1)) {
  sum <- sum +i
}
sum


print("단입력 : ")
dan <- scan()
i = 1
for(i in seq(1, 9, 1)){
  cat( dan,"*",i,"=", (dan*i), "\n")
}


#중첩 반복문(구구단 출력)
for(i in seq(2,9)){
  cat("\n===========", i," 단=================\n")
  for(j in seq(1,9)) {
    cat(i, "*", j, "=", i*j, "\n")
  }
}


#[while]
sum <- 0
cnt <- 1
while(cnt <= 10){
  sum <- sum + cnt
  cnt <- cnt +1
}
sum


#[repeat]
# 최소 한번 이상의 반복을 보장 받을 수 있다.
sum <- 0
cnt <- 1
repeat{
  sum <- sum+cnt
  cnt <- cnt+1
  
  if(cnt>10){
    break
  }
}
sum



######################################################
#[함수]

# 인자없는 함수
# test1이라는 이름으로 함수를 만들 때
test1 <- function(){
  x <- 10
  y <- 10
  return(x*y)
}


#호출
test1()


# 인자있는 함수
test2 <- function(x, y){
  xx <- x
  yy <- y
  return(sum(xx,yy))
}

test2(10,20)


#가변인수
#...은 인수가 한개든 세개든 여러개든 상관없다는것
# 단 반복문으로 처리해야한다.
test3 <- function(...){
  args <- list(...) 
  for(i in args){
    print(i)
  }
}

test3(3,4)
test3(3,4,5,6)
test3('3', '홍길동', 7)



#test4
test4 <- function(a, b, ...){
  print(a)
  print(b)
  print("--------------------")
  test3(...)
}

test4(10, 20, 30, 40)


#중첩함수

test5 <- function(x, y){
  print(x)
  test6 <- function(){
    print(y)
  }
  
  test6()
}

test5(10, 20)


#########################################################
# 기술 통계랑 처리 관련 내장함수
#-------------------------------------

#min()
#max()
#range() : 벡터를 대상으로 범위값을 구하는 함수(최대값, 최소값)
#mean()
#median()
#sum()
#sort()  : 벡터 데이터 정렬(원본의 값이 바뀌는게 아님)
#order() : 정렬된 값의 인덱스를 보여주는 함수
#rank()
#sd()
#summary()
#table()

test <- read.csv("data/test.csv", header=T)
head(test)

# 한번의 함수 호출로 다수의 컬럼에 대한 통계량을 계산하는 기능
# 각 컬럼단위로 빈도와 최대값/최소값 계산 함수 정의


data_proc <- function(df){
  #컬럼의 갯수만큼 반복을 돌린다. 
  for(idx in 1:length(df)){
    cat(idx, "번째 컬럼의 빈도 분석결과")
    print(table(df[idx]))
    cat("\n")
  }
  
  for(idx in 1:length(df)){
    f <- table(df[idx])
    cat(idx, "번째 컬럼의 최대값/최소값 결과")
    cat("max=", max(f), ", min = ", min(f), "\n")
  }
}


data_proc(test)



# 결측치 처리
data <- c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA)


#처리방법
#1. 결측치 지운다
#2. 0으로 바꾼다.
#3. 결측치를 평균값으로 바꿔서 넣는다. 

my_na<- function(vec){
  #제 1차 : 결측치를 제거하고 평균계산
  print("결측치 0으로 변경할때 평균은?")
  print(mean(vec))  #결측치 포함하고 계산하면 그냥 NA값이 나옴
  print(mean(vec, na.rm=T))  #결측치 제외하는 옵션
  
  #제 2차 : 결측치를 0으로 대체하고 평균 계산
  data <- ifelse(!is.na(vec), vec, 0)
  #vec이 NA가 아니면 vec그대로, 아니면 0으로
  print("0으로 대체한 평균은?")
  print(mean(data))

  #제 3차 : 결측치를 평균으로 대체하고 평균 계산
  print("결측치를 평균으로 바꿨을때 평균은?")
  data <- ifelse(!is.na(vec), vec, mean(vec, na.rm=T))
  print(mean(data))
  
}

my_na(data)
