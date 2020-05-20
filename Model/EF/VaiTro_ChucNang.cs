namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class VaiTro_ChucNang
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string MaVaiTro { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(50)]
        public string MaChucNang { get; set; }

        [Column(TypeName = "ntext")]
        public string GhiChu { get; set; }

        public virtual ChucNang ChucNang { get; set; }

        public virtual VaiTro VaiTro { get; set; }
    }
}
