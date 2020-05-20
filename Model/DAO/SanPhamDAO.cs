using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class SanPhamDAO
    {
        OnlineShopDbContext db;

        public SanPhamDAO()
        {
            db = new OnlineShopDbContext();
        }


        public IEnumerable<SanPham> ListAllPaging(string search, int page, int pagesize)
        {
            IQueryable<SanPham> model = db.SanPhams;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.TenSP.Contains(search));
            }
            return model.OrderByDescending(x => x.MaSP).ToPagedList(page, pagesize);
        }

        public SanPham ViewDetail(long id)
        {
            return db.SanPhams.Find(id);
        }

        public bool BanHang(SanPham entity)
        {
            var sanPham = db.SanPhams.Find(entity.MaSP);
            sanPham.SoLuong = entity.SoLuong;
            db.SaveChanges();
            return true;
        }

        public bool Update(SanPham entity)
        {
            try
            {
                var sanPham = db.SanPhams.Find(entity.MaSP);

                sanPham.TenSP = entity.TenSP;
                sanPham.MaLoaiSP = entity.MaLoaiSP;
                sanPham.MaNCC = entity.MaNCC;
                sanPham.ThuongHieu = entity.ThuongHieu;
                sanPham.GiaBan = entity.GiaBan;
                sanPham.GiaNhap = entity.GiaNhap;
                sanPham.SoLuong = entity.SoLuong;
                sanPham.Mota = entity.Mota;
                sanPham.NgayCapNhat = DateTime.Now;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(SanPham entity)
        {
            try
            {
                var sanPham = db.SanPhams.Find(entity.MaSP);
                db.SanPhams.Remove(sanPham);
                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool CapNhatSoLuong(SanPham entity)
        {
            try
            {
                var sanPham = db.SanPhams.Find(entity.MaSP);
               
                sanPham.SoLuong = entity.SoLuong;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
