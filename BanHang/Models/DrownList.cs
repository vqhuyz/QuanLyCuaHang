using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanHang.Models
{
    public class DrownList
    {
        OnlineShopDbContext db = new OnlineShopDbContext();
        public List<LoaiSanPham> ListLoaiSP()
        {
            return db.LoaiSanPhams.ToList();
        }

        public List<NhaCungCap> ListNCC()
        {
            return db.NhaCungCaps.ToList();
        }

        public List<KhachHang> ListKH()
        {
            return db.KhachHangs.ToList();
        }

    }
}