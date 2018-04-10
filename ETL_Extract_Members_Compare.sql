-- New Row added

Insert into TaMember_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
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
  
  from taMember
  
  where memberNO in (
    select memberNO from TaMember
    minus
    select memberNO from TaMember_Yesterday
  );
  
-- Deleted Row 

Insert into TaMember_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
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
  
  from taMember_Yesterday
  
  where memberNO in (
      select memberNO from TaMember_Yesterday
        minus
      select memberNO from TaMember
  );
  
  
  
-- Changed Row 

Insert into TaMember_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
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
  
  from (select * from TaMember 
        minus 
        select * from TaMember_Yesterday) changes
            
  where not changes.memberno in (
          select memberno from TaMember 
          minus
          select memberno from TaMember_Yesterday)
;
  
  
  
-- Birtdhay Row 

Insert into TaMember_Changes (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
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
  
  from taMember
  
  where (
    extract (day from DATEBORN) = extract(day from sysdate)
    and extract (month from DATEBORN) = extract (month from sysdate) 
  )
  and not MEMBERNO in (select MEMBERNO from TaMember_Changes)
;