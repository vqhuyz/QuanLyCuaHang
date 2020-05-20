using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BanHang.Models
{
    public class DangNhapModel
    {
        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = "Nhập tài khoản")]
        public string TaiKhoan { get; set; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Nhập mật khẩu")]
        public string MatKhau { get; set; }
    }
}