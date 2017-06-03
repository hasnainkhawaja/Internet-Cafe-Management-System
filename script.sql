USE [InternetcafeManagment]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06/04/2017 2:33:25 AM ******/
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
	[isactive] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ComputerTimeCharges]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComputerTimeCharges](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[time] [float] NOT NULL,
	[price] [decimal](18, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](max) NOT NULL,
	[lastname] [varchar](max) NOT NULL,
	[contactno] [varchar](max) NOT NULL,
	[address] [varchar](max) NOT NULL,
	[isactive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaperColor]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaperColor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Papers]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Papers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paperSizeId] [int] NOT NULL,
	[papercolorId] [int] NOT NULL,
	[price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK__Papers__3213E83FFD8841C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaperSize]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaperSize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[size] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Session](
	[sessionid] [varchar](max) NULL,
	[starttime] [datetime] NULL,
	[endtime] [datetime] NULL,
	[customerid] [int] NOT NULL,
	[computerid] [int] NOT NULL,
	[session_password] [varchar](10) NOT NULL,
	[isactive] [bit] NOT NULL,
	[isInternetAvailable] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SessionPrint]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SessionPrint](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paperid] [int] NULL,
	[sessionid] [varchar](max) NULL,
	[qty] [int] NULL,
	[status] [varchar](50) NULL,
	[processData] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Computers] ON 

INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [isactive]) VALUES (5, N'MY-DESKTOP', N'192.168.1.1', 0)
INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [isactive]) VALUES (6, N'HASANAIN-PC', N'192.168.1.1', 1)
INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [isactive]) VALUES (7, N'TCUBE UK PC', N'192.168.1.2', 1)
SET IDENTITY_INSERT [dbo].[Computers] OFF
ALTER TABLE [dbo].[ComputerTimeCharges] ADD  CONSTRAINT [DF__InternetC__price__15502E78]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [isactive]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF__Session__session__2A4B4B5E]  DEFAULT (newid()) FOR [sessionid]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF__Session__isactiv__2B3F6F97]  DEFAULT ((0)) FOR [isactive]
GO
ALTER TABLE [dbo].[Session] ADD  CONSTRAINT [DF_Session_isInternetAvailable]  DEFAULT ((0)) FOR [isInternetAvailable]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertComputer]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_InsertComputer] 
@pcname as varchar(max) , 
@ipaddress as varchar(max),
@acitve as bit,
@id int output
as
begin
SET NOCOUNT ON;
INSERT INTO  Computers(pcname,ipaddress, isactive)
VALUES (@pcname, @ipaddress,@acitve)
SET @id=SCOPE_IDENTITY()
RETURN  @id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SelectComputers]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SelectComputers]
as
begin
select * from Computers
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ValidatePc]    Script Date: 06/04/2017 2:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ValidatePc]
@pcname as varchar(100) , 
@ipaddress as varchar(100),
@message varchar(100) output
as
begin
declare @count int;
select @count = count(*) from Computers where pcname = @pcname and ipaddress = @ipaddress
if @count>0
	begin
		set @message = 'Please use unique computer name and ipaddress'
	end
	else
	begin
		set @message =''
	end
end
GO
