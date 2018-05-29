/* -------------------------------------------*/
/*  DDL for creating  all the tables for the  */
/*  Data Warehousing course project.          */
/*  Groupe members :                          */ 
/*    Leander Holm                            */
/*    Mallé Marega                            */
/*    Mathieu Montgomery                      */
/* -------------------------------------------*/
/*  June 2018                                 */
/* -------------------------------------------*/


set heading ON;
set feedback ON;


-- Drop all the tables and sequences --
drop table F_Flights cascade constraints;
drop table D_Time cascade constraints;
drop table D_Planes cascade constraints;
drop table D_Members cascade constraints;
drop table BridgePilotFlight cascade constraints;
drop table D_Clubs cascade constraints;

drop table TaFlights cascade constraints;
drop table TaFlights_New cascade constraints;
drop table TaFlights_Yesterday cascade constraints;

drop table TaFlights_Validate_Duration cascade constraints;
drop table TaFlights_Validate_Pilot_Initials cascade constraints;
drop table TaFlights_Validate_Launch_Type cascade constraints;
drop table TaFlights_Error cascade constraints;
drop table TaFlights_Key_Pilots_1 cascade constraints;
drop table TaFlights_Key_Pilots_2 cascade constraints;
drop table TaFlights_Key_Clubs cascade constraints;
drop table TaFlights_Key_Time cascade constraints;
drop table TaFlights_Key_Planes cascade constraints;
drop table BridgePilotFlights cascade constraints;

drop table TaMembers_Yesterday cascade constraints;
drop table TaMembers_Changes cascade constraints;

drop table TaMembers_Validate_Status cascade constraints;
drop table TaMembers_Validate_age cascade constraints;
drop table TaMembers_Validate_TEST_age cascade constraints;
drop table TaMembers_Error cascade constraints;

drop table taFlightsVejle cascade constraints;
drop table taFlightsSG70 cascade constraints;
drop table taMembers cascade constraints;
drop table taClubs cascade constraints;
drop table taRegions cascade constraints;

DROP SEQUENCE seq_TRANSFORM_ERROR_ID; 
DROP SEQUENCE seq_LOAD_MEMBER_ID; 
DROP SEQUENCE seq_TRANSFORM_FLIGHT_ERROR_ID; 
DROP SEQUENCE seq_LOAD_BRIDGEPILOTFLIGHTS; 
DROP SEQUENCE seq_LOAD_FACT; 


-- ******************* Creating TaClubs and TaFlights_New *******************






create table taRegions
       (
           Name   varchar2(50)
                  not null
                  constraint coPKtaRegion primary key
       )
;
       
create table taClubs
       (
           Mane    varchar2(50)
                   not null
                   constraint coPKtaClub primary key
                 
        ,  Address varchar2(50)
                   not null
                   
        ,  ZipCode char(04)
                   not null
                   
        , Region   varchar2(50)
                   constraint coFKtaClubtaRegion references taRegions
       )
;
       
create table taMembers
       (
          MemberNo number(6,0)
                        not null
                        constraint coPKtaMember primary key
                        
        , Initials      char(04)
                        not null
                        
        , Name          varchar2(50)
                        not null
                        
        , Address       varchar2(50)
                        not null
                        
        , ZipCode       number(4,0)
                        not null
                        
        , DateBorn      date
                        not null
                        
        , DateJoined    date
                        not null
                        
        , DateLeft      date
                        
                        
        , OwnsPlaneReg  char(03)
                        not null
                              
        , StatusStudent  char(01)
                         not null
                         constraint coCHStatusStudent check (StatusStudent in ('Y', 'N'))
                        
        , StatusPilot   char(01)
                        not null
                        constraint coCHStatusPilot check (StatusPilot in ('Y', 'N'))
                        
        , StatusAsCat   char(01)
                        not null
                        constraint coCHStatusErHI check (StatusAsCat in ('Y', 'N'))
                        
        , StatusFullCat char(01)
                        not null
                        constraint coCHStatusFullCat check (StatusFullCat in ('Y', 'N'))
                        
        , Sex           char(01)
                        not null
                        constraint coCHSex check (Sex in ('M', 'F'))
                        
        , Club          varchar2(50)
                        not null
                        constraint coFKtaMemberClub references taClubs
       )
