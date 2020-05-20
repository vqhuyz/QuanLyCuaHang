namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        [Display(Name = "Mã nhân viên")]
        public long MaNV { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên nhân viên")]
        public string TenNV { get; set; }

        [Display(Name = "Hình ảnh")]
        public string HinhAnh { get; set; }

        [StringLength(10)]
        [Display(Name = "Giới tính")]
        public string GioiTinh { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Ngày sinh")]
        public DateTime NgaySinh { get; set; }

        [StringLength(12)]
        [Display(Name = "Số chứng minh")]
        public string SoCMND { get; set; }

        [StringLength(10)]
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }

        [StringLength(50)]
        [Display(Name = "Chức vụ")]
        public string ChucVu { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Tiền lương")]
        public decimal? MucLuong { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        [StringLength(200)]
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }

        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }

        [Display(Name = "Ngày tham gia")]
        public DateTime NgayThamGia { get; set; }

        [StringLength(50)]
        [Display(Name = "Tài khoản")]
        public string TaiKhoan { get; set; }

        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }

        [StringLength(20)]
        [Display(Name = "Quyền truy cập")]
        public string MaVaiTro { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        public virtual VaiTro VaiTro { get; set; }
    }
}
