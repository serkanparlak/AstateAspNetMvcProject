using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Konut
    {
        public int KonutId { get; set; }
        public Nullable<int> kategori { get; set; }
        public Nullable<int> sahipId { get; set; }
        public Nullable<int> metrekare { get; set; }
        public Nullable<decimal> fiyat { get; set; }
        public Nullable<decimal> depozito { get; set; }
        public Nullable<int> il { get; set; }
        public Nullable<int> ilce { get; set; }
        public string adres { get; set; }
        public Nullable<int> yasi { get; set; }
        public Nullable<int> isitmaTuru { get; set; }
        public Nullable<int> katSayisi { get; set; }
        public Nullable<int> bulunduguKat { get; set; }
        public Nullable<int> konutTuru { get; set; }
        public Nullable<int> odaSayisi { get; set; }
        public Nullable<System.DateTime> ilanTarihi { get; set; }
        public Nullable<bool> aktif { get; set; }
        public string baslik { get; set; }
        public Nullable<bool> esyaDurumu { get; set; }
        public string aciklama { get; set; }
        public string kucukResim { get; set; }
        public virtual bulunduguKat bulunduguKat1 { get; set; }
        public virtual ilceler ilceler { get; set; }
        public virtual iller iller { get; set; }
        public virtual isitmaTuru isitmaTuru1 { get; set; }
        public virtual KonutTuru KonutTuru1 { get; set; }
        public virtual Kullanici Kullanici { get; set; }
        public virtual odaSayisi odaSayisi1 { get; set; }
    }
}
