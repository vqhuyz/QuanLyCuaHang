using BanHang.Common;
using BanHang.Models;
using Model.DAO;
using Model.EF;
using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class NhanVienController : Controller
    {
        // GET: NhanVien
        [KiemTraQuyen(MaChucNang = "Xem_NhanVien")]
        public ActionResult Index(string search, int page = 1, int pagesize = 10)
        {
            var dao = new NhanVienDAO();
            var model = dao.ListAllPaging(search, page, pagesize);
            ViewBag.Search = search;
            return View(model);
        }

        [HttpGet]
        public ActionResult ThemMoi()
        {
            return View();
        }

        [HttpGet]
        public ActionResult CapNhat(long id)
        {
            var nhanVien = new NhanVienDAO().ViewDetail(id);
            return View(nhanVien);
        }

        [HttpGet]
        public ActionResult Xoa(long id)
        {
            var nhanVien = new NhanVienDAO().ViewDetail(id);
            return View(nhanVien);
        }

        [HttpGet]
        public ActionResult ThongTin(long id)
        {
            var nhanVien = new NhanVienDAO().ViewDetail(id);
            ViewBag.MaNV = nhanVien.MaNV;
            return View(nhanVien);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(NhanVien nhanVien, HttpPostedFileBase FileAnh)
        {
            if (ModelState.IsValid)
            {
                OnlineShopDbContext db = new OnlineShopDbContext();
                string path = "";
                if (FileAnh != null && FileAnh.ContentLength > 0)
                {
                    string extension = Path.GetExtension(FileAnh.FileName);
                    if (extension.Equals(".jpg") || extension.Equals(".png") || extension.Equals(".jpeg"))
                    {
                        path = Path.Combine(Server.MapPath("~/Image/NhanVien/"), FileAnh.FileName);
                        FileAnh.SaveAs(path);
                    }
                    nhanVien.HinhAnh = FileAnh.FileName;
                    nhanVien.NgayThamGia = DateTime.Now;
                    var encryptedMd5Pas = Encryptor.MD5Hash(nhanVien.MatKhau);
                    nhanVien.MatKhau = encryptedMd5Pas;

                    db.NhanViens.Add(nhanVien);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                var dao = new NhanVienDAO();
                var id = dao.Update(nhanVien);
                if (id)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thất bại");
                }
            }
            return View("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Xoa(NhanVien nhanVien)
        {
            var dao = new NhanVienDAO();
            var id = dao.Delete(nhanVien);
            if (id)
                return RedirectToAction("Index");
            else
                return View();
        }

        public void Ds_NhanVien()
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            var model = db.NhanViens.ToList();

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            using (var Ep = new ExcelPackage(new FileInfo("NhanVien.xlsx")))
            {
                ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
                Sheet.Cells["A1"].Value = "Mã NV";
                Sheet.Cells["B1"].Value = "Tên";
                Sheet.Cells["C1"].Value = "Giới tính";
                Sheet.Cells["D1"].Value = "Số CMND";
                Sheet.Cells["E1"].Value = "Ngày Sinh";
                Sheet.Cells["F1"].Value = "Số điện thoại";
                Sheet.Cells["G1"].Value = "Email";
                Sheet.Cells["H1"].Value = "Địa chỉ";
                Sheet.Cells["I1"].Value = "Chức vụ";
                Sheet.Cells["J1"].Value = "Mức lương";
                int row = 2;
                foreach (var item in model)
                {

                    Sheet.Cells[string.Format("A{0}", row)].Value = item.MaNV;
                    Sheet.Cells[string.Format("B{0}", row)].Value = item.TenNV;
                    Sheet.Cells[string.Format("C{0}", row)].Value = item.GioiTinh;
                    Sheet.Cells[string.Format("D{0}", row)].Value = item.SoCMND;
                    Sheet.Cells[string.Format("E{0}", row)].Value = item.NgaySinh;
                    Sheet.Cells[string.Format("F{0}", row)].Value = item.SoDT;
                    Sheet.Cells[string.Format("G{0}", row)].Value = item.Email;
                    Sheet.Cells[string.Format("H{0}", row)].Value = item.DiaChi;
                    Sheet.Cells[string.Format("I{0}", row)].Value = item.ChucVu;
                    Sheet.Cells[string.Format("J{0}", row)].Value = item.MucLuong;
                    row++;
                }


                Sheet.Cells["A:AZ"].AutoFitColumns();
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment: filename=" + "NhanVien.xlsx");
                Response.BinaryWrite(Ep.GetAsByteArray());
                Response.End();
            }
        }
    }
}