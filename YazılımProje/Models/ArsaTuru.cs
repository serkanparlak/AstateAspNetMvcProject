using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class ArsaTuru
    {
        public ArsaTuru()
        {
            this.Arsas = new List<Arsa>();
        }

        public int arsaTuruId { get; set; }
        public string arsaTuruAdi { get; set; }
        public virtual ICollection<Arsa> Arsas { get; set; }
    }
}
