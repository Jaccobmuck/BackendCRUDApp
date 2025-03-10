USE [master]
GO
/****** Object:  Database [MovieRental]    Script Date: 2/12/2025 1:01:35 PM ******/
CREATE DATABASE [MovieRental]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieRental', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.COMP375JMUCK\MSSQL\DATA\MovieRental.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieRental_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.COMP375JMUCK\MSSQL\DATA\MovieRental_log.ldf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MovieRental] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieRental].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieRental] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieRental] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieRental] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieRental] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieRental] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieRental] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieRental] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieRental] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieRental] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieRental] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieRental] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieRental] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieRental] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieRental] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieRental] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieRental] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieRental] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieRental] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieRental] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieRental] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieRental] SET RECOVERY FULL 
GO
ALTER DATABASE [MovieRental] SET  MULTI_USER 
GO
ALTER DATABASE [MovieRental] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieRental] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieRental] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieRental] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieRental] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieRental] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MovieRental', N'ON'
GO
ALTER DATABASE [MovieRental] SET QUERY_STORE = ON
GO
ALTER DATABASE [MovieRental] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MovieRental]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/12/2025 1:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[MembershipDate] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 2/12/2025 1:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [bigint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Genre] [nvarchar](50) NULL,
	[ReleaseYear] [datetime] NULL,
	[Director] [nvarchar](50) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 2/12/2025 1:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[RentalId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerId] [bigint] NULL,
	[MovieId] [bigint] NULL,
	[RentDate] [datetime] NULL,
	[ReturnDate] [datetime] NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[RentalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (1, N'Matthias Alten', N'malten0@hao123.com', N'801-180-0361', CAST(N'2024-04-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (2, N'Vannie Ebbens', N'vebbens1@sun.com', N'698-506-0906', CAST(N'2025-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (3, N'Humfrid O''Cooney', N'hocooney2@washingtonpost.com', N'640-633-3173', CAST(N'2024-05-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (4, N'Tildy Butler-Bowdon', N'tbutlerbowdon3@fc2.com', N'217-699-3089', CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (5, N'Harry Guys', N'hguys4@oaic.gov.au', N'658-831-4577', CAST(N'2024-09-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (6, N'Alana Bindon', N'abindon5@google.com', N'365-515-1402', CAST(N'2024-03-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (7, N'Brooks Calverd', N'bcalverd6@sohu.com', N'971-875-0268', CAST(N'2024-10-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (8, N'Karyn Cockley', N'kcockley7@amazon.de', N'645-951-9945', CAST(N'2024-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (9, N'Constancy Kobieriecki', N'ckobieriecki8@istockphoto.com', N'760-324-6810', CAST(N'2024-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (10, N'Barty Rauprich', N'brauprich9@ehow.com', N'467-449-5392', CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (11, N'Elias Alves', N'ealvesa@shinystat.com', N'514-114-0908', CAST(N'2024-09-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (12, N'Jeffy Cotterill', N'jcotterillb@usa.gov', N'391-802-6964', CAST(N'2024-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (13, N'Anallise Vicarey', N'avicareyc@freewebs.com', N'186-203-8624', CAST(N'2025-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (14, N'Roosevelt Phizakarley', N'rphizakarleyd@nsw.gov.au', N'315-399-2655', CAST(N'2024-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (15, N'Sloane Coldtart', N'scoldtarte@dion.ne.jp', N'993-523-3929', CAST(N'2024-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (16, N'Sianna Greenalf', N'sgreenalff@google.es', N'267-947-6165', CAST(N'2024-08-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (17, N'Ginger Cawthery', N'gcawtheryg@over-blog.com', N'216-904-3555', CAST(N'2024-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (18, N'Sheila-kathryn Gueinn', N'sgueinnh@hao123.com', N'277-588-8827', CAST(N'2025-01-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (19, N'Raphaela Cloney', N'rcloneyi@vk.com', N'157-390-8043', CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (20, N'Curtice Stallebrass', N'cstallebrassj@phpbb.com', N'462-670-8737', CAST(N'2024-10-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (21, N'Karola Plumbridge', N'kplumbridgek@sohu.com', N'811-202-7103', CAST(N'2024-06-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (22, N'Zacharias Wilsdon', N'zwilsdonl@hp.com', N'530-790-6623', CAST(N'2025-01-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (23, N'Di Bonney', N'dbonneym@sciencedaily.com', N'495-591-8209', CAST(N'2024-05-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (24, N'Aloise Nuzzti', N'anuzztin@hatena.ne.jp', N'633-149-7862', CAST(N'2024-07-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (25, N'Otto Ovitts', N'oovittso@yolasite.com', N'154-533-3292', CAST(N'2024-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (26, N'Mickie Pundy', N'mpundyp@cnn.com', N'360-839-3043', CAST(N'2024-11-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (27, N'Renate Daily', N'rdailyq@cocolog-nifty.com', N'913-546-9002', CAST(N'2024-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (28, N'Beret Barkley', N'bbarkleyr@indiatimes.com', N'102-299-9706', CAST(N'2024-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (29, N'Kirby Seefus', N'kseefuss@apache.org', N'886-647-0072', CAST(N'2025-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (30, N'Lotti Getsham', N'lgetshamt@java.com', N'683-188-7398', CAST(N'2024-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (31, N'Bunny Lund', N'blundu@rambler.ru', N'831-514-6243', CAST(N'2024-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (32, N'Lillis Bannerman', N'lbannermanv@nps.gov', N'466-740-2434', CAST(N'2024-05-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (33, N'Wright Giamuzzo', N'wgiamuzzow@simplemachines.org', N'602-857-8334', CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (34, N'Tiphany Scragg', N'tscraggx@mit.edu', N'937-887-2349', CAST(N'2024-12-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (35, N'Holly Janus', N'hjanusy@so-net.ne.jp', N'191-499-1491', CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (36, N'Rachael Dallicott', N'rdallicottz@unesco.org', N'552-533-8571', CAST(N'2024-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (37, N'Cherilynn Duthy', N'cduthy10@fotki.com', N'768-419-8462', CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (38, N'Mab Plank', N'mplank11@sitemeter.com', N'529-734-8353', CAST(N'2024-06-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (39, N'Rosalia Pulhoster', N'rpulhoster12@amazon.com', N'149-138-5253', CAST(N'2024-09-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (40, N'Salomon Sexstone', N'ssexstone13@gnu.org', N'366-263-4051', CAST(N'2024-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (41, N'Kaiser Petriello', N'kpetriello14@yandex.ru', N'212-570-9534', CAST(N'2024-10-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (42, N'Marthe McNirlan', N'mmcnirlan15@hubpages.com', N'392-205-0965', CAST(N'2024-08-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (43, N'Eustacia Jelfs', N'ejelfs16@paginegialle.it', N'620-988-6702', CAST(N'2024-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (44, N'Duke Quenell', N'dquenell17@msn.com', N'221-770-2325', CAST(N'2024-04-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (45, N'Renaud Blum', N'rblum18@comcast.net', N'695-754-6626', CAST(N'2025-01-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (46, N'Obadiah Luard', N'oluard19@jimdo.com', N'570-383-1519', CAST(N'2024-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (47, N'Ricki McGeown', N'rmcgeown1a@nsw.gov.au', N'131-885-4006', CAST(N'2024-02-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (48, N'Elwira Latter', N'elatter1b@globo.com', N'602-390-5741', CAST(N'2024-09-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (49, N'Molly Banane', N'mbanane1c@smh.com.au', N'217-757-7841', CAST(N'2024-10-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (50, N'Carlie Ruthven', N'cruthven1d@skype.com', N'436-821-0728', CAST(N'2024-11-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (51, N'Aurea Flippelli', N'aflippelli1e@time.com', N'275-232-9665', CAST(N'2024-04-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (52, N'Rosemarie Lawrence', N'rlawrence1f@hhs.gov', N'476-238-8640', CAST(N'2024-06-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (53, N'Petra Fayer', N'pfayer1g@odnoklassniki.ru', N'510-503-2972', CAST(N'2024-12-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (54, N'Jayme Arnaldo', N'jarnaldo1h@furl.net', N'725-467-9472', CAST(N'2025-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (55, N'Christyna Daingerfield', N'cdaingerfield1i@spiegel.de', N'684-895-8158', CAST(N'2024-10-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (56, N'Georgeta Dellenbrok', N'gdellenbrok1j@bbc.co.uk', N'859-137-1531', CAST(N'2024-09-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (57, N'Flora Diemer', N'fdiemer1k@auda.org.au', N'334-325-7542', CAST(N'2024-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (58, N'Addy Hubbold', N'ahubbold1l@simplemachines.org', N'614-179-3471', CAST(N'2024-10-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (59, N'Tandie Spreull', N'tspreull1m@about.me', N'319-492-0501', CAST(N'2024-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (60, N'Aloysia Deny', N'adeny1n@marketwatch.com', N'347-586-7802', CAST(N'2024-06-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (61, N'Alley Drohane', N'adrohane1o@vistaprint.com', N'310-814-4736', CAST(N'2024-06-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (62, N'Shalne Haddrill', N'shaddrill1p@oaic.gov.au', N'927-262-8000', CAST(N'2024-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (63, N'Filmore Worwood', N'fworwood1q@mtv.com', N'479-154-8195', CAST(N'2024-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (64, N'Jeremias O''Currigan', N'jocurrigan1r@ftc.gov', N'160-820-1210', CAST(N'2025-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (65, N'Adrea Caulder', N'acaulder1s@booking.com', N'529-687-8989', CAST(N'2024-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (66, N'Hobey Ianiello', N'hianiello1t@kickstarter.com', N'243-384-9912', CAST(N'2024-11-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (67, N'Cirstoforo Verson', N'cverson1u@networkadvertising.org', N'774-423-9386', CAST(N'2024-04-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (68, N'Lotti Chesworth', N'lchesworth1v@studiopress.com', N'651-102-4068', CAST(N'2025-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (69, N'Janessa Petrichat', N'jpetrichat1w@hostgator.com', N'751-516-5862', CAST(N'2025-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (70, N'Ethelbert Bettesworth', N'ebettesworth1x@mayoclinic.com', N'113-112-8604', CAST(N'2024-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (71, N'Rhys Mableson', N'rmableson1y@issuu.com', N'328-711-2986', CAST(N'2024-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (72, N'Hadleigh Margerrison', N'hmargerrison1z@51.la', N'129-386-1762', CAST(N'2024-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (73, N'Tobe Kalb', N'tkalb20@yellowbook.com', N'754-419-5947', CAST(N'2024-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (74, N'Holly-anne Seathwright', N'hseathwright21@prweb.com', N'886-529-3366', CAST(N'2024-06-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (75, N'Modesty Deniskevich', N'mdeniskevich22@bizjournals.com', N'214-373-9264', CAST(N'2024-03-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (76, N'Lizbeth Paoloni', N'lpaoloni23@phpbb.com', N'695-158-5438', CAST(N'2024-11-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (77, N'Daryl Crosskell', N'dcrosskell24@fema.gov', N'544-503-5726', CAST(N'2024-08-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (78, N'Rosina Godmar', N'rgodmar25@lycos.com', N'610-463-5278', CAST(N'2024-05-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (79, N'Farr Licas', N'flicas26@imageshack.us', N'408-607-8969', CAST(N'2024-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (80, N'Darsey Beebis', N'dbeebis27@sphinn.com', N'191-160-8113', CAST(N'2024-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (81, N'Tandi Tyson', N'ttyson28@jimdo.com', N'812-873-6571', CAST(N'2024-10-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (82, N'Krystle Musgrove', N'kmusgrove29@gov.uk', N'650-254-0678', CAST(N'2024-09-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (83, N'Jeannette Jerrold', N'jjerrold2a@indiegogo.com', N'933-474-0437', CAST(N'2024-06-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (84, N'Nanci Balharrie', N'nbalharrie2b@tinyurl.com', N'403-378-3800', CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (85, N'Kent Lack', N'klack2c@nhs.uk', N'262-305-0353', CAST(N'2024-04-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (86, N'Raphaela Jachimczak', N'rjachimczak2d@is.gd', N'590-864-1242', CAST(N'2024-03-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (87, N'Kristal Izon', N'kizon2e@dell.com', N'216-411-0664', CAST(N'2024-05-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (88, N'Nicoli Vaudrey', N'nvaudrey2f@epa.gov', N'281-875-9022', CAST(N'2024-02-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (89, N'Neils Leades', N'nleades2g@cpanel.net', N'285-818-1503', CAST(N'2024-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (90, N'Bendite Boullin', N'bboullin2h@patch.com', N'452-458-7731', CAST(N'2024-11-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (91, N'Ainslee Bradock', N'abradock2i@mac.com', N'339-670-1758', CAST(N'2024-10-16T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (92, N'Ev Marlen', N'emarlen2j@cnet.com', N'692-922-2905', CAST(N'2024-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (93, N'Jean Kobus', N'jkobus2k@whitehouse.gov', N'825-129-5929', CAST(N'2024-03-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (94, N'Zorana Rebanks', N'zrebanks2l@histats.com', N'716-274-7281', CAST(N'2024-11-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (95, N'Quentin Milner', N'qmilner2m@mozilla.org', N'515-757-7943', CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (96, N'Brita Staterfield', N'bstaterfield2n@reference.com', N'888-561-5976', CAST(N'2024-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (97, N'Nichole Kimblen', N'nkimblen2o@sun.com', N'834-258-4808', CAST(N'2024-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (98, N'Desirae Pautot', N'dpautot2p@china.com.cn', N'132-625-4689', CAST(N'2024-06-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (99, N'Klara Farland', N'kfarland2q@reference.com', N'367-954-1806', CAST(N'2024-03-14T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Phone], [MembershipDate]) VALUES (100, N'Zelig Schroeder', N'zschroeder2r@msu.edu', N'273-324-0233', CAST(N'2024-08-04T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (1, N'Munich', N'Action|Crime|Drama|Thriller', CAST(N'1905-07-07T00:00:00.000' AS DateTime), N'Pauly Pittock')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (2, N'Last Winter (L''hiver dernier)', N'Drama', CAST(N'1905-06-24T00:00:00.000' AS DateTime), N'Lindy Colchett')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (3, N'Snow Dogs', N'Adventure|Children|Comedy', CAST(N'1905-06-29T00:00:00.000' AS DateTime), N'Darius Delnevo')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (4, N'Something to Sing About', N'Comedy|Musical', CAST(N'1905-06-09T00:00:00.000' AS DateTime), N'Bridgette Gauchier')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (5, N'Shooter', N'Action|Drama|Thriller', CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Turner Kimberley')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (6, N'And the Band Played On', N'Drama', CAST(N'1905-06-18T00:00:00.000' AS DateTime), N'Chev Greated')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (7, N'Halloween Tree, The', N'Animation|Children', CAST(N'1905-07-06T00:00:00.000' AS DateTime), N'Karie Walthall')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (8, N'Conspirator, The', N'Drama', CAST(N'1905-06-22T00:00:00.000' AS DateTime), N'Gardy Cutbirth')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (9, N'Puddle Cruiser', N'Comedy', CAST(N'1905-06-10T00:00:00.000' AS DateTime), N'Lorie Janaszewski')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (10, N'Bad Dreams', N'Horror|Thriller', CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Shelba Chansonne')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (11, N'Five and Ten', N'Romance', CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Damien Tippetts')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (12, N'Julie', N'Thriller', CAST(N'1905-07-06T00:00:00.000' AS DateTime), N'Abram Keenleyside')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (13, N'Invisible Man, The', N'Horror|Sci-Fi', CAST(N'1905-07-02T00:00:00.000' AS DateTime), N'Rheba Kain')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (14, N'Panic in the Streets', N'Crime|Drama|Film-Noir|Thriller', CAST(N'1905-06-19T00:00:00.000' AS DateTime), N'Diena Legerwood')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (15, N'Breaking the Maya Code', N'Documentary', CAST(N'1905-06-25T00:00:00.000' AS DateTime), N'Ollie Tuffell')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (16, N'Elite Squad (Tropa de Elite)', N'Action|Crime|Drama|Thriller', CAST(N'1905-06-24T00:00:00.000' AS DateTime), N'Herbert Cradick')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (17, N'Trucker', N'Drama', CAST(N'1905-06-18T00:00:00.000' AS DateTime), N'Ossie Quinnette')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (18, N'Beauty and the Bastard (Tyttö sinä olet tähti)', N'Drama|Musical|Romance', CAST(N'1905-07-06T00:00:00.000' AS DateTime), N'Annabel Furminger')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (19, N'Accident on Hill Road', N'Crime|Drama|Thriller', CAST(N'1905-06-30T00:00:00.000' AS DateTime), N'Karia Philipp')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (20, N'Last Trapper, The (Le dernier trappeur)', N'Adventure|Documentary', CAST(N'1905-07-06T00:00:00.000' AS DateTime), N'Nat Ashbolt')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (21, N'Sukiyaki Western Django', N'Action|Western', CAST(N'1905-07-06T00:00:00.000' AS DateTime), N'Odette Rugge')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (22, N'Veer Zaara', N'Drama|Musical|Romance', CAST(N'1905-07-05T00:00:00.000' AS DateTime), N'Martica Celler')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (23, N'Bigfoot Lives', N'Adventure|Documentary|Drama', CAST(N'1905-06-19T00:00:00.000' AS DateTime), N'Glennis Gerrietz')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (24, N'Soul of Bread, The (Ai de mian bao hun)', N'Comedy|Romance', CAST(N'1905-06-23T00:00:00.000' AS DateTime), N'Kacey Yitzhok')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (25, N'Cool World, The', N'Crime|Drama', CAST(N'1905-07-02T00:00:00.000' AS DateTime), N'Jessee Dellenbroker')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (26, N'Midnight Movies: From the Margin to the Mainstream', N'Documentary', CAST(N'1905-07-03T00:00:00.000' AS DateTime), N'Marmaduke Fragino')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (27, N'Adventures of Tarzan', N'Action|Adventure', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Jedd Nealand')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (28, N'Passage to India, A', N'Adventure|Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Jeniece Josskovitz')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (29, N'All Through the Night', N'Action|Comedy|Drama|Thriller|War', CAST(N'1905-06-12T00:00:00.000' AS DateTime), N'Allayne Egdal')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (30, N'B.F.''s Daughter', N'Drama|Romance', CAST(N'1905-07-04T00:00:00.000' AS DateTime), N'Deva Koppelmann')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (31, N'Average Italian', N'Comedy', CAST(N'1905-07-05T00:00:00.000' AS DateTime), N'Alayne Alleburton')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (32, N'Cool World', N'Animation|Comedy|Fantasy', CAST(N'1905-06-10T00:00:00.000' AS DateTime), N'Britney Truman')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (33, N'Wild Hogs', N'Adventure|Comedy', CAST(N'1905-06-22T00:00:00.000' AS DateTime), N'Carolee Skeat')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (34, N'Boy', N'Drama|Romance', CAST(N'1905-07-04T00:00:00.000' AS DateTime), N'Germain Cyseley')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (35, N'Sorceress', N'Action|Adventure|Fantasy', CAST(N'1905-06-29T00:00:00.000' AS DateTime), N'Darice Bernardinelli')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (36, N'Evening with Kevin Smith, An', N'Comedy|Documentary', CAST(N'1905-07-03T00:00:00.000' AS DateTime), N'Corny Cayette')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (37, N'Across the Hall', N'Thriller', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Bevan Vedstra')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (38, N'Bekas', N'Drama', CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Liam Vader')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (39, N'Dinner for Schmucks', N'Comedy', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Bryana Limeburner')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (40, N'Newburgh Sting, The', N'Documentary', CAST(N'1905-06-23T00:00:00.000' AS DateTime), N'Celestina Simmonds')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (41, N'Tunes of Glory', N'Drama', CAST(N'1905-06-17T00:00:00.000' AS DateTime), N'Rubie Sanzio')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (42, N'Park Row', N'Drama|Thriller', CAST(N'1905-06-13T00:00:00.000' AS DateTime), N'Stefan Berrisford')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (43, N'Love Me If You Dare (Jeux d''enfants)', N'Drama|Romance', CAST(N'1905-06-20T00:00:00.000' AS DateTime), N'Bryant Donneely')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (44, N'Loves of Carmen, The', N'Drama', CAST(N'1905-06-30T00:00:00.000' AS DateTime), N'Vin Routhorn')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (45, N'August (Elokuu) ', N'Drama', CAST(N'1905-07-04T00:00:00.000' AS DateTime), N'Bonny Binding')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (46, N'Billy''s Holiday', N'Drama|Musical', CAST(N'1905-06-21T00:00:00.000' AS DateTime), N'Heindrick Arpur')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (47, N'P2', N'Horror|Thriller', CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Jeanna Scutter')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (48, N'Corridors of Blood', N'Crime|Drama|Horror|Thriller', CAST(N'1905-06-20T00:00:00.000' AS DateTime), N'Romain Stampfer')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (49, N'Answers to Nothing', N'Drama|Mystery', CAST(N'1905-07-07T00:00:00.000' AS DateTime), N'Donielle Snoday')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (50, N'Metallica: Through the Never', N'Action|Musical|IMAX', CAST(N'1905-06-11T00:00:00.000' AS DateTime), N'Anissa Hillyatt')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (51, N'V. I. Warshawski', N'Action|Comedy|Crime', CAST(N'1905-07-02T00:00:00.000' AS DateTime), N'Haley Loch')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (52, N'D.C. Cab', N'Action|Comedy', CAST(N'1905-06-27T00:00:00.000' AS DateTime), N'Hailey Rupke')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (53, N'Where the Wild Things Are', N'Adventure|Children|Drama|Fantasy|IMAX', CAST(N'1905-06-17T00:00:00.000' AS DateTime), N'Johnathan McMurrugh')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (54, N'Eternal Return, The (L''éternel retour)', N'Drama|Romance', CAST(N'1905-06-24T00:00:00.000' AS DateTime), N'Alphard Bikker')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (55, N'Super Rich: The Greed Game', N'Documentary', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Rickie Golightly')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (56, N'Mighty, The', N'Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Adelaide Edmands')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (57, N'Misérables, Les', N'Drama', CAST(N'1905-05-30T00:00:00.000' AS DateTime), N'Morgan Knutton')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (58, N'A Story of Children and Film', N'Documentary', CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Norean Le Friec')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (59, N'Here on Earth', N'Drama|Romance', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Wendy Keyme')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (60, N'Wah-Wah', N'Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Darrell Burt')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (61, N'Dreamchild', N'Drama|Fantasy|Romance', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Shawn Lewendon')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (62, N'Christine Jorgensen Story, The', N'Drama', CAST(N'1905-06-19T00:00:00.000' AS DateTime), N'Duane Winterbourne')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (63, N'Surprise', N'(no genres listed)', CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Morse Goulborne')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (64, N'Look', N'Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Lion Harbert')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (65, N'Prime Suspect 7: The Final Act', N'Crime|Drama|Mystery|Thriller', CAST(N'1905-07-03T00:00:00.000' AS DateTime), N'Raviv Killough')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (66, N'Prime Suspect 3', N'Crime|Drama|Mystery', CAST(N'1905-06-18T00:00:00.000' AS DateTime), N'Sigvard Rowe')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (67, N'Hanzo the Razor: Sword of Justice (Goyôkiba)', N'Action', CAST(N'1905-06-13T00:00:00.000' AS DateTime), N'Kevina Strotton')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (68, N'Forbidden Fruit (Kielletty hedelmä)', N'Drama', CAST(N'1905-06-22T00:00:00.000' AS DateTime), N'Meredith Bulger')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (69, N'Whole Night, A (Toute une nuit)', N'Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Abbi Booi')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (70, N'Let''s Not Keep in Touch!', N'Comedy', CAST(N'1905-06-22T00:00:00.000' AS DateTime), N'Elyn Lind')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (71, N'Sweet and Lowdown', N'Comedy|Drama', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Hollyanne Shelborne')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (72, N'Assassin of the Tsar', N'Drama', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Bartram Gylle')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (73, N'Head Above Water', N'Comedy|Thriller', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Henryetta Bordman')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (74, N'Harriet Craig', N'Drama', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Nina Klamman')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (75, N'Lost, The', N'Thriller', CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Allie Caldayrou')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (76, N'Norma Jean & Marilyn', N'Drama', CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Isis Dallaway')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (77, N'I.O.U.S.A. (a.k.a. IOUSA)', N'Documentary', CAST(N'1905-06-20T00:00:00.000' AS DateTime), N'Kurtis Riepel')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (78, N'Heartbreak Ridge', N'Action|War', CAST(N'1905-07-04T00:00:00.000' AS DateTime), N'Brandice Paladini')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (79, N'I Confess', N'Thriller', CAST(N'1905-07-02T00:00:00.000' AS DateTime), N'Giralda Riddlesden')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (80, N'Invisible Waves', N'Adventure|Crime|Drama', CAST(N'1905-06-23T00:00:00.000' AS DateTime), N'Amity Pearmine')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (81, N'Mouse Hunt', N'Children|Comedy', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Brigit Blackah')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (83, N'Shadow Conspiracy', N'Thriller', CAST(N'1905-06-23T00:00:00.000' AS DateTime), N'Farley Eddies')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (84, N'Midnight Bayou', N'Drama|Mystery|Romance', CAST(N'1905-07-04T00:00:00.000' AS DateTime), N'Riva Catmull')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (85, N'Angélique, marquise des anges', N'Adventure|Romance', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Maible Swaysland')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (86, N'Iris', N'Drama', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Gardner Rowthorn')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (87, N'Fistful of Dollars, A (Per un pugno di dollari)', N'Action|Western', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Cassie Willeson')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (88, N'The Land Before Time VIII: The Big Freeze', N'Adventure|Animation|Children', CAST(N'1905-06-20T00:00:00.000' AS DateTime), N'Valma Sebley')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (89, N'Side Out', N'Comedy|Romance', CAST(N'1905-06-19T00:00:00.000' AS DateTime), N'Allix Hawley')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (90, N'Black Box, The (La boîte noire)', N'Mystery|Thriller', CAST(N'1905-06-21T00:00:00.000' AS DateTime), N'Debera Giotto')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (91, N'Happy Endings', N'Comedy|Drama', CAST(N'1905-06-26T00:00:00.000' AS DateTime), N'Tandi Taffs')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (92, N'Vatel', N'Drama', CAST(N'1905-06-18T00:00:00.000' AS DateTime), N'Margie Briar')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (93, N'Vera Cruz', N'Adventure|Western', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Reagan McKennan')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (94, N'Aberdeen', N'Drama', CAST(N'1905-06-12T00:00:00.000' AS DateTime), N'Lenette Chantler')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (95, N'I Still Know What You Did Last Summer', N'Horror|Mystery|Thriller', CAST(N'1905-06-19T00:00:00.000' AS DateTime), N'Keane Steinhammer')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (96, N'Jolene', N'Drama', CAST(N'1905-06-16T00:00:00.000' AS DateTime), N'Deina MacClenan')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (97, N'Sign of the Cross, The', N'Drama', CAST(N'1905-06-14T00:00:00.000' AS DateTime), N'Annette Feehily')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (98, N'Blue in the Face', N'Comedy|Drama', CAST(N'1905-06-29T00:00:00.000' AS DateTime), N'Ignacio McFaul')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (99, N'Cran d''arrêt', N'Crime|Mystery|Thriller', CAST(N'1905-06-28T00:00:00.000' AS DateTime), N'Catina Beavis')
INSERT [dbo].[Movie] ([MovieId], [Title], [Genre], [ReleaseYear], [Director]) VALUES (100, N'Most Wanted Man, A', N'Thriller', CAST(N'1905-06-17T00:00:00.000' AS DateTime), N'Ruddie Pechell')
GO
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
SET IDENTITY_INSERT [dbo].[Rental] ON 

INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (1, 16, 33, CAST(N'2024-12-29T00:00:00.000' AS DateTime), CAST(N'2024-03-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (2, 56, 70, CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(N'2024-10-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (3, 54, 97, CAST(N'2024-08-06T00:00:00.000' AS DateTime), CAST(N'2024-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (4, 7, 47, CAST(N'2024-07-30T00:00:00.000' AS DateTime), CAST(N'2024-03-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (5, 50, 2, CAST(N'2024-04-26T00:00:00.000' AS DateTime), CAST(N'2024-10-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (6, 77, 84, CAST(N'2025-01-02T00:00:00.000' AS DateTime), CAST(N'2024-12-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (7, 63, 90, CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (8, 67, 30, CAST(N'2024-08-03T00:00:00.000' AS DateTime), CAST(N'2024-04-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (9, 1, 37, CAST(N'2024-03-13T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (10, 51, 3, CAST(N'2024-05-12T00:00:00.000' AS DateTime), CAST(N'2024-08-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (11, 28, 55, CAST(N'2024-09-06T00:00:00.000' AS DateTime), CAST(N'2025-01-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (12, 96, 29, CAST(N'2024-10-13T00:00:00.000' AS DateTime), CAST(N'2025-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (13, 98, 78, CAST(N'2024-03-27T00:00:00.000' AS DateTime), CAST(N'2024-09-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (14, 90, 30, CAST(N'2024-06-30T00:00:00.000' AS DateTime), CAST(N'2024-10-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (15, 38, 1, CAST(N'2024-03-21T00:00:00.000' AS DateTime), CAST(N'2024-10-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (16, 63, 67, CAST(N'2024-12-18T00:00:00.000' AS DateTime), CAST(N'2024-11-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (17, 42, 35, CAST(N'2025-02-08T00:00:00.000' AS DateTime), CAST(N'2024-10-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (18, 63, 26, CAST(N'2024-06-09T00:00:00.000' AS DateTime), CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (19, 36, 69, CAST(N'2024-09-09T00:00:00.000' AS DateTime), CAST(N'2024-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (20, 37, 62, CAST(N'2024-08-30T00:00:00.000' AS DateTime), CAST(N'2024-11-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (21, 90, 3, CAST(N'2024-09-10T00:00:00.000' AS DateTime), CAST(N'2024-10-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (22, 2, 73, CAST(N'2024-10-19T00:00:00.000' AS DateTime), CAST(N'2024-08-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (23, 6, 41, CAST(N'2025-01-26T00:00:00.000' AS DateTime), CAST(N'2024-05-18T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (24, 12, 90, CAST(N'2024-10-19T00:00:00.000' AS DateTime), CAST(N'2024-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (25, 47, 8, CAST(N'2024-11-12T00:00:00.000' AS DateTime), CAST(N'2024-05-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (26, 18, 77, CAST(N'2024-05-05T00:00:00.000' AS DateTime), CAST(N'2024-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (27, 77, 64, CAST(N'2024-10-28T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (28, 53, 46, CAST(N'2024-08-15T00:00:00.000' AS DateTime), CAST(N'2025-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (29, 99, 31, CAST(N'2024-08-07T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (30, 72, 9, CAST(N'2024-05-14T00:00:00.000' AS DateTime), CAST(N'2024-07-17T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (31, 28, 47, CAST(N'2024-03-12T00:00:00.000' AS DateTime), CAST(N'2024-02-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (32, 6, 32, CAST(N'2024-11-29T00:00:00.000' AS DateTime), CAST(N'2024-10-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (33, 33, 15, CAST(N'2024-08-14T00:00:00.000' AS DateTime), CAST(N'2024-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (34, 97, 93, CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2024-07-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (35, 25, 33, CAST(N'2024-07-08T00:00:00.000' AS DateTime), CAST(N'2024-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (36, 90, 1, CAST(N'2024-12-29T00:00:00.000' AS DateTime), CAST(N'2025-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (37, 94, 89, CAST(N'2024-05-09T00:00:00.000' AS DateTime), CAST(N'2024-08-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (38, 70, 94, CAST(N'2024-08-10T00:00:00.000' AS DateTime), CAST(N'2024-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (39, 12, 56, CAST(N'2024-08-31T00:00:00.000' AS DateTime), CAST(N'2024-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (40, 5, 38, CAST(N'2024-03-04T00:00:00.000' AS DateTime), CAST(N'2024-11-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (41, 33, 38, CAST(N'2024-09-13T00:00:00.000' AS DateTime), CAST(N'2024-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (42, 22, 75, CAST(N'2024-04-19T00:00:00.000' AS DateTime), CAST(N'2024-06-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (43, 84, 27, CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (44, 92, 93, CAST(N'2024-06-18T00:00:00.000' AS DateTime), CAST(N'2024-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (45, 62, 99, CAST(N'2025-01-30T00:00:00.000' AS DateTime), CAST(N'2025-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (46, 22, 96, CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2024-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (47, 79, 62, CAST(N'2024-02-21T00:00:00.000' AS DateTime), CAST(N'2024-05-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (48, 67, 84, CAST(N'2024-10-13T00:00:00.000' AS DateTime), CAST(N'2024-07-19T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (49, 36, 60, CAST(N'2024-07-16T00:00:00.000' AS DateTime), CAST(N'2024-05-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (50, 29, 51, CAST(N'2024-07-08T00:00:00.000' AS DateTime), CAST(N'2024-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (51, 66, 31, CAST(N'2024-11-20T00:00:00.000' AS DateTime), CAST(N'2024-04-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (52, 30, 86, CAST(N'2024-12-25T00:00:00.000' AS DateTime), CAST(N'2024-05-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (53, 59, 47, CAST(N'2024-06-14T00:00:00.000' AS DateTime), CAST(N'2024-06-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (54, 41, 11, CAST(N'2024-05-26T00:00:00.000' AS DateTime), CAST(N'2024-04-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (55, 21, 91, CAST(N'2024-10-18T00:00:00.000' AS DateTime), CAST(N'2024-09-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (56, 9, 96, CAST(N'2024-09-08T00:00:00.000' AS DateTime), CAST(N'2024-03-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (57, 62, 58, CAST(N'2024-03-10T00:00:00.000' AS DateTime), CAST(N'2024-03-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (58, 22, 9, CAST(N'2024-04-19T00:00:00.000' AS DateTime), CAST(N'2025-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (59, 33, 32, CAST(N'2025-01-19T00:00:00.000' AS DateTime), CAST(N'2024-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (60, 17, 45, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-04-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (61, 31, 35, CAST(N'2024-05-20T00:00:00.000' AS DateTime), CAST(N'2025-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (62, 35, 28, CAST(N'2024-08-13T00:00:00.000' AS DateTime), CAST(N'2025-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (63, 19, 54, CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-10-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (64, 71, 17, CAST(N'2024-04-02T00:00:00.000' AS DateTime), CAST(N'2024-06-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (65, 26, 71, CAST(N'2024-09-22T00:00:00.000' AS DateTime), CAST(N'2024-07-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (66, 22, 99, CAST(N'2025-02-04T00:00:00.000' AS DateTime), CAST(N'2024-07-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (67, 63, 42, CAST(N'2024-02-23T00:00:00.000' AS DateTime), CAST(N'2025-01-23T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (68, 21, 27, CAST(N'2024-10-12T00:00:00.000' AS DateTime), CAST(N'2024-03-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (69, 28, 82, CAST(N'2024-09-05T00:00:00.000' AS DateTime), CAST(N'2024-12-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (70, 40, 3, CAST(N'2024-06-17T00:00:00.000' AS DateTime), CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (71, 41, 3, CAST(N'2024-08-29T00:00:00.000' AS DateTime), CAST(N'2025-01-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (72, 91, 54, CAST(N'2025-02-04T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (73, 66, 6, CAST(N'2024-08-11T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (74, 38, 2, CAST(N'2024-12-17T00:00:00.000' AS DateTime), CAST(N'2024-04-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (75, 50, 31, CAST(N'2024-02-24T00:00:00.000' AS DateTime), CAST(N'2024-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (76, 52, 95, CAST(N'2024-05-25T00:00:00.000' AS DateTime), CAST(N'2024-04-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (77, 100, 2, CAST(N'2024-07-03T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (78, 92, 24, CAST(N'2025-01-14T00:00:00.000' AS DateTime), CAST(N'2024-08-25T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (79, 86, 51, CAST(N'2024-03-05T00:00:00.000' AS DateTime), CAST(N'2025-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (80, 49, 67, CAST(N'2024-04-08T00:00:00.000' AS DateTime), CAST(N'2024-04-26T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (81, 30, 78, CAST(N'2024-10-23T00:00:00.000' AS DateTime), CAST(N'2024-09-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (82, 19, 83, CAST(N'2024-04-18T00:00:00.000' AS DateTime), CAST(N'2024-07-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (83, 22, 66, CAST(N'2025-01-28T00:00:00.000' AS DateTime), CAST(N'2025-01-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (84, 26, 5, CAST(N'2024-10-16T00:00:00.000' AS DateTime), CAST(N'2024-03-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (85, 75, 94, CAST(N'2024-08-19T00:00:00.000' AS DateTime), CAST(N'2024-07-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (86, 75, 2, CAST(N'2024-07-23T00:00:00.000' AS DateTime), CAST(N'2024-05-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (87, 13, 62, CAST(N'2024-07-07T00:00:00.000' AS DateTime), CAST(N'2025-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (88, 57, 56, CAST(N'2024-12-19T00:00:00.000' AS DateTime), CAST(N'2024-12-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (89, 27, 49, CAST(N'2024-06-11T00:00:00.000' AS DateTime), CAST(N'2025-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (90, 98, 21, CAST(N'2024-07-10T00:00:00.000' AS DateTime), CAST(N'2025-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (91, 74, 78, CAST(N'2024-03-29T00:00:00.000' AS DateTime), CAST(N'2024-09-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (92, 44, 76, CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-11-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (93, 55, 87, CAST(N'2024-03-25T00:00:00.000' AS DateTime), CAST(N'2024-08-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (94, 58, 11, CAST(N'2024-08-28T00:00:00.000' AS DateTime), CAST(N'2025-01-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (95, 96, 9, CAST(N'2024-04-09T00:00:00.000' AS DateTime), CAST(N'2024-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (96, 65, 66, CAST(N'2024-10-06T00:00:00.000' AS DateTime), CAST(N'2024-03-22T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (97, 42, 6, CAST(N'2025-02-08T00:00:00.000' AS DateTime), CAST(N'2024-11-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (98, 79, 6, CAST(N'2024-11-07T00:00:00.000' AS DateTime), CAST(N'2024-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (99, 41, 36, CAST(N'2024-08-18T00:00:00.000' AS DateTime), CAST(N'2024-02-29T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Rental] ([RentalId], [CustomerId], [MovieId], [RentDate], [ReturnDate]) VALUES (100, 21, 94, CAST(N'2024-12-06T00:00:00.000' AS DateTime), CAST(N'2024-10-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rental] OFF
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_MembershipDate]  DEFAULT (getutcdate()) FOR [MembershipDate]
GO
ALTER TABLE [dbo].[Rental] ADD  CONSTRAINT [DF_Rental_RentDate]  DEFAULT (getutcdate()) FOR [RentDate]
GO
ALTER TABLE [dbo].[Rental] ADD  CONSTRAINT [DF_Rental_ReturnDate]  DEFAULT (getutcdate()) FOR [ReturnDate]
GO
USE [master]
GO
ALTER DATABASE [MovieRental] SET  READ_WRITE 
GO
