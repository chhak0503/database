#날짜 : 2024/07/05
#이름 : 김철학
#내용 : 5장 데이터베이스 개체

#실습 5-1
show index from `user1`;
show index from `user2`;
show index from `user3`;

#실습 5-2
create index `idx_user1_uid` ON `user1` (`uid`);
analyze table `user1`;

select * from `user5`;

#실습 5-3
drop index `idx_user1_uid` on `user1`;

# 대량의 데이터 저장
insert into `user5` (`name`, `gender`, `age`, `addr`) select `name`, `gender`, `age`, `addr` from `user5`;

update `user5` set `name`='홍길동' where `seq`=3;
update `user5` set `name`='정약용' where `seq`=1000000;

select count(*) from `user5`;
select * from `user5` where `name`='홍길동';
select * from `user5` where `name`='정약용';

# 인덱스 적용 후 다시 조회하기
create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;

#실습 5-4
create view `vw_user1` as (select `name`, `hp`, `age` from `user1`);

CREATE VIEW `vw_user4_age_under30` AS (
	SELECT * FROM `User4` WHERE `age` < 30
);

CREATE VIEW `vm_member_with_sales` AS (	
    select 
		a.`uid` as `직원아이디`,
		b.`name` as `직원이름`,
		b.`pos` as `직급`,
		c.`name` as `부서명`,
		a.`year` as `매출년도`,
		a.`month` as `월`,
		a.`sale` as `매출액`
	from `Sales` as a
    join `Member` as b on a.uid = b.uid
    join `Department` as c on b.dep = c.depNo
);

#실습 5-5
select * from `vw_user1`;
select * from `vw_user4_age_under30`;
select * from `vm_member_with_sales`;

#실습 5-6

#실습 5-7
DELIMITER $$
	create procedure proc_test1()
    BEGIN
		select * from `Member`;
        select * from `Department`;    
    END $$
DELIMITER ;

call proc_test1();

#실습 5-8
DELIMITER $$
	create procedure proc_test2(IN _userName VARCHAR(10))
    BEGIN
		select * from `member` where `name`=_userName;
    END $$
DELIMITER ;

call proc_test2('김유신');

DELIMITER $$
CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
BEGIN
	select * from `Member` where `pos`=_pos AND `dep`=_dep;
END $$
DELIMITER ;

CALL proc_test3('차장', 101);

DELIMITER $$
CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
BEGIN
	SELECT count(*) INTO _count FROM `Member` WHERE `pos`=_pos;
END $$
DELIMITER ;

CALL proc_test4('대리', @_count);
select concat('_count : ', @_count);

#실습 5-9
DELIMITER $$
CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
BEGIN
	DECLARE userId VARCHAR(10); # 변수 선언
    select `uid` into userId from `member` where `name`=_name;
    select * from `sales` where `uid`=userId;
END $$
DELIMITER ;

call proc_test5('김유신');

delimiter $$
create procedure proc_test6()
begin
	declare num1 int;
    declare num2 int;
     
	set num1 = 1;
    set num2 = 2;
    
    if (num1 > num2) then
		select 'num1이 num2보다 크다.' as `결과2`;
    else
		select 'num1이 num2보다 작다.' as `결과2`;
    end if;
end $$
delimiter ;

call proc_test6();

delimiter $$
create procedure proc_test7()
begin
	declare sum int;
    declare num int;
    
    set sum = 0;
    set num = 1;
    
    while(num <= 10) do
		set sum = sum + num;
        set num = num + 1;
    end while;
    
    select sum as '1부터 10까지 합계';
end $$	
delimiter ;

call proc_test7();

#실습 5-10
DELIMITER $$
CREATE PROCEDURE proc_test8()
BEGIN
	# 변수 선언
	DECLARE total INT DEFAULT 0;
    DECLARE price INT;
    DECLARE endOfRow BOOLEAN default false;
    
    # 커서 선언
    DECLARE salesCursor CURSOR FOR SELECT `sale` FROM `Sales`;
    
    # 반복 조건
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfRow = TRUE;
    
    # 커서 열기
    OPEN salesCursor;
    
    cursor_loop: LOOP
		FETCH salesCursor INTO price;
        
        IF endOfRow THEN
			LEAVE cursor_loop;
		END IF;
        
        SET total = total + price;
	END LOOP;
    
    select total as `전체 합계`;
    
    CLOSE salesCursor;    
END $$
DELIMITER ;

CALL proc_test8();

#실습 5-11
SET GLOBAL log_bin_trust_function_creators=ON;

DELIMITER $$
CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
BEGIN
	declare total int;	
    select sum(`sale`) into total from `Sales` where `uid`=_userid;        
    return total;
END $$
DELIMITER ;

select func_test1('a101');

delimiter $$
create function func_test2(_sale int) returns double
begin
	declare bonus double;
    
    if( _sale >= 100000 ) then
		set bonus = _sale * 0.1;
    else
		set bonus = _sale * 0.05;
    end if;
	return bonus;
end $$;
delimiter ;

select 
	`uid`, 
    `year`, 
    `month`, 
    `sale`, 
    func_test2(`sale`) as `bonus`
from 
	`Sales`;





