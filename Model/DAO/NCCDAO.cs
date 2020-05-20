using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class NCCDAO
    {
        OnlineShopDbContext db;

        public NCCDAO()
        {
            db = new OnlineShopDbContext();
        }

        public IEnumerable<NhaCungCap> ListAllPaging(string search,int page, int pagesize)
        {
            IQueryable<NhaCungCap> model = db.NhaCungCaps;
            if(!string.IsNullOrEmpty(search))
            {
                model = model.Where(x => x.TenNCC.Contains(search));
            }
            return model.OrderByDescending(x => x.MaNCC).ToPagedList(page, pagesize);
        }

        public NhaCungCap ViewDetail(long id)
        {
            return db.NhaCungCaps.Find(id);
        }
        public long Insert(NhaCungCap entity)
        {
            db.NhaCungCaps.Add(entity);
            db.SaveChanges();
            return entity.MaNCC;
        }

        public bool Update(NhaCungCap entity)
        {
            try
            {
                var nhaCungCap = db.NhaCungCaps.Find(entity.MaNCC);

                nhaCungCap.TenNCC = entity.TenNCC;
                nhaCungCap.SoDT = entity.SoDT;
                nhaCungCap.DiaChi = entity.DiaChi;
                nhaCungCap.Email = entity.Email;
                nhaCungCap.MaThue = entity.MaThue;
                nhaCungCap.GhiChu = entity.GhiChu;

                db.SaveChanges();

                return true;
            }
            catch(Exception ex)
            {
                return false;
            }            
        }

        public bool Delete(NhaCungCap entity)
        {
            try
            {
                var nhaCungCap = db.NhaCungCaps.Find(entity.MaNCC);
                db.NhaCungCaps.Remove(nhaCungCap);
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
