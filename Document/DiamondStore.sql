USE [master]
GO
/****** Object:  Database [DiamondStore]    Script Date: 7/26/2024 7:22:03 PM ******/
CREATE DATABASE [DiamondStore]
GO
ALTER DATABASE [DiamondStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiamondStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiamondStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiamondStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiamondStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiamondStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiamondStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiamondStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DiamondStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiamondStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiamondStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiamondStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiamondStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiamondStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiamondStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiamondStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiamondStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DiamondStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiamondStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiamondStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiamondStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiamondStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiamondStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiamondStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiamondStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiamondStore] SET  MULTI_USER 
GO
ALTER DATABASE [DiamondStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiamondStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiamondStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiamondStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DiamondStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DiamondStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DiamondStore', N'ON'
GO
ALTER DATABASE [DiamondStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [DiamondStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DiamondStore]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GiaCertificate] [varchar](50) NULL,
	[Cut] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Clarity] [varchar](50) NULL,
	[Carat] [decimal](5, 2) NULL,
	[DistributorId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerVoucher]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerVoucher](
	[CustomerVoucherId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[VoucherId] [uniqueidentifier] NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerVoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveryId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[ShiperId] [uniqueidentifier] NULL,
	[ManagerId] [uniqueidentifier] NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distributor]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distributor](
	[DistributorId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DistributorName] [varchar](100) NOT NULL,
	[Locate] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DistributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[OrderDate] [date] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[Status] [varchar](50) NOT NULL,
	[VoucherId] [uniqueidentifier] NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItem]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItem](
	[OrderItemId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [uniqueidentifier] NULL,
	[ProductId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[IsExpired] [bit] NOT NULL,
	[CategoryId] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[RoleId] [uniqueidentifier] NULL,
	[Status] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[VoucherId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[DiscountPercentage] [decimal](5, 2) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warranty]    Script Date: 7/26/2024 7:22:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranty](
	[WarrantyId] [uniqueidentifier] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[IssueDate] [date] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[WarrantyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Id], [GiaCertificate], [Cut], [Color], [Clarity], [Carat], [DistributorId]) VALUES (N'39545e72-1772-46b9-b04f-3d3bc954f425', 3, N'GIA987654', N'Emerald', N'E', N'SI1', CAST(1.75 AS Decimal(5, 2)), N'd173edb7-5977-40a3-bcc2-457b3c7b3576')
INSERT [dbo].[Category] ([CategoryId], [Id], [GiaCertificate], [Cut], [Color], [Clarity], [Carat], [DistributorId]) VALUES (N'34c63939-da9b-436c-b864-737e4b7b245c', 5, N'GIA112233', N'Cushion', N'H', N'IF', CAST(1.25 AS Decimal(5, 2)), N'84cd738f-9112-404b-89b8-4ec97846a8f8')
INSERT [dbo].[Category] ([CategoryId], [Id], [GiaCertificate], [Cut], [Color], [Clarity], [Carat], [DistributorId]) VALUES (N'f3012533-8725-4a74-8ef1-d9c5a4afe8bb', 1, N'GIA123456', N'Round', N'D', N'VS1', CAST(1.50 AS Decimal(5, 2)), N'adb83c21-a372-428e-9c58-1f51bb5a16da')
INSERT [dbo].[Category] ([CategoryId], [Id], [GiaCertificate], [Cut], [Color], [Clarity], [Carat], [DistributorId]) VALUES (N'9acd6dfd-076d-4c8c-ad57-fbbb9a1cebf5', 4, N'GIA456789', N'Oval', N'G', N'VS2', CAST(2.50 AS Decimal(5, 2)), N'a8ba4f87-df16-4031-837b-6174dd6df77d')
INSERT [dbo].[Category] ([CategoryId], [Id], [GiaCertificate], [Cut], [Color], [Clarity], [Carat], [DistributorId]) VALUES (N'ce2bf848-f255-49dd-9e49-fc41042d3b19', 2, N'GIA654321', N'Princess', N'F', N'VVS2', CAST(2.00 AS Decimal(5, 2)), N'bcd88522-1059-4ffb-9acf-8e31394b4131')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerVoucher] ON 

INSERT [dbo].[CustomerVoucher] ([CustomerVoucherId], [Id], [UserId], [VoucherId], [Status]) VALUES (N'7ad4735a-aa0c-4701-94bc-1b52074c59a8', 2, N'6f025af2-7ca2-414a-8088-385cc4eac3d0', N'7a870f0b-fb7b-4642-afff-fb6cbc0bf919', N'Unused')
INSERT [dbo].[CustomerVoucher] ([CustomerVoucherId], [Id], [UserId], [VoucherId], [Status]) VALUES (N'43607ff9-1599-4a7c-b122-9cc3a7e821be', 4, N'6f025af2-7ca2-414a-8088-385cc4eac3d0', N'0ae513f1-8846-440f-89db-91509d6cad0c', N'Unused')
INSERT [dbo].[CustomerVoucher] ([CustomerVoucherId], [Id], [UserId], [VoucherId], [Status]) VALUES (N'a73b5c1c-b682-4232-8a73-ac32c3ff96bb', 5, N'a5569222-e826-4afb-a30b-362dbbbdcd50', N'9599c185-7fa1-4d9d-9a4a-40eb9a78d1e8', N'Unused')
INSERT [dbo].[CustomerVoucher] ([CustomerVoucherId], [Id], [UserId], [VoucherId], [Status]) VALUES (N'dc5cffbc-fbd9-4796-8c3a-ac5abaa27921', 3, N'a5569222-e826-4afb-a30b-362dbbbdcd50', N'cd439be4-b550-4abc-9cf8-05f96310fe9b', N'Expired')
INSERT [dbo].[CustomerVoucher] ([CustomerVoucherId], [Id], [UserId], [VoucherId], [Status]) VALUES (N'f3600fc5-d4b5-4243-85c2-d0ca7bd4098b', 1, N'a5569222-e826-4afb-a30b-362dbbbdcd50', N'b514759b-f653-4364-95e6-96eabd595a2c', N'Used')
SET IDENTITY_INSERT [dbo].[CustomerVoucher] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveryId], [Id], [OrderId], [ShiperId], [ManagerId], [Status]) VALUES (N'9c9d9aa2-bd5f-48f5-973d-c51ddca4c06a', 2, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'8890fd42-a0eb-4bf8-907e-c14d9272a7cc', N'c3e6a8bd-345f-4f9a-809c-6b4ead7718b8', N'Shipped')
INSERT [dbo].[Delivery] ([DeliveryId], [Id], [OrderId], [ShiperId], [ManagerId], [Status]) VALUES (N'd8b3ee98-ca51-4321-a9cf-f18c7fdf0bab', 1, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'8890fd42-a0eb-4bf8-907e-c14d9272a7cc', N'c3e6a8bd-345f-4f9a-809c-6b4ead7718b8', N'Shipped')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Distributor] ON 

