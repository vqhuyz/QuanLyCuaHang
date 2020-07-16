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
            DatHangs = new HashSet<DatHang>();
            HoaDons = new HashSet<HoaDon>();
        }

        [Key]
        public long MaNV { get; set; }

        [StringLength(50)]
        public string TenNV { get; set; }

        public string HinhAnh { get; set; }

        [StringLength(10)]
        public string GioiTinh { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgaySinh { get; set; }

        [StringLength(20)]
        public string SoCMND { get; set; }

        public int? SoDT { get; set; }

        [StringLength(50)]
        public string ChucVu { get; set; }

        [Column(TypeName = "money")]
        public decimal? MucLuong { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        [StringLength(200)]
        public string DiaChi { get; set; }

        public string GhiChu { get; set; }

        public DateTime NgayThamGia { get; set; }

        [StringLength(50)]
        public string TaiKhoan { get; set; }

        public string MatKhau { get; set; }

        [StringLength(20)]
        public string MaVaiTro { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DatHang> DatHangs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoaDon> HoaDons { get; set; }

        public virtual VaiTro VaiTro { get; set; }
    }
}
