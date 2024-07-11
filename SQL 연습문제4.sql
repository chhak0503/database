#날짜 : 2024/07/11
#이름 : 김철학
#내용 : SQL 연습문제4

#실습 4-1
CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Theater.* TO 'theater'@'%';
FLUSH PRIVILEGES;

# 4-2. 테이블 생성
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(30),
    genre VARCHAR(10),
    release_date DATE
);

CREATE TABLE customers (
    `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20),
    `email` VARCHAR(50),
    `phone` CHAR(13)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    num_tickets INT,
    booking_date DATETIME
);

# 4-3. 위에서 생성한 테이블에 다음 데이터를 삽입하세요
INSERT INTO Movies (title, genre, release_date) VALUES 
('쇼생크의 탈출', '드라마', '1994-10-14'),
('타이타닉', '로맨스', '1997-03-24'),
('탑건', '액션', '1987-07-16'),
('쥬라기공원', '액션', '1994-02-11'),
('글래디에이터', '액션', '2000-05-03'),
('시네마천국', '드라마', '1995-04-12'),
('미션임파서블', '액션', '1995-11-11'),
('노트북', '로맨스', '2003-08-23'),
('인터스텔라', 'SF', '2011-05-26'),
('아바타', 'SF', '2010-02-10');

INSERT INTO Customers (name, email, phone) VALUES 
('김유신', 'kys@example.com', '010-1234-1001'),
('김춘추', 'kcc@example.com', '010-1234-1002'),
('장보고', 'jbg@example.com', '010-1234-1003'),
('강감찬', 'kgc@example.com', '010-1234-1004'),
('이순신', 'lss@example.com', '010-1234-1005');

INSERT INTO Bookings (booking_id, customer_id, movie_id, num_tickets, booking_date) VALUES 
(101, 1,  1, 2, '2023-01-10'),
(102, 2,  2, 3, '2023-01-11'),
(103, 3,  2, 2, '2023-01-13'),
(104, 4,  3, 1, '2023-01-17'),
(105, 5,  5, 2, '2023-01-21'),
(106, 3,  8, 2, '2023-01-21'),
(107, 1, 10, 4, '2023-01-21'),
(108, 2,  9, 1, '2023-01-22'),
(109, 5,  7, 2, '2023-01-23'),
(110, 3,  4, 2, '2023-01-23'),
(111, 1,  6, 1, '2023-01-24'),
(112, 3,  5, 3, '2023-01-25');

#실습 4-4
SELECT title FROM movies;

# 4-5. '로맨스' 장르의 모든 영화 제목을 조회하시오.
SELECT *
FROM Movies
where genre='로맨스';

# 4-6. 개봉일이 2010년 이후인 모든 영화의 제목과 개봉일을 조회하시오.
SELECT title, release_date
FROM Movies
WHERE release_date > '2010-01-01';


# 4-7. 예매된 티켓 수가 3장 이상인 예약 ID와 예약일자를 조회하시오.
SELECT booking_id, booking_date
FROM Bookings
WHERE num_tickets >= 3;


# 4-8. 예약일자가 '2023-01-20' 이전 예약 ID와 고객 ID를 조회하시오.
SELECT *
FROM Bookings
WHERE booking_date < '2023-01-20';


# 4-9. 90년대 영화를 조회하시오.
SELECT *
FROM Movies
WHERE release_date BETWEEN '1990-01-01' AND '1999-12-31';

# 4-10. 가장 최근에 이루어진 예매 3건의 예약 ID와 예약일자를 조회하시오.
SELECT * FROM Bookings 
ORDER BY booking_date DESC
limit 3;

# 4-11. 개봉일이 가장 오래된 영화의 제목과 개봉일을 조회하시오.
SELECT 
	title, release_date 
FROM Movies 
ORDER BY release_date ASC
limit 1;

# 4-12. '액션' 장르의 영화 제목과 개봉일을 문자열 결합하여 조회하고, 제목에 '공원'이 포함된 영화만 선택하여 개봉일 기준 오름차순으로 정렬한 후, 상위 1개만 조회하시오.
SELECT CONCAT(title, ' - ', release_date) AS movie_info
FROM Movies
WHERE genre = '액션' AND title LIKE '%공원%'
ORDER BY release_date ASC
LIMIT 1;

# 4-13. 고객 ID가 2인 고객이 한 예매의 예약일자와 예매한 영화 제목을 함께 조회하시오.
SELECT 
	booking_date, 
	title
FROM Bookings
JOIN Movies 
USING (movie_id)
WHERE customer_id = 2;

# 4-14. 영화를 예매한 고객 이름, 휴대폰, 예매일자, 예매한 영화 제목을 조회하시오.
SELECT 
	C.name, 
	C.phone, 
	B.booking_date, 
	M.title
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;

# 4-15. 장르별로 평균 예매 티켓 수를 조회하시오.
SELECT M.genre, AVG(B.num_tickets) AS avg_tickets
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
GROUP BY M.genre;

# 4-16. 고객별 평균 예매 티켓 수를 조회하시오.
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SELECT C.name, AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_id;


# 4-17. 고객별 전체 예매 티켓 수가 가장 많은 고객순으로 조회하시오.
SELECT 
	C.name,
	SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY C.customer_id
ORDER BY `전체 예매 티켓 수` DESC;


# 4-18. 예매일자가 가장 오래된 애매번호, 영화번호, 고객이름, 예매일을 조회하시오.
SELECT 
	B.booking_id, 
    B.movie_id, 
    C.name, 
    B.booking_date
FROM Bookings B
JOIN Customers C ON B.customer_id = C.customer_id
ORDER BY B.booking_date ASC
LIMIT 1;

# 4-19. 각 영화의 장르별로 개봉일이 가장 최근인 영화의 제목을 조회하시오.
SELECT 
	genre, title, release_date
FROM Movies
WHERE (genre, release_date) IN (
    SELECT genre, MAX(release_date)
    FROM Movies
    GROUP BY genre
);

# 4-20. 김유신 고객이 예매한 모든 영화정보를 조회하시오.
SELECT
	*
FROM Movies 
WHERE movie_id IN (
    SELECT movie_id 
    FROM Bookings 
    WHERE customer_id = (SELECT customer_id FROM Customers where `name`='김유신')
);

# 4-21. 예매한 영화 중 가장 많은 티켓을 예매한 고객의 이름과 이메일 조회
SELECT name, email 
FROM Customers 
WHERE customer_id = (
    SELECT customer_id 
    FROM Bookings 
    GROUP BY customer_id 
    ORDER BY SUM(num_tickets) DESC 
    LIMIT 1
);

# 4-22. 예약된 티켓 수가 평균 예매 티켓 수보다 많은 예매정보를 조회하시오.
SELECT 
	*
FROM bookings
WHERE num_tickets > (SELECT AVG(`num_tickets`) FROM Bookings);

# 4-23. 각 영화별로 예매된 총 티켓 수를 조회하시오.
SELECT
	M.title, SUM(B.num_tickets) AS total_tickets
FROM Bookings B
JOIN Movies M ON B.movie_id = M.movie_id
GROUP BY M.title;

# 4-24. 각 고객별로 예매한 총 티켓 수와 평균 티켓 수를 조회하시오.
SELECT 
	c.name, 
	SUM(b.num_tickets) AS total_tickets, 
    AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.name;

# 4-25. 예매 티켓 수가 가장 많은 고객의 아이디와 이름, 이메일을 조회하시오.
SELECT 
	c.customer_id,
	c.name, 
	c.email, 
	SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings b
JOIN Customers c ON b.customer_id = c.customer_id
GROUP BY c.`name`
ORDER BY `예매 티켓수` DESC;

# 실습 4-26. 예매된 티켓 수가 가장 큰 순서로 고객명, 영화제목, 예매 티켓수, 예매일을 조회하시오.
SELECT
	c.name,
	m.title,
	b.num_tickets,
	b.booking_date	
FROM bookings b
JOIN customers c ON b.customer_id = c.customer_id
JOIN movies m ON b.movie_id = m.movie_id
ORDER BY num_tickets DESC;

# 실습 4-27. 장르가 '액션'이고 평균 예매 티켓 수가 가장 높은 순으로 영화의 제목을 조회하시오.
SELECT
	M.title,
	M.genre,
	SUM(B.num_tickets) AS `예매 티켓 수`,
	AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
GROUP BY M.title
ORDER BY `평균 티켓 수` DESC;

# 4-28. 회원별 예매 티켓 수가 큰 순서로 고객아이디, 고객명, 티켓합 조회하시오.
SELECT 
	B.customer_id,
	C.name,
	SUM(`num_tickets`) AS `ticket_total`
FROM bookings B
JOIN Customers C ON B.customer_id = C.customer_id
GROUP BY B.customer_id
ORDER BY ticket_total DESC;


# 실습 4-29. 각 영화별로 예약된 티켓 수가 가장 많은 예매 ID와 예약된 티켓 수를 조회하시오.
SELECT 
	B.booking_id,
	B.customer_id,
	B.movie_id,
	MaxTickets.max_tickets
FROM Bookings B
JOIN (
    SELECT movie_id, MAX(num_tickets) AS max_tickets
    FROM Bookings
    group by movie_id
) AS MaxTickets
ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

# 4-30. 각 장르별로 예매 티켓 수가 가장 많은 영화정보의 예매번호, 고객아이디, 고객명, 영화제목, 장르, 예매 티켓 수 조회하는 SQL을 작성하세요. 단 예매 티켓 수로 내림차순 정렬
SELECT
	B.booking_id,
	B.customer_id,
	C.name,
	M.title,
	M.genre,	
	SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customers C ON B.customer_id = C.customer_id
GROUP BY M.title
HAVING `예매 티켓 수` = (
    SELECT MAX(total_tickets)
    FROM (
        SELECT SUM(B2.num_tickets) AS total_tickets
        FROM Bookings B2
        JOIN Movies M2 ON B2.movie_id = M2.movie_id
        WHERE M2.genre = M.genre
        GROUP BY M2.title
    ) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;

