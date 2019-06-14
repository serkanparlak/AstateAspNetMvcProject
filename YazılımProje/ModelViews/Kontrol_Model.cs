using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YazılımProje.ModelViews
{
    public class Kontrol_Model
    {
        public int kategori { get; set; }
        public int metrekare { get; set; }
        public decimal fiyat { get; set; }
        public decimal depozito { get; set; }
        public int il { get; set; }
        public int ilce { get; set; }
        public string adres { get; set; }
        public int yasi { get; set; }
        public int isitmaTuru { get; set; }
        public int katSayisi { get; set; }
        public int bulunduguKat { get; set; }
        public int konutTuru { get; set; }
        public int odaSayisi { get; set; }
        public System.DateTime ilanTarihi { get; set; }
        public int aktif { get; set; }
        public string baslik { get; set; }
        public int esyaDurumu { get; set; }
        public string aciklama { get; set; }
        public int id { get; set; }
    }
}