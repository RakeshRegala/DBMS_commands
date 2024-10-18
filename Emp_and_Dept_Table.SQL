            											     HANDOUTS


create table dept(deptno number(2), dname  varchar2(20), loc  varchar2(15),  
constraint pk_dept primary key (deptno));
 
create table emp(empno  number(4), ename varchar2(10), job varchar2(9), mgr number(4), hiredate date,
sal number(7,2), comm number(7,2), deptno number(2), constraint pk_emp primary key (empno),
constraint fk_deptno foreign key (deptno) references dept (deptno));

insert into dept values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept values(20, 'RESEARCH', 'DALLAS');
insert into dept values(30, 'SALES', 'CHICAGO');
insert into dept values(40, 'OPERATIONS', 'BOSTON');

insert into emp values(7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981','dd-mm-yyyy'), 5000, null, 10);
insert into emp values(7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981','dd-mm-yyyy'), 2850, null, 30);
insert into emp values(7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'), 2450, null, 10);
insert into emp values(7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'),  2975, null, 20);
insert into emp values(7788, 'SCOTT', 'ANALYST', 7566, to_date('13-7-1987','dd-mm-yyyy'), 3000, null, 20);
insert into emp values(7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'),  3000, null, 20);
insert into emp values(7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 800, null, 20);
insert into emp values(7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'),1600, 300, 30);
insert into emp values(7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'), 1250, 500, 30);
insert into emp values(7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'), 1250, 1400, 30);
insert into emp values(7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'), 1500, null, 30);
insert into emp values(7876, 'ADAMS', 'CLERK', 7788, to_date('13-7-1987', 'dd-mm-yyyy'), 1100, null, 20);
insert into emp values(7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'), 950, null, 30);
insert into emp values(7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'),1300, null, 10);



1) Display all the records in emp table

select *
from emp;





2) Display all the records in emp table where employee belongs to deptno 10.


SELECT *
FROM EMP
WHERE deptno=10;

3) Display all the records in emp table where employee does not belong to deptno 30.

select *
from emp
where deptno<>30;



4) Display total number of records in Emp table.

select count(*)
from emp;


5) Display emp table with salary descending order.

select *
from emp
order by sal desc;


6) Display first five records in employee table.

select *
from emp
where rownum<6;


7) Display all the records in emp table order by ascending deptno, descending salary.

select *
from emp
order by deptno asc,sal desc;


8) Display all employees those who were joined in year 1981.

select *
from emp
where hiredate between '31-dec-80' and '01-jan-82';

9) Display employee information who don’



10) Display the records in emp table where MGR in 7698,7566 and sal should be greater then
1500


select *
from emp
where (mgr=7698 or mgr=7566) and (sal>1500);


11) Display all employees where their salary is less then the Ford’s salary?

select ename
from emp
where sal<(select sal
    from emp
    where ename='FORD');


12) Display all the records in EMP table along with the rowed.

select rownum,emp.*
from emp;


13) Write a query to display current date.


SELECT SYSDATE AS current_date FROM dual;



14) Display distinct job from emp table.

select distinct job
from emp;


15) Write a query that displays the employee’s names with the first letter capitalized and all other
letters lowercase for all employees whose name starts with J, A, or M.

SELECT
    UPPER(SUBSTR(ename, 1, 1)) || LOWER(SUBSTR(ename, 2)) AS formatted_name
FROM
    emp
WHERE
    ename LIKE 'J%' OR
    ename LIKE 'A%' OR
    ename LIKE 'M%';



16) Write a query to display the employee name, department name of all employees who earn a
commission.

SELECT ename,dname
FROM emp e,dept d
where e.deptno=d.deptno and comm IS NOT NULL;



17) Display the empno, ename, sal, and salary increased by 15%.

SELECT empno,ename,sal,sal+sal*0.15 SAL_INCREASED_BY_15PERC
FROM emp



18) Display employee names and corresponding manager names


select e.ename,(SELECT m.ename from emp m where m.empno=e.mgr) AS manager
from emp e



19) Display all the departments where employee salary greater than average salary of that
department.

select distinct dname
from emp e,dept d
where sal>(SELECT AVG(sal)
    from emp
    where deptno=e.deptno);

20) Display employees where length of ename is 5


select ename
from emp
where ename LIKE '_____';


21) Display all employees where ename start with J and ends with S

select ename
from emp
where ename like 'j%s' or ename like 'J%S';



