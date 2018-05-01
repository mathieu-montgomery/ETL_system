drop table F_Flights;
drop table D_Time;
drop table D_Plane;
drop table BridgePilotFlights;
drop table D_MEMBER;
drop table D_LaunchType;
drop table D_Club;



CREATE TABLE D_Club (
    club_ID VARCHAR(50) NOT NULL,

    adress VARCHAR(50),
    zipcode CHAR(04),
    region VARCHAR(50),

    CONSTRAINT PK_D_Club PRIMARY KEY (club_ID)
);

CREATE TABLE D_LaunchType(
	launch_type_ID NUMBER(1),
	name VARCHAR(50),

    CONSTRAINT PK_D_LaunchType PRIMARY KEY (launch_type_ID)
);

CREATE TABLE D_MEMBER(
	member_change_ID INT not null,
	MEMBER_ID INT not null, 
	INITIALS CHAR(4),
	Name VARCHAR2(50),
	Adress VARCHAR2(50),
  ZipCode number(4,0) not null,
	DATEBORN DATE not null,
	AGE number(3,0),
	DATEJOINED DATE,
	DATELEFT DATE,
  OWNSPLANEREG CHAR(3 BYTE),
  SEX	CHAR(1 BYTE),
  CLUB_ID VARCHAR(50) not null,
	STATUS VARCHAR(50),
  VALID_FROM DATE,
  VALID_TO Date,
	Constraint PK_D_Member PRIMARY KEY(member_change_ID)
);

/*
CREATE TABLE BridgePilotFlights(
	flight_group_ID INT NOT NULL,
	member_change_ID INT NOT NULL,
	member_change2_ID INT NOT NULL,

    CONSTRAINT PK_BridgePilotFlights PRIMARY KEY (flight_group_ID),
    
    CONSTRAINT FK_D_MEMBER FOREIGN KEY(member_change_ID) REFERENCES D_MEMBER(member_change_ID),
    CONSTRAINT FK_D_MEMBER2 FOREIGN KEY(member_change2_ID) REFERENCES D_MEMBER(member_change_ID)
);*/

CREATE TABLE BridgePilotFlights(
	flight_group_ID INT NOT NULL,
	member_ID INT NOT NULL,
	weight DECIMAL(3,2) NOT NULL,

  CONSTRAINT PK_BridgePilotFlights PRIMARY KEY (flight_group_ID),
  CONSTRAINT FK_D_MEMBER FOREIGN KEY(member_ID) REFERENCES D_MEMBER(member_change_ID)
);

CREATE TABLE D_Plane (
    RegistrationNumber_ID VARCHAR(20),

    DateOfPurchase DATE,
    CompNo VARCHAR(20),
    PlaneType VARCHAR(20),
    ClubOwned NUMBER(1),
    OwnerName VARCHAR(20),
    OwnerClubName VARCHAR(50),
    HasEngine NUMBER(1),
    NumberOfSeats INT,

    CONSTRAINT PK_D_Plane PRIMARY KEY (RegistrationNumber_ID),
    
    CONSTRAINT FK_OwnerClubName FOREIGN KEY(OwnerClubName) REFERENCES D_Club(club_ID)
);
    
CREATE TABLE D_Time (
    ID_Time INT,
    Year_time INT,
    Month_time INT,
    Day_time INT,
    Hour_time INT,
    Minute_time INT,

    CONSTRAINT PK_D_Time PRIMARY KEY (ID_Time)
);


CREATE TABLE F_Flights (
    flight_ID INT NOT NULL,

    plane_ID VARCHAR(20),
    flight_group_ID INT,
    club_ID VARCHAR(50),
    time_ID int, 
    launch_type_ID NUMBER(1),

    incident NUMBER(1),
    distance VARCHAR(255),
    flight_duration VARCHAR(255),
    normal_season NUMBER(1),

    
    CONSTRAINT FK_Launch_type FOREIGN KEY(launch_type_ID) REFERENCES D_LaunchType(launch_type_ID),
    CONSTRAINT FK_Club FOREIGN KEY(club_ID) REFERENCES D_Club(club_ID),
    CONSTRAINT FK_Time FOREIGN KEY(time_ID) REFERENCES D_Time(ID_Time),
	CONSTRAINT FK_Plane FOREIGN KEY(plane_ID) REFERENCES D_Plane(RegistrationNumber_ID),
    CONSTRAINT FK_BridgeFlight FOREIGN KEY(flight_group_ID) REFERENCES BridgePilotFlights(flight_group_ID),

    CONSTRAINT PK_F_flights PRIMARY KEY (flight_ID)
);