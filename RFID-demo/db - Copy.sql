--CREATE DATABASE [CHECKIN]

--USE [CHECKIN]

----------------------------------------------------------------------------------

CREATE TABLE ACCOUNT(
	RFID varchar(128) NOT NULL,
	codeID varchar(32) NOT NULL,
	fullName nvarchar(128) NOT NULL,
	PRIMARY KEY (RFID, codeID, fullName)
);

INSERT INTO ACCOUNT VALUES('unknow', 'B1400713', N'Doan Minh Nhut')

----------------------------------------------------------------------------------
CREATE TABLE LOGIN(
	username varchar(32) PRIMARY KEY,
  password varchar(1024) NOT NULL,
	codeSystem varchar(32) NOT NULL,
	fullName nvarchar(128) NOT NULL,
	FOREIGN KEY (fullName) REFERENCES ACCOUNT(fullName)
);

INSERT INTO LOGIN VALUES('admin','admin', '001', N'Doan Minh Nhut')

----------------------------------------------------------------------------------

CREATE TABLE  STUDENT(
	  RFID varchar(128) NOT NULL,
    codeID varchar(32) PRIMARY KEY,
    fullName nvarchar(128) NOT NULL,
    class varchar(128) NOT NULL,
    majors nvarchar(256) NOT NULL,
    college nvarchar(256) NOT NULL,
    schoolYear varchar(32) NOT NULL
		FOREIGN KEY (RFID) REFERENCES ACCOUNT(RFID),
		FOREIGN KEY (codeID) REFERENCES ACCOUNT(codeID),
		FOREIGN KEY (fullName) REFERENCES ACCOUNT(fullName)
);

----------------------------------------------------------------------------------

CREATE TABLE EMPLOYER(
		RFID varchar(128) NOT NULL,
		codeID varchar(32) PRIMARY KEY,
		fullName nvarchar(128) NOT NULL,
    email varchar(256) NOT NULL,
    gender nvarchar(256) NOT NULL,
    department nvarchar(256) NOT NULL,
		FOREIGN KEY (RFID) REFERENCES ACCOUNT(RFID),
		FOREIGN KEY (codeID) REFERENCES ACCOUNT(codeID),
		FOREIGN KEY (fullName) REFERENCES ACCOUNT(fullName)
);

----------------------------------------------------------------------------------

CREATE TABLE EVENTS(
	  codeNo varchar(32) PRIMARY KEY,
    name nvarchar(512) NOT NULL,
    date varchar(32) NOT NULL,
    beginTime varchar(32) NOT NULL,
    endTime varchar(32) NOT NULL
);

----------------------------------------------------------------------------------

CREATE TABLE REGISTER(
	  codeNo varchar(32) NOT NULL,
    RFID varchar(32) NOT NULL,
		codeID varchar(32) NOT NULL,
    PRIMARY KEY (codeNo, RFID),
    FOREIGN KEY (codeNo) REFERENCES EVENTS(codeNo),
    FOREIGN KEY (RFID, codeID) REFERENCES ACCOUNT(RFID, codeID),
    FOREIGN KEY (RFID, codeID) REFERENCES STUDENT(RFID, codeID),
    FOREIGN KEY (RFID, codeID) REFERENCES EMPLOYER(RFID, codeID)
);

----------------------------------------------------------------------------------

CREATE TABLE CHECKIN(
	  codeNo varchar(32) NOT NULL,
    codeID varchar(32) NOT NULL,
    fullName nvarchar(32) NOT NULL,
    inputTime varchar(32),
    outTime varchar(32),
		isJoin varchar(32),
    PRIMARY KEY (codeNo, codeID),
    FOREIGN KEY (codeNo) REFERENCES EVENTS(codeNo),
    FOREIGN KEY (codeID, fullName) REFERENCES ACCOUNT(codeID, fullName),
    FOREIGN KEY (codeID, fullName) REFERENCES STUDENT(codeID, fullName),
    FOREIGN KEY (codeID, fullName) REFERENCES EMPLOYER(codeID, fullName)
);

----------------------------------------------------------------------------------
