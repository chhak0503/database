#날짜 : 2024/07/12
#이름 : 김철학
#내용 : SQL 연습문제5

#실습 5-1
CREATE DATABASE `BookStore`;
CREATE USER 'bookstore'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `BookStore`.* TO 'bookstore'@'%';
FLUSH PRIVILEGES;

#실습5-2
CREATE TABLE `Customer`(
	`custId`		INT AUTO_INCREMENT PRIMARY KEY,
	`name` 		VARCHAR(10) NOT NULL,
	`address` 	VARCHAR(20),
	`phone` 		CHAR(13)
);

CREATE TABLE `Book` (
	`bookId`    INT NOT NULL PRIMARY KEY,
	`bookName`  VARCHAR(20) NOT NULL,
	`publisher` VARCHAR(20) NOT NULL,
	`price`     INT
);

CREATE TABLE `Order`(
	`orderId` 	INT PRIMARY KEY AUTO_INCREMENT,
	`custId`		INT NOT NULL,
	`bookId` 	INT NOT NULL,
	`salePrice` INT NOT NULL,
	`orderDate` DATE NOT NULL
);

#실습5-3
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('박지성', '영국 맨체스타',   '000-5000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('김연아', '대한민국 서울',   '000-6000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO `Customer`(`name`,`address`,`phone`) VALUES ('추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO `Customer`(`name`,`address`) VALUES ('박세리', '대한민국 대전');

INSERT INTO `Book` VALUES (1, '축구의 역사',        '굿스포츠',   7000);
INSERT INTO `Book` VALUES (2, '축구아는 여자',      '나무수',     13000);
INSERT INTO `Book` VALUES (3, '축구의 이해',        '대한미디어', 22000);
INSERT INTO `Book` VALUES (4, '골프 바이블',        '대한미디어', 35000);
INSERT INTO `Book` VALUES (5, '피겨 교본',          '굿스포츠',   8000);
INSERT INTO `Book` VALUES (6, '역도 단계별기술',    '굿스포츠',   6000);
INSERT INTO `Book` VALUES (7, '야구의 추억',        '이상미디어', 20000);
INSERT INTO `Book` VALUES (8, '야구를 부탁해',      '이상미디어', 13000);
INSERT INTO `Book` VALUES (9, '올림픽 이야기',      '삼성당',     7500);
INSERT INTO `Book` VALUES (10, 'Olympic Champions', 'Pearson',    13000);

INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 1,6000,'2014-07-01');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 3,21000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2, 5,8000,'2014-07-03');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 6,6000,'2014-07-04');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 7,20000,'2014-07-05');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (1, 2,12000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (4, 8,13000,'2014-07-07');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `Order`(`custId`,`bookId`,`salePrice`,`orderDate`) VALUES (3, 8,13000,'2014-07-10');

#실습 5-4
SELECT `custId`, `name`, `address` FROM `Customer`;

#실습 5-5
SELECT `bookName`, `price` FROM `Book`;

#실습 5-6
SELECT `price`, `bookName` FROM `Book`;

#실습 5-7
SELECT * FROM `Book`;

#실습 5-8
SELECT `publisher` FROM `Book`;

#실습 5-9
SELECT DISTINCT `publisher` FROM `Book`;
SELECT `publisher` FROM `Book` GROUP BY `publisher`;

#실습 5-10
SELECT * FROM `Book` WHERE `price` >= 20000;

#실습 5-11
SELECT * FROM `Book` WHERE `price` < 20000;

#실습 5-12
SELECT * FROM `Book` WHERE `price` >= 10000 AND `price` <= 20000;

#실습 5-13
SELECT `bookId`, `bookName`,`price` 
FROM `Book` 
WHERE `price` >= 15000 AND `price` <= 30000;

#실습 5-14
SELECT * FROM `Book` WHERE `bookId`=2 OR `bookId`=3 OR `bookId`=5;
SELECT * FROM `Book` WHERE `bookId` IN(2, 3, 5);

#실습 5-15
SELECT * FROM `Book` WHERE `bookId` % 2 = 0;
SELECT * FROM `book` WHERE MOD(bookId, 2) =0;

#실습 5-16
SELECT * FROM `Customer` WHERE `name` LIKE '박%';

#실습 5-17
SELECT * FROM `Customer` WHERE `address` LIKE '%대한민국%';

#실습 5-18
SELECT * FROM `Customer` WHERE `phone` IS NOT NULL;

#실습 5-19
SELECT * FROM `Book` WHERE `publisher`='굿스포츠' OR `publisher`='대한미디어';
SELECT * FROM `Book` WHERE `publisher` IN('굿스포츠', '대한미디어');

#실습 5-20
SELECT `publisher` FROM `Book` WHERE `bookName`='축구의 역사';

#실습 5-21
SELECT `publisher` FROM `Book` WHERE `bookName` LIKE '%축구%';

#실습 5-22
SELECT * FROM `Book` WHERE `bookName` LIKE '_구%';

#실습 5-23
SELECT * FROM `Book` WHERE `bookName` LIKE '%축구%' AND `price` >= 20000;

#실습 5-24
SELECT 
    *
FROM
    `Book`
ORDER BY `bookName`;

#실습 5-25
SELECT * FROM `Book` order BY `price`, `bookName`;

#실습 5-26
SELECT * FROM `Book` order BY `price` DESC, `bookName` ASC;

#실습 5-27
SELECT * FROM `Book` order BY `price` DESC LIMIT 3;

#실습 5-28
SELECT * FROM `Book` order BY `price` ASC LIMIT 3;

#실습 5-29
SELECT SUM(`salePrice`) AS `총판매액` FROM `Order`;

#실습 5-30
SELECT 
	SUM(`salePrice`) AS `총판매액`,
	AVG(`salePrice`) AS `평균값`,
	MIN(`salePrice`) AS `최저가`,
	MAX(`salePrice`) AS `최고가`
FROM `Order`;


#실습 5-31
SELECT COUNT(*) AS `판매건수` FROM `Order`;

#실습 5-32
SELECT 
	`bookId`,
	REPLACE(`bookName`, '야구', '농구') AS `bookName`,
	`publisher`,
	`price`
FROM `Book`;

#실습 5-33
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select 
	`custId`,
    count(*) as `수량`
from `order` 
where `salePrice` >= 8000
group by `custId`
having `수량` >= 2;
	
#실습 5-34
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId;

SELECT * FROM `Customer` JOIN `Order` USING(`custId`);

SELECT * FROM `Customer` a, `Order` b 
	WHERE a.custId = b.custId;


#실습 5-35
SELECT * FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
order BY a.`custId`;

#실습 5-36
SELECT
	`name`,
	`salePrice`
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId;

#실습 5-37
SELECT
	`name`,
	SUM(`salePrice`)
FROM `Customer` AS a 
JOIN `Order` AS b  ON a.custId = b.custId
group by `name`
order by `name`;


#실습 5-38
SELECT 
	`name`,
	`bookName`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId;

#실습 5-39
SELECT 
	`name`,
	`bookName`
FROM `Customer` AS a 
JOIN `Order` AS b ON a.custId = b.custId
JOIN `Book` AS c ON b.bookId = c.bookId
where `salePrice`=20000;

#실습 5-40
SELECT 
	`name`,
    `salePrice`
FROM `Customer` AS a 
left JOIN `Order` AS b ON a.custId = b.custId;

#실습 5-41
SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Customer` AS a
JOIN `Order` AS b ON a.custId = b.custId
WHERE `name`='김연아';

SELECT 
	SUM(`salePrice`) AS `총매출`
FROM `Order`
WHERE `custId`=(SELECT `custId` FROM `Customer` WHERE `name`='김연아');


#실습 5-42
SELECT `bookName` FROM `Book` ORDER BY `price` DESC LIMIT 1;
SELECT `bookName` FROM `Book` WHERE `price`=(SELECT MAX(`price`) FROM `Book`);

#실습 5-43
SELECT `name` FROM `Customer` AS a 
LEFT JOIN `Order` AS b ON a.custId = b.custId
WHERE `orderId` IS NULL;

#실습 5-44
INSERT INTO `Book` SET
					`bookId` = 11,
					`bookName` = '스포츠의학',
					`publisher` = '한솔의학서적';

#실습 5-45
UPDATE `Customer` SET `address`='대한민국 부산' WHERE `custId`=5;

#실습 5-46
DELETE FROM `Customer` WHERE `custId`=5;








