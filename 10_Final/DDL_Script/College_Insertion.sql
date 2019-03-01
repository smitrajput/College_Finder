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
