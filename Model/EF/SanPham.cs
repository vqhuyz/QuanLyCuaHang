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
            CTHDs = new HashSet<CTHD>();
        }

        [Key]
        public long MaSP { get; set; }

        [Display(Name = "Nhà cung cấp")]
        public long? MaNCC { get; set; }

        [Display(Name = "Loại sản phẩm")]
        public long? MaLoaiSP { get; set; }

        [StringLength(200)]
        [Display(Name = "Tên sản phẩm")]
        public string TenSP { get; set; }

        [Display(Name = "Hình ảnh")]
        public string HinhAnh { get; set; }

        [StringLength(200)]
        [Display(Name = "Thương hiệu")]
        public string ThuongHieu { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Giá nhập")]
        public decimal? GiaNhap { get; set; }

        [Column(TypeName = "money")]
        [Display(Name = "Giá bán")]
        public decimal? GiaBan { get; set; }

        [Display(Name = "Ghi chú")]
        public string Mota { get; set; }

        [Display(Name = "Số lượng")]
        public int? SoLuong { get; set; }

        [Display(Name = "Ngày nhập")]
        public DateTime NgayThem { get; set; }

        [Display(Name = "Cập nhật")]
        public DateTime? NgayCapNhat { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTHD> CTHDs { get; set; }

        public virtual LoaiSanPham LoaiSanPham { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }
    }
}
