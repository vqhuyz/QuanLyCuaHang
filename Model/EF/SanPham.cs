namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            CTDHs = new HashSet<CTDH>();
            CTHDs = new HashSet<CTHD>();
            CTPGs = new HashSet<CTPG>();
            CTTHs = new HashSet<CTTH>();
        }

        [Key]
        public long MaSP { get; set; }

        public long? MaLoaiSP { get; set; }

        [StringLength(200)]
        public string TenSP { get; set; }

        public string HinhAnh { get; set; }

        [StringLength(200)]
        public string ThuongHieu { get; set; }

        [Column(TypeName = "money")]
        public decimal? GiaNhap { get; set; }

        [Column(TypeName = "money")]
        public decimal? GiaBan { get; set; }

        public string Mota { get; set; }

        public int? SoLuong { get; set; }

        public DateTime NgayThem { get; set; }

        public DateTime? NgayCapNhat { get; set; }

        public double GiamGia { get; set; }

        [Column(TypeName = "money")]
        public decimal? GiaMoi { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDH> CTDHs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHD> CTHDs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPG> CTPGs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTTH> CTTHs { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }
    }
}
