USE [InternetcafeManagment]
GO
/****** Object:  Table [dbo].[Computers]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Employee]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Floor]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Papers]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Rates]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Session]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[SessionPrint]    Script Date: 06/09/2017 1:51:58 AM ******/
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
/****** Object:  Table [dbo].[Shift]    Script Date: 06/09/2017 1:51:58 AM ******/
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
