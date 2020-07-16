namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OnlineShopDbContext : DbContext
    {
        public OnlineShopDbContext()
            : base("name=OnlineShopDbContext")
        {
        }

        public virtual DbSet<ChucNang> ChucNangs { get; set; }
        public virtual DbSet<CTDH> CTDHs { get; set; }
        public virtual DbSet<CTHD> CTHDs { get; set; }
        public virtual DbSet<CTPG> CTPGs { get; set; }
        public virtual DbSet<CTTH> CTTHs { get; set; }
        public virtual DbSet<DatHang> DatHangs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiSanPham> LoaiSanPhams { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhieuGiao> PhieuGiaos { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<TraHang> TraHangs { get; set; }
        public virtual DbSet<VaiTro> VaiTroes { get; set; }
        public virtual DbSet<VaiTro_ChucNang> VaiTro_ChucNang { get; set; }
        public virtual DbSet<VAT> VATs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChucNang>()
                .Property(e => e.MaChucNang)
                .IsUnicode(false);

            modelBuilder.Entity<ChucNang>()
                .HasMany(e => e.VaiTro_ChucNang)
                .WithRequired(e => e.ChucNang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CTDH>()
                .Property(e => e.DonGia)
                .IsFixedLength();

            modelBuilder.Entity<CTHD>()
                .Property(e => e.GiaBan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<CTPG>()
                .Property(e => e.DonGia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<CTTH>()
                .Property(e => e.DonGia)
                .IsFixedLength();

            modelBuilder.Entity<DatHang>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DatHang>()
                .HasMany(e => e.CTDHs)
                .WithRequired(e => e.DatHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoCMND)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.KhachHang)
                .WillCascadeOnDelete();

            modelBuilder.Entity<LoaiSanPham>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.LoaiSanPham)
                .WillCascadeOnDelete();

            modelBuilder.Entity<NhaCungCap>()
                .Property(e => e.MaThue)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoCMND)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MucLuong)
                .HasPrecision(19, 4);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaVaiTro)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.NhanVien)
                .WillCascadeOnDelete();

            modelBuilder.Entity<PhieuGiao>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<PhieuGiao>()
                .HasMany(e => e.CTPGs)
                .WithRequired(e => e.PhieuGiao)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaNhap)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaBan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaMoi)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.CTDHs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.CTPGs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.CTTHs)
                .WithRequired(e => e.SanPham)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TraHang>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<TraHang>()
                .HasMany(e => e.CTTHs)
                .WithRequired(e => e.TraHang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<VaiTro>()
                .Property(e => e.MaVaiTro)
                .IsUnicode(false);

            modelBuilder.Entity<VaiTro>()
                .HasMany(e => e.VaiTro_ChucNang)
                .WithRequired(e => e.VaiTro)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<VaiTro_ChucNang>()
                .Property(e => e.MaVaiTro)
                .IsUnicode(false);

            modelBuilder.Entity<VaiTro_ChucNang>()
                .Property(e => e.MaChucNang)
                .IsUnicode(false);

            modelBuilder.Entity<VAT>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.VAT1)
                .HasForeignKey(e => e.VAT);
        }
    }
}
