using System;
using System.Collections.Generic;

namespace YazılımProje.Models
{
    public partial class Yonetici
    {
        public int YoneticiID { get; set; }
        public string AdSoyad { get; set; }
        public string Sifre { get; set; }
        public string Email { get; set; }
    }
}
