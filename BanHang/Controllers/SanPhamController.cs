using BanHang.Common;
using BanHang.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class SanPhamController : BaseController
    {
        // GET: SanPham
        [KiemTraQuyen(MaChucNang = "Xem_SanPham")]
        public ActionResult Index(string search, int page = 1, int pagesize = 10)
        {
            var dao = new SanPhamDAO();
            var model = dao.ListAllPaging(search, page, pagesize);
            ViewBag.Search = search;
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemMoi()
        {
            var dao = new DrownList();
            ViewBag.MaLoaiSP = new SelectList(dao.ListLoaiSP(), "MaLoaiSP", "TenLoai");
            return View();
        }

        [HttpGet]
        public ActionResult ThongTin(long id)
        {
            var sanPham = new SanPhamDAO().ViewDetail(id);
            return View(sanPham);
        }

        [HttpGet]
        public ActionResult CapNhat(long id)
        {
            var sanPham = new SanPhamDAO().ViewDetail(id);
            var dao = new DrownList();
            ViewBag.MaLoaiSP = new SelectList(dao.ListLoaiSP(), "MaLoaiSP", "TenLoai");
            return View(sanPham);
        }

        [HttpGet]
        public ActionResult Xoa(long id)
        {
            var sanPham = new SanPhamDAO().ViewDetail(id);
            return View(sanPham);
        }

        [HttpGet]
        public ActionResult KhuyenMai(long id)
        {
            var sanPham = new SanPhamDAO().ViewDetail(id);
            return View(sanPham);
        }

        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(SanPham sanPham, HttpPostedFileBase FileAnh)
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            string path = "";
            if (FileAnh != null && FileAnh.ContentLength > 0)
            {
                string extension = Path.GetExtension(FileAnh.FileName);
                if (extension.Equals(".jpg") || extension.Equals(".png") || extension.Equals(".jpeg"))
                {
                    path = Path.Combine(Server.MapPath("~/Image/SanPham/"), FileAnh.FileName);
                    FileAnh.SaveAs(path);
                }
                sanPham.HinhAnh = FileAnh.FileName;
                db.SanPhams.Add(sanPham);
                sanPham.NgayThem = DateTime.Now;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View("Index");
        }

        [HttpPost, ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(SanPham sanPham)
        {
            var dao = new SanPhamDAO();
            var id = dao.Update(sanPham);
            if (id)
            {
                return RedirectToAction("Index");
            }
            return View("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Xoa(SanPham sanPham)
        {
            var dao = new SanPhamDAO();
            var id = dao.Delete(sanPham);
            if (id)
            {
                SetAlert("Xóa thành công", "error");
                return RedirectToAction("Index");
            }
            else
                return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult KhuyenMai(SanPham sanPham)
        {
            var dao = new SanPhamDAO();
            var id = dao.KhuyenMai(sanPham);
            if (id)
            {
                SetAlert("Đã thêm sản phẩm khuyến mãi", "error");
                return RedirectToAction("Index");
            }
            else
                return View();
        }
    }
}