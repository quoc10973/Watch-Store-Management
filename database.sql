USE [master]
GO
/****** Object:  Database [WatchStoreManagement]    Script Date: 11/29/2024 3:40:55 PM ******/
CREATE DATABASE [WatchStoreManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WatchStoreManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SUZY\MSSQL\DATA\WatchStoreManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WatchStoreManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SUZY\MSSQL\DATA\WatchStoreManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WatchStoreManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WatchStoreManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WatchStoreManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WatchStoreManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WatchStoreManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WatchStoreManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WatchStoreManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [WatchStoreManagement] SET  MULTI_USER 
GO
ALTER DATABASE [WatchStoreManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WatchStoreManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WatchStoreManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WatchStoreManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WatchStoreManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WatchStoreManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WatchStoreManagement', N'ON'
GO
ALTER DATABASE [WatchStoreManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [WatchStoreManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WatchStoreManagement]
GO
/****** Object:  Table [dbo].[tbl_Invoice]    Script Date: 11/29/2024 3:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Invoice](
	[invId] [varchar](50) NOT NULL,
	[userId] [varchar](50) NOT NULL,
	[total] [float] NULL,
	[dateBuy] [varchar](500) NULL,
	[phone] [varchar](250) NOT NULL,
	[address] [nvarchar](500) NULL,
	[city] [nvarchar](100) NULL,
	[delivery] [bit] NULL,
 CONSTRAINT [PK_InvoiceUser] PRIMARY KEY CLUSTERED 
(
	[invId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 11/29/2024 3:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Watch]    Script Date: 11/29/2024 3:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Watch](
	[watchId] [varchar](30) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[watchName] [varchar](20) NOT NULL,
	[image] [varchar](500) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
	[discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[watchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Wishlist]    Script Date: 11/29/2024 3:40:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Wishlist](
	[uId] [varchar](50) NOT NULL,
	[pName] [varchar](50) NOT NULL,
	[pPrice] [float] NOT NULL,
	[description] [varchar](255) NULL,
	[yearOfProduction] [int] NULL,
	[image] [varchar](500) NULL,
	[pId] [varchar](50) NULL,
 CONSTRAINT [uId_pName] PRIMARY KEY CLUSTERED 
(
	[uId] ASC,
	[pName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'khoa', 1, N'Dinh Khoa', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'nguyen', 1, N'Trung Nguyen', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'quoc', 1, N'Kien Quoc', 1)
GO
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W01', N'The GMT-Master II is the ultimate cosmopolitan watch', 3000, N'GMT Master II', N'rolex-gmt-master-ii.jpg', 2015, 14, 1, 20)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W02', N'This watch embodies the spirit of adventure and innovation. Its timeless design, characterized by geometric shapes and exposed screws, has solidified its status as an icon within the House of Cartier.', 4350, N'Santos Dumont', N'cartier-santos-dumont.jpg', 2023, 13, 1, 30)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W03', N'Once the full stainless steel bracelet with AP folding clasp is fixed around your wrist, you can enjoy all your favorite activities.', 1500, N'Jumbo 5402ST', N'jumbo-5402ST.jpg', 2019, 17, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W04', N'Brand new and Extremely rare Patek Philippe Nautilus Travel Time Chronograph with Diamonds in White Gold comes with box, papers, certificate and a 2 year international warranty.', 2750, N'Nautilus 5990', N'nautilus-5990-1400G-001.jpg', 2012, 30, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W05', N'New resin band model for the standard EDIFICE Chronograph EFV-550 Series', 1350, N'Casio EDIFICE EFV', N'casio-efv-550P.jpg', 2022, 18, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W06', N'This Longines Conquest Moon phase watch makes a fashionable accessory as well as a highly reliable timepiece.', 5350, N'Longines Moonphase', N'longines-conquest-moonphase.jpeg', 2023, 21, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W07', N'The integrated bracelet and the vintage MIDO logo are typical of this iconic model as well as the monocoque case housing an automatic movement.', 4200, N'MIDO COMMANDER 1959', N'mido-commander-1959.jpg', 2020, 28, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W08', N'Reinforcing the cases durability and 200m water resistance are a screw-down crown and a screw-down exhibition caseback engraved with the edition number.', 3260, N'Timex Titanium GMT', N'timex-titanium-gmt.jpg', 2018, 22, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W09', N'The distinctive mark of Ogival watches is their creative and artistic design style. The strap and dial combine harmoniously to create a perfect version.', 5860, N'Ogival OG358', N'ogival-og358.jpg', 2023, 30, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W10', N'The watch has a case finished in Titanium, a high-quality material with extremely high durability and a familiar satin and polished finish.', 6800, N'Hublot Fusion', N'hublot-classic-fusion.jpg', 2024, 9, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W11', N'This was a landmark breakthrough for the industry as it opened the door to a whole new level of watchmaking technology.', 1300, N'Orient Star Skeleton', N'orient-star-skeleton.jpeg', 2020, 13, 1, 0)
INSERT [dbo].[tbl_Watch] ([watchId], [description], [price], [watchName], [image], [yearOfProduction], [quantity], [notSale], [discount]) VALUES (N'W12', N'The Patek Philippe Grand Complications Sky Moon Tourbillon 6002G-010 watch is definitely a masterpiece that is not for the masses.', 8900, N'Sky Moon Tourbillon', N'sky-moon-tourbillon.jpg', 2021, 30, 1, 0)
GO
USE [master]
GO
ALTER DATABASE [WatchStoreManagement] SET  READ_WRITE 
GO
