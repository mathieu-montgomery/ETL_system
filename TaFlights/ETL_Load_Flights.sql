set serveroutput on;

 declare
 
   id_group int;
   
 begin
 
   for c in (select pilot1init, pilot2init from TaFlights_key_planes) loop
      id_group := -1;
      
      if( c.pilot2Init = '    ') then           -- Only one pilot
          select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS where c.pilot1Init = member_id AND weight = 1;
          
          if(id_group = -1) then                -- The group does not exist
              insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.nextval, c.pilot1Init, 1);
              select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS where c.pilot1Init = member_id AND weight = 1;
          end if;
          
          
          
      else                                      -- Two pilots
          select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS 
          where c.pilot1Init = member_id  
                AND weight = 0.5
                AND FLIGHT_GROUP_ID in (select FLIGHT_GROUP_ID from BRIDGEPILOTFLIGHTS where c.pilot2Init = member_id and weight=0.5);
          
          if(id_group = -1) then                -- The group does not exist
              insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.nextval, c.pilot1Init, 0.5);
              insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.currval, c.pilot2Init, 0.5);
              id_group := seq_LOAD_BRIDGEPILOTFLIGHTS.currval;
          end if;
      end if;
      
      
        Insert into F_Flights (FLIGHT_ID, PLANE_ID, FLIGHT_GROUP_ID, CLUB_ID, TIME_ID, LAUNCH_TYPE_ID, INCIDENT, DISTANCE, FLIGHT_DURATION)
        values(
               seq_LOAD_FACT.nextval
            ,  PLANEREGISTRATION
            ,  id_group
            ,  CLUB
            ,  LAUNCHTIME
            ,  LAUNCH_TYPE
            ,  CABLEBREAK
            ,  CROSSCOUNTRYKM
            ,  FLIGHT_DURATION     
        );
      
      end loop;
   
   
 end;