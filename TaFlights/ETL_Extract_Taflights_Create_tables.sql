drop table TaFlights;
drop table TaFlightsNew;
drop table TaFlightsYesterday;


create table TaFlights
	(	
	 LAUNCHTIME 		date not null
	,LANDINGTIME 		date 
	,PLANEREGISTRATION 	char(03) not null;
	,PILOT1INIT 		char(04) not null;
	,PILOT2INIT 		char(01)
	,LAUNCHAEROTOW 		char(01)
						constraint coCHLaunchAerotow check (LaunchAerotow in ('Y' , 'N'))
	,LAUNCHWINCH 		char(01)
						constraint coCHLaunchWinch  check (LaunchWinch in ('Y' , 'N'))
	,LAUNCHSELFLAUNCH 	char(01)
						constraint coCHLaunchSelfLaunch check (LaunchSelfLaunch in ('Y' , 'N'))
	,CABLEBREAK 		char(01)
						constraint coCHCableBreak check (CableBreak in ('Y' , 'N'))
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
						constraint coCHLaunchAerotow check (LaunchAerotow in ('Y' , 'N'))
	,LAUNCHWINCH 		char(01)
						constraint coCHLaunchWinch  check (LaunchWinch in ('Y' , 'N'))
	,LAUNCHSELFLAUNCH 	char(01)
						constraint coCHLaunchSelfLaunch check (LaunchSelfLaunch in ('Y' , 'N'))
	,CABLEBREAK 		char(01)
						constraint coCHCableBreak check (CableBreak in ('Y' , 'N'))
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
						constraint coCHLaunchAerotow check (LaunchAerotow in ('Y' , 'N'))
	,LAUNCHWINCH 		char(01)
						constraint coCHLaunchWinch  check (LaunchWinch in ('Y' , 'N'))
	,LAUNCHSELFLAUNCH 	char(01)
						constraint coCHLaunchSelfLaunch check (LaunchSelfLaunch in ('Y' , 'N'))
	,CABLEBREAK 		char(01)
						constraint coCHCableBreak check (CableBreak in ('Y' , 'N'))
	,CROSSCOUNTRYKM 	number(04)
						default 0  
	, CLUB				varchar(50) not null
	
	);