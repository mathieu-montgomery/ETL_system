truncate table tamember_yesterday;
truncate table tamember_changes; 
truncate table tamember_error;
truncate table D_Member;

select * from tamember_changes;

select * from tamember_yesterday;



DELETE FROM tamember
WHERE memberno = 9991;

DELETE FROM tamember
WHERE memberno = 9990;

UPDATE tamember
SET Name = 'Mathieu Dudfdrendal'
WHERE memberno=152;

UPDATE tamember
SET Name = 'Mall� KJHKJHG'
WHERE memberno=153;

INSERT INTO tamember
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
  
  INSERT INTO tamember
VALUES
(    9990
  ,  'ITM'
  ,  'Mall� Marega'
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
  
UPDATE tamember
SET Dateborn = '01/05/1800'
WHERE memberno=250;

UPDATE tamember
SET Dateborn = '01/05/2020'
WHERE memberno=251;

select * from taflightssg70;


select i.pilot1Init
      , i.pilot2Init
      , coalesce(p.id, -1)
      , i.duration
from tempflight i
left outer join d_plane p on 
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
    
    
    select * from tamember_changes;
  
truncate table TaMember_Validate_Status;
truncate table TaMember_Error_Status; 

select * from TaMember_Validate_Status;

select * from TaMember_Error_Status;

select * from TaMember_Error_AGE;

select * from TAMEMBER_VALIDATE_AGE;

select * from d_member where MEMBER_ID=9990;

select * from taflights where regexp_count(LAUNCHAEROTOW || LAUNCHWINCH || LAUNCHSELFLAUNCH, 'Y')=0;