;       
       
create table taFlightsVejle
       (
          LaunchTime          date
                              not null
                        
        , LandingTime         date
                        
        , PlaneRegistration  char(03)
                             not null
                          
        , Pilot1Init         char(04)
                             not null
                          
        , Pilot2Init         char(04)
                        
        , LaunchAerotow      char(01)
                             constraint coCHLaunchAerotow check (LaunchAerotow in ('Y' , 'N'))
                           
        , LaunchWinch        char(01)
                             constraint coCHLaunchWinch  check (LaunchWinch in ('Y' , 'N'))
                           
        , LaunchSelfLaunch   char(01)
                             constraint coCHLaunchSelfLaunch check (LaunchSelfLaunch in ('Y' , 'N'))
                           
        , CableBreak        char(01)
                            constraint coCHCableBreak check (CableBreak in ('Y' , 'N'))

                          
        , CrossCountryKM    number(4,0)
                            default 0                  
                          
        , constraint coPKtaFlightsVejle primary key (LaunchTime, LandingTime, PlaneRegistration)  
         
       )
;       
                     
create table taFlightsSG70 as (select *
                                      from taFlightsVejle);
alter table taFlightsSG70
  add  constraint coPKtaFlightsSG70 primary key (LaunchTime, LandingTime, PlaneRegistration)
;                                  




 -- ********************* creating all the final tables *********************




CREATE TABLE D_Clubs (
    Club_Change_ID INT not null,
    Club_ID VARCHAR(50) NOT NULL,    
    NameClub VARCHAR(50),
    Adress VARCHAR(50),
    Zipcode CHAR(04),
    Region VARCHAR(50),
    VALID_FROM DATE,
    VALID_TO Date,
    CONSTRAINT PK_D_Club PRIMARY KEY (Club_Change_ID)
);

CREATE TABLE D_MEMBERS(
    member_change_ID INT not null,
    MEMBER_ID INT not null, 
    INITIALS CHAR(4),
    Name VARCHAR2(50),
    Adress VARCHAR2(50),
    ZipCode number(4,0) not null,
    DATEBORN DATE not null,
    AGE number(3,0),
    DATEJOINED DATE,
    DATELEFT DATE,
    OWNSPLANEREG CHAR(3 BYTE),
    SEX CHAR(1 BYTE),
    CLUB_ID VARCHAR(50) not null,
    STATUS VARCHAR(50),
    VALID_FROM DATE,
    VALID_TO Date,
    Constraint PK_D_Member PRIMARY KEY(member_change_ID)
);

/*
CREATE TABLE BridgePilotFlights(
  flight_group_ID INT NOT NULL,
  member_change_ID INT NOT NULL,
  member_change2_ID INT NOT NULL,

    CONSTRAINT PK_BridgePilotFlights PRIMARY KEY (flight_group_ID),
    
    CONSTRAINT FK_D_MEMBER FOREIGN KEY(member_change_ID) REFERENCES D_MEMBER(member_change_ID),
    CONSTRAINT FK_D_MEMBER2 FOREIGN KEY(member_change2_ID) REFERENCES D_MEMBER(member_change_ID)
);*/

CREATE TABLE BridgePilotFlights(
  flight_group_ID INT NOT NULL,
  member_ID INT NOT NULL,
  weight DECIMAL(3,2) NOT NULL,

  CONSTRAINT PK_BridgePilotFlights PRIMARY KEY (flight_group_ID, member_ID),
  CONSTRAINT FK_D_MEMBER FOREIGN KEY(member_ID) REFERENCES D_MEMBERS(member_change_ID)
);