INSERT [dbo].[Distributor] ([DistributorId], [Id], [DistributorName], [Locate]) VALUES (N'adb83c21-a372-428e-9c58-1f51bb5a16da', 1, N'Diamond Distributors Inc.', N'123 Diamond St.')
INSERT [dbo].[Distributor] ([DistributorId], [Id], [DistributorName], [Locate]) VALUES (N'd173edb7-5977-40a3-bcc2-457b3c7b3576', 3, N'Precious Stones Ltd.', N'789 Precious Rd.')
INSERT [dbo].[Distributor] ([DistributorId], [Id], [DistributorName], [Locate]) VALUES (N'84cd738f-9112-404b-89b8-4ec97846a8f8', 5, N'Luxury Gems', N'654 Luxury Blvd.')
INSERT [dbo].[Distributor] ([DistributorId], [Id], [DistributorName], [Locate]) VALUES (N'a8ba4f87-df16-4031-837b-6174dd6df77d', 4, N'Jewel Supply Co.', N'321 Jewel Ln.')
INSERT [dbo].[Distributor] ([DistributorId], [Id], [DistributorName], [Locate]) VALUES (N'bcd88522-1059-4ffb-9acf-8e31394b4131', 2, N'Gemstone Wholesalers', N'456 Gem Ave.')
SET IDENTITY_INSERT [dbo].[Distributor] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [Id], [UserId], [OrderDate], [TotalAmount], [Status], [VoucherId], [TotalPrice]) VALUES (N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', 1, N'a5569222-e826-4afb-a30b-362dbbbdcd50', CAST(N'2024-06-15' AS Date), CAST(115000.00 AS Decimal(10, 2)), N'Cart', N'7a870f0b-fb7b-4642-afff-fb6cbc0bf919', CAST(38250.00 AS Decimal(10, 2)))
INSERT [dbo].[Order] ([OrderId], [Id], [UserId], [OrderDate], [TotalAmount], [Status], [VoucherId], [TotalPrice]) VALUES (N'8abd3dda-0b3c-4184-8747-942674f4892e', 2, N'6f025af2-7ca2-414a-8088-385cc4eac3d0', CAST(N'2024-12-22' AS Date), CAST(30000.00 AS Decimal(10, 2)), N'Cart', N'0ae513f1-8846-440f-89db-91509d6cad0c', CAST(22500.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItem] ON 

INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'c79a1465-ba75-41a8-a16c-00b16b8e01ee', 2, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'96b096bc-6370-4aee-8faf-196caa35714c', 8, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'79895075-5ad6-43c2-86c1-240a9a54801d', 17, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'17929128-77fc-44a4-83e1-269171d652ef', 1, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'a682a951-c782-41bd-b24a-1ba941ae038f')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'4cad1d21-2462-42c2-ad36-30eedf345bf1', 7, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'b61d5056-fedb-46b7-95fb-324f6ab8cc57', 18, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'a56390ba-34ca-4dc1-8d57-39e347006a38', 15, NULL, N'5dbedf7a-716d-441c-8b8e-d438343adbd3')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'77715eff-97dd-4c65-8ea5-3b455e9a520c', 19, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'6906a4ac-c8a0-468f-a3f8-3c801323e1ba', 6, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'2ca91099-6d60-48c7-9985-6f6d1b638ffd', 14, NULL, N'7138e638-2dcf-4a69-b82a-c7b83ee68d6c')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'f902ac13-7305-4187-897b-757576255d8a', 13, NULL, N'a682a951-c782-41bd-b24a-1ba941ae038f')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'7e18008c-12c0-45b6-b6d9-a6b43f3fc6e8', 11, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'4fd7743f-f692-4f5e-a647-baa28cfb6e51', 9, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'41f82ec7-9105-4236-9b1a-c444e22a3c03', 21, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'a682a951-c782-41bd-b24a-1ba941ae038f')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'5bba8518-ab02-4b78-9396-c5751dbd3dda', 4, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'958b1bb2-19f8-4fad-857b-cdbcc333ca3c', 3, N'8abd3dda-0b3c-4184-8747-942674f4892e', N'5dbedf7a-716d-441c-8b8e-d438343adbd3')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'cab36115-3048-40f6-b4b4-d6f0cde1145b', 5, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'fb2f89b7-277e-4bb0-8153-da5edf548132', 12, NULL, N'a682a951-c782-41bd-b24a-1ba941ae038f')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'dda919ac-e4be-4d31-8e9f-e90d590bc127', 10, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'eaf91a6f-f184-440b-9f20-eefd4979a30f', 16, NULL, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0')
INSERT [dbo].[OrderItem] ([OrderItemId], [Id], [OrderId], [ProductId]) VALUES (N'43a1b7c0-61bb-4735-a010-f8e2068c5910', 20, N'4836c5c3-8e28-4ee2-ae00-4c334d83c294', N'a682a951-c782-41bd-b24a-1ba941ae038f')
SET IDENTITY_INSERT [dbo].[OrderItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Id], [Name], [Description], [Price], [IsExpired], [CategoryId]) VALUES (N'9488e7a7-e6f3-44c1-b4da-0f99320916d0', 2, N'Princess Cut Diamond', N'A stunning princess cut diamond', CAST(20000.00 AS Decimal(10, 2)), 0, N'ce2bf848-f255-49dd-9e49-fc41042d3b19')
INSERT [dbo].[Product] ([ProductId], [Id], [Name], [Description], [Price], [IsExpired], [CategoryId]) VALUES (N'a682a951-c782-41bd-b24a-1ba941ae038f', 1, N'Round Cut Diamond', N'A beautiful round cut diamond', CAST(15000.00 AS Decimal(10, 2)), 0, N'f3012533-8725-4a74-8ef1-d9c5a4afe8bb')
INSERT [dbo].[Product] ([ProductId], [Id], [Name], [Description], [Price], [IsExpired], [CategoryId]) VALUES (N'7138e638-2dcf-4a69-b82a-c7b83ee68d6c', 4, N'Oval Cut Diamond', N'An exquisite oval cut diamond', CAST(25000.00 AS Decimal(10, 2)), 0, N'9acd6dfd-076d-4c8c-ad57-fbbb9a1cebf5')
INSERT [dbo].[Product] ([ProductId], [Id], [Name], [Description], [Price], [IsExpired], [CategoryId]) VALUES (N'5dbedf7a-716d-441c-8b8e-d438343adbd3', 3, N'Emerald Cut Diamond', N'A magnificent emerald cut diamond', CAST(17500.00 AS Decimal(10, 2)), 0, N'39545e72-1772-46b9-b04f-3d3bc954f425')
INSERT [dbo].[Product] ([ProductId], [Id], [Name], [Description], [Price], [IsExpired], [CategoryId]) VALUES (N'789f817c-8257-4588-9bef-d7b5e69c51c4', 5, N'Cushion Cut Diamond', N'A gorgeous cushion cut diamond', CAST(12500.00 AS Decimal(10, 2)), 0, N'34c63939-da9b-436c-b864-737e4b7b245c')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [Id], [RoleName]) VALUES (N'78b62fc7-91f3-412b-923e-0122821e1ab7', 5, N'Support')
INSERT [dbo].[Role] ([RoleId], [Id], [RoleName]) VALUES (N'cbdb557d-0e81-4960-bd40-0bd7d3e9be7d', 2, N'Shiper')
INSERT [dbo].[Role] ([RoleId], [Id], [RoleName]) VALUES (N'2b0fd2ac-56d8-4a5f-93fc-7741f997ea5e', 3, N'Manager')
INSERT [dbo].[Role] ([RoleId], [Id], [RoleName]) VALUES (N'7d6e3cfc-3615-4a05-9193-9a249f8077ba', 4, N'Admin')
INSERT [dbo].[Role] ([RoleId], [Id], [RoleName]) VALUES (N'0d682409-3a67-4cee-bfa7-f05da2f33c32', 1, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'a5569222-e826-4afb-a30b-362dbbbdcd50', 1, N'customer1', N'1', N'customer1@example.com', N'0d682409-3a67-4cee-bfa7-f05da2f33c32', N'Inactive')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'6f025af2-7ca2-414a-8088-385cc4eac3d0', 2, N'support1', N'1', N'support1@example.com', N'78b62fc7-91f3-412b-923e-0122821e1ab7', N'Active')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'fe752dd8-4de3-4867-8aa1-48c74be82d80', 5, N'admin1', N'1', N'admin1@example.com', N'7d6e3cfc-3615-4a05-9193-9a249f8077ba', N'Active')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'c3e6a8bd-345f-4f9a-809c-6b4ead7718b8', 4, N'manager1', N'1', N'manager1@example.com', N'2b0fd2ac-56d8-4a5f-93fc-7741f997ea5e', N'Active')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'37975087-933f-4df0-be55-b4ed14d6fd3c', 7, N'duonghailuom', N'1', N'duonghailuom@gmail.com', N'0d682409-3a67-4cee-bfa7-f05da2f33c32', N'Active')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'8890fd42-a0eb-4bf8-907e-c14d9272a7cc', 3, N'shiper1', N'1', N'shiper1@example.com', N'cbdb557d-0e81-4960-bd40-0bd7d3e9be7d', N'Active')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'4928bc3b-535a-4da1-80cf-c1f379240303', 6, N'a', N'1', N'admin@gmail.com', N'0d682409-3a67-4cee-bfa7-f05da2f33c32', N'Verifying')
INSERT [dbo].[User] ([UserId], [Id], [Username], [Password], [Email], [RoleId], [Status]) VALUES (N'5046e259-0322-4ddd-8a12-ee9a699286df', 8, N'danh', N'1', N'dangtranhai628@gmail.com', N'0d682409-3a67-4cee-bfa7-f05da2f33c32', N'Active')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Voucher] ON 

