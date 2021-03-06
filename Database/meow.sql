USE [Meowntain]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 4/23/2017 6:42:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[User_FK] [int] NOT NULL,
	[Cat_FK] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[isApproved] [bit] NOT NULL,
	[Approved_By] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cat]    Script Date: 4/23/2017 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cat](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Date_Arrived] [datetime] NOT NULL,
	[Picture_Path] [varchar](max) NOT NULL CONSTRAINT [DF_Cat_Picture_Path]  DEFAULT ('/catPics/Default.jpg'),
	[Description] [varchar](max) NULL,
	[isAdopted] [bit] NULL CONSTRAINT [DF_Cat_isAdopted]  DEFAULT ((0)),
	[Date_Adopted] [datetime] NULL,
	[Adopted_User] [int] NULL,
 CONSTRAINT [PK_Cat] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 4/23/2017 6:42:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[LName] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Phone] [int] NULL,
	[Email] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL CONSTRAINT [DF_User_isAdmin]  DEFAULT ((0)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Appointment] ADD  CONSTRAINT [DF_Appointment_isApproved]  DEFAULT ((0)) FOR [isApproved]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Cat] FOREIGN KEY([Cat_FK])
REFERENCES [dbo].[Cat] ([CatID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Cat]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User] FOREIGN KEY([User_FK])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_User1] FOREIGN KEY([Approved_By])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_User1]
GO
ALTER TABLE [dbo].[Cat]  WITH CHECK ADD  CONSTRAINT [FK_Cat_User] FOREIGN KEY([Adopted_User])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Cat] CHECK CONSTRAINT [FK_Cat_User]
GO
