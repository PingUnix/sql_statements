drop procedure if exists p111;

delimiter //
CREATE PROCEDURE p111(IN id INT UNSIGNED,IN name VARCHAR(11))
BEGIN
SET @SqlCmd = 'SELECT * FROM newsal ';
IF id IS NOT NULL THEN
SET @SqlCmd = CONCAT(@SqlCmd , 'WHERE emp_no=?');
PREPARE stmt FROM @SqlCmd;
SET @a = id;
EXECUTE stmt USING @a;
END IF;
END;
//

CALL p111(10001,'ww');

--- another procedure with table name as parameter

drop procedure if exists sels;

delimiter //
create procedure sels(in tblname varchar(100), in id int)
begin

set @querycmd = concat('select * from ' , tblname);
if id is not null then
	set @querycmd = concat(@querycmd, ' where emp_no = ', id);

end if;
prepare stmt from @querycmd;
execute stmt;


end;
//

call sels('newsal',10011);

-----------
# select * from smallsalaries;
drop procedure if exists ps1;

delimiter //

create procedure ps1 (out empno int, out deptno varchar(100))
begin
select emp_no into empno
from smalldept_emp
where emp_no = '10001';

select dept_no into deptno
from smalldept_emp
where emp_no = '10001';

end;

//


set @a := 1;

call ps1(@a,@b);

select concat_ws('== ',@a, @b);
