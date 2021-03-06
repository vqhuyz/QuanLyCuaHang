USE [master]
GO
/****** Object:  Database [QuanLy]    Script Date: 7/16/2020 7:45:48 PM ******/
CREATE DATABASE [QuanLy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLy.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLy_log.ldf' , SIZE = 1792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLy] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLy].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLy] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLy] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLy] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLy] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLy] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLy] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLy] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLy] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLy] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLy] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLy] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLy] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLy] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLy] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLy] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLy] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLy] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLy] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLy] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLy] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLy] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLy] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLy] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLy] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLy] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLy] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLy] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLy] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLy] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLy] SET QUERY_STORE = OFF
GO
USE [QuanLy]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[MaChucNang] [varchar](50) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTDH]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDH](
	[MaDatHang] [bigint] NOT NULL,
	[MaSP] [bigint] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
 CONSTRAINT [PK_CTDH] PRIMARY KEY CLUSTERED 
(
	[MaDatHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTHD](
	[MaHD] [bigint] NOT NULL,
	[MaSP] [bigint] NOT NULL,
	[TenSP] [nvarchar](200) NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [money] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPG]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPG](
	[MaPhieuGiao] [bigint] NOT NULL,
	[MaSP] [bigint] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [money] NULL,
 CONSTRAINT [PK_CTPG] PRIMARY KEY CLUSTERED 
(
	[MaPhieuGiao] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTTH]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTTH](
	[MaTraHang] [bigint] NOT NULL,
	[MaSP] [bigint] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [nchar](10) NULL,
 CONSTRAINT [PK_CTTH] PRIMARY KEY CLUSTERED 
(
	[MaTraHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DatHang]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DatHang](
	[MaNV] [bigint] NULL,
	[MaNCC] [bigint] NULL,
	[NgayDat] [datetime] NOT NULL,
	[MaDatHang] [bigint] IDENTITY(1,1) NOT NULL,
	[TongTien] [money] NULL,
	[TrangThai] [nvarchar](10) NULL,
 CONSTRAINT [PK_DatHang] PRIMARY KEY CLUSTERED 
(
	[MaDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [bigint] IDENTITY(1,1) NOT NULL,
	[TongSL] [int] NULL,
	[TongTien] [money] NULL,
	[NgayBan] [datetime] NOT NULL,
	[MaNV] [bigint] NULL,
	[MaKH] [bigint] NULL,
	[VAT] [float] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SoCMND] [char](20) NULL,
	[SoDT] [int] NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[Email] [nvarchar](200) NULL,
	[Facebook] [nvarchar](200) NULL,
	[NgayDangKi] [datetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NULL,
	[MaNCC] [bigint] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [bigint] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
	[SoDT] [int] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[MaThue] [char](10) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [bigint] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NOT NULL,
	[SoCMND] [char](20) NULL,
	[SoDT] [int] NULL,
	[ChucVu] [nvarchar](50) NULL,
	[MucLuong] [money] NULL,
	[Email] [nvarchar](200) NULL,
	[DiaChi] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[NgayThamGia] [datetime] NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [nvarchar](max) NULL,
	[MaVaiTro] [varchar](20) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuGiao]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuGiao](
	[MaPhieuGiao] [bigint] IDENTITY(1,1) NOT NULL,
	[MaDatHang] [bigint] NULL,
	[NgayGiao] [datetime] NULL,
	[TongTien] [money] NULL,
	[TrangThai] [nvarchar](10) NULL,
 CONSTRAINT [PK_PhieuGiao] PRIMARY KEY CLUSTERED 
(
	[MaPhieuGiao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [bigint] IDENTITY(1,1) NOT NULL,
	[MaLoaiSP] [bigint] NULL,
	[TenSP] [nvarchar](200) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[ThuongHieu] [nvarchar](200) NULL,
	[GiaNhap] [money] NULL,
	[GiaBan] [money] NULL,
	[Mota] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[NgayThem] [datetime] NOT NULL,
	[NgayCapNhat] [datetime] NULL,
	[GiamGia] [float] NOT NULL,
	[GiaMoi] [money] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraHang]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraHang](
	[MaTraHang] [bigint] IDENTITY(1,1) NOT NULL,
	[NgayTra] [datetime] NULL,
	[MaHD] [bigint] NULL,
	[TongTien] [money] NULL,
	[TrangThai] [nvarchar](10) NULL,
 CONSTRAINT [PK_TraHang] PRIMARY KEY CLUSTERED 
(
	[MaTraHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVaiTro] [varchar](20) NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro_ChucNang]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro_ChucNang](
	[MaVaiTro] [varchar](20) NOT NULL,
	[MaChucNang] [varchar](50) NOT NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_VaiTro_ChucNang_1] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC,
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VAT]    Script Date: 7/16/2020 7:45:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VAT](
	[VAT] [float] NOT NULL,
 CONSTRAINT [PK_VAT] PRIMARY KEY CLUSTERED 
(
	[VAT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_NhaCungCap', N'Xem nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_NhanVien', N'Xem danh sách Nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_PhanLoai', N'Xem phân loại')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_SanPham', N'Xem danh sách sản phẩm')
GO
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (121, 65, N'Tráng miệng tuyệt hảo với Bánh Mousse Socola', 1, 17000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (121, 66, N'Temaki Onigiri Thịt Nguội Mayo thơm ngon chắc bụng', 1, 14000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (121, 68, N'Thực đơn lành mạnh với Salad gà karaage ngũ sắc ngon miệng, bắt mắt', 2, 20000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (121, 69, N'Sandwich thịt nguội phô mai salad', 1, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (122, 22, N'Xúc Xích Hong khói', 1, 13000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (122, 33, N'Cà phê sữa đá MINISTOP', 1, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 20, N'Bánh Bao Thịt Trứng Muối', 6, 16000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 23, N'Hotdog Xúc Xích Gà Nướng Sả', 1, 13000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 33, N'Cà phê sữa đá MINISTOP', 20, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 38, N'Temaki Onigiri Trứng Cá Mayo', 12, 14000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 48, N'Bánh trứng vàng vani', 1, 14000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (123, 69, N'Sandwich thịt nguội phô mai salad', 2, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (124, 30, N'Sushi California', 5, 26000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (124, 33, N'Cà phê sữa đá MINISTOP', 6, 12000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (124, 53, N'Cá viên (ODEN)', 3, 8000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (124, 67, N'Gà xiên BBQ - chuẩn vị gà - đậm đà khó cưỡng', 3, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (124, 69, N'Sandwich thịt nguội phô mai salad', 3, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (125, 24, N'Chè bắp', 8, 8000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (125, 48, N'Bánh trứng vàng vani', 4, 14000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (125, 65, N'Tráng miệng tuyệt hảo với Bánh Mousse Socola', 3, 17000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (125, 68, N'Thực đơn lành mạnh với Salad gà karaage ngũ sắc ngon miệng, bắt mắt', 2, 20000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (125, 69, N'Sandwich thịt nguội phô mai salad', 4, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (126, 69, N'Sandwich thịt nguội phô mai salad', 3, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (127, 22, N'Xúc Xích Hong khói', 5, 13000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (128, 68, N'Thực đơn lành mạnh với Salad gà karaage ngũ sắc ngon miệng, bắt mắt', 4, 20000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (129, 49, N'Sushi colorful', 1, 32000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (129, 73, N'Cà phê hòa tan', 1, 200000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (129, 76, N'Nước giải khát Spirt', 1, 10000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (131, 29, N'Sushi thịt nướng và thanh cua', 1, 25000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (131, 30, N'Sushi California', 2, 26000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (131, 56, N'Sandwich xúc xích & chà bông', 1, 21000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (131, 74, N'Bút bi Thiên Long', 1, 5000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (131, 75, N'CocaCola', 1, 10000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (132, 42, N'Ice bolt vị Phúc bồn tử 12oz', 2, 15000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (134, 35, N'Bánh giò ', 1, 11000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (134, 73, N'Cà phê hòa tan', 1, 200000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (134, 74, N'Bút bi Thiên Long', 1, 5000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (134, 75, N'CocaCola', 2, 10000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (135, 40, N'Khoai mì sữa dừa bùi bùi béo ngậy, ăn là mê ngay!', 1, 9000.0000)
INSERT [dbo].[CTHD] ([MaHD], [MaSP], [TenSP], [SoLuong], [GiaBan]) VALUES (135, 51, N'Xúc xích thương hiệu Nhật', 2, 1000.0000)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (121, 5, 96000.0000, CAST(N'2020-05-30T21:42:20.897' AS DateTime), 14, 20, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (122, 2, 25000.0000, CAST(N'2020-05-30T21:42:58.643' AS DateTime), 14, 23, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (123, 42, 581000.0000, CAST(N'2020-05-30T21:44:09.807' AS DateTime), 14, 25, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (124, 20, 376000.0000, CAST(N'2020-05-30T21:44:52.197' AS DateTime), 14, 22, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (125, 21, 311000.0000, CAST(N'2020-05-30T21:45:27.057' AS DateTime), 14, 20, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (126, 3, 75000.0000, CAST(N'2020-05-30T21:46:03.243' AS DateTime), 14, 20, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (127, 5, 65000.0000, CAST(N'2020-05-30T21:46:18.460' AS DateTime), 14, 22, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (128, 4, 80000.0000, CAST(N'2020-05-30T21:46:29.317' AS DateTime), 14, 25, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (129, 3, 242000.0000, CAST(N'2020-06-01T13:36:50.877' AS DateTime), 14, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (130, 1, 10000.0000, CAST(N'2020-06-01T00:00:00.000' AS DateTime), 14, 20, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (131, 6, 113000.0000, CAST(N'2020-06-02T21:54:11.120' AS DateTime), 13, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (132, 2, 30000.0000, CAST(N'2020-06-02T21:55:06.713' AS DateTime), 13, 20, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (134, 5, 236000.0000, CAST(N'2020-06-02T21:55:43.920' AS DateTime), 13, 22, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongSL], [TongTien], [NgayBan], [MaNV], [MaKH], [VAT]) VALUES (135, 3, 11000.0000, CAST(N'2020-06-04T23:01:43.317' AS DateTime), 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (20, N'Lê Đức Tâm', N'0921387472          ', 972668798, CAST(N'2005-06-22' AS Date), N'Củ Chi ', N'Nam', N'levantam24121998@gmail.com', NULL, CAST(N'2020-05-30T21:10:24.367' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (22, N'Vũ Quốc Huy', N'028473829           ', 97382918, CAST(N'2012-02-10' AS Date), N'Bình Thạnh ', N'Nam', N'vuquochuyz99@gmail.com', N'Quốc Huy', CAST(N'2020-05-30T21:24:28.190' AS DateTime), N'Khách hàng mới')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (23, N'Lê Tấn Tồn', N'0283928390          ', 982710982, CAST(N'1997-06-20' AS Date), N'Lê Quang Sung, F6, Phường 6, Quận 6', N'Nam', N'quangsung@gmail.com', N'QuangSung', CAST(N'2020-05-30T21:35:42.177' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (25, N'Nguyễn Thị Thanh Nga', N'0192837482          ', 982716278, CAST(N'1990-10-12' AS Date), N'Cao ốc Srecc Q.3 TP.HCM', N'Nữ', N'buidangtuyen1994@gmail.com', N'thanhnga', CAST(N'2020-05-30T21:41:07.350' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (26, N'Vũ Quốc Huân', NULL, 989169012, CAST(N'2008-02-28' AS Date), N'Dĩ An', N'Nam', N'closeface19@gmail.com', N'Huân Vũ Quốc', CAST(N'2020-06-01T22:20:56.557' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (27, N'Việt Phi', N'036099008134        ', 828365961, CAST(N'1999-12-10' AS Date), N'Quận 9', N'Nam', N'vuquochuyz99@gmail.com', N'Việt Phi', CAST(N'2020-06-02T21:53:22.397' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (28, N'Duy Thức', N'036099008130        ', 989269023, CAST(N'1999-03-17' AS Date), N'Bình Thạnh', N'Nam', N'vuquochuyz99@gmail.com', N'Duy Thức', CAST(N'2020-06-02T21:58:24.670' AS DateTime), NULL)
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (29, N'Mai Xuân Phú', N'036099001394        ', 828365964, CAST(N'2000-03-04' AS Date), N'Nam Định', N'Nam', N'vuquochuyz99@gmail.com', N'Chú Phú', CAST(N'2020-06-06T13:03:47.917' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10020, N'Tráng miệng', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10021, N'Thức ăn nhanh', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10022, N'Oden', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10023, N'Nước giải khát', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10024, N'SuShi', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10025, N'Onigiri', NULL)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai], [MaNCC]) VALUES (10026, N'Hàng tiêu dùng ', NULL)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (17, N' Công ty TNHH nước giải khát Kirin', 274355638, N'NA3, Mỹ Phước, Bến Cát, Bình Dương', N'Kirinvn@gmail.com', N'8821667919', N'Công ty Kirin có địa chỉ tại TP. HCM là công ty con của tập đoàn Kirin Japan, chuyên về lĩnh vực sản xuất nước giải khát. Đã có mặt trên 20 năm tại Việt Nam, công ty nổi tiếng với thương hiệu Wonderfarm, với 2nhà máy ở Đồng Nai và Bình Dương. Hiện tại, các dòng sản phẩm của Kirin, ice+, Latte và Wonderfarm, đã trở thành một nhãn hiệu quen thuộc với người tiêu dùng Việt')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (18, N'Công Ty Ajinomoto Việt Nam', 283930192, N'03-05 Le Thanh Ton St,Dist 1, Ho Chi Minh City ', N'AjinomotoVN@gmail.com', N'8821667821', N'ó mặt tại Việt Nam từ năm 1991, Ajinomoto Việt Nam là một nhánh của Ajinomoto Nhật Bản, chuyên về các mặt hàng như bột nêm gia vị, giấm, nước sốt mayonnaise, nước giải khát. Các thương hiệu nổi tiếng của Ajinomoto Việt Nam có thể kể đến như: bột ngọt Ajinomoto, nước sốt mayonnaise Ajinomoto, cà phê Birdy, bột nêm Knorr…
 ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (19, N'Công ty Kewpie Vietnam', 283920978, N'11 VSIP II-A, Đường số 14, Khu công nghiệp Việt Nam – Singapore II-A, Huyện Tân Uyên, Tỉnh Bình Dương, Việt Nam ', N'KewpieVN@gmail.com', N'8821667110', N'Kewpie Việt Nam là chi nhánh thứ 7 của Kewpie Nhật Bản trên thế giới, công ty chuyên về sản xuất nước sốt mayonnaise. Với bí quyết từ Nhật Bản, công ty cung cấp cho người tiêu dùng Việt các sản phẩm sốt Mayonnaise với hương vị, mẫu mã khác nhau.')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (20, N'Công ty Akuruhi', 283822087, N' 03-05 Le Thanh Ton St,Dist 1, Ho Chi Minh City ', N'AkuruhiVN@gmail.com', N'8821662830', N'Akuruhi là hệ thống siêu thị được thành lập năm 1998, chuyên cung cấp các loại đồ ăn Nhật Bản có sẵn như rượu, hải sản tươi sống, nước uống, rau và cả những loại đồ dùng hằng ngày như dầu gội, mỹ phẩm, phụ kiện nhà bếp. Cửa hàng Akuruhi đã mở rộng phạm vi hoạt động ra Hà Nội, Hải Phòng, Đà Nặng và thậm chí ở Cam pu chia.')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (21, N'Công ty Nissin foods Vietnam', 283930039, N'5th Floor, ITAXA House, 122-126 Nguyen Thi Minh Khai, District 3, HCMC, Vietnam ', N'NissinFoodVN@gmail.com', N'8821661238', N'Nissin foods Vietnam là một chi nhánh của tập đoàn Nissin Nhật Bản được đi vào hoạt động năm 2001. Với công nghệ Nhật Bảnm công ty chuyên sản xuất các loaị mì gói: mì bò tiêu xanh, mì rau răm… đều được phân phối trên các cửa hàng và hệ thống siêu thị ở Việt Nam.')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (22, N'Công ty Asuzac Foods', 283770145, N' Đường 10 KCX Tân Thuận, Quận 7, TP.Hồ Chí Minh.', N'AsuzacFoodVn@gmail.com', N'8822237919', N'Thành lập năm 1994, Asuzac foods Việt Nam là công ty có nguồn gốc Nhật Bản. Đây là công ty chuyên về thực phẩm sấy khô như rau củ, thịt, cháo
 ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (23, N'Công ty TANAKA vietnam', 283765600, N'Đường Số 6, Kcx Tân Thuận, Quận 7, Thành Phố Hồ Chí Minh ', N'TanakaVN@gmail.com', N'9921667919', N'Tanaka Việt Nam là một doanh nghiệp với vốn đầu tư hoàn toàn thuộc về phía Nhật Bản. Công ty chuyên về sản xuất các loại rượu như rượu sake, rượu cơm, chế biến nông sản và hải sản. Ngoài cung cấp cho thị trường Việt Nam, các sản phẩm của chúng tôi còn được xuất khẩu sang thị trường nước ngoài. ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (24, N'Công ty Shinshu NT', 251367878, N'Phường Trung Hòa, Huyện Trảng Bom, Tỉnh Đồng Nai, Trung Hoà, Trảng Bom, Đồng Nai', N'ShinshuNTVN@gmail.com', N'1181667821', N'Đặt cơ sở sản xuất tại Đồng Nai, Shinshu NT là công ty liên doanh giữa tập đoàn Toyota, Tsusho, nhà phân phối thực phẩm Nichirei Fresh và công ty Shinshu- Ham Nhật Bản. Shinshu NT chuyên đảm nhiệm quá trình sản xuất các loại jam bông, xúc xích, thịt xông khói. Shinshu NT cam kết mang giá trị dinh dưỡng cho người tiêu dùng Việt Nam. Hiện tại, Shinshu NT có mặt trong hệ thống siêu thị tại Việt Nam.')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (25, N'Công ty CP chế biến thực phẩm thủy sản Kaiyo', 272376915, N'Lô 21, đường số 5, khu công nghiệp Tân Đức, huyện Đức Hòa, tỉnh Long An', N'KaiyoVN@gmail.com', N'7221667821', N'Công ty thủy sản Kaiyo được thành lập năm 2009 là liên doanh giữa Việt Nam, Nhật Bản và Thái Lan. Thủy sản Kaiyo chuyên về sản xuất, chế biến và đóng gói hàng loạt các loại thủy sản đông lạnh ví dụ mực, tôm, cá tuyết và các loại thủy sản cao cấp khác')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (26, N'Công Ty Ministop Việt Nam', 283822858, N'Hong Bang International University', N'ministopvn@gmail.com', N'8821668291', N'Phân phối sản phẩm tiêu dùng ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (27, N'Công ty Quốc Huy', 828365961, N'310 trần hưng đạo', N'vuquochuyz99@gmail.com', N'HH0123z-  ', NULL)
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (13, N'Vũ Quốc Huy', N'VuQuocHuy.jpg', N'Nam', CAST(N'1999-03-17' AS Date), N'036099008132        ', 828365961, N'Quản Lý', 999999.0000, N'vuquochuyz99@gmail.com', N'Thủ Đức', NULL, CAST(N'2020-05-28T00:00:00.000' AS DateTime), N'admin', N'c4ca4238a0b923820dcc509a6f75849b', N'ADMIN')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (14, N'Lê Văn Tâm', N'anhnv1.jpg', N'Nam', CAST(N'2019-01-15' AS Date), N'1278938991          ', 976918917, N'Nhân viên', 5000000.0000, N'tamle.dev@gmail.com', N'Hóc Môn', NULL, CAST(N'2020-05-30T20:39:46.253' AS DateTime), N'tamle2412', N'aa711cd8dc60b5dace4a5fa7b4d54d56', N'ADMIN')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (15, N'Nguyễn Lê Anh Thư', N'anhnv2.jpg', N'Nữ', CAST(N'2001-01-15' AS Date), N'938201879           ', 972773889, N'Nhân Viên', 3500000.0000, N'anhthule@gmail.com', N'Bình Thạnh', NULL, CAST(N'2020-05-30T20:43:44.860' AS DateTime), N'anhthu0115', N'25f9e794323b453885f5181f1b624d0b', N'USER')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (16, N'Trần Tiến Luật', N'anhnv3.jpg', N'Nam', CAST(N'2000-06-06' AS Date), N'829403781           ', 972889472, N'Nhân Viên', 3500000.0000, N'tienluat@gmail.com', N'Bình Thạnh', NULL, CAST(N'2020-05-30T20:45:24.490' AS DateTime), N'tienluat0606', N'25f9e794323b453885f5181f1b624d0b', N'USER')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (17, N'Lê Kim Ngân', N'anhnv4.jpg', N'Nữ', CAST(N'2020-05-17' AS Date), N'892718297           ', 972882888, N'Nhân Viên', 3500000.0000, N'nganle@gmail.com', N'Quận 3', NULL, CAST(N'2020-05-30T20:46:55.330' AS DateTime), N'nganle0517', N'25f9e794323b453885f5181f1b624d0b', N'USER')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (18, N'Mai Siêu Phong', N'Guweiz-4.jpg', N'Nữ', CAST(N'1996-03-01' AS Date), N'036099008130        ', 828365961, N'Nhân viên', NULL, N'vuhuy99@gmail.com', N'Thủ Đức', NULL, CAST(N'2020-06-06T13:05:06.017' AS DateTime), N'user', N'179e6c0f6ef4ce0ed1e191d52d76de6a', N'USER')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (15, 10020, N'Rau Câu Nước Dừa', N'RauCauNuocDua.jpg', N'Rau Câu Nước Dừa', 5000.0000, 9000.0000, N'<p>Tại MINISTOP, kh&aacute;ch h&agrave;ng c&oacute; thể chọn lựa rất nhiều m&oacute;n tr&aacute;ng miệng kh&aacute;c nhau, từ những sản phẩm được ưa chuộng tại Việt Nam như b&aacute;nh flan, rau c&acirc;u, đến những m&oacute;n tr&aacute;ng miệng nổi tiếng ở c&aacute;c quốc gia kh&aacute;c như b&aacute;nh pudding, b&aacute;nh su kem, v.v&hellip;</p>
', 100, CAST(N'2020-05-30T19:41:03.687' AS DateTime), CAST(N'2020-05-30T19:42:39.117' AS DateTime), 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (16, 10022, N'Đậu Hũ Hải Sản (ODEN)', N'DauHuHaiSan.jpg', N'Đậu Hũ Hải Sản', 3500.0000, 7000.0000, N'<p>Đậu hũ chi&ecirc;n sơ được chế biến sử dụng nguy&ecirc;n liệu từ hải sản, b&aacute;n theo dạng xi&ecirc;n que. Miếng đậu hũ mềm, thấm đều vị chua cay của nước s&uacute;p Oden, mang lại hương vị rất đặc biệt.</p>
', 100, CAST(N'2020-05-30T19:42:00.787' AS DateTime), CAST(N'2020-05-30T19:42:26.133' AS DateTime), 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (17, 10022, N'Thanh Cua Surimi (ODEN)', N'ThanhCuaSurimi.jpg', N'Thanh Cua', 4000.0000, 8000.0000, N'<p>MINISTOP đang sử dụng sản phẩm thanh cua c&oacute; m&agrave;u sắc đẹp mắt. M&oacute;n ăn n&agrave;y sẽ ngon hơn khi vị chua cay của nước s&uacute;p thấm đều v&agrave;o vị ngọt của c&aacute;.</p>
', 100, CAST(N'2020-05-30T19:43:32.627' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (18, 10021, N'Kariman Nhân Pizza', N'KarimanNhanPizza.jpg', N'Kariman', 6000.0000, 16000.0000, N'<p>Mang h&igrave;nh ảnh của Pizza Margherita, Kariman Pizza l&agrave; sự h&ograve;a quyện của sốt c&agrave; chua, pho m&aacute;t, x&uacute;c x&iacute;ch, ớt Đ&agrave; Lạt, nấm&hellip; v&agrave; lớp vỏ gi&ograve;n tan bọc b&ecirc;n ngo&agrave;i tạo n&ecirc;n hương vị thơm ngon cho sản phẩm chỉ c&oacute; tại MINISTOP</p>
', 100, CAST(N'2020-05-30T19:45:44.230' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (19, 10021, N'Kariman Nhân Tôm', N'KarimanNhanTom.jpg', N'Kariman', 6000.0000, 16000.0000, N'<p>Vị ngọt của nh&acirc;n T&ocirc;m kết hợp với c&aacute;c nguy&ecirc;n liệu được tẩm ướp c&ugrave;ng sốt mayonnaise v&agrave; lớp vỏ gi&ograve;n tan bọc b&ecirc;n ng&ograve;ai tạo n&ecirc;n hương vị thơm ngon cho sản phẩm chỉ c&oacute; tại MINISTOP.</p>
', 100, CAST(N'2020-05-30T19:46:23.350' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (20, 10021, N'Bánh Bao Thịt Trứng Muối', N'BanhBaoThitTrungMuoi.jpg', N'Bánh bao thịt', 6000.0000, 16000.0000, N'<p>B&aacute;nh bao cao cấp c&oacute; nh&acirc;n được l&agrave;m từ trứng muối, trứng c&uacute;t, x&uacute;c x&iacute;ch Salami.</p>
', 44, CAST(N'2020-05-30T19:47:12.713' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (21, 10021, N'Gà Karaage Cay', N'GaKaraageCay.jpg', N'Gà cay', 3000.0000, 13000.0000, N'<p>Karaage g&agrave; chi&ecirc;n kh&ocirc;ng xương cay, mềm. M&oacute;n ăn n&agrave;y chấm với tương ớt hoặc tương c&agrave; sẽ l&agrave; sự kết hợp ho&agrave;n hảo.</p>
', 50, CAST(N'2020-05-30T19:49:08.723' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (22, 10021, N'Xúc Xích Hong khói', N'XucXichHongKhoi.jpg', N'Xúc xích', 5000.0000, 13000.0000, N'<p>X&uacute;c x&iacute;ch hong kh&oacute;i với hương vị n&ecirc;m nếm h&ograve;a quyện, m&oacute;n ăn hấp dẫn được giới trẻ ưa chuộng</p>
', 44, CAST(N'2020-05-30T19:49:50.827' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (23, 10021, N'Hotdog Xúc Xích Gà Nướng Sả', N'HotDogXucXichGaNuongXa.jpg', N'Xúc xích', 5000.0000, 13000.0000, N'<p>Hotdog X&uacute;c X&iacute;ch G&agrave; Nướng Sả l&agrave; một m&oacute;n ăn kh&aacute; dễ d&agrave;ng để thực hiện, c&oacute; thể l&agrave;m để ăn nhẹ hoặc cho bữa s&aacute;ng trong ng&agrave;y, M&oacute;n ăn n&agrave;y được chuẩn bị với x&uacute;c x&iacute;ch g&agrave; nướng sả được đặt v&agrave;o giữa hotdog c&ugrave;ng với tương ớt. Hotdog c&oacute; thể ăn kh&ocirc;ng hoặc ăn k&egrave;m c&aacute;c gia vị kh&aacute;c như tương c&agrave; v&agrave; tương ớt tại chuỗi cửa h&agrave;ng MINISTOP Việt Nam.</p>
', 49, CAST(N'2020-05-30T19:51:07.237' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (24, 10020, N'Chè bắp', N'CheBap.jpg', N'Chè', 2000.0000, 8000.0000, N'<p>Ch&agrave;o ng&agrave;y mới nắng l&ecirc;n với m&oacute;n ch&egrave; bắp ngọt thanh, thơm lừng !<br />
H&atilde;y c&ugrave;ng thưởng thức vị ngon thuần của bắp, một ch&uacute;t biến tấu kết hợp c&ugrave;ng đậu xanh v&agrave; nước dừa sẽ mang đến cho bạn thưởng thức 1 m&oacute;n ch&egrave; bắp - vị ngon tinh tế ng&aacute;t trời rất tuyệt nh&eacute;</p>
', 42, CAST(N'2020-05-30T19:51:56.567' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (25, 10021, N'Bánh giò nhân tôm', N'BanhGioNhanTom.jpg', N'Bánh giò', 5000.0000, 15000.0000, N'<p>B&aacute;nh gi&ograve; n&oacute;ng l&agrave; m&oacute;n ăn được nhiều người y&ecirc;u th&iacute;ch v&igrave; hương vị truyền thống của n&oacute;. Lớp l&aacute; chuối b&ecirc;n ngo&agrave;i thấm lại &iacute;t vị tươi xanh cho nh&acirc;n bột n&oacute;ng hổi, mềm trắng b&ecirc;n trong.<br />
<br />
B&aacute;nh gi&ograve; phổ biến l&agrave; thế, nhưng ban đ&atilde; bao giờ ăn thử B&aacute;nh gi&ograve; nh&acirc;n t&ocirc;m chưa? B&aacute;nh gi&ograve; nh&acirc;n t&ocirc;m đặc biệt chỉ c&oacute; tại MINISTOP sẽ khiến bạn ăn m&atilde;i kh&ocirc;ng th&ocirc;i! Nh&acirc;n t&ocirc;m dai, đậm đ&agrave; c&ugrave;ng m&agrave;u sắc đẹp mắt sẽ khiến chiếc b&aacute;nh gi&ograve; th&ecirc;m phần hấp dẫn</p>
', 50, CAST(N'2020-05-30T19:52:46.550' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (26, 10021, N'Bánh bao thịt trứng cút', N'BanhBaoThitTrungCut.jpg', N'Bánh bao thịt', 5000.0000, 14000.0000, N'<p>B&aacute;nh bao cao cấp c&oacute; nh&acirc;n được l&agrave;m từ trứng c&uacute;t, thịt heo xay</p>
', 50, CAST(N'2020-05-30T19:53:28.290' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (27, 10024, N'Set Gunkan Sushi', N'SetGunkanSushi.jpg', N'Sushi', 10000.0000, 30000.0000, N'<p>Sushi c&oacute; lẽ l&agrave; m&ocirc;t trong những m&oacute;n ăn của Nhật Bản nổi tiếng nhất tr&ecirc;n thế giới.<br />
<br />
Khoảng 70 năm trước, người ta nghĩ ra cuộn cơm trộn giấm trong l&aacute; rong biển, rồi cho phủ trứng c&aacute; hồi, cầu gai&hellip; l&ecirc;n tr&ecirc;n. V&igrave; h&igrave;nh dạng giống một chiếc hạm, tiếng Nhật gọi l&agrave; &quot;Gunkan&quot; n&ecirc;n được gọi l&agrave; Sushi Gunkan</p>
', 50, CAST(N'2020-05-30T19:54:14.170' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (28, 10023, N'Nước tinh khiết MINISTOP', N'NuocTinhKhiet.jpg', N'Nước tinh khiết', 3000.0000, 5000.0000, N'<p>Nước suối tinh khiết MINISTOP được sản xuất theo d&acirc;y chuyền c&ocirc;ng nghệ hiện đại Nhật Bản, đảm bảo c&aacute;c y&ecirc;u cầu về chất lượng, vệ sinh an to&agrave;n thực phẩm do Bộ Y tế kiểm định v&agrave; chứng nhận. Bảo đảm cung cấp cho bạn nguồn nước tinh khiết, an to&agrave;n v&agrave; tươi m&aacute;t nhất.</p>
', 1000, CAST(N'2020-05-30T19:54:53.200' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (29, 10024, N'Sushi thịt nướng và thanh cua', N'SushiThitNuongVaThanhCua.jpg', N'Sushi', 10000.0000, 25000.0000, N'<p>Sushi l&agrave; m&oacute;n ẩm thực truyền thống, gắn liền với văn h&oacute;a, lối sống của người d&acirc;n xứ sở mặt trời mọc.<br />
<br />
Sushi thịt nướng v&agrave; thanh cua tại MINISTOP với thịt nướng mềm ẩm, thấm vị thơm phưng phức, thanh cua surimi với từng thớ thịt cua tươi v&agrave; dai được cuộn tr&ograve;n trong lớp gạo dẻo Nhật Bản, đ&acirc;y sẽ l&agrave; m&oacute;n ăn hấp dẫn m&agrave; bạn kh&ocirc;ng thể bỏ qua.<br />
<br />
Th&agrave;nh phần: Cơm sushi, thịt nướng, thanh cua, dưa leo, trứng chi&ecirc;n, rong biển</p>
', 49, CAST(N'2020-05-30T19:55:36.173' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (30, 10024, N'Sushi California', N'SushiCalifornia.jpg', N'Sushi', 15000.0000, 26000.0000, N'<p>Sushi California tại MINISTOP được chế biến th&agrave;nh dạng Sushi cuộn (Uramaki), loại Sushi n&agrave;y được l&agrave;m từ chả c&aacute; hương vị cua, hạt m&egrave; trắng, bơ, Mayonnaise (cuộn sao cho theo thứ tự từ b&ecirc;n ngo&agrave;i: dấm, rong biển kh&ocirc;...)</p>
', 43, CAST(N'2020-05-30T19:56:13.857' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (31, 10025, N'Onigiri Sandwich Burger tôm Ebikatsu', N'OnigiriSandwich.jpg', N'Sandwich', 5000.0000, 18000.0000, N'<p>Onigiri Sandwich Burger t&ocirc;m Ebikatsu</p>
', 50, CAST(N'2020-05-30T19:57:42.893' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (32, 10023, N'Sô cô la đá MINISTOP', N'SocolaDa.jpg', N'Socola', 5000.0000, 12000.0000, N'<p>Thức uống S&ocirc; c&ocirc; la đ&aacute; tại MINISTOP với hương vị thơm nồng n&agrave;n vị S&ocirc; c&ocirc; la b&eacute;o ngậy, từng ngụm s&ocirc; c&ocirc; la tan trong miệng sẽ khiến c&aacute;c bạn ngất ng&acirc;y bởi sự đậm đ&agrave; của n&oacute;</p>
', 100, CAST(N'2020-05-30T19:58:31.363' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (33, 10023, N'Cà phê sữa đá MINISTOP', N'CapheSuaDa.jpg', N'Caphe', 5000.0000, 12000.0000, N'<p>C&agrave; ph&ecirc; h&ograve;a tan tại MINISTOP. Được l&agrave;m từ 100% c&agrave; ph&ecirc; Việt. Sử dụng c&ocirc;ng nghệ c&ocirc; đặc từ c&agrave; ph&ecirc; phin. Th&ecirc;m v&agrave;o một tinh thần &ldquo;Kh&ocirc;ng g&igrave; kh&ocirc;ng thể&rdquo;. Biến thị trấn Mỹ th&agrave;nh thủ phủ c&agrave; ph&ecirc; Việt. Tạo n&ecirc;n một hương vị c&agrave;<br />
ph&ecirc; đ&iacute;ch thực.</p>
', 73, CAST(N'2020-05-30T19:59:07.617' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (34, 10022, N'Chả cá Chikuwa (ODEN)', N'ChaCaChikuwa.jpg', N'Chả cá', 3000.0000, 7000.0000, N'<p>Chả c&aacute; Chikuwa l&agrave; loại chả c&aacute; h&igrave;nh ống của Nhật Bản với lớp vỏ ngo&agrave;i hấp dẫn, hương vị thơm ngon kh&oacute; cưỡng bởi lớp chả c&aacute; thơm ngon, vị dai dai đặc trưng của chả c&aacute; Chikuwa kết hợp c&ugrave;ng nước lẩu Oden khiến người ăn nhớ m&atilde;i hương vị quyến rũ n&agrave;y</p>
', 100, CAST(N'2020-05-30T20:01:10.893' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (35, 10021, N'Bánh giò ', N'BanhGio.jpg', N'Bánh giò', 5000.0000, 11000.0000, N'<p>B&aacute;nh gi&ograve; MINISTOP với lớp bột dẻo mềm mịn, nh&acirc;n thịt h&ograve;a quyện c&ugrave;ng nấm tai m&egrave;o, h&agrave;nh t&acirc;y mang lại hương vị thơm ngon, bổ dưỡng.</p>
', 49, CAST(N'2020-05-30T20:01:56.490' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (36, 10025, N'Temaki Onigiri Thanh Cua Mayo', N'TemakiOnigiriThanhCuaMayo.jpg', N'Onigiri', 4000.0000, 14000.0000, N'<p>Temaki Onigiri từ l&acirc;u đ&atilde; l&agrave; m&oacute;n ăn quen thuộc được mọi người y&ecirc;u th&iacute;ch. V&agrave; h&ocirc;m nay, đến với Ministop bạn sẽ gặp một Temaki Onigiri ho&agrave;n to&agrave;n mới, sự lột x&aacute;c ho&agrave;n hảo v&agrave; to&agrave;n diện của ch&uacute;ng sẽ mang lại luồng gi&oacute; mới l&agrave;m h&agrave;i l&ograve;ng hơn khẩu vị của thực kh&aacute;ch kh&oacute; t&iacute;nh</p>
', 100, CAST(N'2020-05-30T20:02:54.747' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (37, 10025, N'Temaki Onigiri Cá Ngừ Mayo', N'TemakiOnigiriCaNguMayo.jpg', N'Onigiri', 5000.0000, 12000.0000, N'<p>Temaki Onigiri từ l&acirc;u đ&atilde; l&agrave; m&oacute;n ăn quen thuộc được mọi người y&ecirc;u th&iacute;ch. V&agrave; h&ocirc;m nay, đến với Ministop bạn sẽ gặp một Temaki Onigiri ho&agrave;n to&agrave;n mới, sự lột x&aacute;c ho&agrave;n hảo v&agrave; to&agrave;n diện của ch&uacute;ng sẽ mang lại luồng gi&oacute; mới l&agrave;m h&agrave;i l&ograve;ng hơn khẩu vị của thực kh&aacute;ch kh&oacute; t&iacute;nh.</p>
', 100, CAST(N'2020-05-30T20:03:43.467' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (38, 10025, N'Temaki Onigiri Trứng Cá Mayo', N'TemakiOnigiriTrungCaMayo.jpg', N'Onigiri', 4000.0000, 14000.0000, N'<p>Temaki Onigiri từ l&acirc;u đ&atilde; l&agrave; m&oacute;n ăn quen thuộc được mọi người y&ecirc;u th&iacute;ch. V&agrave; h&ocirc;m nay, đến với Ministop bạn sẽ gặp một Temaki Onigiri ho&agrave;n to&agrave;n mới, sự lột x&aacute;c ho&agrave;n hảo v&agrave; to&agrave;n diện của ch&uacute;ng sẽ mang lại luồng gi&oacute; mới l&agrave;m h&agrave;i l&ograve;ng hơn khẩu vị của thực kh&aacute;ch kh&oacute; t&iacute;nh</p>
', 88, CAST(N'2020-05-30T20:04:39.347' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (39, 10025, N'Temaki Onigiri Gà Nướng', N'TemakiOnigiriGaNuong.jpg', N'Onigiri', 4000.0000, 14000.0000, N'<p>Temaki Onigiri từ l&acirc;u đ&atilde; l&agrave; m&oacute;n ăn quen thuộc được mọi người y&ecirc;u th&iacute;ch. V&agrave; h&ocirc;m nay, đến với Ministop bạn sẽ gặp một Temaki Onigiri ho&agrave;n to&agrave;n mới, sự lột x&aacute;c ho&agrave;n hảo v&agrave; to&agrave;n diện của ch&uacute;ng sẽ mang lại luồng gi&oacute; mới l&agrave;m h&agrave;i l&ograve;ng hơn khẩu vị của thực kh&aacute;ch kh&oacute; t&iacute;nh.</p>
', 100, CAST(N'2020-05-30T20:05:28.177' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (40, 10020, N'Khoai mì sữa dừa bùi bùi béo ngậy, ăn là mê ngay!', N'KhoaiMiSuaDua.jpg', N'Khoai mì', 4000.0000, 9000.0000, N'<p>L&agrave; một m&oacute;n ăn mang đậm hương vị d&acirc;n d&atilde; v&agrave; v&ocirc; c&ugrave;ng gần gũi nhưng khoai m&igrave; sữa dừa lại lu&ocirc;n khiến bao người phải &ldquo;say m&ecirc;&rdquo;. Vị b&ugrave;i b&ugrave;i của khoai m&igrave; h&ograve;a quyện với vị b&eacute;o ngậy của sữa v&agrave; hương dừa ng&agrave;o ngạt khiến bất kỳ ai cũng kh&ocirc;ng thể cưỡng lại.</p>
', 99, CAST(N'2020-05-30T20:07:51.837' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (41, 10020, N'Mê mẩn với Bánh su que kem trứng muối lạ miệng', N'BanhSuQueKemTrungMuoi.jpg', N'Bánh su kem', 5000.0000, 16000.0000, N'<p>B&aacute;nh su kem trứng muối l&agrave; một sự kết hợp đầy mới lạ giữa vị ngọt b&eacute;o của nh&acirc;n kem quyện với vị mặn nhẹ b&ugrave;i b&ugrave;i của trứng muối, hứa hẹn sẽ chinh phục bao tử của bất kỳ ai.</p>
', 100, CAST(N'2020-05-30T20:08:26.583' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (42, 10023, N'Ice bolt vị Phúc bồn tử 12oz', N'IceBolt.jpg', N'Ice ', 5000.0000, 15000.0000, N'<p>Ice bolt vị Ph&uacute;c bồn tử 12oz</p>
', 98, CAST(N'2020-05-30T20:09:28.773' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (43, 10023, N'Ice bolt vị cam 12oz', N'IceBoltViCam.jpg', N'Ice ', 5000.0000, 15000.0000, N'<p>Ice bolt vị cam 12oz</p>
', 100, CAST(N'2020-05-30T20:10:14.990' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (44, 10025, N'Temaki Onigiri cá hồi mayo', N'TemakiOnigiriCaHoiMayo.jpg', N'Onigiri', 5000.0000, 15000.0000, N'<p>Temaki Onigiri c&aacute; hồi mayo</p>
', 100, CAST(N'2020-05-30T20:11:02.800' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (45, 10021, N'Temaki onigiri bò sốt phomai', N'TemakiOnigiriBoSotPhomai.jpg', N'Onigiri', 5000.0000, 15000.0000, N'<p>Temaki onigiri b&ograve; sốt phomai</p>
', 100, CAST(N'2020-05-30T20:11:33.893' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (46, 10021, N'Chả cá phô mai', N'ChaCaPhoMai.jpg', N'Chả cá', 3000.0000, 13000.0000, N'<p>Thịt c&aacute; tươi xay nhuyễn, đ&aacute;nh đều tay với gia vị gi&uacute;p chả c&aacute; vẫn giữ độ dai gi&ograve;n khi ăn c&ugrave;ng lẩu Oden. B&ecirc;n trong l&agrave; ph&ocirc; mai tan chảy, b&eacute;o ngậy. Bảo đảm hội th&iacute;ch ph&ocirc; mai sẽ nghiện ngay Chả c&aacute; ph&ocirc; mai tại MINISTOP</p>
', 100, CAST(N'2020-05-30T20:12:14.473' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (47, 10021, N'Chả cá bạch tuộc', N'ChaCaBAchTuoc.jpg', N'Chả cá', 3000.0000, 8000.0000, N'<p>Ly lẩu Oden thật thiếu s&oacute;t khi kh&ocirc;ng c&oacute; Chả c&aacute; bạch tuộc ăn k&egrave;m. Chả c&aacute; được l&agrave;m từ thịt c&aacute; v&agrave; bạch tuộc tươi xanh của biển, gia vị được tẩm ướp vừa miệng. Khi h&uacute;p nước lẩu Oden chua cay, cắn miếng chả c&aacute; bạch tuộc dai dai th&igrave; vị gi&aacute;c của bạn như được đ&aacute;nh thức tức th&igrave;</p>
', 100, CAST(N'2020-05-30T20:12:48.447' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (48, 10020, N'Bánh trứng vàng vani', N'BanhTrungVangVani.jpg', N'Bánh trứng ', 5000.0000, 14000.0000, N'<p>Với nguy&ecirc;n liệu ho&agrave;n to&agrave;n l&agrave;m bằng trứng g&agrave; tươi, những người thợ l&agrave;m n&ecirc;n chiếc b&aacute;nh xốp mềm mịn, B&ecirc;n trong l&agrave; lớp kem vani ngọt dịu thơm vị trứng</p>
', 95, CAST(N'2020-05-30T20:13:26.007' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (49, 10024, N'Sushi colorful', N'SushiColorful.jpg', N'Sushi', 15000.0000, 32000.0000, N'<p>Bữa đại tiệc sushi đầy m&agrave;u sắc với Sushi c&aacute; hồi kh&egrave; &amp; sốt ngọt nigiri, sushi g&agrave; sốt m&egrave; rang uramaki, sushi thanh cua nigiri, sushi bắp mayo gunkan, sushi x&uacute;c x&iacute;ch, sushi m&agrave;u cam uramaki sẽ đem văn h&oacute;a ẩm thực Nhật Bản đến gần bạn hơn<br />
<br />
Hương vị sushi tươi ngon, được chế biến theo c&ocirc;ng thức chuẩn Nhật đảm bảo ăn một lần l&agrave; nhớ m&atilde;i. C&aacute;c bạn đ&atilde; sẵn s&agrave;ng mở tiệc sushi c&ugrave;ng Ministop chưa n&egrave;</p>
', 99, CAST(N'2020-05-30T20:14:03.400' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (51, 10021, N'Xúc xích thương hiệu Nhật', N'XucXichThuongHieuNhat.jpg', N'Xúc xích', 3000.0000, 1000.0000, N'<p>Hương vị của thịt xay được tẩm ướp vừa đủ để giữ được sự tươi ngon. Khi ăn kh&ocirc;ng hoặc d&ugrave;ng chung với tương ớt đều tạo được m&ugrave;i vị ri&ecirc;ng, ngon kh&oacute; cưỡng<br />
<br />
Chỉ trong t&iacute;ch tắc l&agrave; bạn đ&atilde; c&oacute; thể thưởng thức m&oacute;n ăn vặt kh&ocirc;ng bao giờ ng&aacute;n n&agrave;y tại Ministop rồi nh&eacute;!</p>
', 98, CAST(N'2020-05-30T20:17:24.467' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (52, 10021, N'Chả quế ớt cá (ODEN)', N'ChaQueOtCa.jpg', N'Chả quế', 3000.0000, 8000.0000, N'<p>Oden l&agrave; một trong những m&oacute;n ăn đặc trưng của người Nhật, cũng như l&agrave; m&oacute;n ăn quen thuộc của c&aacute;c fan của MINISTOP. Nước hầm c&oacute; vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ c&aacute;c phần ninh, nhất l&agrave; củ cải. Th&agrave;nh phần ch&iacute;nh c&oacute; trong oden thường l&agrave; những m&oacute;n được ưa chuộng v&agrave;o m&ugrave;a đ&ocirc;ng, như củ cải, trứng luộc&hellip; v&igrave; n&oacute; l&agrave;m cho người ăn c&oacute; cảm gi&aacute;c ấm l&ecirc;n trong tiết trời lạnh gi&aacute;.</p>
', 100, CAST(N'2020-05-30T20:18:11.107' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (53, 10022, N'Cá viên (ODEN)', N'CaVien.jpg', N'Cá viên', 3000.0000, 8000.0000, N'<p>Oden l&agrave; một trong những m&oacute;n ăn đặc trưng của người Nhật, cũng như l&agrave; m&oacute;n ăn quen thuộc của c&aacute;c fan của MINISTOP. Nước hầm c&oacute; vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ c&aacute;c phần ninh, nhất l&agrave; củ cải. Th&agrave;nh phần ch&iacute;nh c&oacute; trong oden thường l&agrave; những m&oacute;n được ưa chuộng v&agrave;o m&ugrave;a đ&ocirc;ng, như củ cải, trứng luộc&hellip; v&igrave; n&oacute; l&agrave;m cho người ăn c&oacute; cảm gi&aacute;c ấm l&ecirc;n trong tiết trời lạnh gi&aacute;.</p>
', 97, CAST(N'2020-05-30T20:18:54.417' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (54, 10022, N'Cá hồi (ODEN)', N'CaHoi.jpg', N'Cá hồi', 3000.0000, 8000.0000, N'<p>Oden l&agrave; một trong những m&oacute;n ăn đặc trưng của người Nhật, cũng như l&agrave; m&oacute;n ăn quen thuộc của c&aacute;c fan của MINISTOP. Nước hầm c&oacute; vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ c&aacute;c phần ninh, nhất l&agrave; củ cải. Th&agrave;nh phần ch&iacute;nh c&oacute; trong oden thường l&agrave; những m&oacute;n được ưa chuộng v&agrave;o m&ugrave;a đ&ocirc;ng, như củ cải, trứng luộc&hellip; v&igrave; n&oacute; l&agrave;m cho người ăn c&oacute; cảm gi&aacute;c ấm l&ecirc;n trong tiết trời lạnh gi&aacute;.</p>
', 100, CAST(N'2020-05-30T20:24:02.807' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (55, 10022, N'Bò viên (ODEN)', N'BoVien.jpg', N'Bò viên', 3000.0000, 8000.0000, N'<p>Oden l&agrave; một trong những m&oacute;n ăn đặc trưng của người Nhật, cũng như l&agrave; m&oacute;n ăn quen thuộc của c&aacute;c fan của MINISTOP. Nước hầm c&oacute; vị hơi mặn vừa phải của shoyu, cộng với vị ngọt ra từ c&aacute;c phần ninh, nhất l&agrave; củ cải. Th&agrave;nh phần ch&iacute;nh c&oacute; trong oden thường l&agrave; những m&oacute;n được ưa chuộng v&agrave;o m&ugrave;a đ&ocirc;ng, như củ cải, trứng luộc&hellip; v&igrave; n&oacute; l&agrave;m cho người ăn c&oacute; cảm gi&aacute;c ấm l&ecirc;n trong tiết trời lạnh gi&aacute;.</p>
', 100, CAST(N'2020-05-30T20:24:43.397' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (56, 10021, N'Sandwich xúc xích & chà bông', N'SandWichXucXichChaBong.jpg', N'Sandwich', 10000.0000, 21000.0000, N'<p>Sự kết hợp mới lạ giữa x&uacute;c x&iacute;ch dai gi&ograve;n sần sật v&agrave; ch&agrave; b&ocirc;ng mằn mặn hao cơm quyện đều trong nước sốt hơi b&eacute;o khiến m&oacute;n sandwich mới thật đặc biệt v&agrave; l&ocirc;i cuốn.</p>
', 99, CAST(N'2020-05-30T20:25:33.660' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (57, 10020, N'Bánh Socola kem phô mai', N'BanhSocolaKemPhomai.jpg', N'Bánh ', 8000.0000, 18000.0000, N'<p>Những chiếc b&aacute;nh ngọt ng&agrave;o, mềm mại, b&eacute;o ngậy bởi kem ph&ocirc; mai v&agrave; th&ecirc;m ch&uacute;t đắng nhẹ của Socola sẽ l&agrave; sự lựa chọn ho&agrave;n hảo cho những buổi chiều tr&agrave; chanh ch&eacute;m gi&oacute; c&ugrave;ng bạn b&egrave; hay ngồi nh&acirc;m nhi c&ugrave;ng ly tr&agrave; giải nhiệt.</p>
', 100, CAST(N'2020-05-30T20:26:35.867' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (58, 10025, N'Onigiri thanh cua & trứng', N'OnigiriThanhcuaVaTrung.jpg', N'Onigiri', 10000.0000, 19000.0000, N'<p>Nắm cơm mềm dẻo, thơm lừng m&ugrave;i gạo mới ăn k&egrave;m thanh cua ngọt tươi vị hải sản v&agrave; trứng gi&agrave;u protein, tất cả h&ograve;a quyện trong nước sốt chuẩn vị MINISTOP tạo n&ecirc;n một kiệt t&aacute;c đầy hấp dẫn.</p>
', 100, CAST(N'2020-05-30T20:27:11.657' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (59, 10021, N'Sandwich ngũ cốc Gà xé sốt Mè rang', N'SandwichNguCocGaXeSotMeRang.jpg', N'Sandwich', 10000.0000, 29000.0000, N'<p>Cực phẩm cho bữa s&aacute;ng đ&acirc;y rồi cả nh&agrave; ơi!<br />
Sandwich ngũ cốc hương vị mới lạ, l&ocirc;i cuốn đầy k&iacute;ch th&iacute;ch. G&agrave; x&eacute; sốt M&egrave; rang beo b&eacute;o đậm đ&agrave; hẳn sẽ khiến dạ d&agrave;y bạn r&eacute;o riết đầy phấn kh&iacute;ch cho m&agrave; xem.</p>
', 100, CAST(N'2020-05-30T20:27:43.203' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (60, 10020, N'Mousse Thanh Long', N'MousseThanhLong.jpg', N'Mousse', 10000.0000, 20000.0000, N'<p>M&oacute;n b&aacute;nh kem xốp, mềm, m&aacute;t lạnh tan ngay trong miệng bởi hương vị b&eacute;o ngậy của lớp kem tươi c&ugrave;ng thanh long ruột đỏ ngọt thanh, gi&agrave;u vitamin.</p>
', 100, CAST(N'2020-05-30T20:28:16.697' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (61, 10025, N'Temaki Onigiri Xúc Xích Mayo', N'TemakiOnigiriXucXichMayo.jpg', N'Onigiri', 10000.0000, 17000.0000, N'<p>Vẫn l&agrave; nắm cơm mềm d&egrave;o với rong biển dai gi&ograve;n nhưng nay bổ sung nh&acirc;n mới &quot;x&uacute;c x&iacute;ch mayo&quot; vừa gi&ograve;n vừa b&eacute;o ngậy đầy ấn tượng. Một nắm cơm vừa ngon vừa chắc bụng lại đủ dưỡng chất l&agrave; đ&acirc;y chứ đ&acirc;u nữa cả nh&agrave; ơi!!!</p>
', 100, CAST(N'2020-05-30T20:28:50.890' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (62, 10021, N'Mì gà sốt phô mai cay cay mới lạ', N'MiGaSotPhoMaiCayCay.jpg', N'Mì', 10000.0000, 29000.0000, N'<p>Sợi m&igrave; dai gi&ograve;n đ&uacute;ng ti&ecirc;u chuẩn h&ograve;a quyện trong những xớ thịt g&agrave; sốt ph&ocirc; mai cay cay b&eacute;o ngậy v&ocirc; c&ugrave;ng thu h&uacute;t. T&iacute;n đồ của m&igrave; chắc chắn kh&ocirc;ng thể bỏ qua m&oacute;n n&agrave;y!</p>
', 100, CAST(N'2020-05-30T20:29:30.190' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (63, 10021, N'Bữa sáng healthy với sandwich hỗn hợp cá ngừ rau củ', N'BuaSangHealthyvoiSandwichHonHopCaNguRauCu.jpg', N'Sandwich', 10000.0000, 23000.0000, N'<p>Sandwich ngũ cốc - đột ph&aacute; mới trong l&agrave;ng sandwich. Ngũ cốc dinh dưỡng lu&ocirc;n l&agrave; lựa chọn h&agrave;ng đầu cho những t&iacute;n đồ y&ecirc;u l&agrave;m đẹp. Nay sandwich ngũ cốc đầy đủ dinh dưỡng, lạ miệng thơm ngon hứa hẹn sẽ khiến fans m&ecirc; mẩn, đến MINISTOP thử ngay c&aacute;c bạn nh&eacute;!</p>
', 50, CAST(N'2020-05-30T20:30:28.537' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (64, 10020, N'Tráng miệng tuyệt hảo với Bánh Mousse Cam', N'BanhMousseCam.jpg', N'Mousse', 5000.0000, 17000.0000, N'<p>B&aacute;nh Mousse vị Cam khiến người d&ugrave;ng m&ecirc; mẩn ngay từ lần chạm đầu ti&ecirc;n bởi sự ngọt ng&agrave;o lạ lẫm đầy cuốn h&uacute;t, sự mềm mịn v&agrave; beo b&eacute;o đầy k&iacute;ch th&iacute;ch k&egrave;m một ch&uacute;t vị chua nhẹ c&ugrave;ng hương cam.<br />
Ăn thử 1 lần l&agrave; m&ecirc; 1 đời!</p>
', 100, CAST(N'2020-05-30T20:31:13.317' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (65, 10020, N'Tráng miệng tuyệt hảo với Bánh Mousse Socola', N'BanhMousseSocola.jpg', N'Mousse', 5000.0000, 17000.0000, N'<p>B&aacute;nh Mousse vị Socola khiến người d&ugrave;ng m&ecirc; mẩn ngay từ lần chạm đầu ti&ecirc;n bởi sự ngọt ng&agrave;o lạ lẫm đầy cuốn h&uacute;t, sự mềm mịn v&agrave; beo b&eacute;o đầy k&iacute;ch th&iacute;ch c&ugrave;ng vị Socola đăng đắng dịu nhẹ.<br />
Ăn thử 1 lần l&agrave; m&ecirc; 1 đời!</p>
', 96, CAST(N'2020-05-30T20:31:52.760' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (66, 10025, N'Temaki Onigiri Thịt Nguội Mayo thơm ngon chắc bụng', N'TemakiOnigiriThitNguoiMayo.jpg', N'Onigiri', 4000.0000, 14000.0000, N'<p>Nắm cơm mềm dẻo, thơm lừng, rong biển dai ngon đầy k&iacute;ch th&iacute;ch. Ăn một miếng, cảm nhận ngay phần nh&acirc;n thịt nguội mayo b&eacute;o ngậy đậm vị.</p>
', 99, CAST(N'2020-05-30T20:32:36.887' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (67, 10021, N'Gà xiên BBQ - chuẩn vị gà - đậm đà khó cưỡng', N'GaxienBBQ.jpg', N'Gà xiên', 10000.0000, 25000.0000, N'<p>Thịt g&agrave; được tẩm ướp gia vị đậm đ&agrave;, nướng l&ecirc;n thơm lừng nức mũi sẽ l&agrave; bữa ăn nhẹ si&ecirc;u dinh dưỡng v&agrave; ngon l&agrave;nh!</p>
', 97, CAST(N'2020-05-30T20:33:07.183' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (68, 10021, N'Thực đơn lành mạnh với Salad gà karaage ngũ sắc ngon miệng, bắt mắt', N'SaladGaNguSac.jpg', N'Salad', 10000.0000, 20000.0000, N'<p>Giảm c&acirc;n kh&ocirc;ng c&ograve;n khắc nghiệt với m&oacute;n Salad g&agrave; karaage mới lạ đầy hấp dẫn.<br />
Sự kết giữa vị gi&ograve;n tươi của x&agrave; l&aacute;ch, thịt ức g&agrave; karaage thơm ngon dinh dưỡng c&ugrave;ng gia vị v&agrave; nước sốt thanh thanh beo b&eacute;o tạo n&ecirc;n một kiệt t&aacute;c ho&agrave;n hảo.</p>
', 92, CAST(N'2020-05-30T20:33:40.957' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (69, 10021, N'Sandwich thịt nguội phô mai salad', N'SandwichThitNguoi.jpg', N'Sandwich', 10000.0000, 25000.0000, N'<p>Một bữa s&aacute;ng s&agrave;nh điệu với sandwich hương vị mới lạ. Thịt nguội mềm mềm đi c&ugrave;ng với ph&ocirc; mai b&eacute;o ngậy, th&ecirc;m ch&uacute;t rau xanh để trung h&ograve;a mọi thứ. Đảm bảo ăn ho&agrave;i kh&ocirc;ng ng&aacute;n!</p>
', 87, CAST(N'2020-05-30T20:34:26.977' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (70, 10023, N'Bia budweiser', N'Budweiser.jpg', N'Bia ', 8000.0000, 15000.0000, N'<p>&nbsp;</p>

<p>Sản phẩm d&agrave;nh cho người tr&ecirc;n 18 tuổi v&agrave; kh&ocirc;ng d&agrave;nh cho phụ nữ mang thai. Thưởng thức c&oacute; tr&aacute;ch nhiệm, đ&atilde; uống đồ uống c&oacute; cồn th&igrave; kh&ocirc;ng l&aacute;i xe!</p>
', 100, CAST(N'2020-05-31T00:33:58.960' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (71, 10021, N'Mì chay Mama', N'mi-ly-chay-huong-rau-cu-2-org.jpg', N'Mì ly', 5000.0000, 15000.0000, NULL, 100, CAST(N'2020-05-31T00:36:56.150' AS DateTime), CAST(N'2020-05-31T00:37:32.397' AS DateTime), 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (72, 10021, N'Mì cay NongShim ShinCup ', N'mi-an-lien-shin-75-gam-2-org.jpg', N'Mì cay Hàn Quốc', 5000.0000, 15000.0000, N'<p>SỢI M&Igrave; - Bột m&igrave; 59.05%, tinh bột khoai t&acirc;y 19.68%, dầu cọ 5.68%, muối 5.51%, chất điều chỉnh độ acid (E500i, E501i) 3.66%, tocopherol (lecithin (E322)) 3.23%, chiết xuất tr&agrave; xanh 3.18%, m&agrave;u tự nhi&ecirc;n riboflavin maltodextrin, đường, muối, ớt, đậu n&agrave;nh, tỏi, chiết xuất nấm men, dầu cọ, h&agrave;nh, c&aacute; cơm) 44.58%, đường 13.05%, muối 12.85%, tinh bột sắn 9.7%, glucose 8.2%, gia vị (maltodextrin, glucose, tỏi, ớt) 6%, chất điều vị (E627, E631) 3%, nấm 2.62%</p>
', 100, CAST(N'2020-05-31T00:38:09.637' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (73, 10023, N'Cà phê hòa tan', N'ca-phe-hoa-tan-king-coffee-hop-300g-2g-x-150-goi-201901241345154616.jpg', N'King Coffee', 40000.0000, 200000.0000, N'<p>C&agrave; ph&ecirc; sữa ho&agrave; tan 3 in 1 King Coffee hộp 10 g&oacute;i được tuyển chọn từ những hạt c&agrave; ph&ecirc; tốt nhất tr&ecirc;n v&ugrave;ng đất Bu&ocirc;n M&ecirc; Thuột trứ danh kết hợp với vị sữa thơm ngọt, cho bạn một t&aacute;ch c&agrave; ph&ecirc; sữa hấp dẫn.</p>
', 48, CAST(N'2020-05-31T00:39:55.937' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (74, 10026, N'Bút bi Thiên Long', N'butbithienlong.jpg', N'Thiên Long', 1000.0000, 5000.0000, N'<p>Đ&acirc;y l&agrave; một trong những c&acirc;y b&uacute;t đang được học sinh sử dụng nhiều nhất tại Việt Nam. B&uacute;t c&oacute; thiết kế tối giản, nhưng tinh tế v&agrave; ấn tượng. To&agrave;n bộ th&acirc;n b&uacute;t l&agrave;m từ nhựa trong, phối hợp ho&agrave;n hảo với m&agrave;u ruột b&uacute;t b&ecirc;n trong.</p>
', 998, CAST(N'2020-05-31T00:44:12.477' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (75, 10023, N'CocaCola', N'nuoc-ngot-coca-cola-250ml-201912021100377731.jpg', N'Coca Cola', 5000.0000, 10000.0000, N'<p>Ngon hơn khi uống lạnh</p>
', 97, CAST(N'2020-05-31T00:47:02.963' AS DateTime), NULL, 0, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat], [GiamGia], [GiaMoi]) VALUES (76, 10023, N'Nước giải khát Spirt', N'nuoc-ngot-sprite-vi-chanh-250ml-201909161019429057.jpg', N'Spirt', 3000.0000, 10000.0000, N'<p>Ngon hơn khi uống lạnh</p>
', 99, CAST(N'2020-05-31T00:48:02.773' AS DateTime), NULL, 0, 10000.0000)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'ADMIN', N'Quản lý')
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'BLOCK', N'Tài khoản bị khóa')
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'USER', N'Nhân viên')
GO
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_NhaCungCap', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_NhanVien', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_PhanLoai', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_SanPham', NULL)
GO
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [DF_SanPham_GiamGia]  DEFAULT ((0)) FOR [GiamGia]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_DatHang] FOREIGN KEY([MaDatHang])
REFERENCES [dbo].[DatHang] ([MaDatHang])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_DatHang]
GO
ALTER TABLE [dbo].[CTDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDH_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTDH] CHECK CONSTRAINT [FK_CTDH_SanPham]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_SanPham]
GO
ALTER TABLE [dbo].[CTPG]  WITH CHECK ADD  CONSTRAINT [FK_CTPG_PhieuGiao] FOREIGN KEY([MaPhieuGiao])
REFERENCES [dbo].[PhieuGiao] ([MaPhieuGiao])
GO
ALTER TABLE [dbo].[CTPG] CHECK CONSTRAINT [FK_CTPG_PhieuGiao]
GO
ALTER TABLE [dbo].[CTPG]  WITH CHECK ADD  CONSTRAINT [FK_CTPG_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPG] CHECK CONSTRAINT [FK_CTPG_SanPham]
GO
ALTER TABLE [dbo].[CTTH]  WITH CHECK ADD  CONSTRAINT [FK_CTTH_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTTH] CHECK CONSTRAINT [FK_CTTH_SanPham]
GO
ALTER TABLE [dbo].[CTTH]  WITH CHECK ADD  CONSTRAINT [FK_CTTH_TraHang] FOREIGN KEY([MaTraHang])
REFERENCES [dbo].[TraHang] ([MaTraHang])
GO
ALTER TABLE [dbo].[CTTH] CHECK CONSTRAINT [FK_CTTH_TraHang]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhaCungCap]
GO
ALTER TABLE [dbo].[DatHang]  WITH CHECK ADD  CONSTRAINT [FK_DatHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DatHang] CHECK CONSTRAINT [FK_DatHang_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_VAT] FOREIGN KEY([VAT])
REFERENCES [dbo].[VAT] ([VAT])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_VAT]
GO
ALTER TABLE [dbo].[LoaiSanPham]  WITH CHECK ADD  CONSTRAINT [FK_LoaiSanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[LoaiSanPham] CHECK CONSTRAINT [FK_LoaiSanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_VaiTro1] FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_VaiTro1]
GO
ALTER TABLE [dbo].[PhieuGiao]  WITH CHECK ADD  CONSTRAINT [FK_PhieuGiao_DatHang] FOREIGN KEY([MaDatHang])
REFERENCES [dbo].[DatHang] ([MaDatHang])
GO
ALTER TABLE [dbo].[PhieuGiao] CHECK CONSTRAINT [FK_PhieuGiao_DatHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[TraHang]  WITH CHECK ADD  CONSTRAINT [FK_TraHang_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[TraHang] CHECK CONSTRAINT [FK_TraHang_HoaDon]
GO
ALTER TABLE [dbo].[VaiTro_ChucNang]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_ChucNang_ChucNang] FOREIGN KEY([MaChucNang])
REFERENCES [dbo].[ChucNang] ([MaChucNang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VaiTro_ChucNang] CHECK CONSTRAINT [FK_VaiTro_ChucNang_ChucNang]
GO
ALTER TABLE [dbo].[VaiTro_ChucNang]  WITH CHECK ADD  CONSTRAINT [FK_VaiTro_ChucNang_VaiTro] FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[VaiTro_ChucNang] CHECK CONSTRAINT [FK_VaiTro_ChucNang_VaiTro]
GO
USE [master]
GO
ALTER DATABASE [QuanLy] SET  READ_WRITE 
GO
