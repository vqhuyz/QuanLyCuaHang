USE [master]
GO
/****** Object:  Database [QuanLy]    Script Date: 5/20/2020 11:25:32 PM ******/
CREATE DATABASE [QuanLy]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLy', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLy.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLy_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\QuanLy_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [QuanLy]
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChucNang](
	[MaChucNang] [varchar](50) NOT NULL,
	[TenChucNang] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTHD]    Script Date: 5/20/2020 11:25:32 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 5/20/2020 11:25:32 PM ******/
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
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [bigint] IDENTITY(1,1) NOT NULL,
	[TenKH] [nvarchar](50) NULL,
	[SoCMND] [char](12) NULL,
	[SoDT] [char](10) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSP] [bigint] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](max) NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [bigint] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](200) NULL,
	[SoDT] [char](10) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](200) NULL,
	[MaThue] [char](10) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [bigint] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgaySinh] [date] NOT NULL,
	[SoCMND] [char](12) NULL,
	[SoDT] [char](10) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [bigint] IDENTITY(1,1) NOT NULL,
	[MaNCC] [bigint] NULL,
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
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVaiTro] [varchar](20) NOT NULL,
	[VaiTro] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VaiTro_ChucNang]    Script Date: 5/20/2020 11:25:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VaiTro_ChucNang](
	[MaVaiTro] [varchar](20) NOT NULL,
	[MaChucNang] [varchar](50) NOT NULL,
	[GhiChu] [ntext] NULL,
 CONSTRAINT [PK_VaiTro_ChucNang_1] PRIMARY KEY CLUSTERED 
(
	[MaVaiTro] ASC,
	[MaChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Sua_KhachHang', N'Sửa thông tin khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Sua_NhaCungCap', N'Sửa nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Sua_NhanVien', N'Sửa thông tin nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Sua_PhanLoai', N'Sửa phân loại')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Sua_SanPham', N'Sửa thông tin sản phẩm')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Them_KhachHang', N'Thêm khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Them_NhaCungCap', N'Thêm nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Them_NhanVien', N'Thêm nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Them_PhanLoai', N'Thêm phân loại')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Them_SanPham', N'Thêm sản phẩm mới')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'ThongTin_KhachHang', N'Thông tin chi tiết khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'ThongTin_NhaCungCap', N'Thông tin nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'ThongTin_NhanVien', N'Thông tin nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'ThongTin_SanPham', N'Thông tin chi tiết sản phẩm')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_KhachHang', N'Xem danh sách khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_NhaCungCap', N'Xem nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_NhanVien', N'Xem danh sách Nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_PhanLoai', N'Xem phân loại')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xem_SanPham', N'Xem danh sách sản phẩm')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_HoaDon', N'Xóa hóa đơn')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_KhachHang', N'Xóa khách hàng')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_NhaCungCap', N'Xóa nhà cung cấp')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_NhanVien', N'Xóa nhân viên')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_PhanLoai', N'Xóa phân loại')
