using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Resim
    {
        public int ResimId { get; set; }
        public Nullable<int> IlanTuruId { get; set; }
        public Nullable<int> KayitId { get; set; }
        public string ResimAdresi { get; set; }
    }
}
