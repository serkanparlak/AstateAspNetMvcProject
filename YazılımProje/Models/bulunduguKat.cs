using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class bulunduguKat
    {
        public bulunduguKat()
        {
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
        }

        public int bulunduguKatId { get; set; }
        public string bulunduguKatAdi { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
