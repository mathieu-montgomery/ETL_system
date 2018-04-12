create table Validate_Status 
       (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Status        varchar2(50) not null
        )
        ;
        
create table Error_Status
(
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
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
        , typeError     varchar2(100)
       )
; 

create table Validate_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(3,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Status        varchar2(50) not null
        )
        ;

create table Error_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null constraint coPKtaMemberYesterday primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(3,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Status        varchar2(50) not null
        , typeError     varchar2(100)
        )
        ;