INSERT [dbo].[Voucher] ([VoucherId], [Id], [Name], [DiscountPercentage], [StartDate], [EndDate]) VALUES (N'cd439be4-b550-4abc-9cf8-05f96310fe9b', 3, N'Black Friday', CAST(20.00 AS Decimal(5, 2)), CAST(N'2024-11-23' AS Date), CAST(N'2024-11-27' AS Date))
INSERT [dbo].[Voucher] ([VoucherId], [Id], [Name], [DiscountPercentage], [StartDate], [EndDate]) VALUES (N'9599c185-7fa1-4d9d-9a4a-40eb9a78d1e8', 5, N'Valentine''s Day', CAST(30.00 AS Decimal(5, 2)), CAST(N'2024-02-10' AS Date), CAST(N'2024-02-14' AS Date))
INSERT [dbo].[Voucher] ([VoucherId], [Id], [Name], [DiscountPercentage], [StartDate], [EndDate]) VALUES (N'0ae513f1-8846-440f-89db-91509d6cad0c', 4, N'Christmas Special', CAST(25.00 AS Decimal(5, 2)), CAST(N'2024-12-20' AS Date), CAST(N'2024-12-31' AS Date))
INSERT [dbo].[Voucher] ([VoucherId], [Id], [Name], [DiscountPercentage], [StartDate], [EndDate]) VALUES (N'b514759b-f653-4364-95e6-96eabd595a2c', 1, N'New Year Discount', CAST(10.00 AS Decimal(5, 2)), CAST(N'2024-01-01' AS Date), CAST(N'2024-01-31' AS Date))
INSERT [dbo].[Voucher] ([VoucherId], [Id], [Name], [DiscountPercentage], [StartDate], [EndDate]) VALUES (N'7a870f0b-fb7b-4642-afff-fb6cbc0bf919', 2, N'Summer Sale', CAST(15.00 AS Decimal(5, 2)), CAST(N'2024-06-01' AS Date), CAST(N'2024-06-30' AS Date))
SET IDENTITY_INSERT [dbo].[Voucher] OFF
GO
SET IDENTITY_INSERT [dbo].[Warranty] ON 

