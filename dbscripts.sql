USE [master]
GO
/****** Object:  Database [QuanLyKho]    Script Date: 5/10/2019 12:46:34 PM ******/
CREATE DATABASE [QuanLyKho]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLKho_data', FILENAME = N'F:\ThucTapNhom\Project_TTNhom\DB\QuanLyLKho_data.MDF' , SIZE = 51200KB , MAXSIZE = 204800KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'QLKho_log', FILENAME = N'F:\ThucTapNhom\Project_TTNhom\DB\QuanLyKho_log.LDF' , SIZE = 51200KB , MAXSIZE = 2048GB , FILEGROWTH = 5120KB )
GO
ALTER DATABASE [QuanLyKho] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyKho].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyKho] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyKho] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyKho] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyKho] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyKho] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyKho] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyKho] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyKho] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyKho] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyKho] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyKho] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyKho] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyKho] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyKho] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyKho] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyKho] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyKho] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyKho] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyKho] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyKho] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyKho] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyKho] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyKho] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuanLyKho] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QuanLyKho]
GO
/****** Object:  Table [dbo].[CTPhieuNhap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuNhap](
	[MaPN] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[SoLuong] [bigint] NULL,
	[GiaNhap] [decimal](20, 2) NULL,
 CONSTRAINT [CTPN_MaPN_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPhieuXuat]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPhieuXuat](
	[MaPX] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [bigint] NULL,
	[MaKH] [int] NULL,
	[GiamGia] [decimal](3, 0) NULL,
 CONSTRAINT [CTPX_MaP_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] NOT NULL,
	[TenKH] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](400) NULL,
	[SDT] [char](20) NULL,
 CONSTRAINT [KH_MaKH_PK] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KichCo]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KichCo](
	[MaKichCo] [int] NOT NULL,
	[KichCo] [varchar](20) NULL,
 CONSTRAINT [PK_KichCo] PRIMARY KEY CLUSTERED 
(
	[MaKichCo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](200) NULL,
 CONSTRAINT [LND_MaLoai_PK] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoai] [int] NOT NULL,
	[TenLoai] [nvarchar](100) NULL,
 CONSTRAINT [LSP_MaLoai_PK] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [int] NOT NULL,
	[TenNCC] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SDT] [char](20) NULL,
 CONSTRAINT [NCC_MaNCC_PK] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] NOT NULL,
	[TenNV] [nvarchar](100) NULL,
	[NamSinh] [date] NULL,
	[QueQuan] [nvarchar](100) NULL,
	[TenDangNhap] [varchar](200) NULL,
	[MatKhau] [varchar](20) NULL,
	[SDT] [varchar](20) NULL,
	[MaLoaiNguoiDung] [int] NULL,
 CONSTRAINT [NV_MaNV_PK] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [int] NOT NULL,
	[NgayNhap] [date] NULL,
 CONSTRAINT [PN_MaPN_PK] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuXuat]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuXuat](
	[MaPX] [int] NOT NULL,
	[NgayXuat] [date] NULL,
 CONSTRAINT [PX_MaPX_PK] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MaLoai] [int] NULL,
	[MaNCC] [int] NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MaKichCo] [int] NULL,
	[DonGia] [decimal](20, 2) NULL,
 CONSTRAINT [SP_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[ThongKeTonKho]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeTonKho]
as
select MaLoai,MaSP, TenSP, sum(Nhap) as Nhap, sum(Xuat)  as Xuat from 
(select sp.MaLoai, sp.MaSP, sp.TenSP, Sum(ctpn.SoLuong) as Nhap, 0 as Xuat from SanPham as sp, CTPhieuNhap as ctpn
where sp.MaSP = ctpn.MaSP
group by sp.MaSP,sp.TenSP,sp.MaLoai
union (
		select sp.MaLoai, sp.MaSP,sp.TenSP,0 as Nhap,Sum(ctpx.SoLuong) as Xuat from SanPham as sp, CTPhieuXuat as ctpx
		where sp.MaSP = ctpx.MaSP
		group by sp.MaSP,sp.TenSP, sp.MaLoai
		)
union (
	select sp.MaLoai, sp.MaSP,sp.TenSP, 0 as Nhap, 0 as Xuat from SanPham as sp
)
) as ThongKeTonKho
group by MaSP, TenSP, MaLoai

GO
/****** Object:  View [dbo].[TonKhoTheoLoai]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TonKhoTheoLoai]
as
select tk.TenSP, tk.Nhap, tk.Xuat ,(tk.Nhap - tk.Xuat) as TonKho from ThongKeTonKho as tk 
where tk.MaLoai = 1
GO
/****** Object:  View [dbo].[TonKho]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[TonKho]
as
select tk.TenSP, tk.Nhap, tk.Xuat , (tk.Nhap - tk.Xuat) as TonKho from ThongKeTonKho as tk

GO
/****** Object:  View [dbo].[DSNhanVien]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSNhanVien]
as
select nv.MaNV, nv.TenNV, nv.NamSinh, nv.QueQuan, nv.SDT, nv.TenDangNhap, nv.MatKhau, lnd.TenLoai
from NhanVien as nv, LoaiNguoiDung as lnd
where nv.MaLoaiNguoiDung = lnd.MaLoai

GO
/****** Object:  View [dbo].[DSNhapTheoNam]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSNhapTheoNam]
as
select year(pn.NgayNhap) as N'Năm', DemHD.SL as N'Số hóa đơn', sum(ct.SoLuong) as N'Tổng hàng', sum(ct.SoLuong*ct.GiaNhap) as N'Tổng giá trị'
from CTPhieuNhap as ct, PhieuNhap as pn,
	(select NgayNhap, COUNT(PhieuNhap.MaPN) as SL from PhieuNhap
	group by NgayNhap) as DemHD
where ct.MaPN = pn.MaPN and pn.NgayNhap = DemHD.NgayNhap
group by year(pn.NgayNhap), DemHD.SL
GO
/****** Object:  View [dbo].[DSTheoNCC]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSTheoNCC]
as
select ncc.TenNCC as N'Nhà cung cấp',COUNT(ct.MaSP) as N'Số loại sản phẩm', sum(ct.SoLuong) as N'Tổng hàng', sum(ct.SoLuong*ct.GiaNhap) as N'Tổng giá trị'
from CTPhieuNhap as ct,PhieuNhap as pn, NhaCungCap as ncc
where ct.MaPN = pn.MaPN and ct.MaNCC = ncc.MaNCC
group by ncc.TenNCC
GO
/****** Object:  View [dbo].[DSXuatTheoKH]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSXuatTheoKH]
as
select kh.TenKH as N'Khách hàng',COUNT(ct.MaSP) as N'Số loại sản phẩm', sum(ct.SoLuong) as N'Tổng hàng', sum(ct.SoLuong*sp.DonGia - ct.SoLuong*sp.DonGia*ct.GiamGia) as N'Tổng giá trị'
from CTPhieuXuat as ct,PhieuXuat as px, SanPham as sp, KhachHang as kh
where ct.MaPX = px.MaPX and ct.MaSP = sp.MaSP and ct.MaKH = kh.MaKH
group by kh.TenKH

GO
/****** Object:  View [dbo].[DSXuatTheoNam]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSXuatTheoNam]
as
select year(px.NgayXuat) as N'Năm', DemHD.SL as N'Số hóa đơn', Sum(ct.SoLuong) as N'Tổng hàng', SUM(ct.SoLuong*sp.DonGia - ct.SoLuong*sp.DonGia*ct.GiamGia) as N'Tổng giá trị' 
from CTPhieuXuat as ct, PhieuXuat as px, SanPham as sp,
	(select year(NgayXuat) as Nam, COUNT(PhieuXuat.MaPX) as SL from PhieuXuat 
	group by year(NgayXuat) ) as DemHD
where px.MaPX = ct.MaPX and sp.MaSP = ct.MaSP and year(px.NgayXuat) = DemHD.Nam
group by year(px.NgayXuat), DemHD.SL
GO
/****** Object:  View [dbo].[DSXuatTheoNgay]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DSXuatTheoNgay]
as
select px.NgayXuat as N'Ngày xuất', DemHD.SL as N'Số hóa đơn', Sum(ct.SoLuong) as N'Tổng hàng', SUM(ct.SoLuong*sp.DonGia - ct.SoLuong*sp.DonGia*ct.GiamGia) as N'Tổng giá trị' 
from CTPhieuXuat as ct, PhieuXuat as px, SanPham as sp,
	(select NgayXuat, COUNT(PhieuXuat.MaPX) as SL from PhieuXuat 
	group by NgayXuat ) as DemHD
where px.MaPX = ct.MaPX and sp.MaSP = ct.MaSP and DemHD.NgayXuat = px.NgayXuat
group by px.NgayXuat, DemHD.SL

GO
/****** Object:  View [dbo].[ThongKeDSNhapTheoNgay]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeDSNhapTheoNgay]
as
select pn.NgayNhap as N'Ngày nhập', DemHD.SL as N'Số hóa đơn', SUM(ct.SoLuong) as N'Tổng hàng', SUM(ct.SoLuong*ct.GiaNhap) as N'Tổng giá trị'
from CTPhieuNhap as ct, PhieuNhap as pn,
	(select NgayNhap, COUNT(PhieuNhap.MaPN) as SL from PhieuNhap
	group by NgayNhap) as DemHD
where pn.MaPN = ct.MaPN and pn.NgayNhap = DemHD.NgayNhap
group by pn.NgayNhap, DemHD.SL

GO
/****** Object:  View [dbo].[ThongKeNhap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeNhap]
as
	select ctpn.MaSP, sum(ctpn.SoLuong) as SoLuongNhap from CTPhieuNhap as ctpn, PhieuNhap as pn
	where ctpn.MaPN = pn.MaPN
	group by (ctpn.MaSP)

GO
/****** Object:  View [dbo].[ThongKeNhapXuat]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeNhapXuat]
as
select MaSP, TenSP, sum(Xuat) as Xuat, sum(Nhap) as Nhap, NgayNhap, NgayXuat from
(select sp.MaSP, sp.TenSP, sum(ctpn.SoLuong) as Nhap, 0 as Xuat, pn.NgayNhap, null as NgayXuat
from SanPham as sp, CTPhieuNhap as ctpn , PhieuNhap as pn
where sp.MaSP = ctpn.MaSP and ctpn.MaPN = pn.MaPN
group by sp.MaSP, pn.NgayNhap, sp.TenSP
union (
		select sp.MaSP,sp.TenSP,0 as Nhap,sum(ctpx.SoLuong) as Xuat , null as NgayNhap, px.NgayXuat
		from SanPham as sp, CTPhieuXuat as ctpx , PhieuXuat as px
		where sp.MaSP = ctpx.MaSP and ctpx.MaPX = px.MaPX
		group by sp.MaSP, px.NgayXuat, sp.TenSP
		)
union (
	select sp.MaSP,sp.TenSP, 0 as Nhap, 0 as Xuat, null as NgayNhap, null as NgayXuat 
	from SanPham as sp
)
) as ThongKeNhapXuat
group by MaSP, TenSP,  NgayNhap, NgayXuat

GO
/****** Object:  View [dbo].[ThongKeXuat]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ThongKeXuat]
as
	select ctpx.MaSP, sum(ctpx.SoLuong) as SoLuongXuat from CTPhieuXuat as ctpx, PhieuXuat as px
	where ctpx.MaPX = px.MaPX
	group by(ctpx.MaSP)
GO
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaSP], [MaNCC], [SoLuong], [GiaNhap]) VALUES (1, 1, 1, 10, CAST(1000000.00 AS Decimal(20, 2)))
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaSP], [MaNCC], [SoLuong], [GiaNhap]) VALUES (1, 4, 1, 10, CAST(1000000.00 AS Decimal(20, 2)))
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaSP], [MaNCC], [SoLuong], [GiaNhap]) VALUES (2, 2, 2, 10, CAST(900000.00 AS Decimal(20, 2)))
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaSP], [MaNCC], [SoLuong], [GiaNhap]) VALUES (2, 5, 2, 10, CAST(900000.00 AS Decimal(20, 2)))
INSERT [dbo].[CTPhieuNhap] ([MaPN], [MaSP], [MaNCC], [SoLuong], [GiaNhap]) VALUES (3, 3, 1, 10, CAST(800000.00 AS Decimal(20, 2)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (1, 1, 1, 1, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (1, 2, 2, 1, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (2, 1, 1, 4, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (2, 5, 1, 4, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (2, 6, 1, 4, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[CTPhieuXuat] ([MaPX], [MaSP], [SoLuong], [MaKH], [GiamGia]) VALUES (3, 3, 2, 3, CAST(0 AS Decimal(3, 0)))
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (1, N'Hoàng Văn Vũ', N'304 Minh Khai, Hai Bà Trưng, Hà Nội', N'123456789           ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (2, N'Trần Hoàng Nhất', N'210, Trần Nhân Tông, Đức Chính, Đông Triều, Quảng Ninh', N'987654321           ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (3, N'Nguyễn Thanh Thùy', N'21, Cầu Giấy, Cầu Giấy, Hà Nội', N'0969764696          ')
INSERT [dbo].[KhachHang] ([MaKH], [TenKH], [DiaChi], [SDT]) VALUES (4, N'Mai Phương Thúy', N'230, Hoàng Quốc Việt, Cầu Giấy, Hà Nội', N'0988333754          ')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (1, N'35')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (2, N'35,5')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (3, N'36')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (4, N'36,5')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (5, N'37')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (6, N'37,5')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (7, N'38')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (8, N'38,5')
INSERT [dbo].[KichCo] ([MaKichCo], [KichCo]) VALUES (9, N'39')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (1, N'Nhân viên quản lý nhân sự')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (2, N'Nhân viên nhập hàng')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (3, N'Nhân viên xuất hàng')
INSERT [dbo].[LoaiNguoiDung] ([MaLoai], [TenLoai]) VALUES (4, N'Quản lý toàn kho')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (1, N'Adidas Alphabounce')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (2, N'Adidas Arkyn')
INSERT [dbo].[LoaiSP] ([MaLoai], [TenLoai]) VALUES (3, N'Adidas Continental')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (1, N'Adidas', N'354 Cầu Giấy, Hà Nội', N'123456789           ')
INSERT [dbo].[NhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT]) VALUES (2, N'MaxxSport', N'345 Thái Hà, Đống Đa, Hà Nội', N'123456788           ')
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NamSinh], [QueQuan], [TenDangNhap], [MatKhau], [SDT], [MaLoaiNguoiDung]) VALUES (1, N'Nguyễn Thị Linh', CAST(N'1990-04-01' AS Date), N'Quảng Ninh', N'Linhnguyen', N'1234', N'12345678', 1)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NamSinh], [QueQuan], [TenDangNhap], [MatKhau], [SDT], [MaLoaiNguoiDung]) VALUES (2, N'Nguyễn Thị Linh', CAST(N'1990-04-01' AS Date), N'Quảng Ninh', N'Linhnguyenthi', N'1234', N'12345678', 2)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NamSinh], [QueQuan], [TenDangNhap], [MatKhau], [SDT], [MaLoaiNguoiDung]) VALUES (3, N'Trần Thị Hạnh', CAST(N'1989-08-15' AS Date), N'Hà Nội', N'Hanhtran', N'Hanhtran', N'345678791', 4)
INSERT [dbo].[NhanVien] ([MaNV], [TenNV], [NamSinh], [QueQuan], [TenDangNhap], [MatKhau], [SDT], [MaLoaiNguoiDung]) VALUES (7, N'Ngô Bá Quang', CAST(N'1988-05-23' AS Date), N'Hải Phòng', N'Quangngo', N'Quangngo', N'123456781', 3)
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap]) VALUES (1, CAST(N'2018-12-01' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap]) VALUES (2, CAST(N'2019-04-12' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap]) VALUES (3, CAST(N'2018-12-01' AS Date))
INSERT [dbo].[PhieuNhap] ([MaPN], [NgayNhap]) VALUES (5, CAST(N'2019-05-08' AS Date))
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat]) VALUES (1, CAST(N'2019-01-22' AS Date))
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat]) VALUES (2, CAST(N'2019-01-22' AS Date))
INSERT [dbo].[PhieuXuat] ([MaPX], [NgayXuat]) VALUES (3, CAST(N'2019-02-12' AS Date))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (1, N'Adidas AlphaBounce Beyond “White/Legend Ink” ', 1, 1, N'Nam', N'Bán chạy', 1, CAST(1850000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (2, N'Adidas Alphabounce RC “Carbon/Core black”', 1, 1, N'Nam', N'', 1, CAST(1450000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (3, N'Adidas AlphaBounce Beyond “Creator”', 1, 1, N'Nam', NULL, 1, CAST(1850000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (4, N'Adidas Arkyn Wmns “Blue Tint”', 2, 1, N'Nam', NULL, NULL, CAST(1350000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (5, N'Adidas Arkyn Wmns “Hi-Res Blue”', NULL, NULL, N'Nữ', NULL, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (6, N'Adidas ', 2, 2, N'Nữ', N'', 2, CAST(1000000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (7, N'Adidas Abc', 1, 1, N'Nam', N'', 6, CAST(1000000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (8, N'abc', 1, 1, N'Nữ', N'', 1, CAST(900000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (9, N'ABVHJKDV', 1, 1, N'Nữ', N'', 1, CAST(1000000.00 AS Decimal(20, 2)))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MaLoai], [MaNCC], [GioiTinh], [GhiChu], [MaKichCo], [DonGia]) VALUES (11, N'adsfg', 1, 1, N'Nam', N'', 1, CAST(900000.00 AS Decimal(20, 2)))
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [CTPN_MaNCC_FK] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [CTPN_MaNCC_FK]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [CTPN_MaPN_FK] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [CTPN_MaPN_FK]
GO
ALTER TABLE [dbo].[CTPhieuNhap]  WITH CHECK ADD  CONSTRAINT [CTPN_MaSP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuNhap] CHECK CONSTRAINT [CTPN_MaSP_FK]
GO
ALTER TABLE [dbo].[CTPhieuXuat]  WITH CHECK ADD  CONSTRAINT [CTPX_MaKH_FK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[CTPhieuXuat] CHECK CONSTRAINT [CTPX_MaKH_FK]
GO
ALTER TABLE [dbo].[CTPhieuXuat]  WITH CHECK ADD  CONSTRAINT [CTPX_MaPX_FK] FOREIGN KEY([MaPX])
REFERENCES [dbo].[PhieuXuat] ([MaPX])
GO
ALTER TABLE [dbo].[CTPhieuXuat] CHECK CONSTRAINT [CTPX_MaPX_FK]
GO
ALTER TABLE [dbo].[CTPhieuXuat]  WITH CHECK ADD  CONSTRAINT [CTPX_MaSP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[CTPhieuXuat] CHECK CONSTRAINT [CTPX_MaSP_FK]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [NV_MaLoaiNguoiDung_FK] FOREIGN KEY([MaLoaiNguoiDung])
REFERENCES [dbo].[LoaiNguoiDung] ([MaLoai])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [NV_MaLoaiNguoiDung_FK]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_KichCo] FOREIGN KEY([MaKichCo])
REFERENCES [dbo].[KichCo] ([MaKichCo])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_KichCo]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [SP_MaLoai_FK] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSP] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [SP_MaLoai_FK]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [SP_MaNCC_FK] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [SP_MaNCC_FK]
GO
/****** Object:  StoredProcedure [dbo].[ChiTietPN]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ChiTietPN]
@MaSP int
as
begin
	select * from CTPhieuNhap as CT
	where CT.MaPN IN
		(
			select MaPN from PhieuNhap as PN
			where PN.MaPN = CT.MaPN
		)
end
GO
/****** Object:  StoredProcedure [dbo].[DSChiTietPhieuNhap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DSChiTietPhieuNhap]
as
begin
	select * from CTPhieuNhap
end
GO
/****** Object:  StoredProcedure [dbo].[DSPhieuNhap]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DSPhieuNhap]
as
begin
	select * from PhieuNhap
end
GO
/****** Object:  StoredProcedure [dbo].[procDSPX]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[procDSPX]
as
begin
	select * from PhieuXuat
end
GO
/****** Object:  StoredProcedure [dbo].[proDSKC]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSKC]
as
begin
	select * from KichCo
end
GO
/****** Object:  StoredProcedure [dbo].[proDSKH]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSKH]
as
begin
	select * from KhachHang
end
GO
/****** Object:  StoredProcedure [dbo].[proDSLSP]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSLSP]
as
begin	
	select * from LoaiSP
end
GO
/****** Object:  StoredProcedure [dbo].[proDSNCC]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSNCC]
as
begin
	select * from NhaCungCap
end
GO
/****** Object:  StoredProcedure [dbo].[proDSNV]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSNV]
as
begin
	select * from NhanVien

end
GO
/****** Object:  StoredProcedure [dbo].[proDSPN]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSPN]
as
begin
	select * from PhieuNhap
end
GO
/****** Object:  StoredProcedure [dbo].[proDSSP]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[proDSSP]
as
begin
	select * from SanPham
end
GO
/****** Object:  StoredProcedure [dbo].[themNV]    Script Date: 5/10/2019 12:46:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[themNV]
@MaNV int,
@TenNV nvarchar(100),
@QueQuan nvarchar(100)
as
begin
	insert into NhanVien(MaNV,TenNV,QueQuan)
	values (@MaNV,@TenNV,@QueQuan)
end
GO
USE [master]
GO
ALTER DATABASE [QuanLyKho] SET  READ_WRITE 
GO
