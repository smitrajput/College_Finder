
DROP SCHEMA collegefinder CASCADE;
CREATE SCHEMA collegefinder;
SET SEARCH_PATH TO  collegefinder;

CREATE TABLE if not exists college(
		ClgId smallint ,
	 	ClgRank smallint NOT NULL check(clgrank>0),
	 	ClgName varchar(30) NOT NULL ,
	  	Highest_package_inLPA numeric(4)NOT NULL,
   		Location varchar(20) NOT NULL,
   		Estb_year smallint NOT NULL,
    	Scholarships_offered boolean ,
    	primary key(ClgId)
         );

CREATE TABLE if not exists program(
 		ProgId varchar(7),
 		ProgName varchar(50) NOT NULL,
 		Intake smallint,
 		Avg_package_inLPA numeric(4,2),
 		Percent_of_student_placed smallint ,
 		Leading_company varchar(50),
 		GirlsToBoys_ratio varchar(5),
 		AI_cat_name varchar(6),
 		AI_cat_openingrank integer check(AI_cat_openingrank >0) ,
 		AI_cat_closingrank integer check(AI_cat_closingrank >0) ,
 		HS_cat_name varchar(6) ,
 		HS_cat_openingrank integer check(HS_cat_openingrank >0) ,
 		HS_cat_closingrank integer  check(HS_cat_closingrank >0) ,
 		ClgId smallint NOT NULL ,
		primary key(ProgId) ,
	    constraint AI check((AI_cat_openingrank < AI_cat_closingrank) AND (HS_cat_openingrank <HS_cat_closingrank) ),
		FOREIGN KEY (ClgId) REFERENCES college(ClgId) ON DELETE SET DEFAULT ON UPDATE CASCADE

);

CREATE TABLE if not exists course(
        CourseName varchar(35) NOT NULL,
		CourseId varchar(6),

		ProgId varchar(7) ,
		primary key(CourseId),
		FOREIGN KEY (ProgId) REFERENCES program(ProgId) ON DELETE SET DEFAULT ON UPDATE CASCADE
);


