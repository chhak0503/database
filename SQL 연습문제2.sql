#날짜 : 2024/07/09
#이름 : 김철학
#내용 : SQL 연습문제2

#실습 2-1
create database `Bank`;
create user 'bank'@'%' identified by '1234';
grant all privileges on `Bank`.* to 'bank'@'%';
flush privileges;

#실습2-2
CREATE TABLE `bank_customer` (
	`c_no`		CHAR(14) PRIMARY KEY,
	`c_name`		VARCHAR(20) NOT NULL,
	`c_dist`		TINYINT NOT NULL DEFAULT 0,
	`c_phone`	VARCHAR(20) UNIQUE NOT NULL,
	`c_addr`		VARCHAR(100)
);

CREATE TABLE `bank_account` (
	`a_no`			CHAR(11) PRIMARY KEY,
	`a_item_dist`	CHAR(2) NOT NULL,
	`a_item_name`	VARCHAR(20) NOT NULL,
	`a_c_no`			CHAR(14) NOT NULL,
	`a_balance`		INT NOT NULL DEFAULT 0,
	`a_open_date`	DATE NOT NULL
);

CREATE TABLE `bank_transaction` (
	`t_no`		 INT AUTO_INCREMENT PRIMARY KEY,
	`t_a_no`		 CHAR(11) NOT NULL,
	`t_dist`		 TINYINT NOT NULL,
	`t_amount`	 INT NOT NULL DEFAULT 0,
	`t_datetime` DATETIME NOT NULL
);

#실습2-3
INSERT INTO `bank_customer` VALUES ('730423-1000001', '김유신',     1, '010-1234-1001', '경기도 수원시');
INSERT INTO `bank_customer` VALUES ('750210-1000002', '김춘추',     1, '010-1234-1002', '경기도 광주시');
INSERT INTO `bank_customer` VALUES ('830513-2000003', '선덕여왕',   1, '010-1234-1003', '서울시 마포구');
INSERT INTO `bank_customer` VALUES ('870830-1000004', '강감찬',     1, '010-1234-1004', '서울시 영등포구');
INSERT INTO `bank_customer` VALUES ('910912-2000005', '신사임당',   1, '010-1234-1005', '강원도 강릉시');
INSERT INTO `bank_customer` VALUES ('941127-1000006', '이순신',     1, '010-1234-1006', '부산시 영도구');
INSERT INTO `bank_customer` VALUES ('220-82-52237', '(주)한국전산', 2, '02-134-1045',   '서울시 강서구');
INSERT INTO `bank_customer` VALUES ('361-22-42687', '(주)정보산업', 2, '031-563-1253',  '경기도 광명시');
INSERT INTO `bank_customer` VALUES ('102-22-51094', '부산의원',     2, '051-518-1010',  '부산시 남구');

INSERT INTO `bank_account` VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001',  420000, '2005-07-21');
INSERT INTO `bank_account` VALUES ('101-12-1002', 'S2', '정기적립예금', '830513-2000003', 1020000, '2011-05-13');
INSERT INTO `bank_account` VALUES ('101-11-1003', 'S1', '자유저축예금', '870830-1000004',  53000, '2007-02-17');
INSERT INTO `bank_account` VALUES ('101-21-1004', 'L1', '고객신용대출', '910912-2000005', 1200500, '2009-08-25');
INSERT INTO `bank_account` VALUES ('101-13-1005', 'S3', '주택청약예금', '941127-1000006', 720800, '2012-10-15');
INSERT INTO `bank_account` VALUES ('101-22-1006', 'L2', '예금담보대출', '730423-1000001', 25000, '2013-12-11');
INSERT INTO `bank_account` VALUES ('101-23-1007', 'L3', '주택담보대출', '750210-1000002', 2700000, '2020-09-23');
INSERT INTO `bank_account` VALUES ('101-11-2001', 'S1', '자유저축예금', '220-82-52237', 23000000, '2003-04-14');
INSERT INTO `bank_account` VALUES ('101-11-2002', 'S1', '자유저축예금', '361-22-42687',  4201000, '2008-12-30');
INSERT INTO `bank_account` VALUES ('101-11-2003', 'S1', '자유저축예금', '102-22-51094', 8325010, '2010-06-07');

INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 50000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 2, 120000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2001', 2, 300000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-12-1002', 1, 1000000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 3, 0, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-13-1005', 1, 200000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1001', 1, 450000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2002', 2, 32000, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-2003', 3, 0, NOW());
INSERT INTO `bank_transaction` (`t_a_no`, `t_dist`, `t_amount`, `t_datetime`) VALUES ('101-11-1003', 1, 75000, NOW());

#실습 2-4
#실습 2-5
#실습 2-6
#실습 2-7
#실습 2-8
#실습 2-9
#실습 2-10
#실습 2-11
#실습 2-12
#실습 2-13
#실습 2-14
#실습 2-15
#실습 2-16
#실습 2-17
#실습 2-18
#실습 2-19
#실습 2-20
#실습 2-21
#실습 2-22
#실습 2-23
#실습 2-24
#실습 2-25
#실습 2-26
#실습 2-27
#실습 2-28
#실습 2-29
#실습 2-30