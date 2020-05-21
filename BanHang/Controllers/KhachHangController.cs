using BanHang.Common;
using Common;
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
    public class KhachHangController : Controller
    {
        // GET: KhachHang
        public ActionResult Index(string search, int page = 1, int pagesize = 10)
        {
            var dao = new KhachHangDAO();
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
            var khachHang = new KhachHangDAO().ViewDetail(id);
            return View(khachHang);
        }

        [HttpGet]
        public ActionResult Xoa(long id)
        {
            var khachHang = new KhachHangDAO().ViewDetail(id);
            return View(khachHang);
        }

        [HttpGet]
        public ActionResult ThongTin(long id)
        {
            var khachHang = new KhachHangDAO().ViewDetail(id);
            return View(khachHang);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ThemMoi(KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                var dao = new KhachHangDAO();
                long id = dao.Insert(khachHang);
                if (id > 0)
                {
                    if (khachHang.Email == null)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/Email/KhachHang.html"));

                        content = content.Replace("{{MaKH}}", khachHang.MaKH.ToString());
                        content = content.Replace("{{TenKH}}", khachHang.TenKH.ToString());
                        content = content.Replace("{{SoCMND}}", khachHang.SoCMND.ToString());
                        content = content.Replace("{{NgaySinh}}", Common.Format.FormatDate(khachHang.NgaySinh));
                        content = content.Replace("{{SoDT}}", khachHang.SoDT.ToString());
                        content = content.Replace("{{Facebook}}", khachHang.Facebook.ToString());
                        content = content.Replace("{{DiaChi}}", khachHang.DiaChi.ToString());
                        content = content.Replace("{{NgayDK}}", khachHang.NgayDangKi.ToString());

                        new SendMail().Mail(khachHang.Email, "Đăng kí khách hàng thân thiết thành công", content);
                        return RedirectToAction("Index");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Thêm khách hàng thất bại");
                }
            }
            else
            {
                return View();
            }
            return View("Index");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CapNhat(KhachHang khachHang)
        {
            if (ModelState.IsValid)
            {
                var dao = new KhachHangDAO();
                var id = dao.Update(khachHang);
                if (id)
                {
                    if (khachHang.Email == null)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/Email/KhachHang_Update.html"));

                        content = content.Replace("{{MaKH}}", khachHang.MaKH.ToString());
                        content = content.Replace("{{TenKH}}", khachHang.TenKH.ToString());
                        content = content.Replace("{{Email}}", khachHang.Email.ToString());
                        content = content.Replace("{{Facebook}}", khachHang.Facebook.ToString());
                        content = content.Replace("{{SoDT}}", khachHang.SoDT.ToString());
                        content = content.Replace("{{DiaChi}}", khachHang.DiaChi.ToString());

                        new SendMail().Mail(khachHang.Email, "Thay đổi thông tin thành công", content);
                        return RedirectToAction("Index");
                    }
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
        public ActionResult Xoa(KhachHang khachHang)
        {
            var dao = new KhachHangDAO();
            var id = dao.Delete(khachHang);
            if (id)
                return RedirectToAction("Index");
            else
                return View("Index");
        }

        public void Ds_KhachHang()
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            var model = db.KhachHangs.ToList();

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            using (var Ep = new ExcelPackage(new FileInfo("KhachHang.xlsx")))
            {
                ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
                Sheet.Cells["A1"].Value = "Mã KH";
                Sheet.Cells["B1"].Value = "Tên";
                Sheet.Cells["C1"].Value = "Giới tính";
                Sheet.Cells["D1"].Value = "Số CMND";
                Sheet.Cells["E1"].Value = "Ngày Sinh";
                Sheet.Cells["F1"].Value = "Số điện thoại";
                Sheet.Cells["G1"].Value = "Địa chỉ";
                Sheet.Cells["H1"].Value = "Email";
                Sheet.Cells["I1"].Value = "Facebook";
                Sheet.Cells["J1"].Value = "Ghi chú";
                int row = 2;
                foreach (var item in model)
                {

                    Sheet.Cells[string.Format("A{0}", row)].Value = item.MaKH;
                    Sheet.Cells[string.Format("B{0}", row)].Value = item.TenKH;
                    Sheet.Cells[string.Format("C{0}", row)].Value = item.GioiTinh;
                    Sheet.Cells[string.Format("D{0}", row)].Value = item.SoCMND;
                    Sheet.Cells[string.Format("E{0}", row)].Value = item.NgaySinh;
                    Sheet.Cells[string.Format("F{0}", row)].Value = item.SoDT;
                    Sheet.Cells[string.Format("G{0}", row)].Value = item.DiaChi;
                    Sheet.Cells[string.Format("H{0}", row)].Value = item.Email;
                    Sheet.Cells[string.Format("I{0}", row)].Value = item.Facebook;
                    Sheet.Cells[string.Format("J{0}", row)].Value = item.GhiChu;
                    row++;
                }


                Sheet.Cells["A:AZ"].AutoFitColumns();
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment: filename=" + "KhachHang.xlsx");
                Response.BinaryWrite(Ep.GetAsByteArray());
                Response.End();
            }

        }
    }
}