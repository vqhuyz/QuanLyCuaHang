using BanHang.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class BanHangController : Controller
    {
        private string SanPham = "SanPham";
        OnlineShopDbContext db = new OnlineShopDbContext();
        // GET: BanHang
        public ActionResult Index(string search, int page = 1, int pagesize = 5)
        {
            var dao = new SanPhamDAO();
            var model = dao.ListAllPaging(search, page, pagesize);
            ViewBag.Search = search;
            return View(model);
        }

        [HttpGet]
        public ActionResult ThanhToan()
        {
            var thanhToan = Session[SanPham];
            var list = new List<ThanhToanSanPham>();
            if (thanhToan != null)
            {
                list = (List<ThanhToanSanPham>)thanhToan;
            }
            return View(list);
        }

        [HttpPost]
        public ActionResult ThanhToan(FormCollection collection)
        {
            var hoaDon = new HoaDon();
            var sanPhamDAO = new SanPhamDAO();
            var chiTietDao = new CTHD_DAO();

            hoaDon.NgayBan = DateTime.Now;
            hoaDon.TongSL = int.Parse(collection["TongSL"]);
            hoaDon.TongTien = decimal.Parse(collection["TongTien"]);
            hoaDon.MaNV = long.Parse(collection["MaNV"]);
            if (collection["MaKH"] == "")
            {
                hoaDon.MaKH = null;
            }
            else
            {
                hoaDon.MaKH = long.Parse(collection["MaKH"]);
            }

            var maHD = new HoaDonDAO().Insert(hoaDon);
            var thanhToan = (List<ThanhToanSanPham>)Session[SanPham];

            foreach (var item in thanhToan)
            {
                var chiTiet = new CTHD();
                chiTiet.MaSP = item.SanPham.MaSP;
                chiTiet.TenSP = item.SanPham.TenSP;
                chiTiet.MaHD = maHD;
                chiTiet.SoLuong = item.SoLuong;
                chiTiet.GiaBan = item.SanPham.GiaBan;
                chiTietDao.Insert(chiTiet);

                SanPham check = sanPhamDAO.ViewDetail(chiTiet.MaSP);
                check.SoLuong -= chiTiet.SoLuong;
                sanPhamDAO.CapNhatSoLuong(check);
            }
            thanhToan.Clear();


            return RedirectToAction("Index", "HoaDon");
        }

        public ActionResult ThemSanPham(long maSP, int soLuong)
        {
            var sanPham = new SanPhamDAO().ViewDetail(maSP);
            var thanhToan = Session[SanPham];
            if (thanhToan != null)
            {
                var list = (List<ThanhToanSanPham>)thanhToan;
                if (list.Exists(x => x.SanPham.MaSP == maSP))
                {
                    foreach (var item in list)
                    {
                        if (item.SanPham.MaSP == maSP)
                        {
                            item.SoLuong += soLuong;
                        }
                    }
                }
                else
                {
                    var item = new ThanhToanSanPham();
                    item.SanPham = sanPham;
                    item.SoLuong = soLuong;
                    list.Add(item);
                }
                Session[SanPham] = list;
            }
            else
            {
                var item = new ThanhToanSanPham();
                item.SanPham = sanPham;
                item.SoLuong = soLuong;
                var list = new List<ThanhToanSanPham>();
                list.Add(item);
                Session[SanPham] = list;

            }
            return RedirectToAction("Index");
        }

        public ActionResult Xoa(long maSP)
        {
            var thanhToan = Session[SanPham];
            if (thanhToan != null)
            {
                var list = (List<ThanhToanSanPham>)thanhToan;
                list.RemoveAll(x => x.SanPham.MaSP == maSP);

            }
            return RedirectToAction("ThanhToan");

        }

        public ActionResult XoaGioHang()
        {
            var thanhToan = Session[SanPham];
            if (thanhToan != null)
            {
                var list = (List<ThanhToanSanPham>)thanhToan;
                list.Clear();
            }
            return RedirectToAction("ThanhToan");

        }

        public ActionResult CapNhat(long maSP, FormCollection collection)
        {
            var thanhToan = Session[SanPham];
            if (thanhToan != null)
            {
                var list = (List<ThanhToanSanPham>)thanhToan;
                foreach (var item in list)
                {
                    if (item.SanPham.MaSP == maSP)
                    {
                        item.SoLuong = int.Parse(collection["soLuongMoi"].ToString());
                    }
                }
            }
            return RedirectToAction("ThanhToan");
        }
    }
}