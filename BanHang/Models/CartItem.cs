﻿using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanHang.Models
{
    [Serializable]
    public class CartItem
    {
        public SanPham SanPham { set; get; }
        public int SoLuong { set; get; }
    }
}