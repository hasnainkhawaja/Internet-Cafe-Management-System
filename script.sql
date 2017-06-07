USE [InternetcafeManagment]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06/08/2017 2:03:27 AM ******/
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
 CONSTRAINT [PK__Computer__3213E83F6A74C0AC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/08/2017 2:03:28 AM ******/
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
/****** Object:  Table [dbo].[Floor]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Floor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Floor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Papers]    Script Date: 06/08/2017 2:03:28 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 06/08/2017 2:03:28 AM ******/
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
	[timeRestricted] [bit] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rates]    Script Date: 06/08/2017 2:03:28 AM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Session](
	[id] [int] NOT NULL,
	[computerId] [int] NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[loginTime] [time](7) NULL,
	[logOffTime] [nchar](10) NULL,
	[password] [varchar](max) NOT NULL,
	[sessionClosed] [bit] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionPrint]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionPrint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paperid] [int] NOT NULL,
	[sessionid] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[qty] [int] NOT NULL,
	[isDouble] [bit] NOT NULL,
	[processData] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shift]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
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

INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive]) VALUES (1, N'Test PC', N'192.168.1.1', 1, 1)
INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive]) VALUES (2, N'Test PC', N'192.168.1.1', 1, 1)
SET IDENTITY_INSERT [dbo].[Computers] OFF
SET IDENTITY_INSERT [dbo].[Floor] ON 

INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (1, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (2, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (3, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (4, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (5, N'asdasd', 0)
SET IDENTITY_INSERT [dbo].[Floor] OFF
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteEmployee]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE from employee where id =@id
GO
/****** Object:  StoredProcedure [dbo].[DeleteFloor]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteFloor]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM Floor
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[DeletePaper]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePaper]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Papers] WHERE [id] = @id
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteProduct]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE from product where id =@id
GO
/****** Object:  StoredProcedure [dbo].[DeleteRates]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteRates]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM Rates
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[InserPaper]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InserPaper]
(
	@title varchar(50),
	@singlePrice int,
	@doublePrice int,
	@isColorPaper int,
	@isMisc bit,
	@isActive bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Papers] ([title], [singlePrice], [doublePrice], [isColorPaper], [isMisc], [isActive]) VALUES (@title, @singlePrice, @doublePrice, @isColorPaper, @isMisc, @isActive);
	
SELECT id, title, singlePrice, doublePrice, isColorPaper, isMisc, isActive FROM Papers WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertEmployee]
(
	@name varchar(MAX),
	@contact varchar(MAX),
	@username varchar(MAX),
	@password varchar(MAX),
	@type varchar(MAX),
	@active bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Employee] ([name], [contact], [username], [password], [type], [active]) VALUES (@name, @contact, @username, @password, @type, @active)
GO
/****** Object:  StoredProcedure [dbo].[InsertFloor]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFloor]
(
	@title varchar(50),
	@active bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Floor] ( [title], [active]) VALUES (@title, @active)
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProduct]
(
	@id int,
	@title varchar(50),
	@price decimal(18, 2),
	@timeRestricted bit,
	@startTime time,
	@endTime time,
	@active bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [dbo].[Product] ([id], [title], [price], [timeRestricted], [startTime], [endTime], [active]) VALUES (@id, @title, @price, @timeRestricted, @startTime, @endTime, @active)
GO
/****** Object:  StoredProcedure [dbo].[SelectComputerBy_Id]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectComputerBy_Id]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        *
FROM            Computers
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[SelectEmployeeById]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectEmployeeById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        id, name, contact, username, password, type, active
FROM            Employee
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[SelectFloorId]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectFloorId]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT        id, title, active
FROM            Floor
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[SelectPaperById]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectPaperById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT *  FROM Papers where id =@id
GO
/****** Object:  StoredProcedure [dbo].[SelectProductById]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectProductById]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, title, price, timeRestricted, startTime, endTime, active FROM dbo.Product where id = @id
GO
/****** Object:  StoredProcedure [dbo].[SelectRates]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectRates]
(
	@id int
)
AS
	SET NOCOUNT ON;
SELECT id, title, price, active FROM dbo.Rates where id =@id
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteComputer]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_deleteComputer]
(
	@id int
)
AS
	SET NOCOUNT OFF;
DELETE FROM [dbo].[Computers] WHERE [id] =@id
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertComputer]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_InsertComputer]
(
	@pcname varchar(MAX),
	@ipaddress varchar(MAX),
	@floorid int,
	@isactive bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO Computers
                         (pcname, ipaddress, floorid, isactive)
VALUES        (@pcname,@ipaddress,@floorid,@isactive);
	 
SELECT id, pcname, ipaddress, floorid, isactive FROM Computers WHERE (id = SCOPE_IDENTITY())
GO
/****** Object:  StoredProcedure [dbo].[Sp_Update_Computer]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_Update_Computer]
(
	@pcname varchar(MAX),
	@ipaddress varchar(MAX),
	@floorid int,
	@isactive bit,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE [dbo].[Computers] SET [pcname] = @pcname, [ipaddress] = @ipaddress, [floorid] = @floorid, [isactive] = @isactive WHERE [id] = @id
	
SELECT id, pcname, ipaddress, floorid, isactive FROM Computers WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[UpdateFloor]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFloor]
(
	@title varchar(50),
	@active bit,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE       Floor
SET                title = @title, active = @active
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaper]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePaper]
(
	@title varchar(50),
	@singlePrice decimal(18, 2),
	@doublePrice decimal(18, 2),
	@isColorPaper int,
	@isMisc bit,
	@isActive bit,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE       Papers
SET                title = @title, singlePrice = @singlePrice, doublePrice = @doublePrice, isColorPaper = @isColorPaper, isMisc = @isMisc, isActive = @isActive
WHERE        (id = @id);
	 
SELECT id, title, singlePrice, doublePrice, isColorPaper, isMisc, isActive FROM Papers WHERE (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateProduct]
(
	@title varchar(50),
	@price decimal(18, 2),
	@timeRestricted bit,
	@startTime time,
	@endTime time,
	@active bit,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE       Product
SET                title = @title, price = @price, timeRestricted = @timeRestricted, startTime = @startTime, endTime = @endTime, active = @active
WHERE        (id = @id)
GO
/****** Object:  StoredProcedure [dbo].[UpdateRates]    Script Date: 06/08/2017 2:03:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRates]
(
	@title varchar(MAX),
	@price decimal(18, 2),
	@active bit,
	@id int
)
AS
	SET NOCOUNT OFF;
UPDATE       Rates
SET                title = @title, price = @price, active = @active
WHERE        (id = @id)
GO
