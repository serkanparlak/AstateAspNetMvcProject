using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class ilceler
    {
        public ilceler()
        {
            this.Arsas = new List<Arsa>();
            this.Isyeris = new List<Isyeri>();
            this.Konuts = new List<Konut>();
        }

        public int ilceId { get; set; }
        public string ilce { get; set; }
        public int sehirId { get; set; }
        public virtual ICollection<Arsa> Arsas { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
        public virtual ICollection<Konut> Konuts { get; set; }
    }
}
