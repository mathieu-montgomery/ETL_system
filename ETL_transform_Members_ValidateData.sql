


insert into TaMember_Validate_Status (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG,  
                            SEX, CLUB, STATUS)

select OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  SEX
    ,  CLUB
    ,  TODO as STATUS
  
  from TaMember_Changes
  where regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')=1; 
  


