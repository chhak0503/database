#날짜 : 2024/07/03
#이름 : 김철학
#내용 : 4장 SQL 고급


#실습 4-1
CREATE TABLE `Member` (
	`uid`	VARCHAR(10) PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`hp`	CHAR(13) UNIQUE NOT NULL,
	`pos`	VARCHAR(10) default '사원',
	`dep`	TINYINT,
	`rdate`	DATETIME  NOT NULL
);

CREATE TABLE `Department` (
	`depNo`	TINYINT PRIMARY KEY,
	`name`	VARCHAR(10) NOT NULL,
	`tel`	CHAR(12) NOT NULL
);

CREATE TABLE `Sales` (
	`no`	INT AUTO_INCREMENT PRIMARY KEY,
	`uid`	VARCHAR(10) NOT NULL,
	`year`	YEAR NOT NULL,
	`month`	TINYINT NOT NULL,
	`sale`	INT
);


#실습 4-2
INSERT INTO `Member` VALUES ('a101', '박혁거세', '010-1234-1001', '부장', 101, '2024-07-03 14:33:21');
INSERT INTO `Member` VALUES ('a102', '김유신',   '010-1234-1002', '차장', 101, NOW());
INSERT INTO `Member` VALUES ('a103', '김춘추',   '010-1234-1003', '사원', 101, NOW());
INSERT INTO `Member` VALUES ('a104', '장보고',   '010-1234-1004', '대리', 102, NOW());
INSERT INTO `Member` VALUES ('a105', '강감찬',   '010-1234-1005', '과장', 102, NOW());
INSERT INTO `Member` VALUES ('a106', '이성계',   '010-1234-1006', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a107', '정철',     '010-1234-1007', '차장', 103, NOW());
INSERT INTO `Member` VALUES ('a108', '이순신',   '010-1234-1008', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a109', '허균',     '010-1234-1009', '부장', 104, NOW());
INSERT INTO `Member` VALUES ('a110', '정약용',   '010-1234-1010', '사원', 105, NOW());
INSERT INTO `Member` VALUES ('a111', '박지원',   '010-1234-1011', '사원', 105, NOW());

INSERT INTO `Department` VALUES (101, '영업1부', '051-512-1001');
INSERT INTO `Department` VALUES (102, '영업2부', '051-512-1002');
INSERT INTO `Department` VALUES (103, '영업3부', '051-512-1003');
INSERT INTO `Department` VALUES (104, '영업4부', '051-512-1004');
INSERT INTO `Department` VALUES (105, '영업5부', '051-512-1005');
INSERT INTO `Department` VALUES (106, '영업지원부', '051-512-1006');
INSERT INTO `Department` VALUES (107, '인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);

#실습 4-3
select * from `Member` where `name`='김유신';
select * from `Member` where `name` <> '김춘추';
select * from `Member` where `pos` IN ('사원', '대리');
select * from `Member` where `name` LIKE '%신';
select * from `Member` where `name` LIKE '김__';
select * from `Member` where `name` LIKE '정__';

#실습 4-4
select * from `Sales`;
select * from `Sales` ORDER BY `sale`;
select * from `Sales` ORDER BY `sale` ASC;
select * from `Sales` ORDER BY `sale` DESC;

select * from `Sales` 
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5
select * from `Sales` LIMIT 3;
select * from `Sales` LIMIT 5, 3;

#실습 4-6
select SUM(`sale`) AS `합계` FROM `Sales`;
select COUNT(*) as `갯수` from `Sales`;
select CONCAT('Hello', 'World') as `결과`;
select CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';
SELECT NOW();
INSERT INTO `Member` 
	VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7
select SUM(`sale`) as `2018년 1월 매출 총합`
from `Sales` where `year`=2018 and `month`=1;

#실습 4-8
select 
	SUM(`sale`) as `총합`,
    AVG(`sale`) as `평균`
from `Sales` 
where 
	`year`= 2019 and 
    `month`=2 and
    `sale` >= 50000;

#실습 4-9
select 
	MIN(`sale`) as `최저매출`,
    MAX(`sale`) as `최고매출`
from `Sales` 
WHERE `year`=2020;

#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
select * from `Sales` group by `uid`;
select * from `Sales` group by `year`;
select * from `Sales` group by `uid`, `year`;
SELECT `uid`, COUNT(*) AS `건수` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(sale) AS `평균` FROM `Sales` GROUP BY `uid`;

SELECT `uid`, `year`, SUM(sale) AS `합계` 
FROM `Sales` 
GROUP BY `uid`, `year`;
 
SELECT `uid`, `year`, SUM(sale) AS `합계` 
FROM `Sales` 
GROUP BY `uid`, `year` ORDER BY `year` ASC, `합계` DESC;

select 
	`uid`,
    `year`,
    SUM(`sale`) as `합계`
from `Sales`
where `sale` >= 50000
group by `uid`, `year`
order by `합계` desc;

#실습 4-11
select `uid`, sum(`sale`) as `합계` from `Sales`
group by `uid`
having `합계` >= 200000;

select 
	`uid`,
    `year`,
    SUM(`sale`) as `합계`
from `Sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;

#실습 4-12
CREATE TABLE `Sales2` LIKE `Sales`;
INSERT INTO `Sales2` SELECT * FROM `Sales`;

# 조건 없이 update 실행
set sql_safe_updates=0;

UPDATE `Sales2` SET `year` = `year` + 3;

SELECT * FROM `Sales` UNION SELECT * FROM `Sales2`;

SELECT * FROM `Sales` WHERE `sale` >= 100000
UNION
SELECT * FROM `Sales2` WHERE `sale` >= 100000;

SELECT `uid`, `year`, `sale` FROM Sales
 UNION 
 SELECT `uid`, `year`, `sale` FROM Sales2;

SELECT `uid`, `year`, SUM(sale) AS `합계` 
 FROM `Sales` 
 GROUP BY `uid`, `year`
 UNION
 SELECT `uid`, `year`, SUM(sale) AS `합계` 
 FROM `Sales2` 
 GROUP BY `uid`, `year`
 ORDER BY `year` ASC, `합계` DESC;


#실습 4-13
SELECT * FROM `Sales` INNER JOIN `Member` ON `Sales`.uid = `Member`.uid;
SELECT * FROM `Member` INNER JOIN `Department` ON `Member`.dep = `Department`.depNo;
SELECT * FROM `Sales` AS a JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Member` AS a JOIN `Department` AS b ON a.dep = b.depNo;
SELECT * FROM `Sales` AS a, `Member` AS b WHERE a.uid = b.uid;
SELECT * FROM `Member` AS a, `Department` AS b WHERE a.dep = b.depNo;

SELECT a.`no`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
 JOIN `Member` AS b ON a.`uid` = b.`uid`;

SELECT a.`no`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
 JOIN `Member` AS b USING (uid);

SELECT a.`no`, a.`uid`, `sale`, `name`, `pos` FROM `Sales` AS a 
 JOIN `Member` AS b ON a.`uid` = b.`uid`
 WHERE `sale` >= 100000;
SELECT a.`no`, a.`uid`, b.`name`, b.`pos`, `year`, SUM(`sale`) AS `합계` FROM `Sales` AS a
JOIN `Member` AS b ON a.uid = b.uid
GROUP BY a.`uid`, a.`year` HAVING `합계` >= 100000
ORDER BY a.`year` ASC, `합계` DESC;

SELECT * FROM `Sales` AS a 
 JOIN `Member` AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`no`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
 JOIN `Member` AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo;

SELECT a.`no`, a.`uid`, a.`sale`, b.`name`, b.`pos`, c.`name` FROM `Sales` AS a 
 JOIN `Member` AS b ON a.uid = b.uid
 JOIN `Department` AS c ON b.dep = c.depNo
 WHERE `sale` > 100000
 ORDER BY `sale` DESC;

#실습 4-14
SELECT * FROM `Sales` AS a LEFT JOIN `Member` AS b ON a.uid = b.uid;
SELECT * FROM `Sales` AS a RIGHT JOIN `Member` AS b ON a.uid = b.uid;
SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
 LEFT JOIN Member AS b USING(uid);
SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
 RIGHT JOIN Member AS b USING(uid);

#실습 4-14
select * from `Sales` as a left join `Member` as b on a.uid = b.uid;
select * from `Sales` as a right join `Member` as b on a.uid = b.uid;
SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
 LEFT JOIN Member AS b USING(uid);
 
SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a 
 RIGHT JOIN Member AS b USING(uid);

#실습 4-15
select 
	`uid`,
    a.`name`,
    `pos`,
    b.`name`
from `Member` as a
join `Department` as b
on a.dep = b.depNo;

#실습 4-16
select 
	sum(`sale`) as `2019 매출합`
from `Sales` as a
join `Member` as b
on a.uid = b.uid
where `name`='김유신' and `year`=2019;

#실습 4-17
select 
	b.`name` AS `직원명`,
   c.`name` AS `부서명`,
   b.`pos`  AS `직급`,
   a.`year` AS `년도`,    
   SUM(`sale`) as `매출합`
from `Sales`      a
join `Member`     b on a.uid = b.uid
join `Department` c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `매출합` >= 100000
order by `매출합` DESC;

