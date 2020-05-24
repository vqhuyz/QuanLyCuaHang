using Model.DAO;
using Model.EF;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class HoaDonController : Controller
    {
        OnlineShopDbContext db = new OnlineShopDbContext();
        // GET: HoaDon
        [HttpGet]
        public ActionResult Index(string search, int page = 1, int pagesize = 10)
        {
            var dao = new HoaDonDAO();
            var model = dao.ListAllPaging(search, page, pagesize);
            ViewBag.Search = search;
            return View(model);
        }

        [HttpGet]
        public ActionResult ChiTietDonHang(long id)
        {
            ViewBag.CTHD = db.CTHDs.Where(x => x.MaHD == id);
            var donHang = new HoaDonDAO().ViewDetail(id);
            return View(donHang);
        }

        [HttpGet]
        public ActionResult InHoaDon(long id)
        {
            ViewBag.CTHD = db.CTHDs.Where(x => x.MaHD == id);
            var donHang = new HoaDonDAO().ViewDetail(id);
            return View(donHang);
        }

        [HttpGet]
        public ActionResult XoaHoaDon(long id)
        {
            var hoaDon = new HoaDonDAO().ViewDetail(id);
            return View(hoaDon);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult XoaHoaDon(HoaDon hoaDon)
        {
            var dao = new HoaDonDAO();
            var id = dao.Delete(hoaDon);
            if (id)
                return RedirectToAction("Index");
            else
                return View();
        }

        public ActionResult Printf(int id)
        {
            var report = new ActionAsPdf("InHoaDon", new { id = id });
            return report;
        }
    }
}