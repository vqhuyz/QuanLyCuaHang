using Model.Content;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHang.Common
{
    public class KiemTraQuyenAttribute : AuthorizeAttribute
    {
        public string MaChucNang { set; get; }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = (NhanVien)HttpContext.Current.Session[Common.CommonConstant.USER_SESSION];
            if (session == null)
            {
                return false;
            }

            List<string> privilegeLevels = this.ChucNang_VaiTro(session.TaiKhoan); // Call another method to get rights of the user from DB

            if (privilegeLevels.Contains(this.MaChucNang) || session.MaVaiTro == CommonConstants.ADMIN_GROUP)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new ViewResult
            {
                ViewName = "~/Views/Shared/_Error404.cshtml"
            };
        }
        public List<string> ChucNang_VaiTro(string taiKhoan)
        {
            var check = (List<string>)HttpContext.Current.Session[CommonConstant.SESSION_CHECK];
            return check;
        }
    }
}