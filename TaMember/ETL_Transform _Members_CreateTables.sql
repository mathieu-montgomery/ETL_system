drop table TaMember_Validate_Status;
drop table TaMember_Error_Status;
drop table TaMember_Validate_age;
drop table TaMember_Validate_TEST_age;
drop table TaMember_Error_age;

create table TaMember_Validate_Status 
       (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Status        varchar2(50) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        )
        ;

create table TaMember_Validate_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(3,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        , Status        varchar2(50) not null
        )
        ;
        
create table TaMember_Validate_TEST_age (
          Operation varchar2(50) not null
        , MemberNo number(6,0) not null primary key
        , Initials      char(04) not null
        , Name          varchar2(50)  not null
        , Address       varchar2(50) not null
        , ZipCode       number(4,0) not null
        , DateBorn      date not null
        , Age           number(38,0)
        , DateJoined    date not null
        , DateLeft      date
        , OwnsPlaneReg  char(03) not null
        , Sex           char(01) not null
        , Club          varchar2(50) not null
        , Status        varchar2(50) not null
        , typeError     varchar2(100)
        )
        ;
        
create table TaMember_Error
(
          idError int primary key not null
        , Operation varchar2(50) not null
        , MemberNo number(6,0) not null
        , dateError date
        , step varchar2(100)
        , dataError varchar2(100)
        , typeError varchar2(100)
        , status varchar2(100)
); 