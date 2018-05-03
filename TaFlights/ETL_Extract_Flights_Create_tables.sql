drop table TaFlights;
drop table TaFlights_New;
drop table TaFlights_Yesterday;


create table TaFlights
	(	
	 LAUNCHTIME 		date not null
	,LANDINGTIME 		date 
	,PLANEREGISTRATION 	char(03) not null
	,PILOT1INIT 		char(04) not null
	,PILOT2INIT 		char(04)
	,LAUNCHAEROTOW 		char(01)
						
	,LAUNCHWINCH 		char(01)
				
	,LAUNCHSELFLAUNCH 	char(01)
						
	,CABLEBREAK 		char(01)
						
	,CROSSCOUNTRYKM 	number(04)
						default 0  
	, CLUB				varchar(50) not null
	
	);
	
create table TaFlights_New
	(	
	 LAUNCHTIME 		date not null
	,LANDINGTIME 		date 
	,PLANEREGISTRATION 	char(03) not null
	,PILOT1INIT 		char(04) not null
	,PILOT2INIT 		char(04)
	,LAUNCHAEROTOW 		char(01)
				
	,LAUNCHWINCH 		char(01)
					
	,LAUNCHSELFLAUNCH 	char(01)
					
	,CABLEBREAK 		char(01)
						
	,CROSSCOUNTRYKM 	number(04)
						default 0  
	, CLUB				varchar(50) not null
	
	);
	
create table TaFlights_Yesterday
	(	
	 LAUNCHTIME 		date not null
	,LANDINGTIME 		date 
	,PLANEREGISTRATION 	char(03) not null
	,PILOT1INIT 		char(04) not null
	,PILOT2INIT 		char(04)
	,LAUNCHAEROTOW 		char(01)
				
	,LAUNCHWINCH 		char(01)
						
	,LAUNCHSELFLAUNCH 	char(01)
				
	,CABLEBREAK 		char(01)
					
	,CROSSCOUNTRYKM 	number(04)
						default 0  
	, CLUB				varchar(50) not null
	
	);