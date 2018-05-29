--This will compare the data from the table TaMembers_Yesterday and the current TaMembers to find new/updated/deleted/birthday rows.
--The new/updated/deleted/birthday will go into the table TaMembers_Changes.




-- New Row added



TRUNCATE TABLE TaMembers_Changes;

Insert into TaMembers_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
                              STATUSPILOT, STATUSASCAT, STATUSFULLCAT, SEX, CLUB )
  select 'INS' as OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  STATUSSTUDENT
    ,  STATUSPILOT
    ,  STATUSASCAT
    ,  STATUSFULLCAT
    ,  SEX
    ,  CLUB
  
  from taMembers
  
  where memberNO in (
    select memberNO from TaMembers
    minus
    select memberNO from TaMembers_Yesterday
  );
  



-- Deleted Row 




Insert into TaMembers_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
                              STATUSPILOT, STATUSASCAT, STATUSFULLCAT, SEX, CLUB )
  select 'DEL' as OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  STATUSSTUDENT
    ,  STATUSPILOT
    ,  STATUSASCAT
    ,  STATUSFULLCAT
    ,  SEX
    ,  CLUB
  
  from taMembers_Yesterday
  
  where memberNO in (
      select memberNO from TaMembers_Yesterday
        minus
      select memberNO from TaMembers
  );
  
  
  

-- Changed Row 




Insert into TaMembers_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
                              STATUSPILOT, STATUSASCAT, STATUSFULLCAT, SEX, CLUB )
  select 'CHGD' as OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  STATUSSTUDENT
    ,  STATUSPILOT
    ,  STATUSASCAT
    ,  STATUSFULLCAT
    ,  SEX
    ,  CLUB
  
  from (select * from TaMembers 
        minus 
        select * from TaMembers_Yesterday) changes
            
  where not changes.memberno in (
          select memberno from TaMembers 
          minus
          select memberno from TaMembers_Yesterday)
;
  
  

  
-- Birthday Row 




Insert into TaMembers_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
                              STATUSPILOT, STATUSASCAT, STATUSFULLCAT, SEX, CLUB )
  select 'BDY' as OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  STATUSSTUDENT
    ,  STATUSPILOT
    ,  STATUSASCAT
    ,  STATUSFULLCAT
    ,  SEX
    ,  CLUB
  
  from taMembers
  
  where (
    extract (day from DATEBORN) = extract(day from sysdate)
    and extract (month from DATEBORN) = extract (month from sysdate) 
  )
  and not MEMBERNO in (select MEMBERNO from TaMembers_Changes)
;