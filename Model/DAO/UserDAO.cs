using Model.Content;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class UserDAO
    {
        OnlineShopDbContext db;

        public UserDAO()
        {
            db = new OnlineShopDbContext();
        }

        public long Insert(NhanVien entity)
        {
            db.NhanViens.Add(entity);
            db.SaveChanges();
            return entity.MaNV;
        }

        public NhanVien GetByID(string taiKhoan)
        {
            return db.NhanViens.SingleOrDefault(x => x.TaiKhoan == taiKhoan);
        }

        public int Login(string taiKhoan, string matKhau, bool isLoginAdmin = false)
        {
            var result = db.NhanViens.Where(x => x.TaiKhoan == taiKhoan).SingleOrDefault();
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (isLoginAdmin == true)
                {
                    {
                        if (result.MaVaiTro == CommonConstants.ADMIN_GROUP || result.MaVaiTro == CommonConstants.USER_GROUP)
                        {
                            if (result.MatKhau == matKhau)
                            {
                                return 1;
                            }
                            else
                                return -1;
                        }
                    }
                }
                return 2;
            }
        }

        public List<string> DsChucNang(string taiKhoan)
        {
            var user = db.NhanViens.Single(x => x.TaiKhoan == taiKhoan);
            var data = (from a in db.VaiTro_ChucNang
                        join b in db.VaiTroes on a.MaVaiTro equals b.MaVaiTro
                        join c in db.ChucNangs on a.MaChucNang equals c.MaChucNang
                        where b.MaVaiTro == user.MaVaiTro
                        select new
                        {
                            MaVaiTro = a.MaVaiTro,
                            MaChucNang = a.MaChucNang
                        }).AsEnumerable().Select(x => new VaiTro_ChucNang()
                        {
                            MaChucNang = x.MaChucNang,
                            MaVaiTro = x.MaVaiTro
                        });
            return data.Select(x => x.MaChucNang).ToList();

        }
    }
}