CREATE TABLE if not exists campusfacilities(

		Campus_size_inacre smallint check(Campus_size_inacre>0),
		Medical boolean ,
		Sports_facilities boolean,
		Library boolean ,
		ClgId smallint ,
		primary key( Campus_size_inacre,ClgId),
		FOREIGN KEY (ClgID) REFERENCES college(ClgId) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE if not exists faculty(
		FacultyId varchar(5),
		FacultyName varchar(30) NOT NULL ,
		Experience_In_years smallint,
		CourseId varchar(6) NOT NULL,
		Qualification varchar(10),
		ClgId smallint NOT NULL,
		primary key(FacultyId),
		FOREIGN KEY (CourseId) REFERENCES course(CourseId) ON DELETE SET DEFAULT ON UPDATE CASCADE,
		FOREIGN KEY (ClgId) REFERENCES college(ClgId) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE if not exists offers(

		ClgId smallint,
		ProgId varchar(7),
		primary key(ClgId,ProgId),
		FOREIGN KEY (ClgId) REFERENCES college(ClgId) ON DELETE SET DEFAULT ON UPDATE CASCADE,
   		FOREIGN KEY (ProgId) REFERENCES program(ProgId) ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE if not exists contains(
		ProgId varchar(7),
		CourseId varchar(6),
		primary key( ProgId, CourseId) ,
		FOREIGN KEY (ProgId) REFERENCES program(ProgId) ON DELETE SET DEFAULT ON UPDATE CASCADE,
		FOREIGN KEY (CourseId) REFERENCES course(CourseId)ON DELETE SET DEFAULT ON UPDATE CASCADE
);

ALTER TABLE college add clg_type varchar(5);


SET SEARCH_PATH TO collegefinder;
BEGIN;

INSERT INTO college VALUES(101,5,'MNNIT ALLAHABAD',28.9,'ALLAHABAD(U.P)',1961,'YES');
INSERT INTO college VALUES(102,2,'NIT CALICUT',20.1,'CALICUT(KERALA)',1971,'YES');
INSERT INTO college VALUES(103,3,'NIT DURGAPUR',15.1,'DURGAPUR(W.B)',1960,'YES');
INSERT INTO college VALUES(104,4,'VNIT NAGPUR',24.2,'NAGPUR(MAHARASTRA)',1983,'YES');
INSERT INTO college VALUES(105,1,'NIT ROURKELA',33.3,'CHATTISGARH',1976,'YES');


INSERT INTO college VALUES(201,2,'IIIT ALLAHABAD',26.3,'U.P',1999,'YES');
INSERT INTO college VALUES(203,3,'IIIT BANGALORE',18.6,'KARNATAKA',1999,'YES');
INSERT INTO college VALUES(204,4,'IIIT DELHI ',22.4,'NEW DELHI',2008,'YES');
INSERT INTO college VALUES(205,5,'IIIT GWALIOR',21.2,'M.P',1997,'YES');
INSERT INTO college VALUES(206,1,'IIIT HYDERABAD',31.2,'ANDHRAPRADESH',1998,'YES');
INSERT INTO college VALUES(207,6,'IIIT JABALPUR',19.2,'M.P',1997,'YES');
INSERT INTO college VALUES(202,10,'IIIT  BHUBHANESHWAR',11.3,'ODISHA',1960,'YES');
INSERT INTO college VALUES(208,7,'IIIT KANCHEEPURAM ',15.4,'KERALA',2006,'YES');
INSERT INTO college VALUES(209,8,'IIIT TRIVANDRUM',17.9,'KERALA',2000,'YES');
INSERT INTO college VALUES(210,9,'IIIT SRICITY',12.2,'HYDERABAD',2013,'YES');



update college set clg_type='NIT' WHERE clgid = 101 ;
update college set clg_type='NIT' WHERE clgid = 102 ;
update college set clg_type='NIT' WHERE clgid = 103 ;
update college set clg_type='NIT' WHERE clgid = 104 ;
update college set clg_type='NIT' WHERE clgid = 105 ;
update college set clg_type='IIIT' WHERE clgid = 201 ;
update college set clg_type='IIIT' WHERE clgid = 202;
update college set clg_type='IIIT' WHERE clgid = 203 ;
update college set clg_type='IIIT' WHERE clgid = 204 ;
update college set clg_type='IIIT' WHERE clgid = 205 ;
update college set clg_type='IIIT' WHERE clgid = 206 ;
update college set clg_type='IIIT' WHERE clgid = 207 ;
update college set clg_type='IIIT' WHERE clgid = 208 ;
update college set clg_type='IIIT' WHERE clgid = 209 ;
update college set clg_type='IIIT' WHERE clgid = 210;

INSERT INTO campusfacilities VALUES(90,'YES','YES','YES',101);
INSERT INTO campusfacilities VALUES(140,'YES','YES','YES',102);
INSERT INTO campusfacilities VALUES(120,'YES','NO','NO',103);
INSERT INTO campusfacilities VALUES(80,'YES','YES','YES',104);
INSERT INTO campusfacilities VALUES(87,'NO','YES','YES',105);


INSERT INTO campusfacilities VALUES(40,'YES','YES','YES',201);
INSERT INTO campusfacilities VALUES(200,'YES','YES','YES',202);
INSERT INTO campusfacilities VALUES(250,'YES','YES','YES',203);
INSERT INTO campusfacilities VALUES(100,'YES','YES','YES',204);
INSERT INTO campusfacilities VALUES(110,'YES','YES','YES',205);
INSERT INTO campusfacilities VALUES(250,'YES','YES','YES',206);
INSERT INTO campusfacilities VALUES(90,'YES','YES','YES',207);
INSERT INTO campusfacilities VALUES(70,'YES','NO','NO',208);
INSERT INTO campusfacilities VALUES(80 ,'NO','NO','YES',209);
INSERT INTO campusfacilities VALUES(50,'YES','NO','NO',210);

INSERT INTO contains VALUES('CS01','101_CSE');
INSERT INTO contains VALUES('CS02','101_CSE');
INSERT INTO contains VALUES('CS03','101_CSE');
INSERT INTO contains VALUES('CS04','101_CSE');
INSERT INTO contains VALUES('CS05','101_CSE');
INSERT INTO contains VALUES('CS06','101_CSE');
INSERT INTO contains VALUES('CS07','101_CSE');

INSERT INTO contains VALUES('ME01','101_ME');
INSERT INTO contains VALUES('ME02','101_ME');
INSERT INTO contains VALUES('ME03','101_ME');
INSERT INTO contains VALUES('ME04','101_ME');
INSERT INTO contains VALUES('ME05','101_ME');
INSERT INTO contains VALUES('ME06','101_ME');
INSERT INTO contains VALUES('ME07','101_ME');
INSERT INTO contains VALUES('ME08','101_ME');

INSERT INTO contains VALUES('EE01','101_EE');
INSERT INTO contains VALUES('EE02','101_EE');
INSERT INTO contains VALUES('EE03','101_EE');
INSERT INTO contains VALUES('EE04','101_EE');
INSERT INTO contains VALUES('EE05','101_EE');
INSERT INTO contains VALUES('EE06','101_EE');
INSERT INTO contains VALUES('EE07','101_EE');



INSERT INTO contains VALUES('CE01','101_CE');
INSERT INTO contains VALUES('CE02','101_CE');
INSERT INTO contains VALUES('CE03','101_CE');
INSERT INTO contains VALUES('CE04','101_CE');
INSERT INTO contains VALUES('CE05','101_CE');
INSERT INTO contains VALUES('CE06','101_CE');
INSERT INTO contains VALUES('CE07','101_CE');

INSERT INTO contains VALUES('EC01','101_ECE');
INSERT INTO contains VALUES('EC02','101_ECE');
INSERT INTO contains VALUES('EC03','101_ECE');
INSERT INTO contains VALUES('EC04','101_ECE');
INSERT INTO contains VALUES('EC05','101_ECE');
INSERT INTO contains VALUES('EC06','101_ECE');
INSERT INTO contains VALUES('EC07','101_ECE');

INSERT INTO contains VALUES('IT01','101_IT');
INSERT INTO contains VALUES('IT02','101_IT');
INSERT INTO contains VALUES('IT03','101_IT');
INSERT INTO contains VALUES('IT04','101_IT');
INSERT INTO contains VALUES('IT05','101_IT');
INSERT INTO contains VALUES('IT06','101_IT');
INSERT INTO contains VALUES('IT07','101_IT');

INSERT INTO contains VALUES('CHE01','101_CHE');
INSERT INTO contains VALUES('CHE02','101_CHE');
INSERT INTO contains VALUES('CHE03','101_CHE');
INSERT INTO contains VALUES('CHE04','101_CHE');
INSERT INTO contains VALUES('CHE05','101_CHE');
INSERT INTO contains VALUES('CHE06','101_CHE');
INSERT INTO contains VALUES('CHE07','101_CHE');









INSERT INTO contains VALUES('CS11','102_CSE');
INSERT INTO contains VALUES('CS12','102_CSE');
INSERT INTO contains VALUES('CS13','102_CSE');
INSERT INTO contains VALUES('CS14','102_CSE');
INSERT INTO contains VALUES('CS15','102_CSE');
INSERT INTO contains VALUES('CS16','102_CSE');
INSERT INTO contains VALUES('CS17','102_CSE');

INSERT INTO contains VALUES('ME11','102_ME');
INSERT INTO contains VALUES('ME12','102_ME');
INSERT INTO contains VALUES('ME13','102_ME');
INSERT INTO contains VALUES('ME14','102_ME');
INSERT INTO contains VALUES('ME15','102_ME');
INSERT INTO contains VALUES('ME16','102_ME');
INSERT INTO contains VALUES('ME17','102_ME');
INSERT INTO contains VALUES('ME18','102_ME');

INSERT INTO contains VALUES('EE11','102_EE');
INSERT INTO contains VALUES('EE12','102_EE');
INSERT INTO contains VALUES('EE13','102_EE');
INSERT INTO contains VALUES('EE14','102_EE');
INSERT INTO contains VALUES('EE15','102_EE');
INSERT INTO contains VALUES('EE16','102_EE');
INSERT INTO contains VALUES('EE17','102_EE');



INSERT INTO contains VALUES('CE11','102_CE');
INSERT INTO contains VALUES('CE12','102_CE');
INSERT INTO contains VALUES('CE13','102_CE');
INSERT INTO contains VALUES('CE14','102_CE');
INSERT INTO contains VALUES('CE15','102_CE');
INSERT INTO contains VALUES('CE16','102_CE');
INSERT INTO contains VALUES('CE17','102_CE');

INSERT INTO contains VALUES('EC11','102_ECE');
INSERT INTO contains VALUES('EC12','102_ECE');
INSERT INTO contains VALUES('EC13','102_ECE');
INSERT INTO contains VALUES('EC14','102_ECE');
INSERT INTO contains VALUES('EC15','102_ECE');
INSERT INTO contains VALUES('EC16','102_ECE');
INSERT INTO contains VALUES('EC17','102_ECE');

INSERT INTO contains VALUES('IT11','102_IT');
INSERT INTO contains VALUES('IT12','102_IT');
INSERT INTO contains VALUES('IT13','102_IT');
INSERT INTO contains VALUES('IT14','102_IT');
INSERT INTO contains VALUES('IT15','102_IT');
INSERT INTO contains VALUES('IT16','102_IT');
INSERT INTO contains VALUES('IT17','102_IT');

INSERT INTO contains VALUES('CHE11','102_CHE');
INSERT INTO contains VALUES('CHE12','102_CHE');
INSERT INTO contains VALUES('CHE13','102_CHE');
INSERT INTO contains VALUES('CHE14','102_CHE');
INSERT INTO contains VALUES('CHE15','102_CHE');
INSERT INTO contains VALUES('CHE16','102_CHE');
INSERT INTO contains VALUES('CHE17','102_CHE');














INSERT INTO contains VALUES('CS21','103_CSE');
INSERT INTO contains VALUES('CS22','103_CSE');
INSERT INTO contains VALUES('CS23','103_CSE');
INSERT INTO contains VALUES('CS24','103_CSE');
INSERT INTO contains VALUES('CS25','103_CSE');
INSERT INTO contains VALUES('CS26','103_CSE');
INSERT INTO contains VALUES('CS27','103_CSE');

INSERT INTO contains VALUES('ME21','103_ME');
INSERT INTO contains VALUES('ME22','103_ME');
INSERT INTO contains VALUES('ME23','103_ME');
INSERT INTO contains VALUES('ME24','ME');
INSERT INTO contains VALUES('ME25','103_ME');
INSERT INTO contains VALUES('ME26','103_ME');
INSERT INTO contains VALUES('ME27','103_ME');
INSERT INTO contains VALUES('ME28','103_ME');

INSERT INTO contains VALUES('EE21','103_EE');
INSERT INTO contains VALUES('EE22','103_EE');
INSERT INTO contains VALUES('EE23','103_EE');
INSERT INTO contains VALUES('EE24','103_EE');
INSERT INTO contains VALUES('EE25','103_EE');
INSERT INTO contains VALUES('EE26','103_EE');
INSERT INTO contains VALUES('EE27','103_EE');



INSERT INTO contains VALUES('CE21','103_CE');
INSERT INTO contains VALUES('CE22','103_CE');
INSERT INTO contains VALUES('CE23','103_CE');
INSERT INTO contains VALUES('CE24','103_CE');
INSERT INTO contains VALUES('CE25','103_CE');
INSERT INTO contains VALUES('CE26','103_CE');
INSERT INTO contains VALUES('CE27','103_CE');

INSERT INTO contains VALUES('EC21','103_ECE');
INSERT INTO contains VALUES('EC22','103_ECE');
INSERT INTO contains VALUES('EC23','103_ECE');
INSERT INTO contains VALUES('EC24','103_ECE');
INSERT INTO contains VALUES('EC25','103_ECE');
INSERT INTO contains VALUES('EC26','103_ECE');
INSERT INTO contains VALUES('EC27','103_ECE');

INSERT INTO contains VALUES('IT21','103_IT');
INSERT INTO contains VALUES('IT22','103_IT');
INSERT INTO contains VALUES('IT23','103_IT');
INSERT INTO contains VALUES('IT24','103_IT');
INSERT INTO contains VALUES('IT25','103_IT');
INSERT INTO contains VALUES('IT26','103_IT');
INSERT INTO contains VALUES('IT27','103_IT');

INSERT INTO contains VALUES('CHE21','103_CHE');
INSERT INTO contains VALUES('CHE22','103_CHE');
INSERT INTO contains VALUES('CHE23','103_CHE');
INSERT INTO contains VALUES('CHE24','103_CHE');
INSERT INTO contains VALUES('CHE25','103_CHE');
INSERT INTO contains VALUES('CHE26','103_CHE');
INSERT INTO contains VALUES('CHE27','103_CHE');












\\NIT 3










INSERT INTO contains VALUES('CS31','104_CSE');
INSERT INTO contains VALUES('CS32','104_CSE');
INSERT INTO contains VALUES('CS33','104_CSE');
INSERT INTO contains VALUES('CS34','104_CSE');
INSERT INTO contains VALUES('CS35','104_CSE');
INSERT INTO contains VALUES('CS36','104_CSE');
INSERT INTO contains VALUES('CS37','104_CSE');

INSERT INTO contains VALUES('ME31','104_ME');
INSERT INTO contains VALUES('ME32','104_ME');
INSERT INTO contains VALUES('ME33','104_ME');
INSERT INTO contains VALUES('ME34','104_ME');
INSERT INTO contains VALUES('ME35','104_ME');
INSERT INTO contains VALUES('ME36','104_ME');
INSERT INTO contains VALUES('ME37','104_ME');
INSERT INTO contains VALUES('ME38','104_ME');

INSERT INTO contains VALUES('EE31','104_EE');
INSERT INTO contains VALUES('EE32','104_EE');
INSERT INTO contains VALUES('EE33','104_EE');
INSERT INTO contains VALUES('EE34','104_EE');
INSERT INTO contains VALUES('EE35','104_EE');
INSERT INTO contains VALUES('EE36','104_EE');
INSERT INTO contains VALUES('EE37','104_EE');



INSERT INTO contains VALUES('CE31','104_CE');
INSERT INTO contains VALUES('CE32','104_CE');
INSERT INTO contains VALUES('CE33','104_CE');
INSERT INTO contains VALUES('CE34','104_CE');
INSERT INTO contains VALUES('CE35','104_CE');
INSERT INTO contains VALUES('CE36','104_CE');
INSERT INTO contains VALUES('CE37','104_CE');

INSERT INTO contains VALUES('EC31','104_ECE');
INSERT INTO contains VALUES('EC32','104_ECE');
INSERT INTO contains VALUES('EC33','104_ECE');
INSERT INTO contains VALUES('EC34','104_ECE');
INSERT INTO contains VALUES('EC35','104_ECE');
INSERT INTO contains VALUES('EC36','104_ECE');
INSERT INTO contains VALUES('EC37','104_ECE');

INSERT INTO contains VALUES('IT31','104_IT');
INSERT INTO contains VALUES('IT32','104_IT');
INSERT INTO contains VALUES('IT33','104_IT');
INSERT INTO contains VALUES('IT34','104_IT');
INSERT INTO contains VALUES('IT35','104_IT');
INSERT INTO contains VALUES('IT36','104_IT');
INSERT INTO contains VALUES('IT37','104_IT');

INSERT INTO contains VALUES('CHE31','104_CHE');
INSERT INTO contains VALUES('CHE32','104_CHE');
INSERT INTO contains VALUES('CHE33','104_CHE');
INSERT INTO contains VALUES('CHE34','104_CHE');
INSERT INTO contains VALUES('CHE35','104_CHE');
INSERT INTO contains VALUES('CHE36','104_CHE');
INSERT INTO contains VALUES('CHE37','104_CHE');




\\NIT4


INSERT INTO contains VALUES('CS41','105_CSE');
INSERT INTO contains VALUES('CS42','105_CSE');
INSERT INTO contains VALUES('CS43','105_CSE');
INSERT INTO contains VALUES('CS44','105_CSE');
INSERT INTO contains VALUES('CS45','105_CSE');
INSERT INTO contains VALUES('CS46','105_CSE');
INSERT INTO contains VALUES('CS47','105_CSE');

INSERT INTO contains VALUES('ME41','105_ME');
INSERT INTO contains VALUES('ME42','105_ME');
INSERT INTO contains VALUES('ME43','105_ME');
INSERT INTO contains VALUES('ME44','105_ME');
INSERT INTO contains VALUES('ME45','105_ME');
INSERT INTO contains VALUES('ME46','105_ME');
INSERT INTO contains VALUES('ME47','105_ME');
INSERT INTO contains VALUES('ME48','105_ME');

INSERT INTO contains VALUES('EE41','105_EE');
INSERT INTO contains VALUES('EE42','105_EE');
INSERT INTO contains VALUES('EE43','105_EE');
INSERT INTO contains VALUES('EE44','105_EE');
INSERT INTO contains VALUES('EE45','105_EE');
INSERT INTO contains VALUES('EE46','105_EE');
INSERT INTO contains VALUES('EE47','105_EE');



INSERT INTO contains VALUES('CE41','105_CE');
INSERT INTO contains VALUES('CE42','105_CE');
INSERT INTO contains VALUES('CE43','105_CE');
INSERT INTO contains VALUES('CE44','105_CE');
INSERT INTO contains VALUES('CE45','105_CE');
INSERT INTO contains VALUES('CE46','105_CE');
INSERT INTO contains VALUES('CE47','105_CE');

INSERT INTO contains VALUES('EC41','105_ECE');
INSERT INTO contains VALUES('EC42','105_ECE');
INSERT INTO contains VALUES('EC43','105_ECE');
INSERT INTO contains VALUES('EC44','105_ECE');
INSERT INTO contains VALUES('EC45','105_ECE');
INSERT INTO contains VALUES('EC46','105_ECE');
INSERT INTO contains VALUES('EC47','105_ECE');

INSERT INTO contains VALUES('IT41','105_IT');
INSERT INTO contains VALUES('IT42','105_IT');
INSERT INTO contains VALUES('IT43','105_IT');
INSERT INTO contains VALUES('IT44','105_IT');
INSERT INTO contains VALUES('IT45','105_IT');
INSERT INTO contains VALUES('IT46','105_IT');
INSERT INTO contains VALUES('IT47','105_IT');

INSERT INTO contains VALUES('CHE41','105_CHE');
INSERT INTO contains VALUES('CHE42','105_CHE');
INSERT INTO contains VALUES('CHE43','105_CHE');
INSERT INTO contains VALUES('CHE44','105_CHE');
INSERT INTO contains VALUES('CHE45','105_CHE');
INSERT INTO contains VALUES('CHE46','105_CHE');
INSERT INTO contains VALUES('CHE47','105_CHE');






\\\IIIT 1


INSERT INTO contains VALUES('CS101','201_CSE');
INSERT INTO contains VALUES('CS102','201_CSE');
INSERT INTO contains VALUES('CS103','201_CSE');
INSERT INTO contains VALUES('CS104','201_CSE');
INSERT INTO contains VALUES('CS105','201_CSE');
INSERT INTO contains VALUES('CS106','201_CSE');
INSERT INTO contains VALUES('CS107','201_CSE');


INSERT INTO contains VALUES('IT101','201_IT');
INSERT INTO contains VALUES('IT102','201_IT');
INSERT INTO contains VALUES('IT103','201_IT');
INSERT INTO contains VALUES('IT104','201_IT');
INSERT INTO contains VALUES('IT105','201_IT');
INSERT INTO contains VALUES('IT106','201_IT');
INSERT INTO contains VALUES('IT107','201_IT');



\\\IIIT 2


INSERT INTO contains VALUES('CS111','202_CSE');
INSERT INTO contains VALUES('CS112','202_CSE');
INSERT INTO contains VALUES('CS113','202_CSE');
INSERT INTO contains VALUES('CS114','202_CSE');
INSERT INTO contains VALUES('CS115','202_CSE');
INSERT INTO contains VALUES('CS116','202_CSE');
INSERT INTO contains VALUES('CS117','202_CSE');


INSERT INTO contains VALUES('IT111','202_IT');
INSERT INTO contains VALUES('IT112','202_IT');
INSERT INTO contains VALUES('IT113','202_IT');
INSERT INTO contains VALUES('IT114','202_IT');
INSERT INTO contains VALUES('IT115','202_IT');
INSERT INTO contains VALUES('IT116','202_IT');
INSERT INTO contains VALUES('IT117','202_IT');




\\\IIIT 3

INSERT INTO contains VALUES('CS121','203_CSE');
INSERT INTO contains VALUES('CS122','203_CSE');
INSERT INTO contains VALUES('CS123','203_CSE');
INSERT INTO contains VALUES('CS124','203_CSE');
INSERT INTO contains VALUES('CS125','203_CSE');
INSERT INTO contains VALUES('CS126','203_CSE');
INSERT INTO contains VALUES('CS127','203_CSE');


INSERT INTO contains VALUES('IT121','203_IT');
INSERT INTO contains VALUES('IT122','203_IT');
INSERT INTO contains VALUES('IT123','203_IT');
INSERT INTO contains VALUES('IT124','203_IT');
INSERT INTO contains VALUES('IT125','203_IT');
INSERT INTO contains VALUES('IT126','203_IT');
INSERT INTO contains VALUES('IT127','203_IT');





\\\IIIT 4
INSERT INTO contains VALUES('CS131','204_CSE');
INSERT INTO contains VALUES('CS132','204_CSE');
INSERT INTO contains VALUES('CS133','204_CSE');
INSERT INTO contains VALUES('CS134','204_CSE');
INSERT INTO contains VALUES('CS135','204_CSE');
INSERT INTO contains VALUES('CS136','204_CSE');
INSERT INTO contains VALUES('CS137','204_CSE');


INSERT INTO contains VALUES('IT131','204_IT');
INSERT INTO contains VALUES('IT132','204_IT');
INSERT INTO contains VALUES('IT133','204_IT');
INSERT INTO contains VALUES('IT134','204_IT');
INSERT INTO contains VALUES('IT135','204_IT');
INSERT INTO contains VALUES('IT136','204_IT');
INSERT INTO contains VALUES('IT137','204_IT');


\\\IIIT 5
INSERT INTO contains VALUES('CS141','205_CSE');
INSERT INTO contains VALUES('CS142','205_CSE');
INSERT INTO contains VALUES('CS143','205_CSE');
INSERT INTO contains VALUES('CS144','205_CSE');
INSERT INTO contains VALUES('CS145','205_CSE');
INSERT INTO contains VALUES('CS146','205_CSE');
INSERT INTO contains VALUES('CS147','205_CSE');


INSERT INTO contains VALUES('IT141','205_IT');
INSERT INTO contains VALUES('IT142','205_IT');
INSERT INTO contains VALUES('IT143','205_IT');
INSERT INTO contains VALUES('IT144','205_IT');
INSERT INTO contains VALUES('IT145','205_IT');
INSERT INTO contains VALUES('IT146','205_IT');
INSERT INTO contains VALUES('IT147','205_IT');


\\IIIT 6
INSERT INTO contains VALUES('CS151','206_CSE');
INSERT INTO contains VALUES('CS152','206_CSE');
INSERT INTO contains VALUES('CS153','206_CSE');
INSERT INTO contains VALUES('CS154','206_CSE');
INSERT INTO contains VALUES('CS155','206_CSE');
INSERT INTO contains VALUES('CS156','206_CSE');
INSERT INTO contains VALUES('CS157','206_CSE');


INSERT INTO contains VALUES('IT151','206_IT');
INSERT INTO contains VALUES('IT152','206_IT');
INSERT INTO contains VALUES('IT153','206_IT');
INSERT INTO contains VALUES('IT154','206_IT');
INSERT INTO contains VALUES('IT155','206_IT');
INSERT INTO contains VALUES('IT156','206_IT');
INSERT INTO contains VALUES('IT157','206_IT');

\\IIIT 7
INSERT INTO contains VALUES('CS161','207_CSE');
INSERT INTO contains VALUES('CS162','207_CSE');
INSERT INTO contains VALUES('CS163','207_CSE');
INSERT INTO contains VALUES('CS164','207_CSE');
INSERT INTO contains VALUES('CS165','207_CSE');
INSERT INTO contains VALUES('CS166','207_CSE');
INSERT INTO contains VALUES('CS167','207_CSE');


INSERT INTO contains VALUES('IT161','207_IT');
INSERT INTO contains VALUES('IT162','207_IT');
INSERT INTO contains VALUES('IT163','207_IT');
INSERT INTO contains VALUES('IT164','207_IT');
INSERT INTO contains VALUES('IT165','207_IT');
INSERT INTO contains VALUES('IT166','207_IT');
INSERT INTO contains VALUES('IT167','207_IT');



\\IIIT 8
INSERT INTO contains VALUES('CS171','208_CSE');
INSERT INTO contains VALUES('CS172','208_CSE');
INSERT INTO contains VALUES('CS173','208_CSE');
INSERT INTO contains VALUES('CS174','208_CSE');
INSERT INTO contains VALUES('CS175','208_CSE');
INSERT INTO contains VALUES('CS176','208_CSE');
INSERT INTO contains VALUES('CS177','208_CSE');


INSERT INTO contains VALUES('IT171','208_IT');
INSERT INTO contains VALUES('IT172','208_IT');
INSERT INTO contains VALUES('IT173','208_IT');
INSERT INTO contains VALUES('IT174','208_IT');
INSERT INTO contains VALUES('IT175','208_IT');
INSERT INTO contains VALUES('IT176','208_IT');
INSERT INTO contains VALUES('IT177','208_IT');

\\\IIIT 9

INSERT INTO contains VALUES('CS181','209_CSE');
INSERT INTO contains VALUES('CS182','209_CSE');
INSERT INTO contains VALUES('CS183','209_CSE');
INSERT INTO contains VALUES('CS184','209_CSE');
INSERT INTO contains VALUES('CS185','209_CSE');
INSERT INTO contains VALUES('CS186','209_CSE');
INSERT INTO contains VALUES('CS187','209_CSE');


INSERT INTO contains VALUES('IT181','209_IT');
INSERT INTO contains VALUES('IT182','209_IT');
INSERT INTO contains VALUES('IT183','209_IT');
INSERT INTO contains VALUES('IT184','209_IT');
INSERT INTO contains VALUES('IT185','209_IT');
INSERT INTO contains VALUES('IT186','209_IT');
INSERT INTO contains VALUES('IT187','209_IT');
\\IIIT 10

INSERT INTO contains VALUES('CS191','210_CSE');
INSERT INTO contains VALUES('CS192','210_CSE');
INSERT INTO contains VALUES('CS193','210_CSE');
INSERT INTO contains VALUES('CS194','210_CSE');
INSERT INTO contains VALUES('CS195','210_CSE');
INSERT INTO contains VALUES('CS196','210_CSE');
INSERT INTO contains VALUES('CS197','210_CSE');


INSERT INTO contains VALUES('IT191','210_IT');
INSERT INTO contains VALUES('IT192','210_IT');
INSERT INTO contains VALUES('IT193','210_IT');
INSERT INTO contains VALUES('IT194','210_IT');
INSERT INTO contains VALUES('IT195','210_IT');
INSERT INTO contains VALUES('IT196','210_IT');
INSERT INTO contains VALUES('IT197','210_IT');




COMMIT;
