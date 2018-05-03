truncate table TaMember_Validate_Status;
truncate table TaMember_Error_Status;
truncate table TaMember_Validate_TEST_age;
truncate table TaMember_Error_age;
truncate table TaMember_Validate_age;


-- Select the people that have only one status
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
    ,  case STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT 
        when 'YNNN' then 'Student' 
        when 'NYNN' then 'Pilot'    
        when 'NNYN' then 'Assistant category pilot'
        when 'NNNY' then 'Full category pilot'
      end as STATUS
  
  from TaMember_Changes
  where regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')=1; 
  
-- Select the people that have more than one status : errors
insert into TaMember_Error ( idError, Operation, MemberNo, dateError, step, dataError, typeError, status)

select 
       seq_TRANSFORM_ERROR_ID.nextval as idError 
    ,  OPERATION
    ,  MEMBERNO
    ,  sysdate as dateError
    , 'Validate Status' as step
    , (STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT) as dataError
    ,  case
          when  regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')>1 then 'To much status'
          when  regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')=0 then 'No status'
       end as typeError
    , 'Not fixed' as status
  from TaMember_Changes
  where regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')>1 OR regexp_count(STATUSSTUDENT || STATUSPILOT || STATUSASCAT || STATUSFULLCAT, 'Y')=0; 
  
  -- Set the age to people
insert into TaMember_Validate_TEST_age (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, AGE, DATEJOINED, DATELEFT, OWNSPLANEREG,  
                            SEX, CLUB, STATUS)

select OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  trunc (to_number((to_number(to_char(sysdate,'YYYYMMDD'))- to_number(to_char(dateborn,'YYYYMMDD')))/10000))
        as AGE
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  SEX
    ,  CLUB
    ,  STATUS


  from TaMember_Validate_Status;
  
-- Select the lines that have a error in the age
insert into TaMember_Error ( idError, Operation, MemberNo, dateError, step, dataError, typeError, status)

select 
       seq_TRANSFORM_ERROR_ID.nextval as idError
    ,  OPERATION 
    ,  MEMBERNO
    ,  sysdate as dateError
    ,  'Validate age' as step
    ,  ('AGE : ' || AGE) as dataError
    ,  CASE 
        when AGE > 130 then 'Age to high' 
        when AGE < 5 then 'Age to low'
      end as typeError
    , 'Not fixed' as status
    
  from TaMember_Validate_TEST_age where AGE >130 OR AGE < 5;  


-- Select the people that have no errors
insert into TaMember_Validate_age (OPERATION, MEMBERNO, INITIALS, NAME, ADDRESS, ZIPCODE, DATEBORN, AGE, DATEJOINED, DATELEFT, OWNSPLANEREG,  
                            SEX, CLUB, STATUS)

select OPERATION 
    ,  MEMBERNO
    ,  INITIALS
    ,  NAME
    ,  ADDRESS
    ,  ZIPCODE
    ,  DATEBORN
    ,  AGE
    ,  DATEJOINED
    ,  DATELEFT
    ,  OWNSPLANEREG
    ,  SEX
    ,  CLUB
    ,  STATUS

  from TaMember_Validate_TEST_age
  where AGE < 130 AND AGE > 5;  


