USE [YazilimProjeServer]
GO
/****** Object:  Table [dbo].[Arsa]    Script Date: 20.05.2018 18:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arsa](
	[ArsaId] [int] IDENTITY(1,1) NOT NULL,
	[kategori] [int] NULL,
	[sahipId] [int] NULL,
	[arsaTuru] [int] NULL,
	[baslik] [nvarchar](100) NULL,
	[fiyat] [decimal](18, 0) NULL,
	[depozito] [decimal](18, 0) NULL,
	[aktif] [bit] NULL,
	[il] [int] NULL,
	[ilce] [int] NULL,
	[adres] [nvarchar](300) NULL,
	[metrekare] [int] NULL,
	[aciklama] [nvarchar](max) NULL,
	[ilanTarihi] [datetime] NULL,
	[kucukResim] [nvarchar](100) NULL,
 CONSTRAINT [PK_Arsa] PRIMARY KEY CLUSTERED 
(
	[ArsaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArsaTuru]    Script Date: 20.05.2018 18:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArsaTuru](
	[arsaTuruId] [int] NOT NULL,
	[arsaTuruAdi] [varchar](50) NULL,
 CONSTRAINT [PK_arsaTuru] PRIMARY KEY CLUSTERED 
(
	[arsaTuruId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bulunduguKat]    Script Date: 20.05.2018 18:31:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bulunduguKat](
	[bulunduguKatId] [int] IDENTITY(1,1) NOT NULL,
	[bulunduguKatAdi] [varchar](50) NULL,
 CONSTRAINT [PK_bulunduguKat] PRIMARY KEY CLUSTERED 
(
	[bulunduguKatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Isyeri]    Script Date: 20.05.2018 18:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Isyeri](
	[IsyeriId] [int] IDENTITY(1,1) NOT NULL,
	[kategori] [int] NULL,
	[sahipId] [int] NULL,
	[baslik] [nvarchar](100) NULL,
	[fiyat] [decimal](18, 0) NULL,
	[depozito] [decimal](18, 0) NULL,
	[aktif] [bit] NULL,
	[il] [int] NULL,
	[ilce] [int] NULL,
	[adres] [nvarchar](300) NULL,
	[metrekare] [int] NULL,
	[odaSayisi] [int] NULL,
	[isitmaTuru] [int] NULL,
	[katSayisi] [int] NULL,
	[bulunduguKat] [int] NULL,
	[binaYasi] [int] NULL,
	[isyeriTuru] [int] NULL,
	[aciklama] [nvarchar](max) NULL,
	[esyaDurumu] [bit] NULL,
	[ilanTarihi] [datetime] NULL,
	[kucukResim] [nvarchar](100) NULL,
 CONSTRAINT [PK_Isyeri] PRIMARY KEY CLUSTERED 
(
	[IsyeriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IsyeriTuru]    Script Date: 20.05.2018 18:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsyeriTuru](
	[isyeriTuruId] [int] NOT NULL,
	[isyeriTuruAdi] [varchar](50) NULL,
 CONSTRAINT [PK_isyeriTuru] PRIMARY KEY CLUSTERED 
(
	[isyeriTuruId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ilceler]    Script Date: 20.05.2018 18:31:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilceler](
	[ilceId] [int] NOT NULL,
	[ilce] [nvarchar](255) NULL,
	[sehirId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_ilceler] PRIMARY KEY CLUSTERED 
(
	[ilceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[iller]    Script Date: 20.05.2018 18:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[iller](
	[ilId] [int] IDENTITY(1,1) NOT NULL,
	[sehir] [nvarchar](255) NULL,
 CONSTRAINT [PK_iller] PRIMARY KEY CLUSTERED 
(
	[ilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[isitmaTuru]    Script Date: 20.05.2018 18:31:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[isitmaTuru](
	[isitmaTuruId] [int] NOT NULL,
	[isitmaTuruAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_almayorBunu] PRIMARY KEY CLUSTERED 
(
	[isitmaTuruId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Konut]    Script Date: 20.05.2018 18:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konut](
	[KonutId] [int] IDENTITY(1,1) NOT NULL,
	[kategori] [int] NULL,
	[sahipId] [int] NULL,
	[metrekare] [int] NULL,
	[fiyat] [decimal](18, 0) NULL,
	[depozito] [decimal](18, 0) NULL,
	[il] [int] NULL,
	[ilce] [int] NULL,
	[adres] [nvarchar](300) NULL,
	[yasi] [int] NULL,
	[isitmaTuru] [int] NULL,
	[katSayisi] [int] NULL,
	[bulunduguKat] [int] NULL,
	[konutTuru] [int] NULL,
	[odaSayisi] [int] NULL,
	[ilanTarihi] [datetime] NULL,
	[aktif] [bit] NULL,
	[baslik] [nvarchar](100) NULL,
	[esyaDurumu] [bit] NULL,
	[aciklama] [nvarchar](max) NULL,
	[kucukResim] [nvarchar](100) NULL,
 CONSTRAINT [PK_Kiralik] PRIMARY KEY CLUSTERED 
(
	[KonutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KonutTuru]    Script Date: 20.05.2018 18:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KonutTuru](
	[konutTuruId] [int] NOT NULL,
	[konutTuruAdi] [varchar](50) NULL,
 CONSTRAINT [PK_konutTuru] PRIMARY KEY CLUSTERED 
(
	[konutTuruId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 20.05.2018 18:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciId] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Sifre] [nvarchar](20) NULL,
	[Il] [int] NULL,
	[Ilce] [int] NULL,
	[Adres] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Telefon] [nvarchar](15) NULL,
	[KayitTarihi] [datetime] NULL,
 CONSTRAINT [PK_MalSahibi] PRIMARY KEY CLUSTERED 
(
	[KullaniciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesajlar]    Script Date: 20.05.2018 18:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesajlar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gönderenID] [int] NOT NULL,
	[aliciID] [int] NOT NULL,
	[tarih] [datetime] NULL,
	[okundumu] [bit] NULL,
	[mesaj] [varchar](max) NOT NULL,
	[konu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Mesajlar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[odaSayisi]    Script Date: 20.05.2018 18:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[odaSayisi](
	[odaSayisiId] [int] IDENTITY(1,1) NOT NULL,
	[odaSayisiAdi] [varchar](10) NULL,
 CONSTRAINT [PK_odaSayisi] PRIMARY KEY CLUSTERED 
(
	[odaSayisiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resim]    Script Date: 20.05.2018 18:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[ResimId] [int] IDENTITY(1,1) NOT NULL,
	[IlanTuruId] [int] NULL,
	[KayitId] [int] NULL,
	[ResimAdresi] [nvarchar](250) NULL,
 CONSTRAINT [PK_Resim] PRIMARY KEY CLUSTERED 
(
	[ResimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetici]    Script Date: 20.05.2018 18:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetici](
	[YoneticiID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Sifre] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Yonetici] PRIMARY KEY CLUSTERED 
(
	[YoneticiID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Arsa] ON 
GO
INSERT [dbo].[Arsa] ([ArsaId], [kategori], [sahipId], [arsaTuru], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [aciklama], [ilanTarihi], [kucukResim]) VALUES (1, 3, 1, 1, N'Sivas''ta kat karşılığı uygun fiyata 500 metrekare arsa', CAST(40000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 58, 700, N'Atlı sokak', 500, N'Uygun fiyata bırakılmıştır kat karşılığı kabul edilmektedir', CAST(N'2016-12-28T10:52:43.337' AS DateTime), N'9a133012-389a-4fe9-a989-2824e23e789c.jpg')
GO
INSERT [dbo].[Arsa] ([ArsaId], [kategori], [sahipId], [arsaTuru], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [aciklama], [ilanTarihi], [kucukResim]) VALUES (2, 3, 1, 12, N'Konyada kat karşılığı arsa', CAST(101000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 42, 493, N'asldfkj', 175, N'Açık işte', CAST(N'2017-01-05T14:05:01.307' AS DateTime), N'c808a175-065a-4086-94e0-5649ed028d63.jpeg')
GO
INSERT [dbo].[Arsa] ([ArsaId], [kategori], [sahipId], [arsaTuru], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [aciklama], [ilanTarihi], [kucukResim]) VALUES (3, 1, 1, 11, N'Eskişehirde satılık 150m² arsa', CAST(40000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 26, 317, N'Ucuz', 150, N'Koşun', CAST(N'2017-01-06T18:26:23.813' AS DateTime), N'b0bf8312-2dc8-4c86-a81f-ef42774b3c93.jpg')
GO
INSERT [dbo].[Arsa] ([ArsaId], [kategori], [sahipId], [arsaTuru], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [aciklama], [ilanTarihi], [kucukResim]) VALUES (4, 1, 1, 1, N'Şişlide konut imarlı 210 m² satılık arsa', CAST(63000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 34, 849, N'Dokuzganlar mah.', 210, N'Gayet uygun hoş fiyatlar', CAST(N'2017-01-07T00:09:23.240' AS DateTime), N'05fb11ab-3846-40de-8b0a-17844d6e0259.jpg')
GO
INSERT [dbo].[Arsa] ([ArsaId], [kategori], [sahipId], [arsaTuru], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [aciklama], [ilanTarihi], [kucukResim]) VALUES (5, 3, 1, 12, N'Konya Karatay''da kat karşılığı tarla', CAST(248000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 42, 504, N'Orda burda şurdadır', 450, N'Beğenmezsen düşeriz fiyattan hadi bakeem kendne dikkat et aslannnnn...', CAST(N'2017-04-17T12:26:45.017' AS DateTime), N'5295269f-9f28-498f-b9b0-f0301419ab1f.jpg')
GO
SET IDENTITY_INSERT [dbo].[Arsa] OFF
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (1, N'Konut İmarlı')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (2, N'Bahçe')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (3, N'Çiftlik')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (4, N'Depo')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (5, N'Sağlık Tesisi')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (6, N'Ticari Alan')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (7, N'Maden Ocağı')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (8, N'Muhtelif Arsa')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (9, N'Eğitim Tesisi')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (10, N'Sanayi İmarlı')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (11, N'Özel Kullanım')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (12, N'Tarla')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (13, N'Toplu Konut Bölgesi')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (14, N'Turizm İmarlı')
GO
INSERT [dbo].[ArsaTuru] ([arsaTuruId], [arsaTuruAdi]) VALUES (15, N'yeniArsaTürü')
GO
SET IDENTITY_INSERT [dbo].[bulunduguKat] ON 
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (1, N'Bahçe Dublex')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (2, N'Bahçe Katı')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (3, N'Çatı Katı')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (4, N'Çatı Dublex')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (5, N'Müstakil')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (6, N'Bodrum')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (7, N'1')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (8, N'2')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (9, N'3')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (10, N'4')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (11, N'5')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (12, N'6')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (13, N'7')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (14, N'8')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (15, N'9')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (16, N'10')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (17, N'11')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (18, N'12')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (19, N'13')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (20, N'14')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (21, N'15')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (22, N'16')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (23, N'17')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (24, N'18')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (25, N'19')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (26, N'20')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (27, N'21')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (28, N'22')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (29, N'23')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (30, N'24')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (31, N'25')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (32, N'26')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (33, N'27')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (34, N'28')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (35, N'29')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (36, N'30')
GO
INSERT [dbo].[bulunduguKat] ([bulunduguKatId], [bulunduguKatAdi]) VALUES (37, N'30+')
GO
SET IDENTITY_INSERT [dbo].[bulunduguKat] OFF
GO
SET IDENTITY_INSERT [dbo].[Isyeri] ON 
GO
INSERT [dbo].[Isyeri] ([IsyeriId], [kategori], [sahipId], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [odaSayisi], [isitmaTuru], [katSayisi], [bulunduguKat], [binaYasi], [isyeriTuru], [aciklama], [esyaDurumu], [ilanTarihi], [kucukResim]) VALUES (1, 3, 1, N'Afyon Merkezde devren satılık atölye', CAST(440000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 3, 23, N'Çıkmaz sokak.', 350, 15, 10, 3, 2, 16, 1, N'Mobilya sektörüne uygun işlek bir mekan', 0, CAST(N'2016-12-28T09:33:34.597' AS DateTime), N'c3d407f3-a582-419a-a3a5-ac32af7bf86c.png')
GO
INSERT [dbo].[Isyeri] ([IsyeriId], [kategori], [sahipId], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [odaSayisi], [isitmaTuru], [katSayisi], [bulunduguKat], [binaYasi], [isyeriTuru], [aciklama], [esyaDurumu], [ilanTarihi], [kucukResim]) VALUES (2, 2, 1, N'Aydın Nazillide kiralık büfe', CAST(7500 AS Decimal(18, 0)), CAST(800 AS Decimal(18, 0)), 1, 9, 116, N'Adliye sokak', 80, 1, 7, 4, 2, 16, 5, N'İşlek bir dükan', 1, CAST(N'2016-12-28T10:48:05.407' AS DateTime), N'0a3a1c44-37ab-42f4-af17-6eb5e0a81274.jpg')
GO
INSERT [dbo].[Isyeri] ([IsyeriId], [kategori], [sahipId], [baslik], [fiyat], [depozito], [aktif], [il], [ilce], [adres], [metrekare], [odaSayisi], [isitmaTuru], [katSayisi], [bulunduguKat], [binaYasi], [isyeriTuru], [aciklama], [esyaDurumu], [ilanTarihi], [kucukResim]) VALUES (3, 3, 1, N'Ankara Gölbaşı''da devren benzin istasyonu', CAST(78000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 1, 6, 71, N'Gölün başı', 250, 3, 7, 1, 7, 12, 2, N'Gayet uygun fazla lafa hacet yok .', 0, CAST(N'2017-04-22T18:10:27.863' AS DateTime), N'f123e0db-4aaa-4149-bc69-f5facc4f6224.jpg')
GO
SET IDENTITY_INSERT [dbo].[Isyeri] OFF
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (1, N'Atölye')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (2, N'Benzin İstasyonu')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (3, N'Bina')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (4, N'Büro')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (5, N'Büfe')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (6, N'Apartman Dairesi')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (7, N'Depo')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (8, N'Fabrika')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (9, N'Dükkan & Mağaza')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (10, N'Hastane')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (11, N'Kafe & Bar')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (12, N'Müstakil')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (13, N'Ofis')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (14, N'Restaurant')
GO
INSERT [dbo].[IsyeriTuru] ([isyeriTuruId], [isyeriTuruAdi]) VALUES (15, N'yeniİşyeriTürü')
GO
SET IDENTITY_INSERT [dbo].[ilceler] ON 
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (1, N'SEYHAN', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (2, N'CEYHAN', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (3, N'FEKE', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (4, N'KARAİSALI', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (5, N'KARATAŞ', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (6, N'KOZAN', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (7, N'POZANTI', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (8, N'SAİMBEYLİ', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (9, N'TUFANBEYLİ', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (10, N'YUMURTALIK', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (11, N'YÜREĞİR', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (12, N'ALADAĞ', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (13, N'İMAMOĞLU', 1)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (14, N'ADIYAMAN MERKEZ', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (15, N'BESNİ', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (16, N'ÇELİKHAN', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (17, N'GERGER', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (18, N'GÖLBAŞI', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (19, N'KAHTA', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (20, N'SAMSAT', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (21, N'SİNCİK', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (22, N'TUT', 2)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (23, N'AFYONMERKEZ', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (24, N'BOLVADİN', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (25, N'ÇAY', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (26, N'DAZKIRI', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (27, N'DİNAR', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (28, N'EMİRDAĞ', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (29, N'İHSANİYE', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (30, N'SANDIKLI', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (31, N'SİNANPAŞA', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (32, N'SULDANDAĞI', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (33, N'ŞUHUT', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (34, N'BAŞMAKÇI', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (35, N'BAYAT', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (36, N'İŞCEHİSAR', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (37, N'ÇOBANLAR', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (38, N'EVCİLER', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (39, N'HOCALAR', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (40, N'KIZILÖREN', 3)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (41, N'AKSARAY MERKEZ', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (42, N'ORTAKÖY', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (43, N'AĞAÇÖREN', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (44, N'GÜZELYURT', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (45, N'SARIYAHŞİ', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (46, N'ESKİL', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (47, N'GÜLAĞAÇ', 68)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (48, N'AMASYA MERKEZ', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (49, N'GÖYNÜÇEK', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (50, N'GÜMÜŞHACIKÖYÜ', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (51, N'MERZİFON', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (52, N'SULUOVA', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (53, N'TAŞOVA', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (54, N'HAMAMÖZÜ', 5)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (55, N'ALTINDAĞ', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (56, N'AYAS', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (57, N'BALA', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (58, N'BEYPAZARI', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (59, N'ÇAMLIDERE', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (60, N'ÇANKAYA', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (61, N'ÇUBUK', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (62, N'ELMADAĞ', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (63, N'GÜDÜL', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (64, N'HAYMANA', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (65, N'KALECİK', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (66, N'KIZILCAHAMAM', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (67, N'NALLIHAN', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (68, N'POLATLI', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (69, N'ŞEREFLİKOÇHİSAR', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (70, N'YENİMAHALLE', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (71, N'GÖLBAŞI', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (72, N'KEÇİÖREN', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (73, N'MAMAK', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (74, N'SİNCAN', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (75, N'KAZAN', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (76, N'AKYURT', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (77, N'ETİMESGUT', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (78, N'EVREN', 6)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (79, N'ANSEKİ', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (80, N'ALANYA', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (81, N'ANTALYA MERKEZİ', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (82, N'ELMALI', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (83, N'FİNİKE', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (84, N'GAZİPAŞA', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (85, N'GÜNDOĞMUŞ', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (86, N'KAŞ', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (87, N'KORKUTELİ', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (88, N'KUMLUCA', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (89, N'MANAVGAT', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (90, N'SERİK', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (91, N'DEMRE', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (92, N'İBRADI', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (93, N'KEMER', 7)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (94, N'ARDAHAN MERKEZ', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (95, N'GÖLE', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (96, N'ÇILDIR', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (97, N'HANAK', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (98, N'POSOF', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (99, N'DAMAL', 75)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (100, N'ARDANUÇ', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (101, N'ARHAVİ', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (102, N'ARTVİN MERKEZ', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (103, N'BORÇKA', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (104, N'HOPA', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (105, N'ŞAVŞAT', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (106, N'YUSUFELİ', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (107, N'MURGUL', 8)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (108, N'AYDIN MERKEZ', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (109, N'BOZDOĞAN', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (110, N'ÇİNE', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (111, N'GERMENCİK', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (112, N'KARACASU', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (113, N'KOÇARLI', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (114, N'KUŞADASI', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (115, N'KUYUCAK', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (116, N'NAZİLLİ', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (117, N'SÖKE', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (118, N'SULTANHİSAR', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (119, N'YENİPAZAR', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (120, N'BUHARKENT', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (121, N'İNCİRLİOVA', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (122, N'KARPUZLU', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (123, N'KÖŞK', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (124, N'DİDİM', 9)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (125, N'AĞRI MERKEZ', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (126, N'DİYADİN', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (127, N'DOĞUBEYAZIT', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (128, N'ELEŞKİRT', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (129, N'HAMUR', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (130, N'PATNOS', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (131, N'TAŞLIÇAY', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (132, N'TUTAK', 4)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (133, N'AYVALIK', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (134, N'BALIKESİR MERKEZ', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (135, N'BALYA', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (136, N'BANDIRMA', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (137, N'BİGADİÇ', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (138, N'BURHANİYE', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (139, N'DURSUNBEY', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (140, N'EDREMİT', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (141, N'ERDEK', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (142, N'GÖNEN', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (143, N'HAVRAN', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (144, N'İVRİNDİ', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (145, N'KEPSUT', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (146, N'MANYAS', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (147, N'SAVAŞTEPE', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (148, N'SINDIRGI', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (149, N'SUSURLUK', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (150, N'MARMARA', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (151, N'GÖMEÇ', 10)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (152, N'BARTIN MERKEZ', 74)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (153, N'KURUCAŞİLE', 74)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (154, N'ULUS', 74)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (155, N'AMASRA', 74)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (156, N'BATMAN MERKEZ', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (157, N'BEŞİRİ', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (158, N'GERCÜŞ', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (159, N'KOZLUK', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (160, N'SASON', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (161, N'HASANKEYF', 72)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (162, N'BAYBURT MERKEZ', 69)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (163, N'AYDINTEPE', 69)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (164, N'DEMİRÖZÜ', 69)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (165, N'BOLU MERKEZ', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (166, N'GEREDE', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (167, N'GÖYNÜK', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (168, N'KIBRISCIK', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (169, N'MENGEN', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (170, N'MUDURNU', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (171, N'SEBEN', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (172, N'DÖRTDİVAN', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (173, N'YENİÇAĞA', 14)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (174, N'AĞLASUN', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (175, N'BUCAK', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (176, N'BURDUR MERKEZ', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (177, N'GÖLHİSAR', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (178, N'TEFENNİ', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (179, N'YEŞİLOVA', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (180, N'KARAMANLI', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (181, N'KEMER', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (182, N'ALTINYAYLA', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (183, N'ÇAVDIR', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (184, N'ÇELTİKÇİ', 15)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (185, N'GEMLİK', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (186, N'İNEGÖL', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (187, N'İZNİK', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (188, N'KARACABEY', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (189, N'KELES', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (190, N'MUDANYA', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (191, N'MUSTAFA K. PAŞA', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (192, N'ORHANELİ', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (193, N'ORHANGAZİ', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (194, N'YENİŞEHİR', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (195, N'BÜYÜK ORHAN', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (196, N'HARMANCIK', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (197, N'NÜLİFER', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (198, N'OSMAN GAZİ', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (199, N'YILDIRIM', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (200, N'GÜRSU', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (201, N'KESTEL', 16)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (202, N'BİLECİK MERKEZ', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (203, N'BOZÜYÜK', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (204, N'GÖLPAZARI', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (205, N'OSMANELİ', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (206, N'PAZARYERİ', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (207, N'SÖĞÜT', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (208, N'YENİPAZAR', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (209, N'İNHİSAR', 11)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (210, N'BİNGÖL MERKEZ', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (211, N'GENÇ', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (212, N'KARLIOVA', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (213, N'KİGI', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (214, N'SOLHAN', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (215, N'ADAKLI', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (216, N'YAYLADERE', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (217, N'YEDİSU', 12)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (218, N'ADİLCEVAZ', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (219, N'AHLAT', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (220, N'BİTLİS MERKEZ', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (221, N'HİZAN', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (222, N'MUTKİ', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (223, N'TATVAN', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (224, N'GÜROYMAK', 13)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (225, N'DENİZLİ MERKEZ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (226, N'ACIPAYAM', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (227, N'BULDAN', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (228, N'ÇAL', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (229, N'ÇAMELİ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (230, N'ÇARDAK', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (231, N'ÇİVRİL', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (232, N'GÜNEY', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (233, N'KALE', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (234, N'SARAYKÖY', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (235, N'TAVAS', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (236, N'BABADAĞ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (237, N'BEKİLLİ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (238, N'HONAZ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (239, N'SERİNHİSAR', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (240, N'AKKÖY', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (241, N'BAKLAN', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (242, N'BEYAĞAÇ', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (243, N'BOZKURT', 20)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (244, N'DÜZCE MERKEZ', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (245, N'AKÇAKOCA', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (246, N'YIĞILCA', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (247, N'CUMAYERİ', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (248, N'GÖLYAKA', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (249, N'ÇİLİMLİ', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (250, N'GÜMÜŞOVA', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (251, N'KAYNAŞLI', 81)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (252, N'DİYARBAKIR MERKEZ', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (253, N'BİSMİL', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (254, N'ÇERMİK', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (255, N'ÇINAR', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (256, N'ÇÜNGÜŞ', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (257, N'DİCLE', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (258, N'ERGANİ', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (259, N'HANİ', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (260, N'HAZRO', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (261, N'KULP', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (262, N'LİCE', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (263, N'SİLVAN', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (264, N'EĞİL', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (265, N'KOCAKÖY', 21)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (266, N'EDİRNE MERKEZ', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (267, N'ENEZ', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (268, N'HAVSA', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (269, N'İPSALA', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (270, N'KEŞAN', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (271, N'LALAPAŞA', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (272, N'MERİÇ', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (273, N'UZUNKÖPRÜ', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (274, N'SÜLOĞLU', 22)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (275, N'ELAZIĞ MERKEZ', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (276, N'AĞIN', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (277, N'BASKİL', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (278, N'KARAKOÇAN', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (279, N'KEBAN', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (280, N'MADEN', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (281, N'PALU', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (282, N'SİVRİCE', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (283, N'ARICAK', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (284, N'KOVANCILAR', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (285, N'ALACAKAYA', 23)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (286, N'ERZURUM MERKEZ', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (287, N'PALANDÖKEN', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (288, N'AŞKALE', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (289, N'ÇAT', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (290, N'HINIS', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (291, N'HORASAN', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (292, N'OLTU', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (293, N'İSPİR', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (294, N'KARAYAZI', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (295, N'NARMAN', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (296, N'OLUR', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (297, N'PASİNLER', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (298, N'ŞENKAYA', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (299, N'TEKMAN', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (300, N'TORTUM', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (301, N'KARAÇOBAN', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (302, N'UZUNDERE', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (303, N'PAZARYOLU', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (304, N'ILICA', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (305, N'KÖPRÜKÖY', 25)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (306, N'ÇAYIRLI', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (307, N'ERZİNCAN MERKEZ', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (308, N'İLİÇ', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (309, N'KEMAH', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (310, N'KEMALİYE', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (311, N'REFAHİYE', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (312, N'TERCAN', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (313, N'OTLUKBELİ', 24)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (314, N'ESKİŞEHİR MERKEZ', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (315, N'ÇİFTELER', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (316, N'MAHMUDİYE', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (317, N'MİHALIÇLIK', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (318, N'SARICAKAYA', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (319, N'SEYİTGAZİ', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (320, N'SİVRİHİSAR', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (321, N'ALPU', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (322, N'BEYLİKOVA', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (323, N'İNÖNÜ', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (324, N'GÜNYÜZÜ', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (325, N'HAN', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (326, N'MİHALGAZİ', 26)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (327, N'ARABAN', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (328, N'İSLAHİYE', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (329, N'NİZİP', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (330, N'OĞUZELİ', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (331, N'YAVUZELİ', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (332, N'ŞAHİNBEY', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (333, N'ŞEHİT KAMİL', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (334, N'KARKAMIŞ', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (335, N'NURDAĞI', 27)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (336, N'GÜMÜŞHANE MERKEZ', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (337, N'KELKİT', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (338, N'ŞİRAN', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (339, N'TORUL', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (340, N'KÖSE', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (341, N'KÜRTÜN', 29)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (342, N'ALUCRA', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (343, N'BULANCAK', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (344, N'DERELİ', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (345, N'ESPİYE', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (346, N'EYNESİL', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (347, N'GİRESUN MERKEZ', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (348, N'GÖRELE', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (349, N'KEŞAP', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (350, N'ŞEBİNKARAHİSAR', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (351, N'TİREBOLU', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (352, N'PİPAZİZ', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (353, N'YAĞLIDERE', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (354, N'ÇAMOLUK', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (355, N'ÇANAKÇI', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (356, N'DOĞANKENT', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (357, N'GÜCE', 28)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (358, N'HAKKARİ MERKEZ', 30)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (359, N'ÇUKURCA', 30)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (360, N'ŞEMDİNLİ', 30)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (361, N'YÜKSEKOVA', 30)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (362, N'ALTINÖZÜ', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (363, N'DÖRTYOL', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (364, N'HATAY MERKEZ', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (365, N'HASSA', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (366, N'İSKENDERUN', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (367, N'KIRIKHAN', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (368, N'REYHANLI', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (369, N'SAMANDAĞ', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (370, N'YAYLADAĞ', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (371, N'ERZİN', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (372, N'BELEN', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (373, N'KUMLU', 31)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (374, N'ISPARTA MERKEZ', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (375, N'ATABEY', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (376, N'KEÇİBORLU', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (377, N'EĞİRDİR', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (378, N'GELENDOST', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (379, N'SİNİRKENT', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (380, N'ULUBORLU', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (381, N'YALVAÇ', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (382, N'AKSU', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (383, N'GÖNEN', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (384, N'YENİŞAR BADEMLİ', 32)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (385, N'IĞDIR MERKEZ', 76)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (386, N'ARALIK', 76)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (387, N'TUZLUCA', 76)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (388, N'KARAKOYUNLU', 76)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (389, N'AFŞİN', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (390, N'ANDIRIN', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (391, N'ELBİSTAN', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (392, N'GÖKSUN', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (393, N'KAHRAMANMARAŞ MERKEZ', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (394, N'PAZARCIK', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (395, N'TÜRKOĞLU', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (396, N'ÇAĞLAYANCERİT', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (397, N'EKİNÖZÜ', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (398, N'NURHAK', 46)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (399, N'EFLANİ', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (400, N'ESKİPAZAR', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (401, N'KARABÜK MERKEZ', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (402, N'OVACIK', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (403, N'SAFRANBOLU', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (404, N'YENİCE', 78)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (405, N'ERMENEK', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (406, N'KARAMAN MERKEZ', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (407, N'AYRANCI', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (408, N'KAZIMKARABEKİR', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (409, N'BAŞYAYLA', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (410, N'SARIVELİLER', 70)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (411, N'KARS MERKEZ', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (412, N'ARPAÇAY', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (413, N'DİGOR', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (414, N'KAĞIZMAN', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (415, N'SARIKAMIŞ', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (416, N'SELİM', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (417, N'SUSUZ', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (418, N'AKYAKA', 36)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (419, N'ABANA', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (420, N'KASTAMONU MERKEZ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (421, N'ARAÇ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (422, N'AZDAVAY', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (423, N'BOZKURT', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (424, N'CİDE', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (425, N'ÇATALZEYTİN', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (426, N'DADAY', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (427, N'DEVREKANİ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (428, N'İNEBOLU', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (429, N'KÜRE', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (430, N'TAŞKÖPRÜ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (431, N'TOSYA', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (432, N'İHSANGAZİ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (433, N'PINARBAŞI', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (434, N'ŞENPAZAR', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (435, N'AĞLI', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (436, N'DOĞANYURT', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (437, N'HANÖNÜ', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (438, N'SEYDİLER', 37)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (439, N'BÜNYAN', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (440, N'DEVELİ', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (441, N'FELAHİYE', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (442, N'İNCESU', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (443, N'PINARBAŞI', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (444, N'SARIOĞLAN', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (445, N'SARIZ', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (446, N'TOMARZA', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (447, N'YAHYALI', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (448, N'YEŞİLHİSAR', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (449, N'AKKIŞLA', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (450, N'TALAS', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (451, N'KOCASİNAN', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (452, N'MELİKGAZİ', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (453, N'HACILAR', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (454, N'ÖZVATAN', 38)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (455, N'DERİCE', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (456, N'KESKİN', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (457, N'KIRIKKALE MERKEZ', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (458, N'SALAK YURT', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (459, N'BAHŞİLİ', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (460, N'BALIŞEYH', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (461, N'ÇELEBİ', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (462, N'KARAKEÇİLİ', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (463, N'YAHŞİHAN', 71)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (464, N'KIRKKLARELİ MERKEZ', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (465, N'BABAESKİ', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (466, N'DEMİRKÖY', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (467, N'KOFÇAY', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (468, N'LÜLEBURGAZ', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (469, N'VİZE', 39)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (470, N'KIRŞEHİR MERKEZ', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (471, N'ÇİÇEKDAĞI', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (472, N'KAMAN', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (473, N'MUCUR', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (474, N'AKPINAR', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (475, N'AKÇAKENT', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (476, N'BOZTEPE', 40)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (477, N'KOCAELİ MERKEZ', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (478, N'GEBZE', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (479, N'GÖLCÜK', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (480, N'KANDIRA', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (481, N'KARAMÜRSEL', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (482, N'KÖRFEZ', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (483, N'DERİNCE', 41)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (484, N'KONYA MERKEZ', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (485, N'AKŞEHİR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (486, N'BEYŞEHİR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (487, N'BOZKIR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (488, N'CİHANBEYLİ', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (489, N'ÇUMRA', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (490, N'DOĞANHİSAR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (491, N'EREĞLİ', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (492, N'HADİM', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (493, N'ILGIN', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (494, N'KADINHANI', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (495, N'KARAPINAR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (496, N'KULU', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (497, N'SARAYÖNÜ', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (498, N'SEYDİŞEHİR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (499, N'YUNAK', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (500, N'AKÖREN', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (501, N'ALTINEKİN', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (502, N'DEREBUCAK', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (503, N'HÜYÜK', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (504, N'KARATAY', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (505, N'MERAM', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (506, N'SELÇUKLU', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (507, N'TAŞKENT', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (508, N'AHIRLI', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (509, N'ÇELTİK', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (510, N'DERBENT', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (511, N'EMİRGAZİ', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (512, N'GÜNEYSINIR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (513, N'HALKAPINAR', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (514, N'TUZLUKÇU', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (515, N'YALIHÜYÜK', 42)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (516, N'KÜTAHYA  MERKEZ', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (517, N'ALTINTAŞ', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (518, N'DOMANİÇ', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (519, N'EMET', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (520, N'GEDİZ', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (521, N'SİMAV', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (522, N'TAVŞANLI', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (523, N'ASLANAPA', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (524, N'DUMLUPINAR', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (525, N'HİSARCIK', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (526, N'ŞAPHANE', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (527, N'ÇAVDARHİSAR', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (528, N'PAZARLAR', 43)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (529, N'KİLİS MERKEZ', 79)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (530, N'ELBEYLİ', 79)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (531, N'MUSABEYLİ', 79)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (532, N'POLATELİ', 79)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (533, N'MALATYA MERKEZ', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (534, N'AKÇADAĞ', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (535, N'ARAPGİR', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (536, N'ARGUVAN', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (537, N'DARENDE', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (538, N'DOĞANŞEHİR', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (539, N'HEKİMHAN', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (540, N'PÜTÜRGE', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (541, N'YEŞİLYURT', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (542, N'BATTALGAZİ', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (543, N'DOĞANYOL', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (544, N'KALE', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (545, N'KULUNCAK', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (546, N'YAZIHAN', 44)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (547, N'AKHİSAR', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (548, N'ALAŞEHİR', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (549, N'DEMİRCİ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (550, N'GÖRDES', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (551, N'KIRKAĞAÇ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (552, N'KULA', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (553, N'MANİSA MERKEZ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (554, N'SALİHLİ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (555, N'SARIGÖL', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (556, N'SARUHANLI', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (557, N'SELENDİ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (558, N'SOMA', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (559, N'TURGUTLU', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (560, N'AHMETLİ', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (561, N'GÖLMARMARA', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (562, N'KÖPRÜBAŞI', 45)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (563, N'DERİK', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (564, N'KIZILTEPE', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (565, N'MARDİN MERKEZ', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (566, N'MAZIDAĞI', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (567, N'MİDYAT', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (568, N'NUSAYBİN', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (569, N'ÖMERLİ', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (570, N'SAVUR', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (571, N'YEŞİLLİ', 47)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (572, N'MERSİN MERKEZ', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (573, N'ANAMUR', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (574, N'ERDEMLİ', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (575, N'GÜLNAR', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (576, N'MUT', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (577, N'SİLİFKE', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (578, N'TARSUS', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (579, N'AYDINCIK', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (580, N'BOZYAZI', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (581, N'ÇAMLIYAYLA', 33)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (582, N'BODRUM', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (583, N'DATÇA', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (584, N'FETHİYE', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (585, N'KÖYCEĞİZ', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (586, N'MARMARİS', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (587, N'MİLAS', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (588, N'MUĞLA MERKEZ', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (589, N'ULA', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (590, N'YATAĞAN', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (591, N'DALAMAN', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (592, N'KAVAKLI DERE', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (593, N'ORTACA', 48)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (594, N'BULANIK', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (595, N'MALAZGİRT', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (596, N'MUŞ MERKEZ', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (597, N'VARTO', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (598, N'HASKÖY', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (599, N'KORKUT', 49)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (600, N'NEVŞEHİR MERKEZ', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (601, N'AVANOS', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (602, N'DERİNKUYU', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (603, N'GÜLŞEHİR', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (604, N'HACIBEKTAŞ', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (605, N'KOZAKLI', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (606, N'ÜRGÜP', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (607, N'ACIGÖL', 50)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (608, N'NİĞDE MERKEZ', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (609, N'BOR', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (610, N'ÇAMARDI', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (611, N'ULUKIŞLA', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (612, N'ALTUNHİSAR', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (613, N'ÇİFTLİK', 51)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (614, N'AKKUŞ', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (615, N'AYBASTI', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (616, N'FATSA', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (617, N'GÖLKÖY', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (618, N'KORGAN', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (619, N'KUMRU', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (620, N'MESUDİYE', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (621, N'ORDU MERKEZ', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (622, N'PERŞEMBE', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (623, N'ULUBEY', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (624, N'ÜNYE', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (625, N'GÜLYALI', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (626, N'GÜRGENTEPE', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (627, N'ÇAMAŞ', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (628, N'ÇATALPINAR', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (629, N'ÇAYBAŞI', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (630, N'İKİZCE', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (631, N'KABADÜZ', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (632, N'KABATAŞ', 52)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (633, N'BAHÇE', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (634, N'KADİRLİ', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (635, N'OSMANİYE MERKEZ', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (636, N'DÜZİÇİ', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (637, N'HASANBEYLİ', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (638, N'SUMBAŞ', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (639, N'TOPRAKKALE', 80)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (640, N'RİZE MERKEZ', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (641, N'ARDEŞEN', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (642, N'ÇAMLIHEMŞİN', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (643, N'ÇAYELİ', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (644, N'FINDIKLI', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (645, N'İKİZDERE', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (646, N'KALKANDERE', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (647, N'PAZAR', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (648, N'GÜNEYSU', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (649, N'DEREPAZARI', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (650, N'HEMŞİN', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (651, N'İYİDERE', 53)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (652, N'AKYAZI', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (653, N'GEYVE', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (654, N'HENDEK', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (655, N'KARASU', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (656, N'KAYNARCA', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (657, N'SAKARYA MERKEZ', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (658, N'PAMUKOVA', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (659, N'TARAKLI', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (660, N'FERİZLİ', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (661, N'KARAPÜRÇEK', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (662, N'SÖĞÜTLÜ', 54)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (663, N'ALAÇAM', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (664, N'BAFRA', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (665, N'ÇARŞAMBA', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (666, N'HAVZA', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (667, N'KAVAK', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (668, N'LADİK', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (669, N'SAMSUN MERKEZ', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (670, N'TERME', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (671, N'VEZİRKÖPRÜ', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (672, N'ASARCIK', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (673, N'ONDOKUZMAYIS', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (674, N'SALIPAZARI', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (675, N'TEKKEKÖY', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (676, N'AYVACIK', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (677, N'YAKAKENT', 55)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (678, N'AYANCIK', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (679, N'BOYABAT', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (680, N'SİNOP MERKEZ', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (681, N'DURAĞAN', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (682, N'ERGELEK', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (683, N'GERZE', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (684, N'TÜRKELİ', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (685, N'DİKMEN', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (686, N'SARAYDÜZÜ', 57)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (687, N'DİVRİĞİ', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (688, N'GEMEREK', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (689, N'GÜRÜN', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (690, N'HAFİK', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (691, N'İMRANLI', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (692, N'KANGAL', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (693, N'KOYUL HİSAR', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (694, N'SİVAS MERKEZ', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (695, N'SU ŞEHRİ', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (696, N'ŞARKIŞLA', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (697, N'YILDIZELİ', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (698, N'ZARA', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (699, N'AKINCILAR', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (700, N'ALTINYAYLA', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (701, N'DOĞANŞAR', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (702, N'GÜLOVA', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (703, N'ULAŞ', 58)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (704, N'BAYKAN', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (705, N'ERUH', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (706, N'KURTALAN', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (707, N'PERVARİ', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (708, N'SİİRT MERKEZ', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (709, N'ŞİRVARİ', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (710, N'AYDINLAR', 56)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (711, N'TEKİRDAĞ MERKEZ', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (712, N'ÇERKEZKÖY', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (713, N'ÇORLU', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (714, N'HAYRABOLU', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (715, N'MALKARA', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (716, N'MURATLI', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (717, N'SARAY', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (718, N'ŞARKÖY', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (719, N'MARAMARAEREĞLİSİ', 59)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (720, N'ALMUS', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (721, N'ARTOVA', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (722, N'TOKAT MERKEZ', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (723, N'ERBAA', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (724, N'NİKSAR', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (725, N'REŞADİYE', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (726, N'TURHAL', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (727, N'ZİLE', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (728, N'PAZAR', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (729, N'YEŞİLYURT', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (730, N'BAŞÇİFTLİK', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (731, N'SULUSARAY', 60)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (732, N'TRABZON MERKEZ', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (733, N'AKÇAABAT', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (734, N'ARAKLI', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (735, N'ARŞİN', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (736, N'ÇAYKARA', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (737, N'MAÇKA', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (738, N'OF', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (739, N'SÜRMENE', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (740, N'TONYA', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (741, N'VAKFIKEBİR', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (742, N'YOMRA', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (743, N'BEŞİKDÜZÜ', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (744, N'ŞALPAZARI', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (745, N'ÇARŞIBAŞI', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (746, N'DERNEKPAZARI', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (747, N'DÜZKÖY', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (748, N'HAYRAT', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (749, N'KÖPRÜBAŞI', 61)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (750, N'TUNCELİ MERKEZ', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (751, N'ÇEMİŞGEZEK', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (752, N'HOZAT', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (753, N'MAZGİRT', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (754, N'NAZİMİYE', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (755, N'OVACIK', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (756, N'PERTEK', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (757, N'PÜLÜMÜR', 62)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (758, N'BANAZ', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (759, N'EŞME', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (760, N'KARAHALLI', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (761, N'SİVASLI', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (762, N'ULUBEY', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (763, N'UŞAK MERKEZ', 64)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (764, N'BAŞKALE', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (765, N'VAN MERKEZ', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (766, N'EDREMİT', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (767, N'ÇATAK', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (768, N'ERCİŞ', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (769, N'GEVAŞ', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (770, N'GÜRPINAR', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (771, N'MURADİYE', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (772, N'ÖZALP', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (773, N'BAHÇESARAY', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (774, N'ÇALDIRAN', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (775, N'SARAY', 65)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (776, N'YALOVA MERKEZ', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (777, N'ALTINOVA', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (778, N'ARMUTLU', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (779, N'ÇINARCIK', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (780, N'ÇİFTLİKKÖY', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (781, N'TERMAL', 77)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (782, N'AKDAĞMADENİ', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (783, N'BOĞAZLIYAN', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (784, N'YOZGAT MERKEZ', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (785, N'ÇAYIRALAN', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (786, N'ÇEKEREK', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (787, N'SARIKAYA', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (788, N'SORGUN', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (789, N'ŞEFAATLI', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (790, N'YERKÖY', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (791, N'KADIŞEHRİ', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (792, N'SARAYKENT', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (793, N'YENİFAKILI', 66)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (794, N'ÇAYCUMA', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (795, N'DEVREK', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (796, N'ZONGULDAK MERKEZ', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (797, N'EREĞLİ', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (798, N'ALAPLI', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (799, N'GÖKÇEBEY', 67)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (800, N'ÇANAKKALE MERKEZ', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (801, N'AYVACIK', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (802, N'BAYRAMİÇ', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (803, N'BİGA', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (804, N'BOZCAADA', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (805, N'ÇAN', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (806, N'ECEABAT', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (807, N'EZİNE', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (808, N'LAPSEKİ', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (809, N'YENİCE', 17)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (810, N'ÇANKIRI MERKEZ', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (811, N'ÇERKEŞ', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (812, N'ELDİVAN', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (813, N'ILGAZ', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (814, N'KURŞUNLU', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (815, N'ORTA', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (816, N'ŞABANÖZÜ', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (817, N'YAPRAKLI', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (818, N'ATKARACALAR', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (819, N'KIZILIRMAK', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (820, N'BAYRAMÖREN', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (821, N'KORGUN', 18)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (822, N'ALACA', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (823, N'BAYAT', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (824, N'ÇORUM MERKEZ', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (825, N'İKSİPLİ', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (826, N'KARGI', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (827, N'MECİTÖZÜ', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (828, N'ORTAKÖY', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (829, N'OSMANCIK', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (830, N'SUNGURLU', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (831, N'DODURGA', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (832, N'LAÇİN', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (833, N'OĞUZLAR', 19)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (834, N'ADALAR', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (835, N'BAKIRKÖY', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (836, N'BEŞİKTAŞ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (837, N'BEYKOZ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (838, N'BEYOĞLU', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (839, N'ÇATALCA', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (840, N'EMİNÖNÜ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (841, N'EYÜP', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (842, N'FATİH', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (843, N'GAZİOSMANPAŞA', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (844, N'KADIKÖY', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (845, N'KARTAL', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (846, N'SARIYER', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (847, N'SİLİVRİ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (848, N'ŞİLE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (849, N'ŞİŞLİ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (850, N'ÜSKÜDAR', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (851, N'ZEYTİNBURNU', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (852, N'BÜYÜKÇEKMECE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (853, N'KAĞITHANE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (854, N'KÜÇÜKÇEKMECE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (855, N'PENDİK', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (856, N'ÜMRANİYE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (857, N'BAYRAMPAŞA', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (858, N'AVCILAR', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (859, N'BAĞCILAR', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (860, N'BAHÇELİEVLER', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (861, N'GÜNGÖREN', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (862, N'MALTEPE', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (863, N'SULTANBEYLİ', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (864, N'TUZLA', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (865, N'ESENLER', 34)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (866, N'ALİAĞA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (867, N'BAYINDIR', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (868, N'BERGAMA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (869, N'BORNOVA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (870, N'ÇEŞME', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (871, N'DİKİLİ', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (872, N'FOÇA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (873, N'KARABURUN', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (874, N'KARŞIYAKA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (875, N'KEMALPAŞA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (876, N'KINIK', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (877, N'KİRAZ', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (878, N'MENEMEN', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (879, N'ÖDEMİŞ', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (880, N'SEFERİHİSAR', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (881, N'SELÇUK', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (882, N'TİRE', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (883, N'TORBALI', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (884, N'URLA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (885, N'BEYDAĞ', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (886, N'BUCA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (887, N'KONAK', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (888, N'MENDERES', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (889, N'BALÇOVA', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (890, N'ÇİGLİ', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (891, N'GAZİEMİR', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (892, N'NARLIDERE', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (893, N'GÜZELBAHÇE', 35)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (894, N'ŞANLIURFA MERKEZ', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (895, N'AKÇAKALE', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (896, N'BİRECİK', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (897, N'BOZOVA', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (898, N'CEYLANPINAR', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (899, N'HALFETİ', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (900, N'HİLVAN', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (901, N'SİVEREK', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (902, N'SURUÇ', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (903, N'VİRANŞEHİR', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (904, N'HARRAN', 63)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (905, N'BEYTÜŞŞEBAP', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (906, N'ŞIRNAK MERKEZ', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (907, N'CİZRE', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (908, N'İDİL', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (909, N'SİLOPİ', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (910, N'ULUDERE', 73)
GO
INSERT [dbo].[ilceler] ([ilceId], [ilce], [sehirId]) VALUES (911, N'GÜÇLÜKONAK', 73)
GO
SET IDENTITY_INSERT [dbo].[ilceler] OFF
GO
SET IDENTITY_INSERT [dbo].[iller] ON 
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (1, N'ADANA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (2, N'ADIYAMAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (3, N'AFYON')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (4, N'AĞRI')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (5, N'AMASYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (6, N'ANKARA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (7, N'ANTALYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (8, N'ARTVİN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (9, N'AYDIN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (10, N'BALIKESİR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (11, N'BİLECİK')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (12, N'BİNGÖL')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (13, N'BİTLİS')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (14, N'BOLU')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (15, N'BURDUR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (16, N'BURSA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (17, N'ÇANAKKALE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (18, N'ÇANKIRI')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (19, N'ÇORUM')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (20, N'DENİZLİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (21, N'DİYARBAKIR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (22, N'EDİRNE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (23, N'ELAZIĞ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (24, N'ERZİNCAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (25, N'ERZURUM')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (26, N'ESKİŞEHİR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (27, N'GAZİANTEP')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (28, N'GİRESUN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (29, N'GÜMÜŞHANE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (30, N'HAKKARİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (31, N'HATAY')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (32, N'ISPARTA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (33, N'İÇEL')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (34, N'İSTANBUL')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (35, N'İZMİR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (36, N'KARS')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (37, N'KASTAMONU')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (38, N'KAYSERİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (39, N'KIRKLARELİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (40, N'KIRŞEHİR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (41, N'KOCAELİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (42, N'KONYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (43, N'KÜTAHYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (44, N'MALATYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (45, N'MANİSA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (46, N'KAHRAMANMARAŞ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (47, N'MARDİN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (48, N'MUĞLA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (49, N'MUŞ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (50, N'NEVŞEHİR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (51, N'NİĞDE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (52, N'ORDU')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (53, N'RİZE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (54, N'SAKARYA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (55, N'SAMSUN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (56, N'SİİRT')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (57, N'SİNOP')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (58, N'SİVAS')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (59, N'TEKİRDAĞ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (60, N'TOKAT')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (61, N'TRABZON')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (62, N'TUNCELİ')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (63, N'ŞANLIURFA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (64, N'UŞAK')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (65, N'VAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (66, N'YOZGAT')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (67, N'ZONGULDAK')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (68, N'AKSARAY')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (69, N'BAYBURT')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (70, N'KARAMAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (71, N'KIRIKKALE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (72, N'BATMAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (73, N'ŞIRNAK')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (74, N'BARTIN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (75, N'ARDAHAN')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (76, N'IĞDIR')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (77, N'YALOVA')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (78, N'KARABÜK')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (79, N'KİLİS')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (80, N'OSMANİYE')
GO
INSERT [dbo].[iller] ([ilId], [sehir]) VALUES (81, N'DÜZCE')
GO
SET IDENTITY_INSERT [dbo].[iller] OFF
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (1, N'Isıtma Yok')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (2, N'Doğalgaz')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (3, N'Güneş Enerjili')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (4, N'Jeotermal')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (5, N'Merkezi Doğalgaz')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (6, N'Sobalı')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (7, N'Kombi Doğalgaz')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (8, N'Kombi Katı Yakıt')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (9, N'Yerden Isıtma')
GO
INSERT [dbo].[isitmaTuru] ([isitmaTuruId], [isitmaTuruAdi]) VALUES (10, N'Merkezi Kömür')
GO
SET IDENTITY_INSERT [dbo].[Konut] ON 
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (3, 2, 1, 123, CAST(152000 AS Decimal(18, 0)), CAST(1000 AS Decimal(18, 0)), 81, 248, N'Saçmalıpınar köyü Kurtdüzü mah.', 15, 6, 2, 2, 1, 11, CAST(N'2016-12-22T18:01:14.980' AS DateTime), 1, N'Düzcede kiralık daire', 1, N'Yeşilik güzeldir :)', N'59aaf763-d9b9-44d4-9d9d-53bbb17808f3.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (4, 1, 1, 163, CAST(456000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 34, 837, N'Sağa sola dön', 0, 2, 3, 1, 6, 10, CAST(N'2016-12-25T00:30:27.810' AS DateTime), 1, N'Beykoz''da satılık kooperatif', 0, N'Çok kullanışlı güzel yani', N'c5598481-4e91-4298-972e-743d4eae6281.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (5, 1, 1, 180, CAST(780000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 6, 68, N'Bilmem ne', 28, 7, 5, 4, 14, 11, CAST(N'2016-12-25T01:14:55.320' AS DateTime), 0, N'Ankaranın gözde mekanında rahat bir hayat', 1, N'Güzel işte', N'3fbd25b1-1a7a-4e3d-86d7-fc1b32be8602.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (6, 1, 1, 145, CAST(350000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 35, 869, N'Bilmem ne sokak', 32, 3, 2, 5, 15, 7, CAST(N'2016-12-27T19:32:28.470' AS DateTime), 1, N'İzmir bornovada satılık yazlık', 0, N'Güzel bişey bu', N'a2272338-ffe8-4f19-a542-b8403c374e16.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (7, 3, 1, 50, CAST(120 AS Decimal(18, 0)), CAST(50 AS Decimal(18, 0)), 54, 654, N'Gürgülek mah', 19, 1, 3, 4, 1, 4, CAST(N'2017-01-04T15:59:54.690' AS DateTime), 0, N'Sakaryada günlük kira daire', 0, N'Resme aldanma güzeldir kendileri', N'b5e9bc77-c45c-4010-88b5-cf5e5c5d7dd1.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (8, 1, 2, 240, CAST(742000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 16, 190, N'Keramet sokak', 27, 8, 7, 8, 7, 8, CAST(N'2017-01-05T12:35:32.370' AS DateTime), 0, N'Bursada satılık köşk', 0, N'Gayet uygun fazla mırlama', N'yl3cb9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (9, 2, 1, 101, CAST(500 AS Decimal(18, 0)), CAST(501 AS Decimal(18, 0)), 32, 374, N'hebele hubala', 5, 9, 2, 5, 4, 6, CAST(N'2017-01-05T22:47:56.403' AS DateTime), 1, N'Ispartada kiralık devremülk', 0, N'hebele hubele', N'f60a9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (10, 1, 1, 60, CAST(20000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 18, 811, N'Dolandırıcı mah. Üçkağıtçılar sok.', 0, 6, 1, 5, 10, 4, CAST(N'2017-01-07T08:30:14.567' AS DateTime), 0, N'Çankırı Çerkeş''te 2+1 satılık prefabrik', 0, N'Hemen kap şunu', N'b17a36bd-c868-4825-82b1-320fa58b3c95.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (11, 1, 1, 140, CAST(80000 AS Decimal(18, 0)), CAST(0 AS Decimal(18, 0)), 13, 220, N'Ardıc mah', 9, 5, 3, 2, 6, 7, CAST(N'2017-01-19T13:03:21.817' AS DateTime), 1, N'Bitliste satılık kooperatif', 0, N'Uygun fiyat pazarlık olur', N'gs3b9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Konut] ([KonutId], [kategori], [sahipId], [metrekare], [fiyat], [depozito], [il], [ilce], [adres], [yasi], [isitmaTuru], [katSayisi], [bulunduguKat], [konutTuru], [odaSayisi], [ilanTarihi], [aktif], [baslik], [esyaDurumu], [aciklama], [kucukResim]) VALUES (12, 2, 2, 110, CAST(480 AS Decimal(18, 0)), CAST(500 AS Decimal(18, 0)), 28, 348, N'Selamlar mah. no:74', 12, 8, 5, 10, 1, 7, CAST(N'2017-04-17T16:44:05.640' AS DateTime), 1, N'Giresun Görele''de kiralık daire', 0, N'Deniz manzaralı hoş bir yapıt', N'19238995-77c5-42cd-9794-e49358888850.jpg')
GO
SET IDENTITY_INSERT [dbo].[Konut] OFF
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (1, N'Daire')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (2, N'Bina')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (3, N'Çiftlik Evi')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (4, N'Devremülk')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (5, N'Dağ Evi')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (6, N'Kooperatif')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (7, N'Köşk')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (8, N'Köy Evi')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (9, N'Müstakil')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (10, N'Prefabrik')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (11, N'Residence')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (12, N'Villa')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (13, N'Yalı')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (14, N'Yalı Dairesi')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (15, N'Yazlık')
GO
INSERT [dbo].[KonutTuru] ([konutTuruId], [konutTuruAdi]) VALUES (16, N'yeniKonutTuru')
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 
GO
INSERT [dbo].[Kullanici] ([KullaniciId], [AdSoyad], [Sifre], [Il], [Ilce], [Adres], [Email], [Telefon], [KayitTarihi]) VALUES (1, N'Serkan Parlak (user)', N'1234', 81, 248, N'Sacmalıpınar Köyü', N'sU@gmail.com', N'05345002156', CAST(N'1994-08-21T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Kullanici] ([KullaniciId], [AdSoyad], [Sifre], [Il], [Ilce], [Adres], [Email], [Telefon], [KayitTarihi]) VALUES (2, N'Suayip Güler', N'12345', 50, 607, N'Aydınlar mah.', N'suayip@gmail.com', N'05345215693', CAST(N'2016-11-19T09:01:52.837' AS DateTime))
GO
INSERT [dbo].[Kullanici] ([KullaniciId], [AdSoyad], [Sifre], [Il], [Ilce], [Adres], [Email], [Telefon], [KayitTarihi]) VALUES (3, N'Oktay Parlak', N'1234', 38, 452, N'Komando tugayı', N'oktay@hotmail.com', N'05612563559', CAST(N'2016-11-19T09:03:46.277' AS DateTime))
GO
INSERT [dbo].[Kullanici] ([KullaniciId], [AdSoyad], [Sifre], [Il], [Ilce], [Adres], [Email], [Telefon], [KayitTarihi]) VALUES (7, N'Selman Özsoy', N'mrket', 26, 314, N'Aşağısöğütönü mah. 1533. sokak d5 apartmanı daire 6', N'selman@gmail.com', N'05423886058', CAST(N'2016-12-30T00:29:29.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Mesajlar] ON 
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (3, 2, 1, CAST(N'2017-06-19T00:00:00.000' AS DateTime), 0, N'Maddi hata vb. nedenlerle final/bütünleme sınavı sonucu ilgili birim Yönetim Kurulu Kararı ile değişen öğrencilerin başarı notunun değerlendirilmesinde dersin final sınavında uygulanan not aralıkları kullanılır. ', N'Oylesine')
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (6, 3, 1, CAST(N'2017-06-18T00:00:00.000' AS DateTime), 0, N'Yönetim Kurulu Kararı ile değişen öğrencilerin başarı notunun Yönetim Kurulu Kararı ile değişen öğrencilerin başarı notunun Yönetim Kurulu Kararı ile değişen öğrencilerin başarı notunun sYönetim Kurulu Kararı ile değişen öğrencilerin başarı notunun  ', N'Ne Haber')
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (9, 7, 1, CAST(N'2017-06-20T00:00:00.000' AS DateTime), 0, N'I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market I would like to meet you to discuss the latest news about the arrival of the new theme. They say it is going to be one the best themes on the market', N'Bugun den bi haber')
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (12, 1, 1, CAST(N'2017-06-15T00:00:00.000' AS DateTime), 1, N'Web sayfalarının yayınlanmasını ve web uygulamalarının çalışmasını sağlayan, istemcilerden HTTP ve FTP üzerinden gelen talepleri Microsoft Windows sunucu tabanlı işletim sistemlerinde karşılayan birimdir.', N'Aklıma Takıldı')
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (14, 1, 7, CAST(N'2017-06-19T17:26:01.957' AS DateTime), NULL, N'Selam kanka nasılsın :)', N'Aklım Karıştı')
GO
INSERT [dbo].[Mesajlar] ([id], [gönderenID], [aliciID], [tarih], [okundumu], [mesaj], [konu]) VALUES (15, 1, 3, CAST(N'2017-06-20T11:50:35.467' AS DateTime), NULL, N'istemcilerden HTTP ve FTP üzerinden gelen talepleri istemcilerden HTTP ve FTP üzerinden gelen talepleri istemcilerden HTTP ve FTP üzerinden gelen talepleri ', N'Hakkından geldim')
GO
SET IDENTITY_INSERT [dbo].[Mesajlar] OFF
GO
SET IDENTITY_INSERT [dbo].[odaSayisi] ON 
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (1, N'1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (2, N'1+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (3, N'2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (4, N'2+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (5, N'2+2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (6, N'3')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (7, N'3+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (8, N'3+2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (9, N'4')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (10, N'4+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (11, N'4+2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (12, N'4+3')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (14, N'5+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (15, N'5+2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (16, N'5+3')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (17, N'5+4')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (19, N'6+1')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (20, N'6+2')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (21, N'6+3')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (22, N'6+4')
GO
INSERT [dbo].[odaSayisi] ([odaSayisiId], [odaSayisiAdi]) VALUES (23, N'7+')
GO
SET IDENTITY_INSERT [dbo].[odaSayisi] OFF
GO
SET IDENTITY_INSERT [dbo].[Resim] ON 
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (3, 1, 3, N'59aaf763-d9b9-44d4-9d9d-53bbb17808f3.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (4, 1, 4, N'c5598481-4e91-4298-972e-743d4eae6281.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (11, 1, 5, N'3fbd25b1-1a7a-4e3d-86d7-fc1b32be8602.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (12, 1, 5, N'9cda53ac-a897-4868-b8eb-26720d48cc5f.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (27, 1, 6, N'a2272338-ffe8-4f19-a542-b8403c374e16.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (28, 1, 7, N'b5e9bc77-c45c-4010-88b5-cf5e5c5d7dd1.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (29, 2, 1, N'c3d407f3-a582-419a-a3a5-ac32af7bf86c.png')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (30, 2, 1, N'2e3f04f3-961f-4751-bba5-f109143c1e88.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (31, 2, 2, N'0a3a1c44-37ab-42f4-af17-6eb5e0a81274.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (32, 2, 2, N'0ae8d8e1-45e6-48ed-80ec-f59b30bb79cc.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (35, 3, 1, N'9a133012-389a-4fe9-a989-2824e23e789c.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (37, 3, 1, N'c519efcb-dd45-4396-a65f-f44f48510b02.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (38, 3, 2, N'c808a175-065a-4086-94e0-5649ed028d63.jpeg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (43, 1, 9, N'f60a9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (44, 3, 3, N'b0bf8312-2dc8-4c86-a81f-ef42774b3c93.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (46, 3, 4, N'05fb11ab-3846-40de-8b0a-17844d6e0259.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (47, 3, 4, N'8dbc9ec7-edb4-4322-8b6c-cc5e3c2f5b9a.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (48, 1, 10, N'b17a36bd-c868-4825-82b1-320fa58b3c95.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (50, 1, 11, N'gs3b9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (51, 1, 8, N'yl3cb9296-9f96-4445-a943-af653ea26c68.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (52, 3, 5, N'5295269f-9f28-498f-b9b0-f0301419ab1f.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (53, 3, 5, N'8a25e4c3-bb8c-4f18-9419-eea162899cab.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (54, 3, 5, N'2b644dc3-f3bd-4898-8421-dd06d200d993.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (55, 3, 5, N'8d197570-4916-4b27-800f-6b79161193a9.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (56, 1, 12, N'19238995-77c5-42cd-9794-e49358888850.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (57, 1, 12, N'134f8fb1-e9f5-45de-a2cd-402265e01f1a.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (58, 2, 3, N'f123e0db-4aaa-4149-bc69-f5facc4f6224.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (59, 2, 3, N'febdd4c5-55c9-454e-b3b7-b69434ed3481.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (60, 2, 3, N'54639f37-21de-4e5c-af9d-24aff588820c.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (61, 2, 3, N'77de7382-1d28-4a6b-90c8-2a640f95832c.jpg')
GO
INSERT [dbo].[Resim] ([ResimId], [IlanTuruId], [KayitId], [ResimAdresi]) VALUES (62, 2, 3, N'ebecf4a2-e593-40bd-84cc-29c26f3e9fd8.jpg')
GO
SET IDENTITY_INSERT [dbo].[Resim] OFF
GO
SET IDENTITY_INSERT [dbo].[Yonetici] ON 
GO
INSERT [dbo].[Yonetici] ([YoneticiID], [AdSoyad], [Sifre], [Email]) VALUES (1, N'Serkan Parlak', N'1234', N'sA@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Yonetici] OFF
GO
ALTER TABLE [dbo].[Konut] ADD  CONSTRAINT [DF_Kiralik_KiralikKayitTarihi]  DEFAULT (getdate()) FOR [ilanTarihi]
GO
ALTER TABLE [dbo].[Konut] ADD  CONSTRAINT [DF_Kiralik_KiralikAktif]  DEFAULT ((1)) FOR [aktif]
GO
ALTER TABLE [dbo].[Kullanici] ADD  CONSTRAINT [DF_MalSahibi_MalSahibiKayitTarihi]  DEFAULT (getdate()) FOR [KayitTarihi]
GO
ALTER TABLE [dbo].[Arsa]  WITH CHECK ADD  CONSTRAINT [FK_Arsa_ArsaTuru] FOREIGN KEY([arsaTuru])
REFERENCES [dbo].[ArsaTuru] ([arsaTuruId])
GO
ALTER TABLE [dbo].[Arsa] CHECK CONSTRAINT [FK_Arsa_ArsaTuru]
GO
ALTER TABLE [dbo].[Arsa]  WITH CHECK ADD  CONSTRAINT [FK_Arsa_ilceler] FOREIGN KEY([ilce])
REFERENCES [dbo].[ilceler] ([ilceId])
GO
ALTER TABLE [dbo].[Arsa] CHECK CONSTRAINT [FK_Arsa_ilceler]
GO
ALTER TABLE [dbo].[Arsa]  WITH CHECK ADD  CONSTRAINT [FK_Arsa_iller] FOREIGN KEY([il])
REFERENCES [dbo].[iller] ([ilId])
GO
ALTER TABLE [dbo].[Arsa] CHECK CONSTRAINT [FK_Arsa_iller]
GO
ALTER TABLE [dbo].[Arsa]  WITH CHECK ADD  CONSTRAINT [FK_Arsa_Kullanici] FOREIGN KEY([sahipId])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Arsa] CHECK CONSTRAINT [FK_Arsa_Kullanici]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_bulunduguKat] FOREIGN KEY([bulunduguKat])
REFERENCES [dbo].[bulunduguKat] ([bulunduguKatId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_bulunduguKat]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_IsyeriTuru] FOREIGN KEY([isitmaTuru])
REFERENCES [dbo].[IsyeriTuru] ([isyeriTuruId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_IsyeriTuru]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_ilceler] FOREIGN KEY([ilce])
REFERENCES [dbo].[ilceler] ([ilceId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_ilceler]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_iller] FOREIGN KEY([il])
REFERENCES [dbo].[iller] ([ilId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_iller]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_isitmaTuru] FOREIGN KEY([isitmaTuru])
REFERENCES [dbo].[isitmaTuru] ([isitmaTuruId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_isitmaTuru]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_Kullanici] FOREIGN KEY([sahipId])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_Kullanici]
GO
ALTER TABLE [dbo].[Isyeri]  WITH CHECK ADD  CONSTRAINT [FK_Isyeri_odaSayisi] FOREIGN KEY([odaSayisi])
REFERENCES [dbo].[odaSayisi] ([odaSayisiId])
GO
ALTER TABLE [dbo].[Isyeri] CHECK CONSTRAINT [FK_Isyeri_odaSayisi]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_bulunduguKat] FOREIGN KEY([bulunduguKat])
REFERENCES [dbo].[bulunduguKat] ([bulunduguKatId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_bulunduguKat]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_ilceler] FOREIGN KEY([ilce])
REFERENCES [dbo].[ilceler] ([ilceId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_ilceler]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_iller] FOREIGN KEY([il])
REFERENCES [dbo].[iller] ([ilId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_iller]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_isitmaTuru] FOREIGN KEY([isitmaTuru])
REFERENCES [dbo].[isitmaTuru] ([isitmaTuruId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_isitmaTuru]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_KonutTuru] FOREIGN KEY([konutTuru])
REFERENCES [dbo].[KonutTuru] ([konutTuruId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_KonutTuru]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_Kullanici] FOREIGN KEY([sahipId])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_Kullanici]
GO
ALTER TABLE [dbo].[Konut]  WITH CHECK ADD  CONSTRAINT [FK_Konut_odaSayisi] FOREIGN KEY([odaSayisi])
REFERENCES [dbo].[odaSayisi] ([odaSayisiId])
GO
ALTER TABLE [dbo].[Konut] CHECK CONSTRAINT [FK_Konut_odaSayisi]
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD  CONSTRAINT [FK_Mesajlar_KullaniciAlici] FOREIGN KEY([aliciID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Mesajlar] CHECK CONSTRAINT [FK_Mesajlar_KullaniciAlici]
GO
ALTER TABLE [dbo].[Mesajlar]  WITH CHECK ADD  CONSTRAINT [FK_Mesajlar_KullaniciGonderen] FOREIGN KEY([gönderenID])
REFERENCES [dbo].[Kullanici] ([KullaniciId])
GO
ALTER TABLE [dbo].[Mesajlar] CHECK CONSTRAINT [FK_Mesajlar_KullaniciGonderen]
GO
