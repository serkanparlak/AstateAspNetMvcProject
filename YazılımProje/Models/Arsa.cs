using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Arsa
    {
        public int ArsaId { get; set; }
        public Nullable<int> kategori { get; set; }
        public Nullable<int> sahipId { get; set; }
        public Nullable<int> arsaTuru { get; set; }
        public string baslik { get; set; }
        public Nullable<decimal> fiyat { get; set; }
        public Nullable<decimal> depozito { get; set; }
        public Nullable<bool> aktif { get; set; }
        public Nullable<int> il { get; set; }
        public Nullable<int> ilce { get; set; }
        public string adres { get; set; }
        public Nullable<int> metrekare { get; set; }
        public string aciklama { get; set; }
        public Nullable<System.DateTime> ilanTarihi { get; set; }
        public string kucukResim { get; set; }
        public virtual ArsaTuru ArsaTuru1 { get; set; }
        public virtual ilceler ilceler { get; set; }
        public virtual iller iller { get; set; }
        public virtual Kullanici Kullanici { get; set; }
    }
}