INSERT [dbo].[Warranty] ([WarrantyId], [Id], [ProductId], [UserId], [IssueDate], [ExpirationDate]) VALUES (N'a9cdd74c-340c-4c29-98aa-41893ffc5e1c', 3, N'5dbedf7a-716d-441c-8b8e-d438343adbd3', N'6f025af2-7ca2-414a-8088-385cc4eac3d0', CAST(N'2024-12-22' AS Date), CAST(N'2025-12-22' AS Date))
INSERT [dbo].[Warranty] ([WarrantyId], [Id], [ProductId], [UserId], [IssueDate], [ExpirationDate]) VALUES (N'0f1618e3-008b-4248-bd7d-85f54dd6563b', 2, N'9488e7a7-e6f3-44c1-b4da-0f99320916d0', N'a5569222-e826-4afb-a30b-362dbbbdcd50', CAST(N'2024-06-15' AS Date), CAST(N'2025-06-15' AS Date))
INSERT [dbo].[Warranty] ([WarrantyId], [Id], [ProductId], [UserId], [IssueDate], [ExpirationDate]) VALUES (N'cde8601a-aac2-45bf-9db0-b50dfd0c64f3', 1, N'a682a951-c782-41bd-b24a-1ba941ae038f', N'a5569222-e826-4afb-a30b-362dbbbdcd50', CAST(N'2024-06-15' AS Date), CAST(N'2025-06-15' AS Date))
SET IDENTITY_INSERT [dbo].[Warranty] OFF
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT (newid()) FOR [CategoryId]
GO
ALTER TABLE [dbo].[CustomerVoucher] ADD  DEFAULT (newid()) FOR [CustomerVoucherId]
GO
ALTER TABLE [dbo].[Delivery] ADD  DEFAULT (newid()) FOR [DeliveryId]
GO
ALTER TABLE [dbo].[Distributor] ADD  DEFAULT (newid()) FOR [DistributorId]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (newid()) FOR [OrderId]
GO
ALTER TABLE [dbo].[OrderItem] ADD  DEFAULT (newid()) FOR [OrderItemId]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (newid()) FOR [ProductId]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [IsExpired]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (newid()) FOR [RoleId]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[Voucher] ADD  DEFAULT (newid()) FOR [VoucherId]
GO
ALTER TABLE [dbo].[Warranty] ADD  DEFAULT (newid()) FOR [WarrantyId]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([DistributorId])
REFERENCES [dbo].[Distributor] ([DistributorId])
GO
ALTER TABLE [dbo].[CustomerVoucher]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[CustomerVoucher]  WITH CHECK ADD FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Voucher] ([VoucherId])
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([ManagerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD FOREIGN KEY([ShiperId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Voucher] ([VoucherId])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderItem]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Warranty]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [DiamondStore] SET  READ_WRITE 
GO
