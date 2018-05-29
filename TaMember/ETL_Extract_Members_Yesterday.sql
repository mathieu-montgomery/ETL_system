-- This should be launch after one cycle of ETL of members. It will simply copy all data from TaMembers into TaMembers_Yesterday

TRUNCATE TABLE TaMembers_Yesterday;

Insert into TaMembers_Yesterday (MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, DATEJOINED, DATELEFT, OWNSPLANEREG, STATUSSTUDENT, 
                              STATUSPILOT, STATUSASCAT, STATUSFULLCAT, SEX, CLUB )
  select 
       MEMBERNO
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
  
  from taMembers;

  
  
