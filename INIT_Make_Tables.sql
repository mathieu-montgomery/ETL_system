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
	INITIALS VARCHAR(4),
	Birthday DATE not null,
	Age number(3,0),
	PilotGender NUMBER(1),
	Name VARCHAR(50),
	Adress VARCHAR2(50),
	Status VARCHAR(50),
	StartDate DATE,
	EndDate DATE,
	OwnsGlider NUMBER(1),
    VALID_FROM DATE,
    VALID_TO Date,
	Constraint PK_D_Member PRIMARY KEY(JUNK_ID)
);

CREATE TABLE BridgePilotFlights(
	flight_group_ID INT NOT NULL,
	member_change_ID INT NOT NULL,
	member_change2_ID INT NOT NULL,

    CONSTRAINT PK_BridgePilotFlights PRIMARY KEY (flight_group_ID),
    
    CONSTRAINT FK_D_MEMBER FOREIGN KEY(member_change_ID) REFERENCES D_MEMBER(member_change_ID),
    CONSTRAINT FK_D_MEMBER2 FOREIGN KEY(member_change2_ID) REFERENCES D_MEMBER(member_change_ID)
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
    Time_ID TIMESTAMP,
    HourOfDay INT,
    DayOfWeek VARCHAR(20),
    Week INT,
    FlightYear INT,
   
    CONSTRAINT PK_D_Time PRIMARY KEY (Time_ID)
);


CREATE TABLE F_Flights (
    flight_ID INT NOT NULL,

    plane_ID VARCHAR(20),
    flight_group_ID INT,
    club_ID VARCHAR(50),
    time_ID TIMESTAMP, 
    launch_type_ID NUMBER(1),

    incident NUMBER(1),
    distance VARCHAR(255),
    flight_duration VARCHAR(255),
    normal_season NUMBER(1),

    
    CONSTRAINT FK_Launch_type FOREIGN KEY(launch_type_ID) REFERENCES D_LaunchType(launch_type_ID),
    CONSTRAINT FK_Club FOREIGN KEY(club_ID) REFERENCES D_Club(club_ID),
    CONSTRAINT FK_Time FOREIGN KEY(time_ID) REFERENCES D_Time(Time_ID),
	CONSTRAINT FK_Plane FOREIGN KEY(plane_ID) REFERENCES D_Plane(RegistrationNumber_ID),
    CONSTRAINT FK_BridgeFlight FOREIGN KEY(flight_group_ID) REFERENCES BridgePilotFlights(flight_group_ID),

    CONSTRAINT PK_F_flights PRIMARY KEY (flight_ID)
);