-- Key lookup for the pilote 1
truncate table TaFlights_key_pilots_1;
truncate table TaFlights_key_pilots_2;
truncate table TaFlights_key_clubs;
truncate table TaFlights_key_time;
truncate table TaFlights_key_Planes;

INSERT INTO TaFlights_key_pilots_1 (LAUNCHTIME, FLIGHT_DURATION,PLANEREGISTRATION,PILOT1INIT,PILOT2INIT,LAUNCH_TYPE,CABLEBREAK,CROSSCOUNTRYKM,CLUB)

select 
      i.launchtime
    , i.flight_duration
    , i.planeregistration
    , coalesce(p.member_change_ID, -1) --Pilot 1 lookup
    , i.pilot2init
    , i.launch_type
    , i.cablebreak
    , i.crosscountrykm
    , i.club

  from taflights_validate_launch_type i
      left outer join D_Members p on 
        (
          p.INITIALS = i.pilot1init
          and p.valid_To = to_date('9999-12-31', 'YYYY-MM-DD')
        )
;
-- Key lookup for the pilote 2

INSERT INTO TaFlights_key_pilots_2 (LAUNCHTIME, FLIGHT_DURATION,PLANEREGISTRATION,PILOT1INIT,PILOT2INIT,LAUNCH_TYPE,CABLEBREAK,CROSSCOUNTRYKM,CLUB)

select 
      i.launchtime
    , i.flight_duration
    , i.planeregistration
    , i.pilot1Init
    , coalesce(p.member_change_ID, -1) --Pilot2 lookup
    , i.launch_type
    , i.cablebreak
    , i.crosscountrykm
    , i.club

  from TaFlights_key_pilots_1 i
      left outer join D_Members p on 
        (
          p.INITIALS = i.pilot2init
          and p.valid_To = to_date('9999-12-31', 'YYYY-MM-DD')
        )
;








-- Key lookup for the clubs

INSERT INTO TaFlights_key_clubs (LAUNCHTIME, FLIGHT_DURATION,PLANEREGISTRATION,PILOT1INIT,PILOT2INIT,LAUNCH_TYPE,CABLEBREAK,CROSSCOUNTRYKM,CLUB)

select 
      i.launchtime
    , i.flight_duration
    , i.planeregistration
    , i.pilot1Init
    , i.pilot2Init
    , i.launch_type
    , i.cablebreak
    , i.crosscountrykm
    , coalesce(p.CLUB_CHANGE_ID, -1)  --Clubs id lookup

  from TaFlights_key_pilots_2 i
      left outer join D_Clubs p on 
        (
          p.NAMECLUB = i.CLUB
          and p.valid_To = to_date('9999-12-31', 'YYYY-MM-DD')
        )
;





-- Key lookup for the Time

INSERT INTO TaFlights_key_time (LAUNCHTIME, FLIGHT_DURATION,PLANEREGISTRATION,PILOT1INIT,PILOT2INIT,LAUNCH_TYPE,CABLEBREAK,CROSSCOUNTRYKM,CLUB)

select 
      coalesce(p.ID_TIME, -1)  --Time id lookup
    , i.flight_duration
    , i.planeregistration
    , i.pilot1Init
    , i.pilot2Init
    , i.launch_type
    , i.cablebreak
    , i.crosscountrykm
    , i.club

  from TaFlights_key_clubs i
      left outer join D_Time p on 
        (
              p.YEAR_TIME   =  extract(YEAR from i.launchtime)
          AND p.MONTH_TIME  =  extract(MONTH from i.launchtime)
          AND p.DAY_TIME    =  extract(DAY from i.launchtime)
          AND p.HOUR_TIME   =  extract (HOUR from cast (i.launchtime as timestamp))
          AND p.MINUTE_TIME =  extract (MINUTE from cast (i.launchtime as timestamp))
        )
;






-- Key lookup for the planes registration

INSERT INTO TaFlights_key_Planes (LAUNCHTIME, FLIGHT_DURATION,PLANEREGISTRATION,PILOT1INIT,PILOT2INIT,LAUNCH_TYPE,CABLEBREAK,CROSSCOUNTRYKM,CLUB)

select 
      i.launchtime
    , i.flight_duration
    , coalesce(p.PLANE_CHANGE_ID, -1) --Planes registration lookup
    , i.pilot1Init
    , i.pilot2Init
    , i.launch_type
    , i.cablebreak
    , i.crosscountrykm
    , i.club

  from TaFlights_key_Time i
      left outer join D_Planes p on 
        (
          p.REGISTRATIONNUMBER_ID = i.PLANEREGISTRATION 
          and p.valid_To = to_date('9999-12-31', 'YYYY-MM-DD')
        )
; 
