namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            CTHDs = new HashSet<CTHD>();
        }

        [Key]
        [Display(Name ="Mã hóa đơn")]
        public long MaHD { get; set; }

        [Display(Name ="Tổng số lượng")]
        public int? TongSL { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Tổng tiền")]
        public decimal? TongTien { get; set; }

        [Column(TypeName = "date")]
        [Display(Name = "Ngày bán")]
        public DateTime NgayBan { get; set; }

        [Display(Name = "Người bán")]
        public long? MaNV { get; set; }

        [Display(Name = "Khách hàng")]
        public long? MaKH { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHD> CTHDs { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
