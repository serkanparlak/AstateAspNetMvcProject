using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Mesajlar
    {
        public int id { get; set; }
        public int gönderenID { get; set; }
        public int aliciID { get; set; }
        public Nullable<System.DateTime> tarih { get; set; }
        public Nullable<bool> okundumu { get; set; }
        public string mesaj { get; set; }
        public string konu { get; set; }
        public virtual Kullanici Kullanici { get; set; }
        public virtual Kullanici Kullanici1 { get; set; }
    }
}
