USE [master]
GO
/****** Object:  Database [FragrantWorldDB]    Script Date: 19.12.2024 22:16:48 ******/
CREATE DATABASE [FragrantWorldDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FragrantWorldDB', FILENAME = N'D:\SQL2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\FragrantWorldDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FragrantWorldDB_log', FILENAME = N'D:\SQL2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\FragrantWorldDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FragrantWorldDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FragrantWorldDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FragrantWorldDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FragrantWorldDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FragrantWorldDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FragrantWorldDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FragrantWorldDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FragrantWorldDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FragrantWorldDB] SET  MULTI_USER 
GO
ALTER DATABASE [FragrantWorldDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FragrantWorldDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FragrantWorldDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FragrantWorldDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FragrantWorldDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FragrantWorldDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FragrantWorldDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FragrantWorldDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FragrantWorldDB]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[PickupPoint] [int] NOT NULL,
	[ClientFullName] [nvarchar](max) NULL,
	[ReceiveCode] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF75A84BE6] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickupPoint]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickupPoint](
	[OrderID] [int] NOT NULL,
	[PickupPointID] [int] NOT NULL,
 CONSTRAINT [PK_OrderPickupPoint] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [int] NOT NULL,
	[ProductQuantity] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662E0ECBBEC] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[PickupPointID] [int] IDENTITY(1,1) NOT NULL,
	[PostalIndex] [int] NULL,
	[City] [nvarchar](max) NULL,
	[Street] [nvarchar](max) NULL,
	[House] [int] NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[PickupPointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5D6CDE391] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.12.2024 22:16:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (1, N'Новый ', CAST(N'2022-05-04T00:00:00.000' AS DateTime), CAST(N'2022-05-10T00:00:00.000' AS DateTime), 24, N'Новиков Матвей Маркович', 201)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (2, N'Новый ', CAST(N'2022-05-05T00:00:00.000' AS DateTime), CAST(N'2022-05-11T00:00:00.000' AS DateTime), 25, NULL, 202)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (3, N'Новый ', CAST(N'2022-05-06T00:00:00.000' AS DateTime), CAST(N'2022-05-12T00:00:00.000' AS DateTime), 26, N'Соловьев Пётр Никитич', 203)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (4, N'Новый ', CAST(N'2022-05-07T00:00:00.000' AS DateTime), CAST(N'2022-05-13T00:00:00.000' AS DateTime), 27, NULL, 204)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (5, N'Новый ', CAST(N'2022-05-08T00:00:00.000' AS DateTime), CAST(N'2022-05-14T00:00:00.000' AS DateTime), 28, N'Васильева Софья Глебовна', 205)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (6, N'Новый ', CAST(N'2022-05-09T00:00:00.000' AS DateTime), CAST(N'2022-05-15T00:00:00.000' AS DateTime), 29, NULL, 206)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (7, N'Новый ', CAST(N'2022-05-10T00:00:00.000' AS DateTime), CAST(N'2022-05-16T00:00:00.000' AS DateTime), 30, NULL, 207)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (8, N'Новый ', CAST(N'2022-05-11T00:00:00.000' AS DateTime), CAST(N'2022-05-17T00:00:00.000' AS DateTime), 31, NULL, 208)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (9, N'Новый ', CAST(N'2022-05-12T00:00:00.000' AS DateTime), CAST(N'2022-05-18T00:00:00.000' AS DateTime), 32, N'Львов Роман Павлович', 209)