CREATE TABLE D_Planes (
    Plane_Change_ID INT not null,
    RegistrationNumber_ID VARCHAR(20),
    NamePlane VARCHAR(20),
    DateOfPurchase DATE,
    CompNo VARCHAR(20),
    PlaneType VARCHAR(20),
    ClubOwned NUMBER(1),
    Owner_ID INT,
    OwnerClubName VARCHAR(50),
    HasEngine NUMBER(1),
    NumberOfSeats INT,
    VALID_FROM DATE,
    VALID_TO Date,
    CONSTRAINT PK_D_Plane PRIMARY KEY (Plane_Change_ID),
    
    CONSTRAINT FK_OwnerClubName FOREIGN KEY(Owner_ID) REFERENCES D_Clubs(Club_Change_ID)
);
    
CREATE TABLE D_Time (
    ID_Time INT,
    Year_time INT,
    Month_time INT,
    Day_time INT,
    Hour_time INT,
    Minute_time INT,

    CONSTRAINT PK_D_Time PRIMARY KEY (ID_Time)
);


CREATE TABLE F_Flights (
    flight_ID INT NOT NULL,

    plane_ID INT,
    flight_group_ID INT,
    club_ID INT,
    time_ID INT, 
    launch_type_ID VARCHAR(50),

    incident CHAR(1),
    distance VARCHAR(255),
    flight_duration VARCHAR(255),

    
    CONSTRAINT FK_Club FOREIGN KEY(club_ID) REFERENCES D_Clubs(Club_Change_ID),
    CONSTRAINT FK_Time FOREIGN KEY(time_ID) REFERENCES D_Time(ID_Time),
    CONSTRAINT FK_Plane FOREIGN KEY(plane_ID) REFERENCES D_Planes(Plane_Change_ID),
    --CONSTRAINT FK_BridgeFlight FOREIGN KEY(flight_group_ID) REFERENCES BridgePilotFlights(flight_group_ID),

    CONSTRAINT PK_F_flights PRIMARY KEY (flight_ID)
);


--  ******************* End of the final table *********************


-- ******************* Creating TaFlights and TaFlights_New *******************




create table TaFlights
    (   
     LAUNCHTIME         date not null
    ,LANDINGTIME        date 
    ,PLANEREGISTRATION  char(03) not null
    ,PILOT1INIT         char(04) not null
    ,PILOT2INIT         char(04)
    ,LAUNCHAEROTOW      char(01)
                        
    ,LAUNCHWINCH        char(01)
                
    ,LAUNCHSELFLAUNCH   char(01)
                        
    ,CABLEBREAK         char(01)
                        
    ,CROSSCOUNTRYKM     number(04)
                        default 0  
    , CLUB              varchar(50) not null
    
    );
    
create table TaFlights_New
    (   
     LAUNCHTIME         date not null
    ,LANDINGTIME        date 
    ,PLANEREGISTRATION  char(03) not null
    ,PILOT1INIT         char(04) not null
    ,PILOT2INIT         char(04)
    ,LAUNCHAEROTOW      char(01)
                
    ,LAUNCHWINCH        char(01)
                    
    ,LAUNCHSELFLAUNCH   char(01)
                    
    ,CABLEBREAK         char(01)
                        
    ,CROSSCOUNTRYKM     number(04)
                        default 0  
    , CLUB              varchar(50) not null
    
    );
    
create table TaFlights_Yesterday
    (   
     LAUNCHTIME         date not null
    ,LANDINGTIME        date 
    ,PLANEREGISTRATION  char(03) not null
    ,PILOT1INIT         char(04) not null
    ,PILOT2INIT         char(04)
    ,LAUNCHAEROTOW      char(01)
                
    ,LAUNCHWINCH        char(01)
                        
    ,LAUNCHSELFLAUNCH   char(01)
                
    ,CABLEBREAK         char(01)
                    
    ,CROSSCOUNTRYKM     number(04)
                        default 0  
    , CLUB              varchar(50) not null
    
    );

