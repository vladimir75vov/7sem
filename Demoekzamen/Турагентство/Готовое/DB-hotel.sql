USE [195bv-hotel]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[CountryCode] [varchar](3) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Stars] [int] NOT NULL,
	[CountryCode] [varchar](3) NOT NULL,
 CONSTRAINT [PK_195bv-hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[ImageID] [int] NOT NULL,
	[HotelID] [int] NOT NULL,
	[ImageSource] [varchar](200) NOT NULL,
 CONSTRAINT [PK_195bv-hotelImage] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel-Tours]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel-Tours](
	[HotelID] [int] NOT NULL,
	[TourID] [int] NOT NULL,
 CONSTRAINT [PK_Tour195bv-hotel] PRIMARY KEY CLUSTERED 
(
	[HotelID] ASC,
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tours]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tours](
	[TourID] [int] NOT NULL,
	[ValueOfTickets] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[ImagePreview] [binary](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[IsActual] [nchar](16) NOT NULL,
 CONSTRAINT [PK_Tours] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TourTypes]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TourTypes](
	[TourID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_TourTypes] PRIMARY KEY CLUSTERED 
(
	[TourID] ASC,
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 24.10.2022 9:36:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_195bv-hotel_Countries] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Countries] ([CountryCode])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_195bv-hotel_Countries]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_195bv-hotelImage_195bv-hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_195bv-hotelImage_195bv-hotel]
GO
ALTER TABLE [dbo].[Hotel-Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tour195bv-hotel_195bv-hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([HotelID])
GO
ALTER TABLE [dbo].[Hotel-Tours] CHECK CONSTRAINT [FK_Tour195bv-hotel_195bv-hotel]
GO
ALTER TABLE [dbo].[Hotel-Tours]  WITH CHECK ADD  CONSTRAINT [FK_Tour195bv-hotel_Tours] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tours] ([TourID])
GO
ALTER TABLE [dbo].[Hotel-Tours] CHECK CONSTRAINT [FK_Tour195bv-hotel_Tours]
GO
ALTER TABLE [dbo].[TourTypes]  WITH CHECK ADD  CONSTRAINT [FK_TourTypes_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[TourTypes] CHECK CONSTRAINT [FK_TourTypes_Types]
GO
