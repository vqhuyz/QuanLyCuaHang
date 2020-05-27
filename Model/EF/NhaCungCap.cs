namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhaCungCap")]
    public partial class NhaCungCap
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhaCungCap()
        {
            SanPhams = new HashSet<SanPham>();
        }

        [Key]
        public long MaNCC { get; set; }

        [StringLength(200)]
        [Display(Name = "Tên nhà cung cấp")]
        public string TenNCC { get; set; }

        [StringLength(10)]
        [Display(Name = "Số điện thoại")]
        public string SoDT { get; set; }

        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }

        [StringLength(200)]
        public string Email { get; set; }

        [StringLength(10)]
        [Display(Name = "Mã số thuế")]
        public string MaThue { get; set; }

        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPhams { get; set; }
    }
}