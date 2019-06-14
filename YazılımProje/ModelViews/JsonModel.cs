using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YazılımProje.ModelViews
{
    public enum GirisTip
    {
        Kullanici,
        Yonetici
    }
    public class JsonModel
    {
        public GirisTip Giris;
        public bool IsSuccess;
        public string Mesaj;
    }
}