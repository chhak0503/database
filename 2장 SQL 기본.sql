#날짜 : 2024/07/01
#이름 : 김철학
#내용 : 2장 SQL 기본

#실습 2-1. 테이블 생성, 제거
use StudyDB;

CREATE TABLE `User1` (
	`uid`	VARCHAR(10),
    `name`	VARCHAR(10),
    `hp`	CHAR(13),
    `age`	INT
);

DROP TABLE `User1`;

#실습 2-2. 데이터 입력
INSERT INTO `User1` VALUES ('A101', '김유신', '010-1234-1111', 25);
INSERT INTO `User1` VALUES ('A102', '김춘추', '010-1234-1111', 23);
INSERT INTO `User1` VALUES ('A103', '장보고', '010-1234-1111', 32);
INSERT INTO `User1` (`uid`, `name`, `age`) VALUES ('A104', '강감찬', 45);
INSERT INTO `User1` SET
						`uid`='A105',
                        `name`='이순신',
                        `hp`='010-1234-5555';

#실습 2-3
#실습 2-4
#실습 2-5
#실습 2-6
#실습 2-7
#실습 2-8
#실습 2-9




