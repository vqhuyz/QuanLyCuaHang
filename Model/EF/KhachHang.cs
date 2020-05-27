namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("KhachHang")]
    public partial class KhachHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KhachHang()
        {
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        public long MaKH { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên khách hàng")]
        public string TenKH { get; set; }

        [StringLength(12)]
        [Display(Name = "Số chứng minh")]
        public string SoCMND { get; set; }

        [StringLength(10)]
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Ngày sinh")]
        public DateTime NgaySinh { get; set; }

        [StringLength(200)]
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }

        [StringLength(10)]
        [Display(Name = "Giới tính")]
        public string GioiTinh { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        [StringLength(200)]
        public string Facebook { get; set; }

        [Display(Name = "Ngày đăng kí")]
        public DateTime? NgayDangKi { get; set; }

        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }
    }
}