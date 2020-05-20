using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class NhanVienDAO
    {
        OnlineShopDbContext db;

        public NhanVienDAO()
        {
            db = new OnlineShopDbContext();
        }

        public IEnumerable<NhanVien> ListAllPaging(string search, int page, int pagesize)
        {
            IQueryable<NhanVien> model = db.NhanViens;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.TenNV.Contains(search) || x.ChucVu.Contains(search));
            }
            return model.OrderByDescending(x => x.MaNV).ToPagedList(page, pagesize);
        }

        public NhanVien ViewDetail(long id)
        {
            return db.NhanViens.Find(id);
        }

        public bool ProfileUpdate(NhanVien entity)
        {
            try
            {
                var nhanVien = db.NhanViens.Find(entity.MaNV);
                nhanVien.SoDT = entity.SoDT;
                nhanVien.Email = entity.Email;
                nhanVien.DiaChi = entity.DiaChi;
                nhanVien.SoCMND = entity.SoCMND;
                nhanVien.NgaySinh = entity.NgaySinh;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Update(NhanVien entity)
        {
            try
            {
                var nhanVien = db.NhanViens.Find(entity.MaNV);

                nhanVien.ChucVu = entity.ChucVu;
                nhanVien.MaVaiTro = entity.MaVaiTro;
                nhanVien.MucLuong = entity.MucLuong;
                nhanVien.GhiChu = entity.GhiChu;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(NhanVien entity)
        {
            try
            {
                var nhanVien = db.NhanViens.Find(entity.MaNV);
                db.NhanViens.Remove(nhanVien);
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
