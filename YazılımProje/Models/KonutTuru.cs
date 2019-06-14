using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class KonutTuru
    {
        public KonutTuru()
        {
            this.Konuts = new List<Konut>();
        }

        public int konutTuruId { get; set; }
        public string konutTuruAdi { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
