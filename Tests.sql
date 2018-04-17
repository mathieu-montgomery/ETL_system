truncate table tamember_yesterday;
truncate table tamember_changes; 

select * from tamember_changes;

select * from tamember_yesterday;

UPDATE tamember
SET Name = 'Mathieu Durendal'
WHERE memberno=153;

DELETE FROM tamember
WHERE memberno = 154;

DELETE FROM tamember
WHERE memberno = 155;
DELETE FROM tamember
WHERE memberno = 156;
DELETE FROM tamember
WHERE memberno = 157;
INSERT INTO tamember
VALUES
(    9999
  ,  'MATM'
  ,  'Mathieu Montgomery'
  ,  '3 rue'
  ,  6755
  ,  '01/05/1998'
  ,  '05/09/2006'
  ,  null
  ,  'Y'
  ,  'N'
  ,  'Y'
  ,  'N'
  ,  'Y'
  ,  'M'
  ,  'Vejle');
  
  INSERT INTO tamember
VALUES
(    9998
  ,  'ITM'
  ,  'Josiane Malacha'
  ,  '3 rue'
  ,  6755
  ,  '01/05/1998'
  ,  '05/09/2006'
  ,  null
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'N'
  ,  'M'
  ,  'Vejle');
  
UPDATE tamember
SET Dateborn = '01/05/1800'
WHERE memberno=250;

UPDATE tamember
SET Dateborn = '01/05/2020'
WHERE memberno=251;
  
  
truncate table TaMember_Validate_Status;
truncate table TaMember_Error_Status; 

select * from TaMember_Validate_Status;

select * from TaMember_Error_Status;