-- ******************* End of TaFlights and TaFlights_New (Extract) *******************


-- ******************* Creating TaFlightValidation and Error ... (Transform) *******************



create table TaFlights_Validate_Duration
  ( 
   LAUNCHTIME         date not null
  ,FLIGHT_DURATION    int
  ,PLANEREGISTRATION  char(03) not null
  ,PILOT1INIT         char(04) not null
  ,PILOT2INIT         char(04)
  ,LAUNCHAEROTOW      char(01)      
  ,LAUNCHWINCH        char(01)  
  ,LAUNCHSELFLAUNCH   char(01)
  ,CABLEBREAK         char(01)    
  ,CROSSCOUNTRYKM     number(04) default 0  
  ,CLUB               varchar(50) not null
  );
  

  create table TaFlights_Validate_Pilot_Initials
  ( 
   LAUNCHTIME         date not null
  ,FLIGHT_DURATION    int
  ,PLANEREGISTRATION  char(03) not null
  ,PILOT1INIT         char(04) not null
  ,PILOT2INIT         char(04)
  ,LAUNCHAEROTOW      char(01)      
  ,LAUNCHWINCH        char(01)  
  ,LAUNCHSELFLAUNCH   char(01)
  ,CABLEBREAK         char(01)    
  ,CROSSCOUNTRYKM     number(04) default 0  
  ,CLUB               varchar(50) not null
  );
  
  
  create table TaFlights_Validate_Launch_Type
  ( 
   LAUNCHTIME         date not null
  ,FLIGHT_DURATION    int
  ,PLANEREGISTRATION  char(03) not null
  ,PILOT1INIT         char(04) not null
  ,PILOT2INIT         char(04)
  ,LAUNCH_TYPE        varchar2(100)
  ,CABLEBREAK         char(01)    
  ,CROSSCOUNTRYKM     number(04) default 0  
  ,CLUB               varchar(50) not null
  );
  
  
  create table TaFlights_Error
(
          idError           int primary key not null
        , launchtime        date not null
        , club              varchar(50) not null
        , dateError         date
        , step              varchar2(100)
        , dataError         varchar2(100)
        , typeError         varchar2(100)
        , status            varchar2(100)
); 
  
  
  
  
  create table TaFlights_Key_Pilots_1
(
      LAUNCHTIME         date not null
    , FLIGHT_DURATION    int
    , PLANEREGISTRATION  char(03) not null
    , PILOT1INIT         int not null
    , PILOT2INIT         char(04)
    , LAUNCH_TYPE        varchar2(100)
    , CABLEBREAK         char(01)   
    , CROSSCOUNTRYKM     number(04) default 0  
    , CLUB               varchar(50) not null
);


  create table TaFlights_Key_Pilots_2
(
      LAUNCHTIME         date not null
    , FLIGHT_DURATION    int
    , PLANEREGISTRATION  char(03) not null
    , PILOT1INIT         int not null
    , PILOT2INIT         int
    , LAUNCH_TYPE        varchar2(100)
    , CABLEBREAK         char(01)   
    , CROSSCOUNTRYKM     number(04) default 0  
    , CLUB               varchar(50) not null
);


  create table TaFlights_Key_Clubs
(
      LAUNCHTIME         date not null
    , FLIGHT_DURATION    int
    , PLANEREGISTRATION  char(03) not null
    , PILOT1INIT         int not null
    , PILOT2INIT         int
    , LAUNCH_TYPE        varchar2(100)
    , CABLEBREAK         char(01)   
    , CROSSCOUNTRYKM     number(04) default 0  
    , CLUB               int not null
);


  create table TaFlights_Key_Time
(
      LAUNCHTIME         int not null
    , FLIGHT_DURATION    int
    , PLANEREGISTRATION  char(03) not null
    , PILOT1INIT         int not null
    , PILOT2INIT         int
    , LAUNCH_TYPE        varchar2(100)
    , CABLEBREAK         char(01)   
    , CROSSCOUNTRYKM     number(04) default 0  
    , CLUB               int not null
);


  create table TaFlights_Key_Planes
