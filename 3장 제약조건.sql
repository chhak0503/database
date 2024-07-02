#날짜 : 2024/07/02
#이름 : 김철학
#내용 : 3장 제약조건

#실습 3-1
CREATE TABLE `User2` (
	`uid`	VARCHAR(10) primary key,
    `name`	VARCHAR(10),
    `birth` CHAR(10),
    `addr`	VARCHAR(50)
);

#실습 3-2
INSERT INTO `User2` VALUES ('A101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO `User2` VALUES ('A102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO `User2` VALUES ('A103', '장보고', '1978-03-01', '전남 완도군');
INSERT INTO `User2` VALUES ('A105', '강감찬', '1979-08-16', '서울시 관악구');
INSERT INTO `User2` VALUES ('A106', '이순신', '1981-05-23', '부산시 진구');
INSERT INTO `User2` VALUES ('A101', '정약용', '1981-05-23', '부산시 진구');

#실습 3-3
CREATE TABLE `User3` (
	`uid` 	VARCHAR(10) PRIMARY KEY,
    `name` 	VARCHAR(10),
    `birth` CHAR(10),
    `hp` 	CHAR(13) UNIQUE,
    `addr`	VARCHAR(50)
);

#실습 3-4
INSERT INTO `User3` VALUES ('A101', '김유신', '1968-05-09', '010-1234-1111', '경남 김해시');
INSERT INTO `User3` VALUES ('A102', '김춘추', '1972-11-23', '010-1234-2222', '경남 경주시');
INSERT INTO `User3` VALUES ('A103', '장보고', '1978-03-01', '010-1234-3333', '전남 완도군');
INSERT INTO `User3` VALUES ('A104', '강감찬', '1979-08-16', '010-1234-4444', '서울시 관악구');
INSERT INTO `User3` VALUES ('A105', '이순신', '1981-05-23', '010-1234-5555', '부산시 진구');
INSERT INTO `User3` VALUES ('A106', '정약용', '1981-05-23', null, '부산시 진구');




#실습 3-5
#실습 3-6
#실습 3-7
#실습 3-8
#실습 3-9
#실습 3-10
