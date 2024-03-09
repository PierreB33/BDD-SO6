CREATE TABLE Student (
    SId VARCHAR(10),
    Sname VARCHAR(10),
    Sage DATETIME,
    Ssex VARCHAR(10)
);
insert into Student values('01', 'Leon', '1990-02-01','M');
insert into Student values('02','David','1990-12-21','M');
insert into Student values('03','Lucas','1990-12-20','M');
insert into Student values('04','Paul','1990-02-06','M');
insert into Student values('05','Lea','1991-02-01','F');
insert into Student values('06','Sophie','1992-03-01','F');
insert into Student values('07','Ella','1989-03-01','F');
insert into Student values('09','Zoe','2007-12-20','F');
insert into Student values('10','Anais','2007-12-25','F');
insert into Student values('11','Eva','2002-06-06','F');
insert into Student values('12','Louise','2003-06-13','F');
insert into Student values('13','Louise','2004-06-01','F');
insert into Student values('15',NULL,'1994-07-01',NULL);
SELECT 
    *
FROM
    Student;

CREATE TABLE Course (
    CId VARCHAR(10),
    Cname VARCHAR(50),
    TId VARCHAR(10)
);
 insert into Course values('01','Computer vision','02');
 insert into Course values ('02' ,'Data visualisation' ,'01');
 insert into Course values ('03','Machine Learning','03');
SELECT 
    *
FROM
    Course;
 
CREATE TABLE Teacher (
    TId VARCHAR(10),
    Tname VARCHAR(10)
);
 insert into Teacher values('01','Emma Lopez');
 insert into Teacher values('02','Anna Lopez');
 insert into Teacher values('03','Raphael Andre');
 
CREATE TABLE SC (
    SId VARCHAR(10),
    CId VARCHAR(10),
    score DECIMAL(18 , 1 )
);
insert into SC values('01','01',16);
insert into SC values('01','02',18);
insert into SC values('01','03',15);
insert into SC values('02','01',14);
insert into SC values('02','02',12);
insert into SC values('02','03',16);
insert into SC values('03','01',16);
insert into SC values('03','02',16);
insert into SC values('03','03',16);
insert into SC values('04','01',10);
insert into SC values('04','02',6);
insert into SC values('04','03',14);
insert into SC values('05','01',0);
insert into SC values('05','02',15.5);
insert into SC values('06','01',6.2);
insert into SC values('06','03',6.8);
insert into SC values('07','02',17.5
);
insert into SC values('07','03',14.5);
insert into SC values('08','03','5');
insert into SC values('09','02','13.5');
insert into SC values('10','03','11');
SELECT * FROM SC;

/* Question 2.1 */
UPDATE SC SET score=10.0 WHERE score=0.0;
Select score from SC;

/* Question 2.2 */
Delete from Student where Sname is NULL;
Select * from student;

/* Question 2.3 */
Select * from Student where Sage>='2000-01-01';

/* Question 2.4 */
SELECT COUNT(*), Ssex FROM student where Ssex='M';
SELECT COUNT(*), Ssex FROM student where Ssex='F';

/* Question 2.5 */
SELECT Student.Sid,Student.Sname,SC1.score,SC2.score FROM Student
Join SC SC1 ON Student.SId=SC1.SId and SC1.CId='01'
Join SC SC2 ON Student.SId=SC2.SId and SC2.CId='02'
Where SC1.score>SC2.score;

/* Question 2.6 */
Select Student.Sid,Student.Sname FROM Student
Join SC SC1 ON Student.SId=SC1.SId and SC1.CId='01'
Join SC SC2 ON Student.SId=SC2.SId and SC2.CId='02';

/* Question 2.7 */
Select Student.Sid,Student.Sname FROM Student
Join SC SC1 ON Student.Sid=SC1.SId and SC1.CId='01';

/* Question 2.8 */
SELECT s.SId, s.Sname FROM Student s
JOIN SC ON s.SId = SC.SId
WHERE SC.CId = '02' AND s.SId NOT IN (
    SELECT SId FROM SC WHERE CId != '02'
); 

/* Question 2.9 */
Select s.SId, s.Sname, avg(SC.score) From Student s
join SC on s.SId=SC.SId
group by s.SId, s.Sname
having avg(SC.score)>=15;

/* Question 2.10 */
Select s.SId, s.Sname From Student s
join SC on s.SId=SC.SId
group by s.SId, s.Sname;

/* Question 2.11 */
Select s.SId, s.Sname, COUNT(DISTINCT s.SId),COUNT(sc.score) From Student s
join SC on s.SId=SC.SId
group by s.SId, s.Sname;

/* Question 2.12 */ /* Question 2.13 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
group by s.Sid,s.Sname;

/* Question 2.14 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
WHere SC.cid='02';

/* Question 2.15 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
group by s.Sid,s.Sname
having count(SC.cid)!=3;

/* Question 2.16 */
Select s.SId,s.Sname,avg(score) from Student s
join SC on s.SId=SC.SId
group by s.SId,s.Sname 
having sum(CASE WHEN SC.score<10 THEN 1 else 0 END)>=2;

/* Question 2.17 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
where SC.cid='01' and score>=15;

/* Question 2.18 */
Select s.SId,s.Sname,avg(score) from Student s
join SC on s.SId=SC.SId
group by s.SId,s.Sname
order by avg(score) DESC;

/* Question 2.19 */
Select s.SId,s.Sname from Student s
Join SC SC1 ON s.SId=SC1.SId and SC1.CId='01'
group by s.SId,s.Sname
order by avg(score) DESC
LIMIT 3;

Select s.SId,s.Sname from Student s
Join SC SC1 ON s.SId=SC1.SId and SC1.CId='02'
group by s.SId,s.Sname
order by avg(score) DESC
LIMIT 3;

Select s.SId,s.Sname from Student s
Join SC SC1 ON s.SId=SC1.SId and SC1.CId='03'
group by s.SId,s.Sname
order by avg(score) DESC
LIMIT 3;

/* Question 2.20 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
where score<=10;

/* Question 2.21 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
WHere SC.cid='02'and sc.score<10;

/* Question 2.22 */
Select s.SId,s.Sname from Student s
join SC on s.SId=SC.SId
where sc.score<10;

/* Question 2.23 */
Select s.Sname from Student s
Where Month (s.sage)=Month(curdate());
Select S.Sname from Student s
Where Month (S.Sage)=Month(curdate())+1;

































                   
 