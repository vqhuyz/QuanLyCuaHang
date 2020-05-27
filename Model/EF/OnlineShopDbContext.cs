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
        public virtual DbSet<CTHD> CTHDs { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiSanPham> LoaiSanPhams { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }
        public virtual DbSet<VaiTro> VaiTroes { get; set; }
        public virtual DbSet<VaiTro_ChucNang> VaiTro_ChucNang { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChucNang>()
                .Property(e => e.MaChucNang)
                .IsUnicode(false);

            modelBuilder.Entity<ChucNang>()
                .HasMany(e => e.VaiTro_ChucNang)
                .WithRequired(e => e.ChucNang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CTHD>()
                .Property(e => e.GiaBan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoCMND)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoDT)
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
                .Property(e => e.SoDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhaCungCap>()
                .Property(e => e.MaThue)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhaCungCap>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.NhaCungCap)
                .WillCascadeOnDelete();

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoCMND)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoDT)
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

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaNhap)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaBan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.GiaMoi)
                .HasPrecision(19, 4);

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
        }
    }
}
