-- This should be launch after one cycle of ETL of flights. It will simply copy all data from TAFLIGHTS into TAFLIGHTS_Yesterday


TRUNCATE TABLE TAFLIGHTS_Yesterday;

Insert into TAFLIGHTS_Yesterday (LAUNCHTIME,  LANDINGTIME,  PLANEREGISTRATION,  PILOT1INIT,  PILOT2INIT,  LAUNCHAEROTOW,  LAUNCHWINCH,  LAUNCHSELFLAUNCH,  
                                CABLEBREAK, CROSSCOUNTRYKM, CLUB)
  select LAUNCHTIME
      ,  LANDINGTIME
      ,  PLANEREGISTRATION
      ,  PILOT1INIT
      ,  PILOT2INIT
      ,  LAUNCHAEROTOW
      ,  LAUNCHWINCH
      ,  LAUNCHSELFLAUNCH
      ,  CABLEBREAK
      ,  CROSSCOUNTRYKM
      ,  CLUB  
  
  from TAFLIGHTS;
  
