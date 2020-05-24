using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using BanHang.Common;

namespace BanHang.Controllers
{
    public class LoaiSanPhamController : Controller
    {
        // GET: LoaiSanPham
        [KiemTraQuyen(MaChucNang = "Xem_PhanLoai")]
        public ActionResult Index(int page = 1, int pagesize = 10)
        {
            var dao = new LoaiSanPhamDAO();
            var model = dao.ListAllPaging(page, pagesize);
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemMoi()
        {
            return PartialView();
        }

        [HttpGet]
        public ActionResult CapNhat(long id)
        {
            var loaiSP = new LoaiSanPhamDAO().ViewDetail(id);
            return PartialView(loaiSP);
        }

        [HttpGet]
        public ActionResult Xoa(long id)
        {
            var loaiSP = new LoaiSanPhamDAO().ViewDetail(id);
            return PartialView(loaiSP);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(LoaiSanPham loaiSP)
        {
            var dao = new LoaiSanPhamDAO();
            long id = dao.Insert(loaiSP);
            if (id > 0)
            {
                return RedirectToAction("Index");
            }
            return View("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(LoaiSanPham loaiSP)
        {
            var dao = new LoaiSanPhamDAO();
            var id = dao.Update(loaiSP);
            if (id)
            {
                return RedirectToAction("Index");
            }
            return View("Index");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Xoa(LoaiSanPham loaiSP)
        {
            var dao = new LoaiSanPhamDAO();
            var id = dao.Delete(loaiSP);
            if (id)
                return RedirectToAction("Index");

            else
                return View();
        }
    }
}