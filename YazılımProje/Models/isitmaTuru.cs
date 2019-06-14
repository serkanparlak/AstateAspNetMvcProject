using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class isitmaTuru
    {
        public isitmaTuru()
        {
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
        }

        public int isitmaTuruId { get; set; }
        public string isitmaTuruAdi { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
