using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        public ActionResult Index()
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            ViewBag.NhanVien = db.NhanViens.Count();
            ViewBag.KhachHang = db.KhachHangs.Count();
            ViewBag.SanPham = db.SanPhams.Count();
            ViewBag.TongDoanhThu = db.HoaDons.Sum(x => x.TongTien);
            ViewBag.DoanhThuNgay = db.HoaDons.Where(x => x.NgayBan.Day == DateTime.Now.Day).Sum(x=>x.TongTien);
            ViewBag.DoanhThuThang = db.HoaDons.Where(x => x.NgayBan.Month == DateTime.Now.Month).Sum(x => x.TongTien);
            return View();
        }
    }
}