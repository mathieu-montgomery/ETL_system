select case column_id 
  when 1 then 'select ' || column_name
  else '  ,  ' || column_name
  end
  from dba_tab_cols
  where owner='DWH'
  and table_name = 'TAFLIGHTS';
  

select sysdate from dual;
select sysdate, trunc (sysdate -1, 'DAY') from dual;

create sequence sqlDWHDemo
  start with 1
  increment by 1
  cache 100
  noMaxValue
;

select sqlDWHDemo.nextval from dual;

select sqlDWHDemo.currval from dual;

insert 
  into dimPilote(id, memberno...)
    select sqDimPilot.nextval
  ,
;

select sysdate, sysdate + to_dsInterval('000 01:00:00')
from dual;