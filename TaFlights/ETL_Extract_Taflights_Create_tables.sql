drop table TaFlights;
drop table TaFlightsNew;
drop table TaFlightsYesterday;


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
	
create table TaFlightsNew
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
	
create table TaFlightsYesterday
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