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