(
      LAUNCHTIME         int not null
    , FLIGHT_DURATION    int
    , PLANEREGISTRATION  int not null
    , PILOT1INIT         int not null
    , PILOT2INIT         int
    , LAUNCH_TYPE        varchar2(100)
    , CABLEBREAK         char(01)   
    , CROSSCOUNTRYKM     number(04) default 0  
    , CLUB               int not null
);


-- ******************* End of TaFlight *******************


-- ******************* Create TaMembersChanges & Yesterday (Extract) *******************


-- Create table for data yesterday
create table TaMembers_Yesterday
       (
          MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , StatusStudent char(01) not null constraint coCHStatusStudentYesterday check (StatusStudent in ('Y', 'N'))
        , StatusPilot   char(01) not null constraint coCHStatusPilotYesterday check (StatusPilot in ('Y', 'N'))
        , StatusAsCat   char(01) not null constraint coCHStatusErHIYesterday check (StatusAsCat in ('Y', 'N'))
        , StatusFullCat char(01) not null constraint coCHStatusFullCatYesterday check (StatusFullCat in ('Y', 'N'))
        , Sex           char(01) not null constraint coCHSexYesterday check (Sex in ('M', 'F'))
        , Club          varchar2(50) not null constraint coFKtaMemberClubYesterday references taClubs
       )
; 
 
--Create table for changes of member
create table TaMembers_Changes
       (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberChanges primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , StatusStudent char(01) not null constraint coCHStatusStudentChanges check (StatusStudent in ('Y', 'N'))
        , StatusPilot   char(01) not null constraint coCHStatusPilotChanges check (StatusPilot in ('Y', 'N'))
        , StatusAsCat   char(01) not null constraint coCHStatusErHIChanges check (StatusAsCat in ('Y', 'N'))
        , StatusFullCat char(01) not null constraint coCHStatusFullCatChanges check (StatusFullCat in ('Y', 'N'))
        , Sex           char(01) not null constraint coCHSexChanges check (Sex in ('M', 'F'))
        , Club          varchar2(50) not null constraint coFKtaMemberClubChanges references taClubs
       )
;  

-- ******************* End of Creating TaMemberChanges & Yesterday  *******************


-- ******************* Creating TaMembersValidation  & Error (Transform) *******************



create table TaMembers_Validate_Status 
       (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Status        varchar2(50) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        )
        ;

create table TaMembers_Validate_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(3,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        , Status        varchar2(50) not null
        )
        ;
        
create table TaMembers_Validate_TEST_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(38,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        , Status        varchar2(50) not null
        , typeError     varchar2(100)
        )
        ;
        
create table TaMembers_Error
(
          idError int primary key not null
        , Operation varchar2(50) not null
        , MemberNo number(6,0) not null
        , dateError date
        , step varchar2(100)
        , dataError varchar2(100)
        , typeError varchar2(100)
        , status varchar2(100)
); 




-- *******************  All the sequence needed *******************


-- transform member init

create sequence seq_TRANSFORM_ERROR_ID
  start with 1
  increment by 1
  cache 100
  noMaxValue
;


-- load member init
create sequence seq_LOAD_MEMBER_ID
  start with 1
  increment by 1
  cache 100
  noMaxValue
;


-- transform flight init
create sequence seq_TRANSFORM_FLIGHT_ERROR_ID
  start with 1
  increment by 1
  cache 100
  noMaxValue
;

-- load flight init
create sequence seq_LOAD_BRIDGEPILOTFLIGHTS
  start with 1
  increment by 1
  cache 100
  noMaxValue
;

create sequence seq_LOAD_FACT
  start with 1
  increment by 1
  cache 100
  noMaxValue
;

-- ******************* End of Sequence  ******************