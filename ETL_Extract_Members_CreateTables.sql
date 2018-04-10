-- Create table for data yesterday
create table TaMember_Yesterday
       (
          MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , StatusStudent char(01) not null constraint coCHStatusStudentYesterday check (StatusStudent in ('Y', 'N'))
        , StatusPilot   char(01) not null constraint coCHStatusPilotYesterday check (StatusPilot in ('Y', 'N'))
        , StatusAsCat   char(01) not null constraint coCHStatusErHIYesterday check (StatusAsCat in ('Y', 'N'))
        , StatusFullCat char(01) not null constraint coCHStatusFullCatYesterday check (StatusFullCat in ('Y', 'N'))
        , Sex           char(01) not null constraint coCHSexYesterday check (Sex in ('M', 'F'))
        , Club          varchar2(50) not null constraint coFKtaMemberClubYesterday references taClub
       )
; 
 
--Create table for changes of member
create table TaMember_Changes
       (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberChanges primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , StatusStudent char(01) not null constraint coCHStatusStudentChanges check (StatusStudent in ('Y', 'N'))
        , StatusPilot   char(01) not null constraint coCHStatusPilotChanges check (StatusPilot in ('Y', 'N'))
        , StatusAsCat   char(01) not null constraint coCHStatusErHIChanges check (StatusAsCat in ('Y', 'N'))
        , StatusFullCat char(01) not null constraint coCHStatusFullCatChanges check (StatusFullCat in ('Y', 'N'))
        , Sex           char(01) not null constraint coCHSexChanges check (Sex in ('M', 'F'))
        , Club          varchar2(50) not null constraint coFKtaMemberClubChanges references taClub
       )
;  
