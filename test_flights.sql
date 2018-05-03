
insert into TAFLIGHTSVEJLE
VALUES 
( 
'01/05/18',
'01/05/18',
'XGL',
'SIWI',
'VAWI',
'N',
'N',
'N',
'Y',
'0'
);


insert into TAFLIGHTSVEJLE
VALUES 
( 
(to_date('2018-05-01 10:08', 'YYYY-MM-DD HH24:MI' )),
(to_date('2018-05-01 12:00', 'YYYY-MM-DD HH24:MI' )),
'BXU',
'WIPA',
'TIIV',
'N',
'N',
'Y',
'N',
'0'
);


select * from TaFlight_Validate_Duration;
select * from TaFlight_Error;

select * from TAFLIGHTS_New;


select * from TAFLIGHTSSG70;