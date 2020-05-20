using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class HoaDonDAO
    {
        OnlineShopDbContext db;
        public HoaDonDAO()
        {
            db = new OnlineShopDbContext();
        }

        public HoaDon ViewDetail(long id)
        {
            return db.HoaDons.Find(id);
        }

        public IEnumerable<HoaDon> ListAllPaging(string search, int page, int pagesize)
        {
            IQueryable<HoaDon> model = db.HoaDons;
            if (!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.KhachHang.TenKH.Contains(search));
            }
            return model.OrderByDescending(x => x.MaHD).ToPagedList(page, pagesize);
        }

        public long Insert(HoaDon hoaDon)
        {
            db.HoaDons.Add(hoaDon);
            db.SaveChanges();
            return hoaDon.MaHD;
        }

        public bool Delete(HoaDon entity)
        {
            try
            {
                var hoaDon = db.HoaDons.Find(entity.MaHD);
                db.HoaDons.Remove(hoaDon);
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
