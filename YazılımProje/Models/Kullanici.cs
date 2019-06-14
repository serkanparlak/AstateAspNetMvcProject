using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Kullanici
    {
        public Kullanici()
        {
            this.Arsas = new List<Arsa>();
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
            this.Mesajlars = new List<Mesajlar>();
            this.Mesajlars1 = new List<Mesajlar>();
        }

        public int KullaniciId { get; set; }
        public string AdSoyad { get; set; }
        public string Sifre { get; set; }
        public Nullable<int> Il { get; set; }
        public Nullable<int> Ilce { get; set; }
        public string Adres { get; set; }
        public string Email { get; set; }
        public string Telefon { get; set; }
        public Nullable<System.DateTime> KayitTarihi { get; set; }
        public virtual ICollection<Arsa> Arsas { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
        public virtual ICollection<Mesajlar> Mesajlars { get; set; }
        public virtual ICollection<Mesajlar> Mesajlars1 { get; set; }
    }
}
