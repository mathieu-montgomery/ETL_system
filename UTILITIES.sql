select case column_id 
  when 1 then 'select ' || column_name
  else '  ,  ' || column_name
  end
  from dba_tab_cols
  where owner='DWH'
  and table_name = 'TAMEMBER';