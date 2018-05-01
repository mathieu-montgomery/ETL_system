set serveroutput on;

 declare
 
   oneFineMinute interval day to second := to_dsInterval ('000 00:01:00');
   firstDate date := to_date('2014-03-02 00:00:00','YYYY-MM-DD HH24:MI:SS');
   
 begin
 
   for i in 1..5256000 loop                
       
    insert into D_TIME (ID_Time, Year_time, Month_time, Day_time, Hour_time, Minute_time)
     values (i,  extract(YEAR FROM firstdate), 
                 extract(MONTH FROM firstdate), 
                 extract(DAY FROM firstdate), 
                 extract (HOUR from cast (firstDate as timestamp)), 
                 extract (MINUTE from cast (firstDate as timestamp)));
   
     firstDate := firstDate + oneFineMinute;
    
   end loop;
 end;

create index D_time_index on D_TIME (Year_time, Month_time, Day_time, Hour_time, Minute_time);
