 set serveroutput on;

 declare
 
   id_group number (10);
   has_group number(1);
   
   cursor c1 is select * from TaFlights_key_planes;
 begin
 
      for c in c1 loop
      
          id_group := -1;
          has_group := 0;
          
          if( c.pilot2Init = -1) then           -- Only one pilot   
            select count(FLIGHT_GROUP_ID) into has_group from BRIDGEPILOTFLIGHTS where member_id = c.pilot1Init AND weight = 1;
            
            
                 if(has_group=1) then
                    select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS where member_id = c.pilot1Init  AND weight = 1;
                
                else                -- The group does not exist
                    insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.nextval, c.pilot1Init, 1);
                    select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS where member_id= c.pilot1Init AND weight = 1;
                end if;

            
            
           else                                      -- Two pilots
    
              select count(FLIGHT_GROUP_ID) into has_group from BRIDGEPILOTFLIGHTS where member_id=c.pilot1Init  AND weight = 0.5 AND FLIGHT_GROUP_ID in (select FLIGHT_GROUP_ID from BRIDGEPILOTFLIGHTS where member_id=c.pilot2Init and weight=0.5);
              
              if(has_group=1) then
                  select FLIGHT_GROUP_ID into id_group from BRIDGEPILOTFLIGHTS 
                      where c.pilot1Init = member_id  
                      AND weight = 0.5
                      AND FLIGHT_GROUP_ID in (select FLIGHT_GROUP_ID from BRIDGEPILOTFLIGHTS where c.pilot2Init = member_id and weight=0.5);

              else              -- The group does not exist
                  insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.nextval, c.pilot1Init, 0.5);
                  insert into BRIDGEPILOTFLIGHTS (FLIGHT_GROUP_ID,MEMBER_ID,WEIGHT) VALUES (seq_LOAD_BRIDGEPILOTFLIGHTS.currval, c.pilot2Init, 0.5);
                  id_group := seq_LOAD_BRIDGEPILOTFLIGHTS.currval;

              end if;
          end if;
                
      
       Insert into F_Flights (FLIGHT_ID, PLANE_ID, FLIGHT_GROUP_ID, CLUB_ID, TIME_ID, LAUNCH_TYPE_ID, INCIDENT, DISTANCE, FLIGHT_DURATION)
        values(
               seq_LOAD_FACT.nextval
            ,  c.PLANEREGISTRATION
            ,  id_group
            ,  c.CLUB
            ,  c.LAUNCHTIME
            ,  c.LAUNCH_TYPE
            ,  c.CABLEBREAK
            ,  c.CROSSCOUNTRYKM
            ,  c.FLIGHT_DURATION     
        );
        
        
      end loop;
 end;