22) Display all employees where employee does not belong to 10,20,40

select *
from emp
where deptno<>10 and deptno<>20 and deptno<>40;


23) Display all employees where jobs does not belong to PRESIDENT and MANAGER.


select ename
from emp
where job<>'PRESIDENT' AND job<>'MANAGER';


24) Display the maximum salary in the emp table

select max(sal)
from emp


25) Display average salary for job SALESMAN

select avg(sal)
from emp
where job='SALESMAN';


26) Display all ename where first character could be anything, but second character should be L.

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_L%';


27) Display nth highest and nth lowest salary in emp table.


28) Display all the departments where department has 3 employees.

SELECT dname
FROM dept NATURAL JOIN emp
GROUP BY dname
having count(empno)=3;



29) Display sum of salary for each department.


select dname,sum(sal)
from emp natural join dept
group by dname;


30) Display all department with Minimum salary and maximum salary?



select dname,max(sal) as MAXIMUM,min(sal) as MINIMUM
from emp natural join dept
group by deptno,dname




31) Display all ename, empno, dname, loc from emp, dept table.

select ename,empno,dname,loc
from emp natural join dept;


32) Display all the departments where department does not have any employees

select dname
from dept
where deptno=ANY(select deptno from dept
			minus
			select deptno from emp);


33) Display all the departments where department does have atleast one employee

select dname
from dept
where deptno In(select distinct deptno from emp);


34) Display all employees those who are not managers.

SELECT *
FROM emp
WHERE empno NOT IN (
    SELECT DISTINCT mgr
    FROM emp
    WHERE mgr IS NOT NULL
);



35) Display ename, deptno from emp table with format of {ename} belongs to {deptno}



SELECT 
    ename || ' belongs to ' || deptno AS formatted_output
FROM 
    emp;



36) Display all the records in emp table. The ename should be lower case. The job first character
should be upper case and rest of the character in job field should be lower case.



37) Create table emp1 and copy the emp table for deptno 10 while creating the table

CREATE TABLE emp1 AS
SELECT *
FROM emp
WHERE deptno = 10;



38) Create table emp2 with same structure of emp table. Do not copy the data

CREATE TABLE emp2 AS
SELECT *
FROM emp
WHERE 1 = 0;



39) Display all the records for deptno which belongs to employee name JAMES.





select *
from emp
where deptno in (select deptno
    from emp
    where ename='JAMES');


40) Display all the records in emp table where salary should be less than or equal to ADAMS
salary.

select *
from emp
where sal<=(select sal
    from emp
    where ename='ADAMS');


41) Display all subordinate those who are working under BLAKE.

select ename
from emp
where mgr = (select empno
    from emp
    where ename='BLAKE');


42) Display who is making highest commission.

select *
from emp
where comm=(select max(comm)
    from emp);

43) Display ename, sal, (grade?), dname, loc for each employee.

select ename,sal,dname,loc
from emp natural join dept;



44) Display all employee whose location is DALLAS.


select ename
from emp e,dept d
where e.deptno=d.deptno and d.loc='DALLAS';


45) Delete emp records for detpno 10 and 20.

delete from emp
where deptno=10 or deptno=20;

				(OR)

DELETE FROM emp
WHERE deptno IN (10, 20);



46) Delete all employees those are not getting any commission.


select *
from emp
where comm is NOT NULL;



47) Delete the employees where employee salary is greater than average salary of his/her
department.


DELETE FROM EMP e
where sal>(select AVG(sal)
    from emp
    where deptno=e.deptno);


48) Rename the employee name JONES to ANDY

UPDATE emp set ename='ANDY' where ename='JONES';
select *
    from emp;



49) Increase the salary 5% for employee those who are earning commission less then 1000


select sal+sal*0.05 SAL_INC_BY_5PERC
from emp
where comm<1000;


98) Increase 100$ for employee who is making more then averge salary of his department.

select ename,sal+100
    from emp
WHERE sal > (
    SELECT AVG(sal)
    FROM emp e
    WHERE e.deptno=emp.deptno
);




99) Increase 1% salary for employee who is making lowest salary in dept 10

SELECT sal+sal*0.01 IncreasedSAL
from emp
where sal=(select min(sal)
    from emp
    where deptno=10);


100) Increase commission 10$ for employees those who are located in NEW YORK.


select comm+10 Inc_comm
from emp natural join dept
where loc='NEW YORK';






