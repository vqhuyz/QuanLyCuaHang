﻿using BanHang.Common;
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
    public class NhaCungCapController : Controller
    {
        // GET: NhaCungCap
        [KiemTraQuyen(MaChucNang = "Xem_NhaCungCap")]
        public ActionResult Index(string search, int page = 1, int pagesize = 10)
        {
            var dao = new NCCDAO();
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
            var nhaCungCap = new NCCDAO().ViewDetail(id);
            return View(nhaCungCap);
        }

        [HttpGet]
        public ActionResult Xoa(long id)
        {
            var nhaCungCap = new NCCDAO().ViewDetail(id);
            return View(nhaCungCap);
        }

        [HttpGet]
        public ActionResult ThongTin(long id)
        {
            var nhaCungCap = new NCCDAO().ViewDetail(id);
            return View(nhaCungCap);
        }

        [HttpPost]
        public ActionResult ThemMoi(NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                var dao = new NCCDAO();
                long id = dao.Insert(nhaCungCap);
                if (id > 0)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm nhà cung cấp thất bại");
                }
            }
            return View("Index");
        }

        [HttpPost]
        public ActionResult CapNhat(NhaCungCap nhaCungCap)
        {
            if (ModelState.IsValid)
            {
                var dao = new NCCDAO();
                var id = dao.Update(nhaCungCap);
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
        public ActionResult Xoa(NhaCungCap nhaCungCap)
        {
            var dao = new NCCDAO();
            var id = dao.Delete(nhaCungCap);
            if (id)
                return RedirectToAction("Index");
            else
                return View();
        }

        public void Ds_NhaCungCap()
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            var model = db.NhaCungCaps.ToList();

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

            using (var Ep = new ExcelPackage(new FileInfo("NhaCungCap.xlsx")))
            {
                ExcelWorksheet Sheet = Ep.Workbook.Worksheets.Add("Report");
                Sheet.Cells["A1"].Value = "Mã NCC";
                Sheet.Cells["B1"].Value = "Tên";
                Sheet.Cells["C1"].Value = "Số điện thoại";
                Sheet.Cells["D1"].Value = "Địa chỉ";
                Sheet.Cells["E1"].Value = "Email";
                Sheet.Cells["F1"].Value = "Mã thuế";
                Sheet.Cells["G1"].Value = "Ghi Chú";
                int row = 2;
                foreach (var item in model)
                {

                    Sheet.Cells[string.Format("A{0}", row)].Value = item.MaNCC;
                    Sheet.Cells[string.Format("B{0}", row)].Value = item.TenNCC;
                    Sheet.Cells[string.Format("C{0}", row)].Value = item.SoDT;
                    Sheet.Cells[string.Format("D{0}", row)].Value = item.DiaChi;
                    Sheet.Cells[string.Format("E{0}", row)].Value = item.Email;
                    Sheet.Cells[string.Format("F{0}", row)].Value = item.MaThue;
                    Sheet.Cells[string.Format("G{0}", row)].Value = item.GhiChu;
                    row++;
                }


                Sheet.Cells["A:AZ"].AutoFitColumns();
                Response.Clear();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment: filename=" + "NhaCungCap.xlsx");
                Response.BinaryWrite(Ep.GetAsByteArray());
                Response.End();
            }

        }

    }
}