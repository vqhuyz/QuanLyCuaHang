using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class KhachHangDAO
    {
        OnlineShopDbContext db;

        public KhachHangDAO()
        {
            db = new OnlineShopDbContext();
        }

        public IEnumerable<KhachHang> ListAllPaging(string search,int page, int pagesize)
        {
            IQueryable<KhachHang> model = db.KhachHangs;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.TenKH.Contains(search) || x.SoCMND.Contains(search));
            }
            return model.OrderByDescending(x => x.MaKH).ToPagedList(page, pagesize);
        }

        public KhachHang ViewDetail(long id)
        {
            return db.KhachHangs.Find(id);
        }
        public long Insert(KhachHang entity)
        {
            entity.NgayDangKi = DateTime.Now;
            db.KhachHangs.Add(entity);
            db.SaveChanges();
            return entity.MaKH;
        }

        public bool Update(KhachHang entity)
        {
            try
            {
                var khachHang = db.KhachHangs.Find(entity.MaKH);

                khachHang.SoDT = entity.SoDT;
                khachHang.DiaChi = entity.DiaChi;
                khachHang.Email = entity.Email;
                khachHang.Facebook = entity.Facebook;
                khachHang.GhiChu = entity.GhiChu;

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(KhachHang entity)
        {
            try
            {
                var khachHang = db.KhachHangs.Find(entity.MaKH);
                db.KhachHangs.Remove(khachHang);
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
