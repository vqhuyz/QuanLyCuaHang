using Model.EF;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CTHD_DAO
    {
        OnlineShopDbContext db;
        public CTHD_DAO()
        {
            db = new OnlineShopDbContext();
        }

        public bool Insert(CTHD chiTiet)
        {
            try
            {
                db.CTHDs.Add(chiTiet);
                db.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }

    }
}
