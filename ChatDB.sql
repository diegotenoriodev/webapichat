﻿CREATE TABLE ChatUser
(
	Id INT NOT NULL IDENTITY(1, 1),
	Name VARCHAR(128) NOT NULL,
	Email VARCHAR(128) NOT NULL,
	CONSTRAINT PK_USER PRIMARY KEY (Id)
);
GO
CREATE TABLE Room
(
	Id INT NOT NULL IDENTITY(1, 1),
	Name VARCHAR(128) NOT NULL,
	Description VARCHAR(512) NULL,
	IdOwner INT NOT NULL,
	CONSTRAINT PK_ROOM PRIMARY KEY (Id),
	CONSTRAINT FK_ROOM_OWNER FOREIGN KEY (IdOwner) REFERENCES ChatUser(Id)
);
GO
CREATE TABLE Message
(
	Id BIGINT NOT NULL IDENTITY(1, 1),
	IdRoom INT NOT NULL,
	IdSender INT NOT NULL,
	IdReceiver INT NULL,
	IdRepliedMessage BIGINT NULL,
	Content VARCHAR(256) NOT NULL,
	DateTimeSent DATETIME NOT NULL CONSTRAINT DF_DATETIMESENT DEFAULT (GETDATE()),
	CountUp INT NOT NULL CONSTRAINT DF_COUNTUP DEFAULT (0),
	CountDown INT NOT NULL CONSTRAINT DF_COUNTDOWN DEFAULT (0),
	CONSTRAINT PK_Message PRIMARY KEY (Id),
	CONSTRAINT FK_MESSAGE_ROOM FOREIGN KEY (IdRoom) REFERENCES Room(Id),
	CONSTRAINT FK_MESSAGE_SENDER FOREIGN KEY (IdSender) REFERENCES ChatUser(Id),
	CONSTRAINT FK_MESSAGE_RECEIVER FOREIGN KEY (IdReceiver) REFERENCES ChatUser(Id),
	CONSTRAINT FK_MESSAGE_Reply FOREIGN KEY (IdRepliedMessage) REFERENCES Message(Id)	
);
GO
CREATE TABLE MessageUp
(
	IdMessage BIGINT NOT NULL,
	IdUser INT NOT NULL,
	CONSTRAINT PK_MESSAGEUP PRIMARY KEY (IdMessage, IdUser),
	CONSTRAINT FK_MESSAGEUP_MESSAGE FOREIGN KEY (IdMessage) REFERENCES Message(Id),
	CONSTRAINT FK_MESSAGEUP_User FOREIGN KEY (IdUser) REFERENCES ChatUser(Id)
);
GO
CREATE TABLE MessageDown
(
	IdMessage BIGINT NOT NULL,
	IdUser INT NOT NULL,
	CONSTRAINT PK_MESSAGEDOWN PRIMARY KEY (IdMessage, IdUser),
	CONSTRAINT FK_MESSAGEDown_MESSAGE FOREIGN KEY (IdMessage) REFERENCES Message(Id),
	CONSTRAINT FK_MESSAGEDown_User FOREIGN KEY (IdUser) REFERENCES ChatUser(Id)
);
GO