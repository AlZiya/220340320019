
create database finalLab ;
use finalLab ;
--                                     Section I	
/* 
1.	Create table DEPT with the following structure:-
DEPTNO			int(2)
DNAME			varchar(15)
LOC				varchar(10)

Insert the following rows into the DEPT table:-
10	ACCOUNTING	NEW YORK
20	RESEARCH		DALLAS
30	SALES		CHICAGO
40	OPERATIONS	BOSTON

*/
create table DEPT (
DEPTNO			int(2) ,
DNAME			varchar(15) ,
LOC				varchar(10) 
);

insert into  DEPT values 
(10	, 'ACCOUNTING','NEW YORK') ,
(20	, 'RESEARCH','DALLAS') ,
(30	, 'SALES','CHICAGO') ,
(40	, 'OPERATIONS',	'BOSTON' );

-- ****************************************************************************************
/*
2.	Create table EMP with the following structure:-
EMPNO			int(4)
ENAME			varchar(10)
JOB				varchar(9)
HIREDATE			date
SAL				float(7,2)
COMM			float(7,2)
DEPTNO			int(2)

Insert the following rows into the EMP table:-
7839	KING		MANAGER	1991-11-17	5000	NULL	10
7698	BLAKE	CLERK	1981-05-01	2850	NULL	30
7782	CLARK	MANAGER	1981-06-09	2450	NULL	10
7566	JONES	CLERK	1981-04-02	2975	NULL 20
7654	MARTIN	SALESMAN	1981-09-28	1250	1400	30
7499	ALLEN	SALESMAN	1981-02-20	1600	300	30
*/

Create table EMP(
EMPNO			int(4) ,
ENAME			varchar(10) ,
JOB				varchar(9) ,
HIREDATE			date ,
SAL				float(7,2) ,
COMM			float(7,2) ,
DEPTNO			int(2)
);

insert into  EMP values 
(7839	,'KING'     ,	'MANAGER'  ,	'1991-11-17'	,   5000   ,NULL,	10),
(7698	,'BLAKE'	,   'CLERK'    ,    '1981-05-01'	,   2850  ,	NULL	,30),
(7782	,'CLARK'	,   'MANAGER'  ,	'1981-06-09'	,   2450  ,	NULL	,10),
(7566	,'JONES'	,   'CLERK'    ,	'1981-04-02'	,   2975  ,	NULL    , 20),
(7654	,'MARTIN'	,   'SALESMAN' ,	'1981-09-28'    ,	1250	,1400	,30),
(7499	,'ALLEN'	,   'SALESMAN' ,	'1981-02-20'    ,	1600	,300	,30);

-- ****************************************************************************************************************
/* 3.	Display all the employees where SAL between 2500 and 5000 (inclusive of both). */
SELECT 
    ENAME
FROM
    emp
WHERE
    sal >= 2500 AND sal <= 5000;
    
    --              or
    
SELECT 
    *
FROM
    emp
WHERE
    sal >= 2500 AND sal <= 5000;
    
    -- ******************************************************************************************************
     /*4.	Display all the ENAMEs in descending order of ENAME. */
     select ename from emp order by ename desc ;
     -- ****************************************************************************************************
     /* 5.	Display all the JOBs in lowercase. */
     select lower(job) from emp ;
     -- or
     select distinct lower(job) from emp ;
     
     -- *******************************************************************************************************
     /* 6.	Display the ENAMEs and the lengths of the ENAMEs. */
     select ename , length(ename) from emp ;
     
     -- *******************************************************************************************************
     /* 7.	Display the DEPTNO and the count of employees who belong to that DEPTNO . */
     select deptno , count(ename) as 'count of employees' from emp group by deptno ;
     -- *******************************************************************************************************
     /* 8.	Display the DNAMEs and the ENAMEs who belong to that DNAME. */
     select  dname , ename 
     from dept , emp 
     where dept.deptno = emp.deptno
     order by dname , ename ;
     -- *************************************************************************************************************************
     /*  9.	Display the position at which the string ‘AR’ occurs in the ename. */
     select  ename , position('AR' in ename) as 'position' from emp ;
     -- *************************************************************************************************
     /* 10.	Display the HRA for each employee given that HRA is 20% of SAL. */
     select ENAME , sal * .20 as 'HRA' FROM EMP ;
     
     --                           Section II	
     /* 1.	Write a stored procedure by the name of PROC1 that accepts two varchar strings as parameters.
     Your procedure should then determine if the first varchar string exists inside the varchar string.
     For example, if string1 = ‘DAC’ and string2 = ‘CDAC, then string1 exists inside string2. 
     The stored procedure should insert the appropriate message into a suitable TEMPP output table.
     Calling program for the stored procedure need not be written.
     */
     CREATE  TABLE TEMPP( 
     message VARCHAR (50));
     
     DELIMITER //
     CREATE   procedure  PROC1 (string1 varchar(50) ,string2 varchar(50) ) 
     begin
		if (string1 like concat('%',string2,'%')) then
			insert into tempp values ('string1  is found in  string2 ');
		else 
			insert into tempp values ( 'string1  is not  found in  string2 ');
		end if ;
	end ; // 
    DELIMITER ;
   drop procedure PROC1;
    set @str1 = 'DAC';
    set @str2 = 'CDAC';
    call PROC1( @str1 ,@str2);
    select * from tempp;
     
     -- ***************************************************************
   /*  2.	Create a stored function by the name of FUNC1 to take three parameters, the sides of a triangle. 
     The function should return a Boolean value:- TRUE if the triangle is valid, FALSE otherwise.
     A triangle is valid if the length of each side is less than the sum of the lengths of the other two sides. 
     Check if the dimensions entered can form a valid triangle.
     Calling program for the stored function need not be written.*/
     
     delimiter // 
     create function FUNC1( side1 int , side2 int , side3 int  )
     returns Boolean 
     deterministic
     begin 
		if side1 < (side2 + side3) and side2 < (side1 + side3) and side3 < (side2 + side1) then
			return true;
        else 
            return false;
         end if ;
     end ; //
     delimiter ;
     drop function FUNC1;
     select FUNC1(10,20,29) from dual;
     select FUNC1(40,10,10) from dual;
     
     
     






