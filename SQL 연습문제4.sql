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
#실습 4-5
#실습 4-6
#실습 4-7
#실습 4-8
#실습 4-9
#실습 4-10
#실습 4-11
#실습 4-12
#실습 4-13
#실습 4-14
#실습 4-15
#실습 4-16
#실습 4-17
#실습 4-18
#실습 4-19
#실습 4-20
#실습 4-21
#실습 4-22
#실습 4-23
#실습 4-24
#실습 4-25
#실습 4-26
#실습 4-27
#실습 4-28
#실습 4-29
#실습 4-30