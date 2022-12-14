USE [195bv-glazkiSave]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 24.10.2022 9:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[AgentID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Priority] [varchar](50) NOT NULL,
	[LogoID] [int] NOT NULL,
	[Adress] [varchar](50) NOT NULL,
	[INN] [int] NOT NULL,
	[KPP] [int] NOT NULL,
	[DirectorName] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Agents] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentTypes]    Script Date: 24.10.2022 9:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentTypes](
	[AgentTypeID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AgentTypes] PRIMARY KEY CLUSTERED 
(
	[AgentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logo]    Script Date: 24.10.2022 9:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logo](
	[LogoID] [int] NOT NULL,
	[PreviewLogo] [binary](50) NOT NULL,
	[LogoPath] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Logo] PRIMARY KEY CLUSTERED 
(
	[LogoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.10.2022 9:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] NOT NULL,
	[ProductType] [varchar](200) NOT NULL,
	[Articul] [int] NOT NULL,
	[PeopleCount] [int] NOT NULL,
	[MinPrice] [int] NOT NULL,
	[NumberWorkshop] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RealizeHistory]    Script Date: 24.10.2022 9:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RealizeHistory](
	[ProductID] [int] NOT NULL,
	[AgentID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Amount] [int] NOT NULL,
	[ID] [int] NOT NULL,
 CONSTRAINT [PK_RealizeHistory_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD  CONSTRAINT [FK_Agents_AgentTypes] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentTypes] ([AgentTypeID])
GO
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_AgentTypes]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD  CONSTRAINT [FK_Agents_Logo] FOREIGN KEY([LogoID])
REFERENCES [dbo].[Logo] ([LogoID])
GO
ALTER TABLE [dbo].[Agents] CHECK CONSTRAINT [FK_Agents_Logo]
GO
ALTER TABLE [dbo].[RealizeHistory]  WITH CHECK ADD  CONSTRAINT [FK_RealizeHistory_Agents] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agents] ([AgentID])
GO
ALTER TABLE [dbo].[RealizeHistory] CHECK CONSTRAINT [FK_RealizeHistory_Agents]
GO
ALTER TABLE [dbo].[RealizeHistory]  WITH CHECK ADD  CONSTRAINT [FK_RealizeHistory_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[RealizeHistory] CHECK CONSTRAINT [FK_RealizeHistory_Products]
GO
