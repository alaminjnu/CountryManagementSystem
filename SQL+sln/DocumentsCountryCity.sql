USE [master]
GO
/****** Object:  Database [CountryCityDB]    Script Date: 5/28/2016 6:22:53 PM ******/
CREATE DATABASE [CountryCityDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryCityDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryCityDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\CountryCityDB_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryCityDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryCityDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryCityDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryCityDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryCityDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryCityDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryCityDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryCityDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryCityDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryCityDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryCityDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryCityDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CountryCityDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryCityDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryCityDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryCityDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryCityDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryCityDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryCityDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryCityDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CountryCityDB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryCityDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryCityDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryCityDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryCityDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [CountryCityDB]
GO
/****** Object:  Table [dbo].[City]    Script Date: 5/28/2016 6:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[About] [text] NULL,
	[Location] [varchar](50) NULL,
	[Weather] [varchar](50) NULL,
	[CountryId] [varchar](50) NULL,
	[DwellersNo] [int] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 5/28/2016 6:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[About] [text] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CityCountryInfo]    Script Date: 5/28/2016 6:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CityCountryInfo]
AS
SELECT        c.CountryId, SUM(c.DwellersNo) AS NumberOfDwellers, COUNT(c.Id) AS NumberOfCity
FROM            dbo.City AS c INNER JOIN
                         dbo.Country AS co ON c.CountryId = co.Id
GROUP BY c.CountryId

GO
/****** Object:  View [dbo].[CityCountrySpecificInfo]    Script Date: 5/28/2016 6:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CityCountrySpecificInfo]
AS
SELECT CityCountryInfo.*,Country.CountryName,Country.About AS AboutOfCountry FROM CityCountryInfo
inner Join Country ON CityCountryInfo.CountryId=Country.Id

GO
/****** Object:  View [dbo].[GetCityInfoByCountryId]    Script Date: 5/28/2016 6:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create VIEW [dbo].[GetCityInfoByCountryId] 
  AS
  SELECT c.Id,c.CityName,c.About as AboutOfCity,c.DwellersNo,c.Location,c.Weather,co.Id as CountryId,co.CountryName,co.About as AboutOfCountry FROM City 
  as c LEFT JOIN Country as co ON c.CountryId=co.Id

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "co"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 119
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CityCountryInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CityCountryInfo'
GO
USE [master]
GO
ALTER DATABASE [CountryCityDB] SET  READ_WRITE 
GO
