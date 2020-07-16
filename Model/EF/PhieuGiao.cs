namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuGiao")]
    public partial class PhieuGiao
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuGiao()
        {
            CTPGs = new HashSet<CTPG>();
        }

        [Key]
        public long MaPhieuGiao { get; set; }

        public long? MaDatHang { get; set; }

        public DateTime? NgayGiao { get; set; }

        [Column(TypeName = "money")]
        public decimal? TongTien { get; set; }

        [StringLength(10)]
        public string TrangThai { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTPG> CTPGs { get; set; }

        public virtual DatHang DatHang { get; set; }
    }
}
