
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
