USE [InternetcafeManagment]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06/11/2017 8:43:30 PM ******/
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
	[isBusy] [bit] NOT NULL CONSTRAINT [DF_Computers_isBusy]  DEFAULT ((0)),
 CONSTRAINT [PK__Computer__3213E83F6A74C0AC] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Floor]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Papers]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Rates]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[SessionPrint]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 06/11/2017 8:43:30 PM ******/
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

INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive], [isBusy]) VALUES (1, N'Test PC', N'192.168.1.1', 1, 1, 0)
INSERT [dbo].[Computers] ([id], [pcname], [ipaddress], [floorid], [isactive], [isBusy]) VALUES (2, N'Test PC', N'192.168.1.1', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Computers] OFF
SET IDENTITY_INSERT [dbo].[Floor] ON 

INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (1, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (2, N'DownStairs', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (3, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (4, N'asdasdasd', 1)
INSERT [dbo].[Floor] ([id], [title], [active]) VALUES (5, N'asdasd', 0)
SET IDENTITY_INSERT [dbo].[Floor] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [title], [price], [timeRestricted], [startTime], [endTime], [active]) VALUES (15, N'dasd', CAST(0.00 AS Decimal(18, 2)), N'NO', CAST(N'1900-01-01 03:10:00.000' AS DateTime), CAST(N'1900-01-01 03:10:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Rates] ON 

INSERT [dbo].[Rates] ([id], [title], [price], [active]) VALUES (2, N'Gamer', CAST(10.00 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[Rates] OFF
SET IDENTITY_INSERT [dbo].[Shift] ON 

INSERT [dbo].[Shift] ([id], [title], [startTime], [endTime], [active]) VALUES (1, N'Day Shift', CAST(N'1900-01-01 03:07:00.000' AS DateTime), CAST(N'1900-01-01 03:22:00.000' AS DateTime), 1)
INSERT [dbo].[Shift] ([id], [title], [startTime], [endTime], [active]) VALUES (2, N'Night Shift', CAST(N'1900-01-01 03:07:00.000' AS DateTime), CAST(N'1900-01-01 03:22:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Shift] OFF
/****** Object:  StoredProcedure [dbo].[DeleteComputer]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeletePaper]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteRate]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteShift]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InserProduct]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertComputer]    Script Date: 06/11/2017 8:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertComputer]
@pcname as varchar(max),
@ipaddress as varchar(max),
@floorid as int,
@isactive as bit,
@isBusy as bit
as
begin
insert into Computers(pcname,ipaddress,floorid,isactive,isBusy) values (@pcname,@ipaddress,@floorid,@isactive,@isBusy)
return SCOPE_IDENTITY()
end
GO
/****** Object:  StoredProcedure [dbo].[InsertPaper]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertRate]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[InsertShift]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectComputerById]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectComputerByIP]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectComputers]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectFloors]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectPaperById]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectPapers]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectProductById]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectProducts]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectRateById]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectRates]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectShiftById]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SelectShifts]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateComputer]    Script Date: 06/11/2017 8:43:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateComputer]
@id as int,
@pcname as varchar(max),
@ipaddress as varchar(max),
@floorid as int,
@isactive as bit,
@isBusy as bit
as
begin
update  Computers set pcname = @pcname,ipaddress = @ipaddress,floorid = @floorid,isactive = @isactive, isBusy = @isBusy
where id = @id
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaper]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRate]    Script Date: 06/11/2017 8:43:30 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateShift]    Script Date: 06/11/2017 8:43:30 PM ******/
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
