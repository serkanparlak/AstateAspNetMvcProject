using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YazılımProje.ModelViews
{
    public class IlanSorgu
    {
        public int ilansahibi { get; set; }
        public int ilanTuru { get; set; }
        public int kategori { get; set; }
        public string ozelarama { get; set; }
        public int[] odasayisi { get; set; }
        public int[] konutturu { get; set; }
        public int il { get; set; }
        public int ilce { get; set; }
        public string[] fiyat { get; set; }
        public string[] metrekare { get; set; }
        public int[] isitmaturu { get; set; }
    }
}