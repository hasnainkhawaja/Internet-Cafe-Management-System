USE [InternetcafeManagment]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Computers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pcname] [varchar](max) NOT NULL,
	[ipaddress] [varchar](max) NOT NULL,
	[floorid] [int] NOT NULL CONSTRAINT [DF_Computers_floorid]  DEFAULT ((0)),
	[isactive] [bit] NOT NULL CONSTRAINT [DF__Computers__isact__286302EC]  DEFAULT ((1)),
	[status] [int] NOT NULL,
 CONSTRAINT [PK__Computer__3213E83F6A74C0AC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[contact] [varchar](max) NOT NULL,
	[username] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[type] [varchar](max) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Floor]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Floor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Papers]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Papers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[singlePrice] [decimal](18, 2) NOT NULL,
	[doublePrice] [decimal](18, 2) NOT NULL,
	[isColorPaper] [int] NOT NULL,
	[isMisc] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK__Papers__3213E83FFD8841C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[timeRestricted] [varchar](3) NOT NULL,
	[startTime] [datetime] NOT NULL,
	[endTime] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](max) NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Rates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Session](
	[id] [uniqueidentifier] NOT NULL,
	[sessionCode] [varchar](8) NOT NULL,
	[computerId] [int] NOT NULL,
	[startTime] [datetime] NOT NULL,
	[endTime] [datetime] NULL,
	[loginTime] [datetime] NULL,
	[logOffTime] [datetime] NULL,
	[sessionClosed] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[createBy] [nvarchar](max) NOT NULL,
	[invoicedBy] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionPrint]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionPrint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sessionId] [uniqueidentifier] NOT NULL,
	[paperid] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[isDouble] [bit] NOT NULL,
	[processData] [datetime] NOT NULL,
	[JobStatus] [varchar](50) NOT NULL,
	[submittedTime] [nvarchar](max) NOT NULL,
	[caption] [nvarchar](max) NOT NULL,
	[dataType] [nvarchar](max) NOT NULL,
	[elapsedTime] [nvarchar](max) NOT NULL,
	[jobId] [nvarchar](max) NOT NULL,
	[PagesPrinted] [int] NOT NULL,
	[StartTime] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[TimeSubmitted] [nvarchar](max) NOT NULL,
	[TotalPages] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[startTime] [datetime] NOT NULL,
	[endTime] [datetime] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Shift] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive], [status]) VALUES (2, N'1', N'192.168.1.1', 1, 1, 1)
INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive], [status]) VALUES (3, N'2', N'192.168.1.1', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Computers] OFF
SET IDENTITY_INSERT [dbo].[Floor] ON 

INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (1, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (2, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (3, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (4, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (5, N'asdasd', 0)
SET IDENTITY_INSERT [dbo].[Floor] OFF
SET IDENTITY_INSERT [dbo].[Papers] ON 

INSERT [dbo].[Papers] ([id], [title], [singlePrice], [doublePrice], [isColorPaper], [isMisc], [isActive]) VALUES (1002, N'A5', CAST(2.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Papers] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [title], [price], [timeRestricted], [startTime], [endTime], [active]) VALUES (1014, N'CHIPS', CAST(20.00 AS Decimal(18, 2)), N'NO', CAST(N'1900-01-01 01:47:00.000' AS DateTime), CAST(N'1900-01-01 01:47:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Rates] ON 

INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1002, N'Rate 2', CAST(12.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1003, N'Rate 3', CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1004, N'Rate 5', CAST(12.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1005, N'Rate 6', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1006, N'Rate 7', CAST(0.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (1007, N'Rate 8', CAST(12.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Rates] OFF
INSERT [dbo].[Session] ([id], [sessionCode], [computerId], [startTime], [endTime], [loginTime], [logOffTime], [sessionClosed], [isActive], [createBy], [invoicedBy], [status]) VALUES (N'295c2136-b572-4ad4-9385-b34dbe23c7d6', N'VBN6', 2, CAST(N'2017-06-13 23:20:54.000' AS DateTime), NULL, NULL, NULL, 0, 1, N'Hasnain', N'', 0)
INSERT [dbo].[Session] ([id], [sessionCode], [computerId], [startTime], [endTime], [loginTime], [logOffTime], [sessionClosed], [isActive], [createBy], [invoicedBy], [status]) VALUES (N'da112da0-0fa7-446e-937e-e6646917d3e4', N'Z6Y4', 3, CAST(N'2017-06-13 23:21:06.000' AS DateTime), NULL, NULL, NULL, 0, 1, N'Hasnain', N'', 0)
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([id], [title], [startTime], [endTime], [active]) VALUES (1, N'Day Shift', CAST(N'1900-01-01 03:07:00.000' AS DateTime), CAST(N'1900-01-01 03:22:00.000' AS DateTime), 1)
INSERT [dbo].[Shift] ([id], [title], [startTime], [endTime], [active]) VALUES (2, N'Night Shift', CAST(N'1900-01-01 03:07:00.000' AS DateTime), CAST(N'1900-01-01 03:22:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Shift] OFF
/****** Object:  StoredProcedure [dbo].[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5_QueueActivation]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5_QueueActivation] AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;

    
    RECEIVE TOP(0) @h = [conversation_handle] FROM dbo.[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5];

    IF EXISTS (SELECT * FROM sys.service_queues WITH(NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5')
    BEGIN
        IF ((SELECT COUNT(*) FROM dbo.[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5] WITH(NOLOCK) WHERE message_type_name = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR message_type_name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/Dispose') > 0)
        BEGIN 
            
            
DECLARE @schema_id INT;
DECLARE @conversation_handle UNIQUEIDENTIFIER;

SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

 
IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'tr_dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5') DROP TRIGGER [dbo].[tr_dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5];

IF EXISTS (SELECT * FROM sys.service_queues WITH(NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5') EXEC (N'ALTER QUEUE [dbo].[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5] WITH ACTIVATION (STATUS = OFF)');


SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5';
DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
OPEN conversation_cursor;
FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
WHILE @@FETCH_STATUS = 0 
BEGIN
    END CONVERSATION @conversation_handle WITH CLEANUP;
    FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
END
CLOSE conversation_cursor;
DEALLOCATE conversation_cursor;
DROP TABLE #Conversations;


IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5') DROP SERVICE [dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5];

IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5') DROP QUEUE dbo.[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5];

IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5') DROP CONTRACT [dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5];

IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Insert') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Insert];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Update') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Update];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Delete') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/StartDialog/Delete];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/Dispose') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/Dispose];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/id') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/id];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/pcname') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/pcname];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/floorid') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/floorid];
IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/status') DROP MESSAGE TYPE[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5/status];


IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5_QueueActivation') DROP PROCEDURE [dbo].[dbo_Computers_7b96ab40-89e1-4483-803b-e0641b6d94b5_QueueActivation];
            
        END 
    END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteComputer]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteComputer]
@id as int
as
begin
delete from Computers where id = @id

end
GO
/****** Object:  StoredProcedure [dbo].[DeletePaper]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeletePaper]
@id as int 
as
begin
 delete from Papers where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteProduct]
@id int 
as
begin
delete from product
where id = @id;
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteRate]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteRate]
@id as int
as
begin
delete  from Rates where id =@id
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteShift]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeleteShift]
@id as int
as
begin
 delete from Shift where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[GenerateSession]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerateSession]
@computerId int,
@sessionCode as varchar(max),
@createdBy as varchar(max),
@startTime as datetime
as
begin
insert into session (id, sessionCode,computerId,startTime,sessionClosed,isActive,createBy,invoicedBy,status)
values (NEWID(), @sessionCode,@computerId,@startTime,0,1,@createdBy,'',0)
update Computers set status = 1 where id =@computerId
end
GO
/****** Object:  StoredProcedure [dbo].[InserProduct]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InserProduct]
@title  nvarchar(max) ='',
@price  decimal(18,2) = 0,
@timeRestricted varchar(3),
@starttime datetime,
@endTime datetime,
@active bit = 1
as
begin
insert into Product(title , price , timeRestricted , startTime , endTime , active) values(@title , @price ,
@timeRestricted , @starttime, @endTime , @active)

return SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[InsertComputer]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertComputer]
@pcname as varchar(max),
@ipaddress as varchar(max),
@floorid as int,
@isactive as bit
as
begin
insert into Computers(pcname,ipaddress,floorid,isactive,status) values (@pcname,@ipaddress,@floorid,@isactive,0)
return SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPaper]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertPaper]
@title as varchar(max),
@singlePrice as decimal(18,2),
@doublePrice as decimal(18,2),
@isColorPaper int,
@isMisc bit,
@isActive bit
as
begin
 insert into Papers(title,singlePrice,doublePrice,isColorPaper,isMisc,isActive)
 values(@title,@singlePrice,@doublePrice,@isColorPaper,@isMisc,@isActive)
 return SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[InsertRate]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertRate]
@title as varchar(max),
@price as decimal ,
@active as bit
as
begin
insert into Rates(title,price,active) values(@title,@price,@active)
return SCOPE_IDENTITY();
end
GO
/****** Object:  StoredProcedure [dbo].[InsertShift]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertShift]
@title as varchar(50) ,
@startTime as datetime,
@endTime as datetime,
@active as bit
as
begin
 insert into Shift(title,startTime,endTime,active )
 values(@title,@startTime,@endTime,@active)
 return SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[SelectComputerById]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectComputerById]
@id as int
as
begin
select * from Computers where id = @id

end
GO
/****** Object:  StoredProcedure [dbo].[SelectComputerByIP]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectComputerByIP]
@ip as varchar(max)
as
begin
select * from Computers where ipaddress = @ip

end
GO
/****** Object:  StoredProcedure [dbo].[SelectComputers]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectComputers]
as

begin
select * from Computers

end
GO
/****** Object:  StoredProcedure [dbo].[SelectFloors]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectFloors]
as

begin
select * from Floor

end
GO
/****** Object:  StoredProcedure [dbo].[SelectPaperById]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectPaperById]
@id as int 
as
begin
 select * from Papers where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SelectPapers]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectPapers]
as
begin
 select * from Papers
end
GO
/****** Object:  StoredProcedure [dbo].[SelectProductById]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SelectProductById]
@id int 
as
begin
select *  from product
where id = @id;
end
GO
/****** Object:  StoredProcedure [dbo].[SelectProducts]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectProducts]
as
begin
select *  from product

end
GO
/****** Object:  StoredProcedure [dbo].[SelectRateById]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectRateById]
@id as int
as
begin
select * from Rates where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SelectRates]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectRates]
as
begin
select * from Rates
end
GO
/****** Object:  StoredProcedure [dbo].[SelectShiftById]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SelectShiftById]
@id as int
as
begin
 Select * from Shift where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[SelectShifts]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SelectShifts]
as
begin
 Select * from Shift 
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateComputer]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateComputer]
@id as int,
@pcname as varchar(max),
@ipaddress as varchar(max),
@floorid as int,
@isactive as bit
as
begin
update  Computers set pcname = @pcname,ipaddress = @ipaddress,floorid = @floorid,isactive = @isactive
where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaper]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdatePaper]
@id as int,
@title as varchar(max),
@singlePrice as decimal(18,2),
@doublePrice as decimal(18,2),
@isColorPaper int,
@isMisc bit,
@isActive bit
as
begin
 update Papers  set title = @title,singlePrice = @singlePrice ,doublePrice=@doublePrice,isColorPaper = @isColorPaper,isMisc=@isMisc,isActive = @isActive
 where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateProduct]
@id int,
@title  nvarchar(max) ='',
@price  decimal(18,2) = 0,
@timeRestricted varchar(3),
@starttime datetime,
@endTime datetime,
@active bit = 1
as
begin
update  Product set title = @title, price =  @price, timeRestricted = @timeRestricted, startTime = @starttime , endTime = @endTime , active = @active
where id = @id;
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateRate]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateRate]
@id as int,
@title as varchar(max),
@price as decimal ,
@active as bit
as
begin
update Rates set title = @title,price = @price,active = @active where id = @id

end
GO
/****** Object:  StoredProcedure [dbo].[UpdateShift]    Script Date: 06/13/2017 11:34:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateShift]
@id as int,
@title as varchar(50) ,
@startTime as datetime,
@endTime as datetime,
@active as bit
as
begin
 update [Shift] set title = @title,startTime = @startTime,endTime = @endTime,active =@active
 where id = @Id
end
GO
