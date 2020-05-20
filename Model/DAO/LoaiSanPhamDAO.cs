using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class LoaiSanPhamDAO
    {
        OnlineShopDbContext db;

        public LoaiSanPhamDAO()
        {
            db = new OnlineShopDbContext();
        }


        public IEnumerable<LoaiSanPham> ListAllPaging(int page, int pagesize)
        {
            return db.LoaiSanPhams.OrderByDescending(x=>x.MaLoaiSP).ToPagedList(page, pagesize);
        }

        public LoaiSanPham ViewDetail(long id)
        {
            return db.LoaiSanPhams.Find(id);
        }

        public long Insert(LoaiSanPham entity)
        {
            db.LoaiSanPhams.Add(entity);
            db.SaveChanges();
            return entity.MaLoaiSP;
        }

        public bool Update(LoaiSanPham entity)
        {
            try
            {
                var loaiSP = db.LoaiSanPhams.Find(entity.MaLoaiSP);

                loaiSP.TenLoai = entity.TenLoai;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(LoaiSanPham entity)
        {
            try
            {
                var loaiSP = db.LoaiSanPhams.Find(entity.MaLoaiSP);
                db.LoaiSanPhams.Remove(loaiSP);
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
