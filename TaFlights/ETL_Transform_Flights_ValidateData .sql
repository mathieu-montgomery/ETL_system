truncate table TaFlight_Validate_Duration;
truncate table TaFlight_Validate_Pilot_Initials;
truncate table TaFlight_Validate_Launch_Type;

-- Validate the duration
insert into TaFlight_Validate_Duration  (LAUNCHTIME,  PLANEREGISTRATION,  PILOT1INIT,  PILOT2INIT
                                          ,LAUNCHAEROTOW,  LAUNCHWINCH,  LAUNCHSELFLAUNCH,  CABLEBREAK,  CROSSCOUNTRYKM,  CLUB, FLIGHT_DURATION)

  select LAUNCHTIME
    ,  PLANEREGISTRATION
    ,  PILOT1INIT
    ,  PILOT2INIT
    ,  LAUNCHAEROTOW
    ,  LAUNCHWINCH
    ,  LAUNCHSELFLAUNCH
    ,  CABLEBREAK
    ,  CROSSCOUNTRYKM
    ,  CLUB
    ,  TRUNC((LANDINGTIME - LAUNCHTIME)*24*60, 0) as FLIGHT_DURATION
    
    from TAFLIGHTS_New
    where TRUNC((LANDINGTIME - LAUNCHTIME)*24*60, 0) > 0 and extract(year from LANDINGTIME) < 9999;
    

insert into TaFlights_Error (idError, launchtime, flight_duration, club, dateError, step, dataError, typeError, status)        
  
  select  seq_TRANSFORM_FLIGHT_ERROR_ID.nextval as idError
        , launchtime
        , club
        , sysdate as dateError
        , 'Duration' as step
        , TRUNC((LANDINGTIME - LAUNCHTIME)*24*60, 0) as dataError
        , case 
          when (LAUNCHTIME - LANDINGTIME) <= 0 then 'Duration < 0'
          when extract(year from LANDINGTIME) = 9999 then 'Duration no ending'
          end as typeError
        , 'Not fixed' as status
    
    from TAFLIGHTS_New
    where (LAUNCHTIME - LANDINGTIME) <= 0 and extract(year from LANDINGTIME) = 9999;
    
    
    
    
-- Validate the pilote
insert into TaFlight_Validate_Pilot_Initials (LAUNCHTIME,  PLANEREGISTRATION,  PILOT1INIT,  PILOT2INIT
                                          ,LAUNCHAEROTOW,  LAUNCHWINCH,  LAUNCHSELFLAUNCH,  CABLEBREAK,  CROSSCOUNTRYKM,  CLUB, FLIGHT_DURATION)
                                          
      select LAUNCHTIME
      ,  PLANEREGISTRATION
      ,  PILOT1INIT
      ,  PILOT2INIT
      ,  LAUNCHAEROTOW
      ,  LAUNCHWINCH
      ,  LAUNCHSELFLAUNCH
      ,  CABLEBREAK
      ,  CROSSCOUNTRYKM
      ,  CLUB
      ,  FLIGHT_DURATION
      
      from TaFlights_Validate_Duration
      where (PILOT1INIT != '    ' 
                and PILOT1INIT != PILOT2INIT   
                and (PILOT1INIT) in (select INITIALS from D_members)) 
                and (
                        (PILOT2INIT != '    ' and PILOT2INIT in (select INITIALS from D_members) 
                    OR 
                        (PILOT2INIT = '    ')
            ));
            
insert into TaFlights_Error (idError, launchtime, flight_duration, club, dateError, step, dataError, typeError, status)        
  
  select  seq_TRANSFORM_FLIGHT_ERROR_ID.nextval as idError
        , launchtime
        , club
        , sysdate as dateError
        , 'Duration' as step
        , 'P1 :' || PILOT1INIT || 'P2 : ' || PILOT2INIT as dataError
        , case 
            when PILOT1INIT = '    '  then 'Pilote 1 not exist'
            when PILOT1INIT = PILOT2INIT then 'Pilote 1 and 2 the same'
            when (PILOT1INIT) not in (select INITIALS from D_members) then 'Pilote 1 is written but not int D_Members'
            when (PILOT2INIT != '    ' and PILOT2INIT not in (select INITIALS from D_members)) then 'Pilote 2 is written but not in D_Members'
          end as typeError
        , 'Not fixed' as status
    
    from TaFlights_Validate_Duration
    where (PILOT1INIT = '    ' 
                or PILOT1INIT = PILOT2INIT   
                or (PILOT1INIT) not in (select INITIALS from D_members)) 
                or (
                        (PILOT2INIT != '    ' and PILOT2INIT not in (select INITIALS from D_members) 
                    or 
                        (PILOT2INIT = '    ')
            ));

-- Validate the launchtype 
insert into TaFlights_Validate_Launch_Type (LAUNCHTIME, FLIGHT_DURATION, PLANEREGISTRATION, PILOT1INIT, PILOT2INIT, LAUNCH_TYPE, 
                                            CABLEBREAK, CROSSCOUNTRYKM, CLUB)            

  select  LAUNCHTIME
        , FLIGHT_DURATION
        , PLANEREGISTRATION
        , PILOT1INIT
        , PILOT2INIT
        , case LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH 
                when 'YNN' then 'Launch aerotow' 
                when 'NYN' then 'Launch winch'    
                when 'NNY' then 'Self launch'
              end as LAUNCH_TYPE
        , CABLEBREAK
        , CROSSCOUNTRYKM
        , CLUB
   
  
  from TaFlight_Validate_Pilot_Initials
  where regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y')=1; 
  
insert into TaFlights_Error (idError, launchtime, flight_duration, club, dateError, step, dataError, typeError, status)        
  
  select  seq_TRANSFORM_FLIGHT_ERROR_ID.nextval as idError
        , launchtime
        , club
        , sysdate as dateError
        , 'Duration' as step
        , 'Launch Type' || LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH  as dataError
        , case 
          when regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y') = 0 then 'No launch type'
          when regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y') > 1 then 'Too much launch type'
          end as typeError
        , 'Not fixed' as status
    
    from TaFlight_Validate_Pilot_Initials
    where regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y') = 0 or regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y') > 1;