INSERT [dbo].[ChucNang] ([MaChucNang], [TenChucNang]) VALUES (N'Xoa_SanPham', N'Xóa sản phẩm')
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (1, N'Huỳnh Kim Minh Hiền', N'036099008133', N'0828365966', CAST(N'1999-12-10' AS Date), N'Thủ Đức', N'Nữ', N'huynhhien@gmail.com', N'Huỳnh Kim Minh Hiền', CAST(N'2020-05-07 22:30:20.033' AS DateTime), N'Khách dễ chịu                                                                                                                   ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (3, N'Quốc Hoàng', N'036099008135', N'0828365961', CAST(N'1999-07-14' AS Date), N'Quận 9', N'Nam', N'quochoang@gmail.com', N'Quốc Hoàng', CAST(N'2020-05-07 22:30:20.033' AS DateTime), N'Khách nhiệt tình')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (4, N'Tà lằng tà lằng', N'036099008130', N'0828365961', CAST(N'2020-05-10' AS Date), N'Thủ Đức', N'Nam', N'tantan@gmail.com', N'Anh Bảnh', CAST(N'2020-05-10 01:03:00.810' AS DateTime), N'Khách hơi ngu')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (5, N'Vũ Quốc Huy', N'036099008132', N'0828365961', CAST(N'1999-03-17' AS Date), N'Dĩ An', N'Nam', N'vuquochuyz99@gmail.com', N'Vũ Quốc Huy', CAST(N'2020-05-12 19:02:07.777' AS DateTime), N'Khách hàng siêu đáng yêu')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [SoCMND], [SoDT], [NgaySinh], [DiaChi], [GioiTinh], [Email], [Facebook], [NgayDangKi], [GhiChu]) VALUES (6, N'Hoàng Yến', N'036099008132', N'0828365961', CAST(N'2020-05-12' AS Date), N'Thủ Đức', N'Nữ', N'1751012086yen@ou.edu.vn', N'Hoàng Yến', CAST(N'2020-05-12 19:08:37.800' AS DateTime), N'Đây là Yến')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai]) VALUES (10003, N'Đồ ăn liền')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai]) VALUES (10005, N'Nước giải khát')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai]) VALUES (10006, N'Đồ y tế')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSP], [TenLoai]) VALUES (10007, N'Đồ gia đình')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[NhaCungCap] ON 

INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (3, N'Big C ', N'0828365961', N'Thủ Đứcc', N'bigCC@gmail.com', N'BC012     ', N'Đây là Big CC')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [SoDT], [DiaChi], [Email], [MaThue], [GhiChu]) VALUES (4, N'Bệnh viện Hoàn Hảo', N'0828365961', N'Thủ Đức', N'hoanhao@gmail.com', N'HH0123z-  ', N'Nhập hàng y tế')
SET IDENTITY_INSERT [dbo].[NhaCungCap] OFF
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [HinhAnh], [GioiTinh], [NgaySinh], [SoCMND], [SoDT], [ChucVu], [MucLuong], [Email], [DiaChi], [GhiChu], [NgayThamGia], [TaiKhoan], [MatKhau], [MaVaiTro]) VALUES (6, N'Vũ Quốc Huy', N'47181249_2273143379637532_854010262049521664_o.jpg', N'Nam', CAST(N'1999-03-17' AS Date), N'036099008132', N'0828365961', N'Quản lí', 10000000.0000, N'vuquochuyz99@gmail.com', N'Dĩ An', NULL, CAST(N'2020-05-16 20:31:16.327' AS DateTime), N'admin', N'c4ca4238a0b923820dcc509a6f75849b', N'ADMIN')
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat]) VALUES (5, 3, 10003, N'Mì ly Hảo Hảo', N'b79e212a681ceb7fd8a4269994eb824f.jpg', N'AceCook', 10000.0000, 15000.0000, N'<p>H&agrave;ng mẫu</p>
', 63, CAST(N'2020-05-16 03:32:56.620' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat]) VALUES (6, 4, 10006, N'Khẩu trang 3D', N'e42a5ae07f5d108be32b0e8401a07206.jpg', N'Quốc Huy', 5000.0000, 8000.0000, NULL, 99, CAST(N'2020-05-16 20:33:08.667' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat]) VALUES (7, 3, 10003, N'Sữa ông thọ', N'EFfAAQJsXuLz.jpg', N'Ông thọ', 3000.0000, 5000.0000, NULL, 98, CAST(N'2020-05-16 20:33:31.340' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat]) VALUES (8, 3, 10007, N'Nước rửa tay', N'nuoc-rua-tay-lifebuoy-cham-soc-da-huong-sua-tu-nhien-chai-493ml-0911201814506.jpg', N'LifeBoy', 30000.0000, 50000.0000, NULL, 98, CAST(N'2020-05-16 20:34:28.583' AS DateTime), NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [HinhAnh], [ThuongHieu], [GiaNhap], [GiaBan], [Mota], [SoLuong], [NgayThem], [NgayCapNhat]) VALUES (9, 3, 10005, N'Đá bào', N'unnamed.jpg', N'Ministop', 10000.0000, 15000.0000, NULL, 100, CAST(N'2020-05-20 19:20:06.243' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'ADMIN', N'Quản lý')
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'BLOCK', N'Tài khoản bị khóa')
INSERT [dbo].[VaiTro] ([MaVaiTro], [VaiTro]) VALUES (N'USER', N'Nhân viên')
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_NhaCungCap', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_NhanVien', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xem_PhanLoai', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xoa_HoaDon', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xoa_KhachHang', NULL)
INSERT [dbo].[VaiTro_ChucNang] ([MaVaiTro], [MaChucNang], [GhiChu]) VALUES (N'ADMIN', N'Xoa_SanPham', NULL)
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
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_VaiTro1] FOREIGN KEY([MaVaiTro])
REFERENCES [dbo].[VaiTro] ([MaVaiTro])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_VaiTro1]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSP])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
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
