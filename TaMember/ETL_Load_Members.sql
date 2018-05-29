-- This will load the data into D_Members. 





-- DELETED ROWS : we update the 'valid to' to today




update D_MEMBERS 
set VALID_TO = trunc(sysdate -1, 'DAY')
where member_id IN (
    select memberno 
    from TAMEMBERS_VALIDATE_AGE 
    where operation='DEL' OR operation='CHGD' OR operation='BDY'
    )
    AND VALID_TO = to_date('9999-12-31', 'YYYY-MM-DD')
;




-- NEW ROWS : we update the 'valid to' to today




insert into D_MEMBERS (MEMBER_CHANGE_ID,  MEMBER_ID,  INITIALS,  NAME,  ADRESS,  ZIPCODE,  DATEBORN,  AGE,  DATEJOINED,  DATELEFT,  OWNSPLANEREG,
                      SEX,  CLUB_ID,  STATUS,  VALID_FROM,  VALID_TO)

  select seq_LOAD_MEMBER_ID.nextval as MEMBER_CHANGE_ID
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
      ,  sysdate as VALID_FROM
      ,  to_date('9999-12-31', 'YYYY-MM-DD') as VALID_TO
      
  from TAMEMBERS_VALIDATE_AGE
  where operation='INS' or operation='CHGD' OR operation='BDY';
  
  