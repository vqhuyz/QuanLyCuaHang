using BanHang.Common;
using BanHang.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace BanHang.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult Login(DangNhapModel model)
        {
            NhanVien userSession = new NhanVien();
            if (ModelState.IsValid)
            {
                var dao = new UserDAO();
                var result = dao.Login(model.TaiKhoan, Encryptor.MD5Hash(model.MatKhau), true);
                if (result == 1)
                {
                    var user = dao.GetByID(model.TaiKhoan);
                    userSession.MaNV = user.MaNV;
                    userSession.TenNV = user.TenNV;
                    userSession.TaiKhoan = user.TaiKhoan;
                    userSession.HinhAnh = user.HinhAnh;
                    userSession.Email = user.Email;
                    userSession.ChucVu = user.ChucVu;
                    userSession.SoCMND = user.SoCMND;
                    userSession.NgaySinh = user.NgaySinh;
                    userSession.SoDT = user.SoDT;
                    userSession.DiaChi = user.DiaChi;
                    userSession.MaVaiTro = user.MaVaiTro;
                    var listChucNang = dao.DsChucNang(model.TaiKhoan);
                    Session.Add(CommonConstant.SESSION_CHECK, listChucNang);
                    Session.Add(CommonConstant.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");

                }
                else if (result == -1)
                {
                    ModelState.AddModelError("", "Sai mật khẩu");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại");
                }
                else if (result == 2)
                {
                    ModelState.AddModelError("", "Tài khoản đã bị khóa");
                }

            }
            return View("Index");
        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Login");
        }

    }
}