using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class TrangChuController : Controller
    {
        OnlineShopDbContext db = new OnlineShopDbContext();

        public ActionResult Index()
        {
            var sanPham = db.SanPhams.Where(x => x.GiamGia == 0).Take(12).ToList();
            ViewBag.SanPham = db.SanPhams.Where(x => x.GiamGia > 0).Take(6).ToList();
            return View(sanPham);
        }


        // product details
        public ActionResult Details(long id)
        {
            var sanPham = db.SanPhams.Single(x => x.MaSP == id);
            ViewBag.ChiTiet = ListByCategoryId(sanPham.MaLoaiSP, 12);
            return View(sanPham);
        }

        public ActionResult AllPromotion()
        {
            var sanPham = db.SanPhams.Where(x => x.GiamGia > 0).ToList();
            return View(sanPham);
        }

        public ActionResult AllProduct(int? page)
        {
            int pageSize = 18;
            int pageNum = (page ?? 1);

            var sanPham = db.SanPhams.ToList();
            return View(sanPham.ToPagedList(pageNum, pageSize));
        }

        public List<SanPham> ListByCategoryId(long? id, int count)
        {
            var sanPham = db.SanPhams.Where(x => x.MaLoaiSP == id).Take(count).ToList();

            return sanPham;
        }

        public ActionResult ListCategory()
        {
            var loaiSP = db.LoaiSanPhams.ToList();
            return PartialView(loaiSP);
        }

        // changed into the top 3 menu
        public ActionResult ListByMenuSide(long id)
        {
            var sanPham = ListByCategoryId(id, 8);
            var loaiSP = db.LoaiSanPhams.Single(x => x.MaLoaiSP == id);
            ViewBag.LoaiSP = loaiSP.TenLoai;
            return View(sanPham);
        }

    }
}