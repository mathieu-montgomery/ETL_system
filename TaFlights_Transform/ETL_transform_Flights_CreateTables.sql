drop table TaFlight_Validate_Duration;
drop table TaFlight_Validate_Pilot_Initials;
drop table TaFlight_Validate_Launch_Type;
drop table TaFlight_Error;





create table TaFlight_Validate_Duration
	(	
	 LAUNCHTIME         date not null
	,FLIGHT_DURATION    int
	,PLANEREGISTRATION  char(03) not null
	,PILOT1INIT         char(04) not null
	,PILOT2INIT         char(04)
	,LAUNCHAEROTOW      char(01)			
	,LAUNCHWINCH        char(01)	
	,LAUNCHSELFLAUNCH 	char(01)
	,CABLEBREAK         char(01)		
	,CROSSCOUNTRYKM     number(04) default 0  
	,CLUB               varchar(50) not null
	);
  

  create table TaFlight_Validate_Pilot_Initials
	(	
	 LAUNCHTIME         date not null
	,FLIGHT_DURATION    int
	,PLANEREGISTRATION  char(03) not null
	,PILOT1INIT         char(04) not null
	,PILOT2INIT         char(04)
	,LAUNCHAEROTOW      char(01)			
	,LAUNCHWINCH        char(01)	
	,LAUNCHSELFLAUNCH 	char(01)
	,CABLEBREAK         char(01)		
	,CROSSCOUNTRYKM     number(04) default 0  
	,CLUB               varchar(50) not null
	);
  
  
  create table TaFlight_Validate_Launch_Type
	(	
	 LAUNCHTIME         date not null
	,FLIGHT_DURATION    int
	,PLANEREGISTRATION  char(03) not null
	,PILOT1INIT         char(04) not null
	,PILOT2INIT         char(04)
	,LAUNCH_TYPE        char(01)
	,CABLEBREAK         char(01)		
	,CROSSCOUNTRYKM     number(04) default 0  
	,CLUB               varchar(50) not null
	);
  
  
  create table TaFlight_Error
(
          idError           int primary key not null
        , launchtime        date not null
        , flight_duration   int
        , club              varchar(50) not null
        , dateError         date
        , step              varchar2(100)
        , dataError         varchar2(100)
        , typeError         varchar2(100)
        , status            varchar2(100)
); 
  