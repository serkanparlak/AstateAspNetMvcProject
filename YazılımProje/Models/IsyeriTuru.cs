using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class IsyeriTuru
    {
        public IsyeriTuru()
        {
            this.Isyeris = new List<Isyeri>();
        }

        public int isyeriTuruId { get; set; }
        public string isyeriTuruAdi { get; set; }
        public virtual ICollection<Isyeri> Isyeris { get; set; }
    }
}
