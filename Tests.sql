truncate table tamembers_yesterday;
truncate table tamembers_changes; 
truncate table tamembers_error;
truncate table D_Members;

select * from tamembers_changes;

select * from tamembers_yesterday;

DELETE FROM tamembers
WHERE memberno = 9991;

DELETE FROM tamembers
WHERE memberno = 9990;

UPDATE tamembers
SET Name = 'Mathieu Dudfdrendal'
WHERE memberno=152;

UPDATE tamembers
SET Name = 'Mallé KJHKJHG'
WHERE memberno=153;

INSERT INTO tamembers
VALUES
(    9991
  ,  'MATM'
  ,  'Leander Holm'
  ,  '4 rue'
  ,  6755
  ,  '01/05/1998'
  ,  sysdate
  ,  null
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'Y'
  ,  'M'
  ,  'Vejle');
  
  INSERT INTO tamembers
VALUES
(    9990
  ,  'ITM'
  ,  'Mallé Marega'
  ,  '5 rue'
  ,  6755
  ,  '01/05/1998'
  ,  '05/09/2006'
  ,  null
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'Y'
  ,  'N'
  ,  'M'
  ,  'Vejle');
  
UPDATE tamembers
SET Dateborn = '01/05/1800'
WHERE memberno=250;

UPDATE tamembers
SET Dateborn = '01/05/2020'
WHERE memberno=251;

select * from taflightssg70;


select i.pilot1Init
      , i.pilot2Init
      , coalesce(p.id, -1)
      , i.duration
from tempflight i
left outer join d_planes p on 
  (p.registration = i.planeRegistration 
  and p.validTo = to_date('9999-12-31 00:00:00', 'YYYY-MM-DD, HH24..')
  );
-- make a -1 row on plane so if p.registration = null, then take this row


  declare
  begin
  for c in (select pilot1init, pilot2init, duration from tempFlight) loop
    if c.pilot2Init='   ' then
      dbms.output.put_line('single pilot flight');
    end if;
  end loop;
  end;
  -- See if on or more pilot
  
  -- For the bridge table : use a sequence for group ID : incremente only for first row of every new group! 
  -- Index the table datetime on day month year hour and min 
  create index Jan on tableX (cd1, cd2, ..);
    
    
    select * from tamembers_changes;
  
truncate table TaMembers_Validate_Status;
truncate table TaMembers_Error_Status; 

select * from TaMembers_Validate_Status;

select * from TaMembers_Error_Status;

select * from TaMembers_Error_AGE;

select * from TAMEMBERs_VALIDATE_AGE;

select * from d_members where MEMBER_ID=9990;

select * from taflights where regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y')=0;






-- Flights

select * from taflightsvejle;
select * from taflightssg70;

select * from taflights_new;


insert into taFlightsVejle (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2017-08-11 10:09', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2017-08-11 16:34', 'YYYY-MM-DD HH24:MI' ) , 'XKB' , 'VAAH' , '    ' , 'N' , 'Y' , 'Y' , 'N' ,    0);
insert into taFlightsVejle (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2014-05-05 11:32', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2014-05-05 12:43', 'YYYY-MM-DD HH24:MI' ) , 'PEX' , 'ARDA' , 'ARNG' , 'N' , 'Y' , 'N' , 'N' ,    0);
insert into taFlightsVejle (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2015-07-16 13:07', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2015-07-16 17:05', 'YYYY-MM-DD HH24:MI' ) , 'XGL' , 'ARIV' , '    ' , 'N' , 'Y' , 'N' , 'Y' ,  424);

insert into taFlightsSG70 (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2016-07-24 12:13', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2016-07-24 15:40', 'YYYY-MM-DD HH24:MI' ) , 'MXH' , 'ARGR' , 'ARWI' , 'Y' , 'N' , 'N' , 'N' ,    0);
insert into taFlightsSG70 (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2017-08-22 10:16', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2017-08-22 13:28', 'YYYY-MM-DD HH24:MI' ) , 'CLX' , 'FEFI' , '    ' , 'Y' , 'N' , 'N' , 'N' ,    0);
insert into taFlightsSG70 (launchTime, landingTime, planeRegistration, pilot1Init, pilot2Init, launchAerotow, launchWinch,launchSelfLaunch, cableBreak, CrossCountryKm)  
  values ( to_date('2017-04-26 12:09', 'YYYY-MM-DD HH24:MI' ) ,  to_date('2017-04-26 15:44', 'YYYY-MM-DD HH24:MI' ) , 'FXF' , 'JAAH' , '    ' , 'N' , 'N' , 'Y' , 'N' ,  261);

select initials from tamembers;
truncate table TAFLIGHTS_KEY_TIME;

select * from TaFlights_key_pilots_2 where ;

select * from taflights_new;
select * from taflights_validate_duration;
select * from TaFlights_Error;
select * from taflights_validate_pilot_initials;
select * from taflights_validate_launch_type;
select * from D_clubs;


select * from taflights_key_pilots_1;
select * from taflights_key_pilots_2;
select * from taflights_key_clubs;
select * from f_flights;

select * from d_members where initials='OSDA';


  