GO
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDate], [OrderDeliveryDate], [PickupPoint], [ClientFullName], [ReceiveCode]) VALUES (10, N'Завершен', CAST(N'2022-05-13T00:00:00.000' AS DateTime), CAST(N'2022-05-19T00:00:00.000' AS DateTime), 33, NULL, 210)
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (1, 1)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (2, 15)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (3, 2)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (4, 3)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (5, 11)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (6, 4)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (7, 4)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (8, 13)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (9, 5)
GO
INSERT [dbo].[OrderPickupPoint] ([OrderID], [PickupPointID]) VALUES (10, 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (1, 1, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (1, 2, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (1, 3, 2)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (1, 4, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (2, 1, 5)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (2, 3, 3)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (3, 4, 100)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (4, 3, 23)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (5, 3, 24)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (6, 2, 14)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (7, 1, 1)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (7, 2, 34)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (8, 4, 1004)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (9, 2, 43)
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [ProductQuantity]) VALUES (10, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (1, 344288, N' г. Ангарск', N' ул. Чехова', 1)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (2, 614164, N' г.Ангарск', N'  ул. Степная', 30)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (3, 394242, N' г. Ангарск', N' ул. Коммунистическая', 43)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (4, 660540, N' г. Ангарск', N' ул. Солнечная', 25)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (5, 125837, N' г. Ангарск', N' ул. Шоссейная', 40)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (6, 125703, N' г. Ангарск', N' ул. Партизанская', 49)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (7, 625283, N' г. Ангарск', N' ул. Победы', 46)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (8, 614611, N' г. Ангарск', N' ул. Молодежная', 50)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (9, 454311, N' г.Ангарск', N' ул. Новая', 19)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (10, 660007, N' г.Ангарск', N' ул. Октябрьская', 19)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (11, 603036, N' г. Ангарск', N' ул. Садовая', 4)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (12, 450983, N' г.Ангарск', N' ул. Комсомольская', 26)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (13, 394782, N' г. Ангарск', N' ул. Чехова', 3)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (14, 603002, N' г. Ангарск', N' ул. Дзержинского', 28)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (15, 450558, N' г. Ангарск', N' ул. Набережная', 30)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (16, 394060, N' г.Ангарск', N' ул. Фрунзе', 43)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (17, 410661, N' г. Ангарск', N' ул. Школьная', 50)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (18, 625590, N' г. Ангарск', N' ул. Коммунистическая', 20)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (19, 625683, N' г. Ангарск', N' ул. 8 Марта', 2)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (20, 400562, N' г. Ангарск', N' ул. Зеленая', 32)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (21, 614510, N' г. Ангарск', N' ул. Маяковского', 47)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (22, 410542, N' г. Ангарск', N' ул. Светлая', 46)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (23, 620839, N' г. Ангарск', N' ул. Цветочная', 8)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (24, 443890, N' г. Ангарск', N' ул. Коммунистическая', 1)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (25, 603379, N' г. Ангарск', N' ул. Спортивная', 46)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (26, 603721, N' г. Ангарск', N' ул. Гоголя', 41)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (27, 410172, N' г. Ангарск', N' ул. Северная', 13)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (28, 420151, N' г. Ангарск', N' ул. Вишневая', 32)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (29, 125061, N' г. Ангарск', N' ул. Подгорная', 8)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (30, 630370, N' г. Ангарск', N' ул. Шоссейная', 24)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (31, 614753, N' г. Ангарск', N' ул. Полевая', 35)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (32, 426030, N' г. Ангарск', N' ул. Маяковского', 44)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (33, 450375, N' г. Ангарск ', N'ул. Клубная', 44)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (34, 625560, N' г. Ангарск', N' ул. Некрасова', 12)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (35, 630201, N' г. Ангарск', N' ул. Комсомольская', 17)
GO
INSERT [dbo].[PickupPoint] ([PickupPointID], [PostalIndex], [City], [Street], [House]) VALUES (36, 190949, N' г. Ангарск', N' ул. Мичурина', 26)
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (1, N'Продукт1', N'Хороший продукт', N'Категория1', NULL, N'Фабрика1', CAST(120.0000 AS Decimal(19, 4)), 4, 3000, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (2, N'Продукт2', N'ОЧЕНЬ хороший продукт', N'Категория2', NULL, N'Фабрика1', CAST(30000.0000 AS Decimal(19, 4)), NULL, 20, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (3, N'Продукт3', N'Нормальный продукт', N'Категория1', NULL, N'Фабрика2', CAST(30.0000 AS Decimal(19, 4)), 50, 30000, N'В наличии')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [ProductStatus]) VALUES (4, N'Продукт4', N'Среднего качества продукт', N'Категория3', NULL, N'Фабрика2', CAST(400.0000 AS Decimal(19, 4)), NULL, 0, N'Нет в наличии')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Константинова ', N'Вероника', N'Агафоновна', N'loginDEsgg2018', N'qhgYnW', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Меркушев ', N'Мартын', N'Федотович', N'loginDEdcd2018', N'LxR6YI', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Казаков ', N'Федот', N'Кондратович', N'loginDEisg2018', N'Cp8ddU', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Карпов ', N'Улеб', N'Леонидович', N'loginDEcph2018', N'7YpE0p', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Королёв ', N'Матвей', N'Вадимович', N'loginDEgco2018', N'nMr|ss', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Юдин ', N'Герман', N'Кондратович', N'loginDEwjg2018', N'9UfqWQ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Беляева ', N'Анна', N'Вячеславовна', N'loginDEjbz2018', N'xIAWNI', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Беляев ', N'Валентин', N'Артёмович', N'loginDEmgu2018', N'0gC3bk', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Семёнов ', N'Герман', N'Дмитрьевич', N'loginDErdg2018', N'ni0ue0', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Шестаков ', N'Илья', N'Антонинович', N'loginDEjtv2018', N'f2ZaN6', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Власов ', N'Вадим', N'Васильевич', N'loginDEtfj2018', N'{{ksPn', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Савельев ', N'Арсений', N'Авксентьевич', N'loginDEpnb2018', N'{ADBdc', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Ефимов ', N'Руслан', N'Якунович', N'loginDEzer2018', N'5&R+zs', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Бурова ', N'Марфа', N'Федотовна', N'loginDEiin2018', N'y9l*b}', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Селезнёв ', N'Александр', N'Никитевич', N'loginDEqda2018', N'|h+r}I', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Кулакова ', N'Виктория', N'Георгьевна', N'loginDEbnj2018', N'#ИМЯ?', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Дорофеева ', N'Кира', N'Демьяновна', N'loginDEqte2018', N'dC8bDI', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Сафонова ', N'Нинель', N'Якововна', N'loginDEfeo2018', N'8cI7vq', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Ситникова ', N'София', N'Лукьевна', N'loginDEvni2018', N'e4pVIv', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Медведев ', N'Ириней', N'Геннадьевич', N'loginDEjis2018', N'A9K++2', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Суханова ', N'Евгения', N'Улебовна', N'loginDExvv2018', N'R1zh}|', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Игнатьев ', N'Владлен', N'Дамирович', N'loginDEadl2018', N'F&IWf4', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Ефремов ', N'Христофор', N'Владиславович', N'loginDEyzn2018', N'P1v24R', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Кошелев ', N'Ростислав', N'Куприянович', N'loginDEphn2018', N'F}jGsJ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Галкина ', N'Тамара', N'Авксентьевна', N'loginDEdvk2018', N'NKNkup', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Журавлёва ', N'Вера', N'Арсеньевна', N'loginDEtld2018', N'c+CECK', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Савина ', N'Таисия', N'Глебовна', N'loginDEima2018', N'XK3sOA', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иванов ', N'Яков', N'Мэлорович', N'loginDEyfe2018', N'4Bbzpa', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Лыткин ', N'Ким', N'Алексеевич', N'loginDEwqc2018', N'vRtAP*', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Логинов ', N'Федот', N'Святославович', N'loginDEgtt2018', N'7YD|BR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Русакова ', N'Марина', N'Юлиановна', N'loginDEiwl2018', N'LhlmIl', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Константинов ', N'Пётр', N'Кондратович', N'loginDEyvi2018', N'22beR}', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Поляков ', N'Анатолий', N'Игоревич', N'loginDEtfz2018', N'uQY0ZQ', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Панфилова ', N'Василиса', N'Григорьевна', N'loginDEikb2018', N'*QkUxc', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Воробьёв ', N'Герман', N'Романович', N'loginDEdmi2018', N'HOGFbU', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Андреев ', N'Ростислав', N'Федосеевич', N'loginDEtlo2018', N'58Jxrg', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Бобров ', N'Агафон', N'Владимирович', N'loginDEsnd2018', N'lLHqZf', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Лапин ', N'Алексей', N'Витальевич', N'loginDEgno2018', N'4fqLiO', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Шестаков ', N'Авдей', N'Иванович', N'loginDEgnl2018', N'wdio{u', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Гаврилова ', N'Алина', N'Эдуардовна', N'loginDEzna2018', N'yz1iMB', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Жуков ', N'Юлиан', N'Валерьянович', N'loginDEsyh2018', N'&4jYGs', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Пономарёв ', N'Максим', N'Альвианович', N'loginDExex2018', N'rnh36{', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Зиновьева ', N'Мария', N'Лаврентьевна', N'loginDEdjm2018', N'KjI1JR', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Осипов ', N'Артём', N'Мэлорович', N'loginDEgup2018', N'36|KhF', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Лапин ', N'Вячеслав', N'Геласьевич', N'loginDEdat2018', N'ussd8Q', 1)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Зуев ', N'Ириней', N'Вадимович', N'loginDEffj2018', N'cJP+HC', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Коновалова ', N'Агафья', N'Митрофановна', N'loginDEisp2018', N'dfz5Ii', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Исаев ', N'Дмитрий', N'Аристархович', N'loginDEfrp2018', N'6dcR|9', 2)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Белозёрова ', N'Алевтина', N'Лаврентьевна', N'loginDEaee2018', N'5&qONH', 3)
GO
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Самсонов ', N'Агафон', N'Максимович', N'loginDEthu2018', N'|0xWzV', 3)
GO
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderPickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_OrderPickupPoint_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderPickupPoint] CHECK CONSTRAINT [FK_OrderPickupPoint_Order]
GO
ALTER TABLE [dbo].[OrderPickupPoint]  WITH CHECK ADD  CONSTRAINT [FK_OrderPickupPoint_PickupPoint] FOREIGN KEY([PickupPointID])
REFERENCES [dbo].[PickupPoint] ([PickupPointID])
GO
ALTER TABLE [dbo].[OrderPickupPoint] CHECK CONSTRAINT [FK_OrderPickupPoint_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__52593CB8] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__52593CB8]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__534D60F1] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__534D60F1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [FragrantWorldDB] SET  READ_WRITE 
GO
