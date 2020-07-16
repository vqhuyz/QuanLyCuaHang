namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CTTH")]
    public partial class CTTH
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaTraHang { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long MaSP { get; set; }

        public int? SoLuong { get; set; }

        [StringLength(10)]
        public string TongTien { get; set; }

        public virtual SanPham SanPham { get; set; }

        public virtual TraHang TraHang { get; set; }
    }
}
