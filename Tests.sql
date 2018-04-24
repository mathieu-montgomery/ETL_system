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
SET Name = 'Mallé KJHKJHG'
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
  
UPDATE tamember
SET Dateborn = '01/05/1800'
WHERE memberno=250;

UPDATE tamember
SET Dateborn = '01/05/2020'
WHERE memberno=251;

show create table taflightssg70;

select * from taflightssg70;
  
  
truncate table TaMember_Validate_Status;
truncate table TaMember_Error_Status; 

select * from TaMember_Validate_Status;

select * from TaMember_Error_Status;

select * from TaMember_Error_AGE;

select * from TAMEMBER_VALIDATE_AGE;

select * from d_member where MEMBER_ID=9990;