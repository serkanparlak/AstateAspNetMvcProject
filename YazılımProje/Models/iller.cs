using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class iller
    {
        public iller()
        {
            this.Arsas = new List<Arsa>();
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
        }

        public int ilId { get; set; }
        public string sehir { get; set; }
        public virtual ICollection<Arsa> Arsas { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
