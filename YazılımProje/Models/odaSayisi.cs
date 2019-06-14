using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class odaSayisi
    {
        public odaSayisi()
        {
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
        }

        public int odaSayisiId { get; set; }
        public string odaSayisiAdi { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
