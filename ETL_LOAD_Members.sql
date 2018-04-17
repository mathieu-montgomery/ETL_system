-- DELETED ROWS : we update the 'valid to' to today

update D_MEMBER 
set VALID_TO = trunc(sysdate -1, 'DAY')
where member_id IN (
    select memberno 
    from TAMEMBER_VALIDATE_AGE 
    where operation='DEL' OR operation='CHGD'
    )
    AND VALID_TO = to_date('9999-12-31', 'YYYY-MM-DD')
;

-- NEW ROWS : we update the 'valid to' to today

insert into D_MEMBER (MEMBER_CHANGE_ID,  MEMBER_ID,  INITIALS,  NAME,  ADRESS,  ZIPCODE,  DATEBORN,  AGE,  DATEJOINED,  DATELEFT,  OWNSPLANEREG,
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
      
  from TAMEMBER_VALIDATE_AGE
  where operation='INS' or operation='CHGD';
  
  