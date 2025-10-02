USE [master]
GO
/****** Object:  Database [PaginaPersonal]    Script Date: 01/10/2025 21:11:48 ******/
CREATE DATABASE [PaginaPersonal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaginaPersonal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2\MSSQL\DATA\PaginaPersonal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaginaPersonal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER2\MSSQL\DATA\PaginaPersonal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PaginaPersonal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaginaPersonal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaginaPersonal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaginaPersonal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaginaPersonal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaginaPersonal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaginaPersonal] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaginaPersonal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaginaPersonal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaginaPersonal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaginaPersonal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaginaPersonal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaginaPersonal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaginaPersonal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaginaPersonal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaginaPersonal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaginaPersonal] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PaginaPersonal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaginaPersonal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaginaPersonal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaginaPersonal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaginaPersonal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaginaPersonal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaginaPersonal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaginaPersonal] SET RECOVERY FULL 
GO
ALTER DATABASE [PaginaPersonal] SET  MULTI_USER 
GO
ALTER DATABASE [PaginaPersonal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaginaPersonal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaginaPersonal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaginaPersonal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaginaPersonal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaginaPersonal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PaginaPersonal', N'ON'
GO
ALTER DATABASE [PaginaPersonal] SET QUERY_STORE = ON
GO
ALTER DATABASE [PaginaPersonal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PaginaPersonal]
GO
/****** Object:  Table [dbo].[AnimeSeries]    Script Date: 01/10/2025 21:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimeSeries](
	[AnimeSeriesID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[Tipo] [nvarchar](20) NOT NULL,
	[Descripcion] [nvarchar](400) NULL,
	[Caratula] [nvarchar](200) NULL,
	[TrailerYouTube] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AnimeSeriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eventos]    Script Date: 01/10/2025 21:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eventos](
	[EventosID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Titulo] [nvarchar](150) NOT NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Fecha] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EventosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genealogia]    Script Date: 01/10/2025 21:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genealogia](
	[GenealogiaID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Parentesco] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Foto] [nvarchar](200) NULL,
 CONSTRAINT [PK__Genealog__910012E760090CD4] PRIMARY KEY CLUSTERED 
(
	[GenealogiaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pasatiempos]    Script Date: 01/10/2025 21:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pasatiempos](
	[PasatiemposID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](300) NULL,
	[Imagen] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PasatiemposID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasatiemposImgs]    Script Date: 01/10/2025 21:11:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasatiemposImgs](
	[PasatiemposImgsID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Imagen] [nvarchar](200) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
 CONSTRAINT [PK_PasatiemposImgs] PRIMARY KEY CLUSTERED 
(
	[PasatiemposImgsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 01/10/2025 21:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[PerfilID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Apellido] [nvarchar](100) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Biografia] [nvarchar](500) NULL,
	[Foto] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PerfilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RedesSociales]    Script Date: 01/10/2025 21:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedesSociales](
	[RedesSocialesID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Red] [nvarchar](50) NOT NULL,
	[Usuario] [nvarchar](100) NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Icono] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[RedesSocialesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Youtubers]    Script Date: 01/10/2025 21:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Youtubers](
	[YoutubersID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[NombreCanal] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](200) NULL,
	[URL] [nvarchar](300) NOT NULL,
	[Logo] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[YoutubersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 01/10/2025 21:11:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[ContactosID] [int] IDENTITY(1,1) NOT NULL,
	[PerfilID] [int] NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Mensaje] [nvarchar](500) NOT NULL,
	[Fecha] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AnimeSeries] ON 
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (1, 1, N'Attack on Titan', N'Anime', N'Humanidad vs titanes gigantes', N'fotos/Serie/aot.jpg', N'LV-nazLVmgo?si=eCpBuZkpVR7S8ZO2')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (2, 1, N'Death Note', N'Anime', N'Estudiante con cuaderno de la muerte', N'fotos/Serie/deathnote.jpg', N'WS6bOufNi9E?si=8Ici4wAzCQO7wLMU')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (3, 1, N'Breaking Bad', N'Serie', N'Profesor que fabrica drogas', N'fotos/Serie/breakingbad.jpg', N'mXd1zTwcQ18?si=iy0NAyW4OgPbZO6L')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (4, 1, N'One Piece', N'Anime', N'Piratas en busca del tesoro', N'fotos/Serie/onepiece.jpg', N'Jvkq7akLDiA?si=TljtTHM8jWPxlfQW')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (5, 2, N'Your Name', N'Anime', N'Romance sobrenatural entre dos jóvenes', N'fotos/Serie/yourname.jpg', N'xU47nhruN-Q?si=AbCd1234567890AB')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (6, 2, N'Stranger Things', N'Serie', N'Misterios sobrenaturales en los 80', N'fotos/Serie/strangerthings.jpg', N'b9EkMc79ZSU?si=XyZ9876543210ZYX')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (7, 2, N'Violet Evergarden', N'Anime', N'Historia emotiva de autodescubrimiento', N'fotos/Serie/violet.jpg', N'g5DiAWkhETk?si=Qwe4567890123Rty')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (8, 3, N'Steins;Gate', N'Anime', N'Viajes en el tiempo y teorías científicas', N'fotos/Serie/steinsgate.jpg', N'muCPjK4nGF4?si=Def7890123456Ghi')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (9, 3, N'Mr. Robot', N'Serie', N'Hacker y conspiraciones corporativas', N'fotos/Serie/mrrobot.jpg', N'xIBiJ_SzJTA?si=Jkl1234567890Mno')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (10, 3, N'Code Geass', N'Anime', N'Estrategia militar y poder sobrenatural', N'fotos/Serie/codegeass.jpg', N'G8CFuZ9MseQ?si=Pqr4567890123Stu')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (11, 4, N'Cells at Work', N'Anime', N'El cuerpo humano explicado de forma divertida', N'fotos/Serie/cellsatwork.jpg', N'v7yyaYZf2qY?si=Vwx7890123456Yza')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (12, 4, N'Greys Anatomy', N'Serie', N'Drama médico en hospital', N'fotos/Serie/greys.jpg', N'pLtTi8j04LI?si=Bcd1234567890Efg')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (13, 4, N'The Good Doctor', N'Serie', N'Médico con autismo supera desafíos', N'fotos/Serie/gooddoctor.jpg', N'fYlZDTru55g?si=Hij4567890123Klm')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (14, 4, N'Doctor House', N'Serie', N'Médico genio y sarcástico resuelve casos médicos imposibles', N'fotos/Serie/doctorhouse.jpg', N'CIDJh6IxmeE?si=Ab12Cd34Ef56Gh78')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (15, 5, N'Cowboy Bebop', N'Anime', N'Cazarrecompensas en el espacio', N'fotos/Serie/cowboybebop.jpg', N'qig4KOK2R2g?si=Nop7890123456Qrs')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (16, 5, N'True Detective', N'Serie', N'Detectives investigan casos complejos', N'fotos/Serie/truedetective.jpg', N'fVQUcaO4AvE?si=Tuv1234567890Wxy')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (17, 5, N'Samurai Champloo', N'Anime', N'Samurais en Japón feudal con hip-hop', N'fotos/Serie/samurai.jpg', N'4OuRajFzMYI?si=Zab4567890123Cde')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (18, 5, N'The Crown', N'Serie', N'Historia de la realeza británica', N'fotos/Serie/thecrown.jpg', N'JWtnJjn6ng0?si=Fgh7890123456Ijk')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (19, 6, N'Mi Vecino Totoro', N'Anime', N'Aventuras mágicas de dos hermanas', N'fotos/Serie/totoro.jpg', N'92a7Hj0ijLs?si=Lmn4567890123Opq')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (20, 6, N'Anne with an E', N'Serie', N'Niña huérfana encuentra hogar', N'fotos/Serie/anne.jpg', N'7ug8v7rPEh8?si=Rst7890123456Uvw')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (21, 6, N'Hilda', N'Serie', N'Niña aventurera en mundo mágico', N'fotos/Serie/hilda.jpg', N'JaVCU7pLfyc?si=Xyz1234567890Abc')
GO
INSERT [dbo].[AnimeSeries] ([AnimeSeriesID], [PerfilID], [Titulo], [Tipo], [Descripcion], [Caratula], [TrailerYouTube]) VALUES (22, 6, N'A Silent Voice', N'Anime', N'Redención y amistad sobre bullying', N'fotos/Serie/silentvoice.jpg', N'nfK6UgLra7g?si=Def4567890123Ghi')
GO
SET IDENTITY_INSERT [dbo].[AnimeSeries] OFF
GO
SET IDENTITY_INSERT [dbo].[Eventos] ON 
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (1, 1, N'Nacimiento', N'Nací en Santo Domingo', CAST(N'1995-03-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (2, 1, N'Graduación Bachillerato', N'Me gradué del instituto con honores', CAST(N'2013-06-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (3, 1, N'Primer Trabajo', N'Comencé como desarrollador junior', CAST(N'2017-08-01' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (4, 1, N'Certificación React', N'Obtuve certificación oficial en React', CAST(N'2020-11-20' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (5, 2, N'Nacimiento', N'Nací en San Cristóbal', CAST(N'1998-07-22' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (6, 2, N'Primera Exposición', N'Mi primera exposición de arte', CAST(N'2016-04-10' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (7, 2, N'Graduación Universidad', N'Licenciatura en Diseño Gráfico', CAST(N'2020-09-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (8, 2, N'Primer Cliente Internacional', N'Trabajé para empresa europea', CAST(N'2022-03-12' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (9, 3, N'Nacimiento', N'Nací en Santiago', CAST(N'1992-11-08' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (10, 3, N'Primer Hackathon', N'Gané mi primer hackathon nacional', CAST(N'2014-10-25' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (11, 3, N'Maestría en IA', N'Completé maestría en Inteligencia Artificial', CAST(N'2018-12-10' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (12, 3, N'Startup Fundada', N'Cofundé startup de machine learning', CAST(N'2021-05-20' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (13, 4, N'Nacimiento', N'Nací en La Romana', CAST(N'2000-02-14' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (14, 4, N'Voluntariado en Clínica', N'Comencé voluntariado médico', CAST(N'2018-06-01' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (15, 4, N'Ingreso a Medicina', N'Aceptada en facultad de medicina', CAST(N'2018-09-01' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (16, 4, N'Misión Humanitaria', N'Viaje humanitario a Haití', CAST(N'2023-07-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (17, 5, N'Nacimiento', N'Nací en Puerto Plata', CAST(N'1988-05-30' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (18, 5, N'Primera Cámara', N'Mi padre me regaló mi primera cámara', CAST(N'2002-12-25' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (19, 5, N'Exposición Fotográfica', N'Primera exposición individual', CAST(N'2010-08-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (20, 5, N'Premio Nacional', N'Gané premio de fotografía documental', CAST(N'2019-11-03' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (21, 5, N'Documental Premiado', N'Mi documental ganó en festival internacional', CAST(N'2023-05-18' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (22, 6, N'Nacimiento', N'Nací en Barahona', CAST(N'1996-09-18' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (23, 6, N'Primer Cuento Publicado', N'Publiqué mi primer cuento infantil', CAST(N'2015-03-22' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (24, 6, N'Graduación Psicología', N'Licenciatura en Psicología Infantil', CAST(N'2019-07-10' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (25, 6, N'Apertura de Consultorio', N'Abrí mi consultorio privado', CAST(N'2021-01-15' AS Date))
GO
INSERT [dbo].[Eventos] ([EventosID], [PerfilID], [Titulo], [Descripcion], [Fecha]) VALUES (26, 6, N'Premio Literario', N'Gané premio nacional de literatura infantil', CAST(N'2024-04-08' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Eventos] OFF
GO
SET IDENTITY_INSERT [dbo].[Genealogia] ON 
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (1, 1, N'Carlos Pérez', N'Padre', N'Ingeniero civil, le gusta la lectura y el fútbol.', N'fotos/Papa1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (2, 1, N'María González', N'Madre', N'Profesora de matemáticas, excelente cocinera.', N'fotos/Mama1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (3, 1, N'Roberto Pérez', N'Abuelo', N'Abuelo paterno, veterano y gran narrador de historias.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (4, 1, N'Carmen López', N'Abuela', N'Abuela paterna, costurera experta y dulcera famosa.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (5, 1, N'Miguel González', N'Abuelo', N'Abuelo materno, carpintero maestro.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (6, 1, N'Isabel Rodríguez', N'Abuela', N'Abuela materna, jardinera apasionada.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (7, 2, N'Luis Rodríguez', N'Padre', N'Contador público, fanático del ajedrez.', N'fotos/Papa2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (8, 2, N'Ana Martínez', N'Madre', N'Enfermera dedicada, experta en repostería.', N'fotos/Mama2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (9, 2, N'Pedro Rodríguez', N'Abuelo', N'Abuelo paterno, mecánico jubilado.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (10, 2, N'Rosa Fernández', N'Abuela', N'Abuela paterna, maestra jubilada.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (11, 2, N'Carlos Martínez', N'Abuelo', N'Abuelo materno, pescador de toda la vida.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (12, 2, N'Lucía Ramírez', N'Abuela', N'Abuela materna, bordadora tradicional.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (13, 2, N'Andrea Rodríguez', N'Hermana', N'Hermana menor, estudiante de veterinaria.', N'fotos/Hermana2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (14, 2, N'Diego Rodríguez', N'Hermano', N'Hermano mayor, arquitecto.', N'fotos/Hermano1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (15, 3, N'Jorge Méndez', N'Padre', N'Doctor en medicina general.', N'fotos/Papa1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (16, 3, N'Patricia Sánchez', N'Madre', N'Abogada especializada en familia.', N'fotos/Mama1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (17, 3, N'Héctor Méndez', N'Abuelo', N'Abuelo paterno, agricultor.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (18, 3, N'Elena Torres', N'Abuela', N'Abuela paterna, modista.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (19, 3, N'Roberto Sánchez', N'Abuelo', N'Abuelo materno, comerciante.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (20, 3, N'Gloria Mejía', N'Abuela', N'Abuela materna, pianista.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (21, 3, N'Sofía Méndez', N'Hermana', N'Hermana, psicóloga clínica.', N'fotos/Hermana1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (22, 3, N'Laura Méndez', N'Prima', N'Prima cercana, bailarina profesional.', N'fotos/Prima2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (23, 3, N'Ricardo Méndez', N'Tío', N'Tío paterno, chef ejecutivo.', N'fotos/Tio2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (24, 4, N'Fernando López', N'Padre', N'Ingeniero eléctrico, amante de la música.', N'fotos/Papa2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (25, 4, N'Carmen Díaz', N'Madre', N'Farmacéutica, coleccionista de plantas.', N'fotos/Mama2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (26, 4, N'Andrés López', N'Abuelo', N'Abuelo paterno, maestro de primaria jubilado.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (27, 4, N'Marta Cruz', N'Abuela', N'Abuela paterna, tejedora artesanal.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (28, 4, N'Javier Díaz', N'Abuelo', N'Abuelo materno, taxista jubilado.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (29, 4, N'Beatriz Morales', N'Abuela', N'Abuela materna, cocinera tradicional.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (30, 4, N'Miguel López', N'Hermano', N'Hermano mayor, ingeniero industrial.', N'fotos/Hermano2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (31, 4, N'Valeria López', N'Hermana', N'Hermana menor, estudiante de bachillerato.', N'fotos/Hija2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (32, 4, N'Gabriel Díaz', N'Primo', N'Primo materno, músico profesional.', N'fotos/Primo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (33, 4, N'Elena Díaz', N'Tía', N'Tía materna, periodista.', N'fotos/Tia2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (34, 5, N'Manuel Castro', N'Padre', N'Piloto comercial retirado.', N'fotos/Papa1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (35, 5, N'Sandra Vega', N'Madre', N'Bibliotecaria y escritora aficionada.', N'fotos/Mama1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (36, 5, N'Alberto Castro', N'Abuelo', N'Abuelo paterno, fotógrafo de bodas.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (37, 5, N'Dolores Núñez', N'Abuela', N'Abuela paterna, florista.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (38, 5, N'Francisco Vega', N'Abuelo', N'Abuelo materno, poeta publicado.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (39, 5, N'Raquel Herrera', N'Abuela', N'Abuela materna, pintora de acuarelas.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (40, 5, N'Daniel Castro', N'Hermano', N'Hermano menor, ingeniero aeronáutico.', N'fotos/Hermano1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (41, 5, N'Camila Castro', N'Hermana', N'Hermana, actriz de teatro.', N'fotos/Hermana2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (42, 5, N'Martín Vega', N'Primo', N'Primo materno, cineasta independiente.', N'fotos/Primo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (43, 5, N'Luciana Vega', N'Prima', N'Prima materna, fotógrafa de moda.', N'fotos/Prima1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (44, 5, N'Sebastián Castro', N'Tío', N'Tío paterno, productor musical.', N'fotos/Tio1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (45, 6, N'Tomás Reyes', N'Padre', N'Veterinario de animales silvestres.', N'fotos/Papa2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (46, 6, N'Gabriela Ortiz', N'Madre', N'Maestra de preescolar.', N'fotos/Mama2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (47, 6, N'Esteban Reyes', N'Abuelo', N'Abuelo paterno, ganadero.', N'fotos/Abuelo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (48, 6, N'Clara Jiménez', N'Abuela', N'Abuela paterna, partera tradicional.', N'fotos/Abuela1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (49, 6, N'Raúl Ortiz', N'Abuelo', N'Abuelo materno, músico de merengue.', N'fotos/Abuelo1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (50, 6, N'Silvia Peña', N'Abuela', N'Abuela materna, cuentacuentos popular.', N'fotos/Abuela2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (51, 6, N'Pablo Reyes', N'Hermano', N'Hermano mayor, biólogo marino.', N'fotos/Hermano2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (52, 6, N'Emma Reyes', N'Hermana', N'Hermana menor, diseñadora de interiores.', N'fotos/Hermana1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (53, 6, N'Natalia Ortiz', N'Prima', N'Prima materna, pediatra.', N'fotos/Prima2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (54, 6, N'Joaquín Ortiz', N'Primo', N'Primo materno, maestro de música.', N'fotos/Primo2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (55, 6, N'Victoria Reyes', N'Tía', N'Tía paterna, trabajadora social.', N'fotos/Tia2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (56, 6, N'Mateo Ortiz', N'Tío', N'Tío materno, ilustrador de libros.', N'fotos/Tio2.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (57, 6, N'Isabella Reyes', N'Hija', N'Hija, estudiante de primaria.', N'fotos/Hija1.jpg')
GO
INSERT [dbo].[Genealogia] ([GenealogiaID], [PerfilID], [Nombre], [Parentesco], [Descripcion], [Foto]) VALUES (58, 6, N'Lucas Reyes', N'Hijo', N'Hijo, en preescolar.', N'fotos/Hijo1.jpg')
GO
SET IDENTITY_INSERT [dbo].[Genealogia] OFF
GO
SET IDENTITY_INSERT [dbo].[Pasatiempos] ON 
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (1, 1, N'Programación', N'Desarrollo aplicaciones web con JavaScript y React', N'fotos/Pasatiempos/Programacion.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (2, 1, N'Gaming', N'Juego videojuegos de estrategia y RPG', N'fotos/Pasatiempos/Gaming.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (3, 1, N'Fotografía', N'Tomo fotos de paisajes y retratos', N'fotos/Pasatiempos/Fotografia.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (4, 1, N'Lectura', N'Leo libros de ciencia ficción y programación', N'fotos/Pasatiempos/Lectura.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (5, 2, N'Pintura Digital', N'Creo ilustraciones digitales con Procreate', N'fotos/Pasatiempos/Pintura.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (6, 2, N'Yoga', N'Practico yoga y meditación diariamente', N'fotos/Pasatiempos/Yoga.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (7, 2, N'Cocina', N'Experimento con recetas veganas', N'fotos/Pasatiempos/Cocina.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (8, 2, N'Viajes', N'Exploro nuevos lugares y culturas', N'fotos/Pasatiempos/Viajes.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (9, 3, N'Machine Learning', N'Desarrollo modelos de IA y redes neuronales', N'fotos/Pasatiempos/ML.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (10, 3, N'Ajedrez', N'Juego ajedrez competitivo', N'fotos/Pasatiempos/Ajedrez.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (11, 3, N'Ciclismo', N'Salgo en bicicleta los fines de semana', N'fotos/Pasatiempos/Ciclismo.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (12, 3, N'Podcast', N'Grabo podcast sobre tecnología', N'fotos/Pasatiempos/Podcast.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (13, 4, N'Voluntariado', N'Ayudo en brigadas médicas comunitarias', N'fotos/Pasatiempos/Voluntariado.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (14, 4, N'Natación', N'Nado competitivamente desde niña', N'fotos/Pasatiempos/Natacion.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (15, 4, N'Música', N'Toco el violín en orquesta juvenil', N'fotos/Pasatiempos/Musica.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (16, 4, N'Escritura', N'Escribo blog sobre salud preventiva', N'fotos/Pasatiempos/Escritura.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (17, 5, N'Fotografía de Calle', N'Capturo momentos urbanos cotidianos', N'fotos/Pasatiempos/Fotografia.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (18, 5, N'Senderismo', N'Exploro montañas para fotografiar naturaleza', N'fotos/Pasatiempos/Senderismo.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (19, 5, N'Cine Clásico', N'Colecciono y estudio películas clásicas', N'fotos/Pasatiempos/Cine.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (20, 5, N'Buceo', N'Fotografía submarina en arrecifes', N'fotos/Pasatiempos/Buceo.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (21, 6, N'Escritura Creativa', N'Escribo cuentos y fábulas para niños', N'fotos/Pasatiempos/Escritura.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (22, 6, N'Teatro Infantil', N'Dirijo obras de teatro para niños', N'fotos/Pasatiempos/Teatro.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (23, 6, N'Jardinería', N'Cultivo huerto urbano con mis hijos', N'fotos/Pasatiempos/Jardineria.jpg')
GO
INSERT [dbo].[Pasatiempos] ([PasatiemposID], [PerfilID], [Nombre], [Descripcion], [Imagen]) VALUES (24, 6, N'Origami', N'Creo figuras de papel para terapia lúdica', N'fotos/Pasatiempos/Origami.jpg')
GO
SET IDENTITY_INSERT [dbo].[Pasatiempos] OFF
GO
SET IDENTITY_INSERT [dbo].[PasatiemposImgs] ON 
GO
INSERT [dbo].[PasatiemposImgs] ([PasatiemposImgsID], [PerfilID], [Nombre], [Imagen], [Descripcion]) VALUES (1, 1, N'Foto1', N'fotos/Pasatiempos2/1.jpg', N'Esta fue cuando escalé el monte Pepe')
GO
INSERT [dbo].[PasatiemposImgs] ([PasatiemposImgsID], [PerfilID], [Nombre], [Imagen], [Descripcion]) VALUES (2, 1, N'Foto2', N'fotos/Pasatiempos2/5.jpg', N'Esta fue cuando volé en globo sobre Machu Pichu')
GO
INSERT [dbo].[PasatiemposImgs] ([PasatiemposImgsID], [PerfilID], [Nombre], [Imagen], [Descripcion]) VALUES (4, 1, N'Foto3', N'fotos/Pasatiempos2/7.jpg', N'Esta fue en el parque Yellowstone')
GO
INSERT [dbo].[PasatiemposImgs] ([PasatiemposImgsID], [PerfilID], [Nombre], [Imagen], [Descripcion]) VALUES (5, 1, N'Foto4', N'fotos/Pasatiempos2/4.jpg', N'Esta fue en el Lago Nes')
GO
INSERT [dbo].[PasatiemposImgs] ([PasatiemposImgsID], [PerfilID], [Nombre], [Imagen], [Descripcion]) VALUES (6, 1, N'Foto5', N'fotos/Pasatiempos2/13.jpg', N'Esta fue en una playa de Bocha Chica')
GO
SET IDENTITY_INSERT [dbo].[PasatiemposImgs] OFF
GO
SET IDENTITY_INSERT [dbo].[Perfil] ON 
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (1, N'Juan', N'Pérez', CAST(N'1995-03-15' AS Date), N'Desarrollador web apasionado por la tecnología y los videojuegos.', N'fotos/PerfilHombre.jpg')
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (2, N'María', N'Rodríguez', CAST(N'1998-07-22' AS Date), N'Diseñadora gráfica y amante del arte digital.', N'fotos/PerfilMujer.jpg')
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (3, N'Carlos', N'Méndez', CAST(N'1992-11-08' AS Date), N'Ingeniero de software y entusiasta de la inteligencia artificial.', N'fotos/Primo1.jpg')
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (4, N'Ana', N'López', CAST(N'2000-02-14' AS Date), N'Estudiante de medicina y voluntaria en organizaciones de salud.', N'fotos/Prima1.jpg')
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (5, N'Roberto', N'Castro', CAST(N'1988-05-30' AS Date), N'Fotógrafo profesional y director de documentales.', N'fotos/Primo2.jpg')
GO
INSERT [dbo].[Perfil] ([PerfilID], [Nombre], [Apellido], [FechaNacimiento], [Biografia], [Foto]) VALUES (6, N'Sofía', N'Reyes', CAST(N'1996-09-18' AS Date), N'Psicóloga infantil y escritora de cuentos para niños.', N'fotos/Tia1.jpg')
GO
SET IDENTITY_INSERT [dbo].[Perfil] OFF
GO
SET IDENTITY_INSERT [dbo].[RedesSociales] ON 
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (1, 1, N'GitHub', N'juan-dev', N'https://github.com/', N'fotos/Redes/GitHub.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (2, 1, N'LinkedIn', N'juan-perez', N'https://linkedin.com/', N'fotos/Redes/Linkedin.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (3, 1, N'X', N'@juandev', N'https://x.com/', N'fotos/Redes/X.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (4, 1, N'Instagram', N'juan_dev', N'https://instagram.com/', N'fotos/Redes/Instagram.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (5, 2, N'Instagram', N'maria_designs', N'https://instagram.com/', N'fotos/Redes/Instagram.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (6, 2, N'Behance', N'mariarodriguez', N'https://behance.net/', N'fotos/Redes/Behance.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (7, 2, N'Pinterest', N'maria_art', N'https://pinterest.com/', N'fotos/Redes/Pinterest.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (8, 3, N'GitHub', N'carlosmendez-ai', N'https://github.com/', N'fotos/Redes/GitHub.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (9, 3, N'LinkedIn', N'carlos-mendez-ai', N'https://linkedin.com/in/', N'fotos/Redes/Linkedin.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (10, 3, N'X', N'@carlosmendezAI', N'https://x.com/', N'fotos/Redes/X.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (11, 3, N'Medium', N'carlos-mendez', N'https://medium.com/', N'fotos/Redes/Medium.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (12, 4, N'Instagram', N'ana_medstudent', N'https://instagram.com/', N'fotos/Redes/Instagram.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (13, 4, N'X', N'@analopezMD', N'https://x.com/', N'fotos/Redes/X.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (14, 4, N'LinkedIn', N'ana-lopez-med', N'https://linkedin.com/in/', N'fotos/Redes/Linkedin.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (15, 4, N'TikTok', N'ana.med', N'https://tiktok.com/', N'fotos/Redes/TikTok.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (16, 5, N'Instagram', N'roberto_fotografia', N'https://instagram.com/', N'fotos/Redes/Instagram.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (17, 5, N'Vimeo', N'robertocastro', N'https://vimeo.com/', N'fotos/Redes/Vimeo.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (18, 5, N'500px', N'robertocastro', N'https://500px.com/', N'fotos/Redes/500px.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (19, 5, N'X', N'@robertocastro_ph', N'https://x.com/', N'fotos/Redes/X.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (20, 6, N'Instagram', N'sofia_psicologa', N'https://instagram.com/', N'fotos/Redes/Instagram.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (21, 6, N'Facebook', N'sofiareyespsicologa', N'https://facebook.com/', N'fotos/Redes/Facebook.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (22, 6, N'LinkedIn', N'sofia-reyes-psi', N'https://linkedin.com/in/', N'fotos/Redes/Linkedin.png')
GO
INSERT [dbo].[RedesSociales] ([RedesSocialesID], [PerfilID], [Red], [Usuario], [URL], [Icono]) VALUES (23, 6, N'Goodreads', N'sofiareyes', N'https://goodreads.com/', N'fotos/Redes/Goodreads.png')
GO
SET IDENTITY_INSERT [dbo].[RedesSociales] OFF
GO
SET IDENTITY_INSERT [dbo].[Youtubers] ON 
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (1, 1, N'Midudev', N'Programación web y JavaScript', N'https://youtube.com/@midudev', N'fotos/YT/midudev.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (2, 1, N'TheGrefg', N'Gaming y entretenimiento', N'https://youtube.com/@TheGrefg', N'fotos/YT/thegrefg.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (3, 1, N'Quantum Fracture', N'Divulgación científica', N'https://youtube.com/@QuantumFracture', N'fotos/YT/quantum.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (4, 2, N'Superholly', N'Idiomas y cultura', N'https://youtube.com/@Superholly', N'fotos/YT/superholly.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (5, 2, N'Luisito Comunica', N'Viajes y aventuras', N'https://youtube.com/@LuisitoComunica', N'fotos/YT/luisito.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (6, 2, N'Paulina Cocina', N'Recetas y gastronomía', N'https://youtube.com/@PaulinaCocina', N'fotos/YT/paulina.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (7, 3, N'Dot CSV', N'Inteligencia artificial y ciencia de datos', N'https://youtube.com/@DotCSV', N'fotos/YT/dotcsv.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (8, 3, N'Nate Gentile', N'Desarrollo profesional tech', N'https://youtube.com/@NateGentile', N'fotos/YT/nate.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (9, 3, N'Two Minute Papers', N'Investigación en IA', N'https://youtube.com/@TwoMinutePapers', N'fotos/YT/twominute.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (10, 4, N'Dr. Mike', N'Medicina y salud explicada', N'https://youtube.com/@DoctorMike', N'fotos/YT/drmike.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (11, 4, N'CrashCourse', N'Educación en ciencias', N'https://youtube.com/@crashcourse', N'fotos/YT/crashcourse.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (12, 4, N'Osmosis', N'Educación médica', N'https://youtube.com/@osmosis', N'fotos/YT/osmosis.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (13, 5, N'Peter McKinnon', N'Fotografía y cinematografía', N'https://youtube.com/@PeterMcKinnon', N'fotos/YT/peter.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (14, 5, N'DSLR Video Shooter', N'Técnicas de video y foto', N'https://youtube.com/@dslrvideoshooter', N'fotos/YT/dslr.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (15, 5, N'Matti Haapoja', N'Vlogs creativos y fotografía', N'https://youtube.com/@MattiHaapoja', N'fotos/YT/matti.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (16, 6, N'Psych2Go', N'Psicología explicada de forma visual', N'https://youtube.com/@Psych2go', N'fotos/YT/psych2go.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (17, 6, N'Jaime Altozano', N'Teoría musical educativa', N'https://youtube.com/@JaimeAltozano', N'fotos/YT/jaime.jpg')
GO
INSERT [dbo].[Youtubers] ([YoutubersID], [PerfilID], [NombreCanal], [Descripcion], [URL], [Logo]) VALUES (18, 6, N'La Gata de Schrödinger', N'Ciencia para todos', N'https://youtube.com/@LaGataDeSchrodinger', N'fotos/YT/gata.jpg')
GO
SET IDENTITY_INSERT [dbo].[Youtubers] OFF
GO
ALTER TABLE [dbo].[Contactos] ADD  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[AnimeSeries]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Eventos]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Genealogia]  WITH CHECK ADD  CONSTRAINT [FK__Genealogi__Perfi__3C69FB99] FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Genealogia] CHECK CONSTRAINT [FK__Genealogi__Perfi__3C69FB99]
GO
ALTER TABLE [dbo].[Pasatiempos]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[PasatiemposImgs]  WITH CHECK ADD  CONSTRAINT [FK_PasatiemposImgs_Perfil] FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[PasatiemposImgs] CHECK CONSTRAINT [FK_PasatiemposImgs_Perfil]
GO
ALTER TABLE [dbo].[RedesSociales]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Youtubers]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
ALTER TABLE [dbo].[Contactos]  WITH CHECK ADD FOREIGN KEY([PerfilID])
REFERENCES [dbo].[Perfil] ([PerfilID])
GO
USE [master]
GO
ALTER DATABASE [PaginaPersonal] SET  READ_WRITE 
GO
