﻿using BanHang.Common;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Controllers
{
    public class ThongTinCaNhanController : Controller
    {
        // GET: ThongTinCaNhan
        public ActionResult Index(NhanVien nv)
        {
            return View(nv);
        }

        [ValidateAntiForgeryToken]
        public ActionResult ProfileUpdate(NhanVien nhanVien)
        {
            var dao = new NhanVienDAO();
            var id = dao.ProfileUpdate(nhanVien);
            if (id)
            {
                return RedirectToAction("Logout", "Login");
            }
            return View("Index");
        }

        [ValidateAntiForgeryToken]
        public ActionResult ThayDoiMatKhau(NhanVien model, FormCollection collection)
        {
            OnlineShopDbContext db = new OnlineShopDbContext();
            var matKhauCu = collection["MatKhauCU"];
            var matKhauMoi = collection["MatKhauMoi"];
            var nhaplaiMK = collection["NhapLaiMK"];
            var encryptedMd5Pas = Encryptor.MD5Hash(matKhauCu);
            var newPass = Encryptor.MD5Hash(matKhauMoi);
            var dao = new NhanVienDAO();
            model = dao.ViewDetail(model.MaNV);
            if (model.MatKhau == encryptedMd5Pas)
            {
                if (matKhauMoi == nhaplaiMK)
                {
                    var nhanvien = db.NhanViens.Find(model.MaNV);
                    nhanvien.MatKhau = newPass;

                    db.SaveChanges();

                    return RedirectToAction("Logout", "Login");

                }
                else
                    return RedirectToAction("Index", "Home");
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
    }
}