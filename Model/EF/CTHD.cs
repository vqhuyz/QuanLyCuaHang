namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTHD")]
    public partial class CTHD
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaHD { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaSP { get; set; }

        [StringLength(200)]
        [Display(Name = "Tên sản phẩm")]
        public string TenSP { get; set; }

        [Display(Name = "Số lượng")]
        public int? SoLuong { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Giá bán")]
        public decimal? GiaBan { get; set; }

        public virtual HoaDon HoaDon { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
