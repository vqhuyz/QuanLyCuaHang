namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChucNang")]
    public partial class ChucNang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChucNang()
        {
            VaiTro_ChucNang = new HashSet<VaiTro_ChucNang>();
        }

        [Key]
        [StringLength(50)]
        public string MaChucNang { get; set; }

        [StringLength(50)]
        public string TenChucNang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VaiTro_ChucNang> VaiTro_ChucNang { get; set; }
    }
}
