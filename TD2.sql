use td1;

/* Exercice 2.1 */
CREATE VIEW vueEtu as 
select s.sid,s.sname from student s;
select*from vueEtu;

insert into vueEtu values ('15','Anna');

/* Exercice 2.2 */
CREATE VIEW vueEtuSc as
select s.sid,s.sname,sc.score from student s
join sc on s.sid=sc.sid;
select * from vueEtuSc;
drop view vueEtuSc;

/* Exercice 2.3 */
CREATE VIEW vueEtuSc_cv as
select s.sid,s.sname,sc.score from Student s,sc
where s.sid=sc.sid and sc.cid='01';
select * from vueEtuSc_cv;
drop view vueetusc_cv;

/* Exercice 2.4 */
CREATE VIEW Bourse as
select s.sid,s.sage,sc.score,avg(sc.score) from student s,sc
where s.Sage>'1990-01-01' and (select count(se.Sid) from student se) >= 2
group by s.sid,s.sage,sc.score
having avg(sc.score)>14;
select * from bourse;
drop view bourse;

/* Exercice 2.5 */
RENAME Table Bourse to list_bourse;

/* Exercice 2.6 */
Drop view list_bourse;

/* Exercice 3.1 */
create table Salarie(
ID int,
prenom varchar(15),
metier varchar(30),
salaire int,
date_entree datetime,
date_sortie datetime
);
Insert into Salarie 
values (2, 'Janny', 'Data archictecte', 40, '2007-05-23', '2013-07-22');
Insert into Salarie 
values (3, 'Tom', 'Lead data scientist', 60, '2007-01-19',null);
Insert into Salarie 
values (4, 'Steven', 'Data scientist', 45, '2021-04-01',null);
Insert into Salarie
values (5, 'Alice', 'Data scientist', 42, '2022-09-10',null);
Insert into Salarie 
values (6, 'Felix', 'Lead data scientist', 55, '2001-09-10', '2006-11-01');
insert into salarie 
values (7,"Laura","Data scientist",43,'2000-05-25','2003-11-09');
insert into salarie 
values (8,"Louis","Data scientist",40,'2019-09-13','2022-09-10');
insert into salarie 
values (9,"Aurélien","Data architecte",41,'2023-01-01',null);
insert into salarie 
values (10,"Sandro","Data engineer",38,'2023-09-01', null);
insert into salarie 
values (11,"Lucas","Data engineer",40,'2023-10-10', null);
select * from salarie;
delete from salarie where date_sortie is not null;
ALTER TABLE salarie AUTO_INCREMENT = 1;
SET @new_id := 0;
UPDATE salarie SET id = @new_id := @new_id + 1;
create table hr (
prenom varchar(20),
poste varchar (30), 
age int, 
entre datetime);
insert into hr values ("Sophie", "Gestion_paie", 35, '2024-01-01');
insert into hr values ("David", "responsable_RH", 38, '2024-01-01');
insert into hr values ("Annick", "charge_recrutement", 30, '2024-01-01');
select * from hr;

/* Exercice 4.1 */
SELECT * FROM user where sid='06';
SELECT * FROM user where sname='sophie'; #moins efficace car plusieurs sofie potentiellement

/* Exercice 4.2 */
CREATE TABLE R (
idR VARCHAR(20) NOT NULL,
PRIMARY KEY (idR));
CREATE TABLE S (
idS INT NOT NULL,
idR VARCHAR(20) NOT NULL,
PRIMARY KEY (idS) ,
FOREIGN KEY (idR) REFERENCES R ) ;
