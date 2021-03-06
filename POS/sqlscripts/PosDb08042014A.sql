USE master
GO

IF EXISTS(select * from sys.databases where name='PosDb')
begin
	alter database PosDb set single_user with rollback IMMEDIATE
	DROP DATABASE PosDb
end
GO

CREATE DATABASE PosDb
GO

USE [PosDb]
GO

/****** Object:  Table [dbo].[Cashbox]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cashbox](
	[CashboxId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[PremiseId] [tinyint] NULL,
	[Name] [varchar](20) NULL,
	[CurrentAmount] [decimal](13, 4) NOT NULL,
 CONSTRAINT [XPKCashBox] PRIMARY KEY CLUSTERED 
(
	[CashboxId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CashboxStatus]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashboxStatus](
	[CBStatusId] [int] NOT NULL IDENTITY ( 1,1 ),
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[StartAmount] [decimal](13, 4) NOT NULL,
	[EndAmount] [decimal](13, 4) NULL,
	[CashboxId] [tinyint] NULL,
	[UserId] [smallint] NULL,
	
 CONSTRAINT [XPKCashboxStatus] PRIMARY KEY CLUSTERED 
(
	[CBStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashboxTestify]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashboxTestify](
	[CashboxId] [tinyint] NULL,
	[CashboxTestifyId] [int] NOT NULL IDENTITY ( 1,1 ),
	[TestifyDate] [datetime] NOT NULL,	
	[UserId] [smallint] NULL,
	[AmountChecked] [decimal](13, 4) NULL,
	[Difference] [decimal](13, 4) NULL,	
	[SessionId] [int] NULL,
	[CBStatusId] [int] NULL,	
 CONSTRAINT [XPKCashboxTestify] PRIMARY KEY CLUSTERED 
(
	[CashboxTestifyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CashMovement]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CashMovement](
	[CashboxId] [tinyint] NULL,
	[CashMovementId] [int] NOT NULL IDENTITY ( 1,1 ),
	[MovementDate] [datetime] NULL,
	[Amount] [decimal](13, 4) NULL,
	[MovementType] [varchar](10) NULL,
	[MovementStatus] [varchar](10) NULL,
	[SessionId] [int] NULL,
	[MovementCategory] [varchar](10) NULL,
 CONSTRAINT [XPKCashMovement] PRIMARY KEY CLUSTERED 
(
	[CashMovementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[Name] [varchar](50) NULL,
	[RUC] [varchar](20) NULL,
	[Address] [varchar](50) NULL,
 CONSTRAINT [XPKCompany] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[PersonId] [int] NULL,
	[CustomerId] [int] NOT NULL IDENTITY ( 1,1 ),
	[RUC] [varchar](20) NULL,
	[LegalName] [varchar](100) NULL,
	[CustomerType] [varchar](10) NULL,
 CONSTRAINT [XPKCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Division]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Division](
	[DivisionId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[CompanyId] [tinyint] NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [XPKDivision] PRIMARY KEY CLUSTERED 
(
	[DivisionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL IDENTITY ( 1,1 ),
	[PersonId] [int] NULL,
 CONSTRAINT [XPKEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MiscVariant]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MiscVariant](
	[MiscVariantId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[Name] [varchar](30) NULL,
 CONSTRAINT [XPKMiscVariant] PRIMARY KEY CLUSTERED 
(
	[MiscVariantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] NOT NULL IDENTITY ( 1,1 ),
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[DocNumber] [varchar](20) NULL,
 CONSTRAINT [XPKPerson] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Premise]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Premise](
	[DivisionId] [tinyint] NULL,
	[PremiseId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[Address] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[PremiseType] [varchar](10) NULL,
 CONSTRAINT [XPKPremise] PRIMARY KEY CLUSTERED 
(
	[PremiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductBaseId] [smallint] NULL,
	[ProductId] [int] NOT NULL IDENTITY ( 1,1 ),	
	[MiscVariantId] [tinyint] NULL,	
 CONSTRAINT [XPKProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductBase]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductBase](
	[ProductBaseId] [smallint] NOT NULL IDENTITY ( 1,1 ),
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](200) NULL,	
	[SaleDefaultUnitAbbr] [varchar](20) NOT NULL,
 CONSTRAINT [XPKProductBase] PRIMARY KEY CLUSTERED 
(
	[ProductBaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductMovement]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMovement](
	[ProductMovementId] [int] NOT NULL IDENTITY ( 1,1 ),
	[PremiseId] [tinyint] NOT NULL,
	[MovementType] [varchar](10) NOT NULL,
	[MovementCategory] [varchar](10) NOT NULL,
	[ProductId] [smallint] NOT NULL,
	[UnitId] [tinyint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[MovementDate] datetime NOT NULL,
	[SessionId] [int] NOT NULL,
 CONSTRAINT [XPKProductMovement] PRIMARY KEY CLUSTERED 
(
	[ProductMovementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductPremise]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPremise](
	[ProductId] [int] NOT NULL,
	[PremiseId] [tinyint] NOT NULL,
	[CurrentStock] [int] NULL,
	[MinimunStock] [int] NULL,	
	[StockDefaultUnitAbbr] [varchar](20) NULL,
 CONSTRAINT [XPKProductPremise] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[PremiseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductPremiseStatus]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPremiseStatus](
	[PPStatusId] [int] NOT NULL IDENTITY ( 1,1 ),
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[StartQuantity] [int] NULL,
	[EndQuantity] [int] NULL,
	[ProductId] [int] NULL,
	[PremiseId] [tinyint] NULL,
 CONSTRAINT [XPKProductPremiseStatus] PRIMARY KEY CLUSTERED 
(
	[PPStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductUnit]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductUnit](
	[ProductId] [int] NOT NULL,
	[UnitId] [tinyint] NOT NULL,
	[CostPrice] [decimal](13, 4) NULL,
	[SalePrice] [decimal](13, 4) NOT NULL,
 CONSTRAINT [XPKProductUnit] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sale]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] NOT NULL IDENTITY ( 1,1 ),
	[Date] [datetime] NULL,
	[Status] [varchar](10) NULL,
	[SessionId] [int] NULL,
	[CashMovementId] [int] NULL,
 CONSTRAINT [XPKSale] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SaleDetails]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetails](
	[SaleDetailId] [int] NOT NULL IDENTITY ( 1,1 ),
	[Quantity] [smallint] NULL,
	[SinglePrice] [decimal](13, 4) NULL,
	[TotalPrice] [decimal](13, 4) NULL,
	[SaleId] [int] NULL,
	[ProductMovementId] [int] NULL,
 CONSTRAINT [XPKSaleDetails] PRIMARY KEY CLUSTERED 
(
	[SaleDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleDocument]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SaleDocument](
	[Date] [date] NULL,
	[CustomerId] [int] NULL,
	[CustomerName] [varchar](200) NULL,
	[RUC] [varchar](20) NULL,
	[Status] [varchar](10) NULL,
	[Number] [varchar](30) NULL,
	[SubTotal] [decimal](13, 4) NULL,
	[IGV] [decimal](13, 4) NULL,
	[Total] [decimal](13, 4) NULL,
	[DocumentType] [varchar](10) NULL,
	[SaleId] [int] NOT NULL,
 CONSTRAINT [XPKSaleDocument] PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Session]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[UserId] [smallint] NULL,
	[SessionId] [int] NOT NULL IDENTITY ( 1,1 ),
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[PremiseId] [tinyint] NULL,
 CONSTRAINT [XPKSession] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemRole]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemRole](
	[RoleId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[RoleName] [varchar](20) NULL,
 CONSTRAINT [XPKSystemRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[Name] [varchar](20) NOT NULL,
	[Abbreviation] [varchar](20) NOT NULL,
 CONSTRAINT [XPKUnit] PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[EmployeeId] [int] NULL,
	[UserId] [smallint] NOT NULL IDENTITY ( 1,1 ),
	[Login] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[DefaultPremise] [tinyint] NOT NULL,
 CONSTRAINT [XPKUser] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserSystemRole]    Script Date: 20/10/2013 10:25:34 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSystemRole](
	[UserId] [smallint] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
 CONSTRAINT [XPKUser_SystemRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnitEquivalence] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnitEquivalence](
	[UnitEquivalenceId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[LowerUnitAbbr] [varchar](20) NOT NULL,
	[HigherUnitAbbr] [varchar](20) NOT NULL,	
	[EquivalenceFactor] [int] NOT NULL,	
 CONSTRAINT [XPKUnitEquivalence] PRIMARY KEY CLUSTERED 
(
	[UnitEquivalenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[GeneralConfigValues] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GeneralConfigValues](
	[ConfigId] [tinyint] NOT NULL IDENTITY ( 1,1 ),
	[ConfigName] [varchar](50) NOT NULL,
	[ConfigValue] [varchar](50) NOT NULL,		
 CONSTRAINT [XPKGeneralConfigValues] PRIMARY KEY CLUSTERED 
(
	[ConfigId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Cashbox]  WITH CHECK ADD  CONSTRAINT [R_36] FOREIGN KEY([PremiseId])
REFERENCES [dbo].[Premise] ([PremiseId])
GO
ALTER TABLE [dbo].[Cashbox] CHECK CONSTRAINT [R_36]
GO
ALTER TABLE [dbo].[CashboxStatus]  WITH CHECK ADD  CONSTRAINT [R_43] FOREIGN KEY([CashboxId])
REFERENCES [dbo].[Cashbox] ([CashboxId])
GO
ALTER TABLE [dbo].[CashboxStatus] CHECK CONSTRAINT [R_43]
GO
--ALTER TABLE [dbo].[CashboxTestify]  WITH CHECK ADD  CONSTRAINT [R_37] FOREIGN KEY([CashboxId])
--REFERENCES [dbo].[Cashbox] ([CashboxId])
--GO
--ALTER TABLE [dbo].[CashboxTestify] CHECK CONSTRAINT [R_37]
--GO
ALTER TABLE [dbo].[CashboxTestify]  WITH CHECK ADD  CONSTRAINT [R_38] FOREIGN KEY([CBStatusId])
REFERENCES [dbo].[CashboxStatus] ([CBStatusId])
GO
ALTER TABLE [dbo].[CashboxTestify] CHECK CONSTRAINT [R_38]
GO
ALTER TABLE [dbo].[CashboxTestify]  WITH CHECK ADD  CONSTRAINT [R_39] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
GO
ALTER TABLE [dbo].[CashboxTestify] CHECK CONSTRAINT [R_39]
GO
ALTER TABLE [dbo].[CashMovement]  WITH CHECK ADD  CONSTRAINT [R_41] FOREIGN KEY([CashboxId])
REFERENCES [dbo].[Cashbox] ([CashboxId])
GO
ALTER TABLE [dbo].[CashMovement] CHECK CONSTRAINT [R_41]
GO
ALTER TABLE [dbo].[CashMovement]  WITH CHECK ADD  CONSTRAINT [R_48] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
GO
ALTER TABLE [dbo].[CashMovement] CHECK CONSTRAINT [R_48]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [R_3] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [R_3]
GO
ALTER TABLE [dbo].[Division]  WITH CHECK ADD  CONSTRAINT [R_20] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Division] CHECK CONSTRAINT [R_20]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [R_4] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [R_4]
GO
ALTER TABLE [dbo].[Premise]  WITH CHECK ADD  CONSTRAINT [R_17] FOREIGN KEY([DivisionId])
REFERENCES [dbo].[Division] ([DivisionId])
GO
ALTER TABLE [dbo].[Premise] CHECK CONSTRAINT [R_17]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [R_100] FOREIGN KEY([MiscVariantId])
REFERENCES [dbo].[MiscVariant] ([MiscVariantId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [R_100]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [R_28] FOREIGN KEY([ProductBaseId])
REFERENCES [dbo].[ProductBase] ([ProductBaseId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [R_28]
GO
ALTER TABLE [dbo].[ProductMovement]  WITH CHECK ADD  CONSTRAINT [R_57] FOREIGN KEY([PremiseId])
REFERENCES [dbo].[Premise] ([PremiseId])
GO
ALTER TABLE [dbo].[ProductMovement] CHECK CONSTRAINT [R_57]
GO
ALTER TABLE [dbo].[ProductPremise]  WITH CHECK ADD  CONSTRAINT [R_10] FOREIGN KEY([PremiseId])
REFERENCES [dbo].[Premise] ([PremiseId])
GO
ALTER TABLE [dbo].[ProductPremise] CHECK CONSTRAINT [R_10]
GO
ALTER TABLE [dbo].[ProductPremise]  WITH CHECK ADD  CONSTRAINT [R_9] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductPremise] CHECK CONSTRAINT [R_9]
GO
ALTER TABLE [dbo].[ProductPremiseStatus]  WITH CHECK ADD  CONSTRAINT [R_11] FOREIGN KEY([ProductId], [PremiseId])
REFERENCES [dbo].[ProductPremise] ([ProductId], [PremiseId])
GO
ALTER TABLE [dbo].[ProductPremiseStatus] CHECK CONSTRAINT [R_11]
GO
ALTER TABLE [dbo].[ProductUnit]  WITH CHECK ADD  CONSTRAINT [R_101] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductUnit] CHECK CONSTRAINT [R_101]
GO
ALTER TABLE [dbo].[ProductUnit]  WITH CHECK ADD  CONSTRAINT [R_102] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([UnitId])
GO
ALTER TABLE [dbo].[ProductUnit] CHECK CONSTRAINT [R_102]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [R_50] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Session] ([SessionId])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [R_50]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [R_52] FOREIGN KEY([CashMovementId])
REFERENCES [dbo].[CashMovement] ([CashMovementId])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [R_52]
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [R_46] FOREIGN KEY([SaleId])
REFERENCES [dbo].[SaleDocument] ([SaleId])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [R_46]
GO
ALTER TABLE [dbo].[SaleDetails]  WITH CHECK ADD  CONSTRAINT [R_56] FOREIGN KEY([ProductMovementId])
REFERENCES [dbo].[ProductMovement] ([ProductMovementId])
GO
ALTER TABLE [dbo].[SaleDetails] CHECK CONSTRAINT [R_56]
GO
ALTER TABLE [dbo].[SaleDocument]  WITH CHECK ADD  CONSTRAINT [R_33] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[SaleDocument] CHECK CONSTRAINT [R_33]
GO
ALTER TABLE [dbo].[SaleDocument]  WITH CHECK ADD  CONSTRAINT [R_47] FOREIGN KEY([SaleId])
REFERENCES [dbo].[Sale] ([SaleId])
GO
ALTER TABLE [dbo].[SaleDocument] CHECK CONSTRAINT [R_47]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [R_35] FOREIGN KEY([PremiseId])
REFERENCES [dbo].[Premise] ([PremiseId])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [R_35]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [R_8] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [R_8]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [R_2] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [R_2]
GO
ALTER TABLE [dbo].[UserSystemRole]  WITH CHECK ADD  CONSTRAINT [R_6] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserSystemRole] CHECK CONSTRAINT [R_6]
GO
ALTER TABLE [dbo].[UserSystemRole]  WITH CHECK ADD  CONSTRAINT [R_7] FOREIGN KEY([RoleId])
REFERENCES [dbo].[SystemRole] ([RoleId])
GO
ALTER TABLE [dbo].[UserSystemRole] CHECK CONSTRAINT [R_7]
GO
