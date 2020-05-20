namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("VaiTro")]
    public partial class VaiTro
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public VaiTro()
        {
            NhanViens = new HashSet<NhanVien>();
            VaiTro_ChucNang = new HashSet<VaiTro_ChucNang>();
        }

        [Key]
        [StringLength(20)]
        public string MaVaiTro { get; set; }

        [Column("VaiTro")]
        [StringLength(50)]
        public string VaiTro1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NhanVien> NhanViens { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<VaiTro_ChucNang> VaiTro_ChucNang { get; set; }
    }
}
