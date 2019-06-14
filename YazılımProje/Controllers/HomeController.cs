using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YazılımProje.Models;
using YazılımProje.ModelViews;

namespace YazılımProje.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Login/
        YazilimProjeServerContext ct = new YazilimProjeServerContext();
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public JsonResult LoginKontrol(Yonetici grs)
        {
            JsonModel jModel = new JsonModel();
            jModel.IsSuccess = true;
            Yonetici yn = ct.Yoneticis.SingleOrDefault(x => x.Email == grs.Email && x.Sifre == grs.Sifre);
            if (yn != null)
            {
                Session["Adm"] = yn.YoneticiID;
                Session["kAdi"] = yn.AdSoyad;
                Session["id"] = yn.YoneticiID;
                jModel.Giris = GirisTip.Yonetici;
                return Json(jModel, JsonRequestBehavior.AllowGet);
            }
            Kullanici kl = ct.Kullanicis.SingleOrDefault(x => x.Email == grs.Email && x.Sifre == grs.Sifre);
            if (kl != null)
            {
                Session["Kl"] = kl.KullaniciId;
                Session["kAdi"] = kl.AdSoyad;
                Session["id"] = kl.KullaniciId;
                jModel.Giris = GirisTip.Kullanici;
                return Json(jModel, JsonRequestBehavior.AllowGet);
            }
            jModel.IsSuccess = false;
            return Json(jModel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public JsonResult RegisterKontrol(Kullanici kl)
        {
            JsonModel jModel = new JsonModel();
            Kullanici email = ct.Kullanicis.SingleOrDefault(x => x.Email == kl.Email);
            if (email != null)
            {
                jModel.Mesaj = "E-mail zaten mevcut!";
                jModel.IsSuccess = false;
                return Json(jModel, JsonRequestBehavior.AllowGet);
            }
            Kullanici k = new Kullanici();
            k.AdSoyad = kl.AdSoyad;
            k.Email = kl.Email;
            k.KayitTarihi = DateTime.Now;
            k.Sifre = kl.Sifre;
            k.Telefon = kl.Telefon;
            try
            {
                ct.Kullanicis.Add(k);
                ct.SaveChanges();
            }
            catch
            {
                return Json(false);
            }
            return Json(true);
        }

        public ActionResult Index()
        {
            ViewBag.KonutTuru = ct.KonutTurus.ToList();
            ViewBag.il = ct.illers.ToList();
            ViewBag.OdaSayisi = ct.odaSayisis.ToList();
            ViewBag.isitmaTuru = ct.isitmaTurus.ToList();
            return View();
        }

        public ActionResult KonutSorgula(IlanSorgu sorgu)
        {
            List<Konut> orginal = new List<Konut>();

            if (sorgu.kategori == 0) { orginal = ct.Konuts.ToList(); }
            else{ orginal = ct.Konuts.Where(x => x.kategori == sorgu.kategori).ToList(); }

            if (sorgu.konutturu != null)
            {
                List<Konut> temp = new List<Konut>();
                foreach (int kt in sorgu.konutturu)
                {
                    temp.AddRange(orginal.Where(x => x.konutTuru == kt));
                }
                orginal = temp;
            }
            if (sorgu.il != 0){ orginal = orginal.Where(x => x.il == sorgu.il).ToList(); }
            if (sorgu.odasayisi != null)
            {
                List<Konut> temp = new List<Konut>();
                foreach (int os in sorgu.odasayisi)
                {
                    temp.AddRange(orginal.Where(x => x.odaSayisi == os));
                }
                orginal = temp;
            }
            if (sorgu.isitmaturu != null)
            {
                List<Konut> temp = new List<Konut>();
                foreach (int it in sorgu.isitmaturu)
                {
                    temp.AddRange(orginal.Where(x => x.isitmaTuru == it));
                }
                orginal = temp;
            }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.fiyat >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.fiyat <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (deger1 < deger2) 
                        orginal = orginal.Where(p => p.fiyat > deger1 && p.fiyat < deger2).ToList();
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.metrekare >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.metrekare <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (deger1 < deger2)
                        orginal = orginal.Where(p => p.metrekare >= deger1 && p.metrekare <= deger2).ToList();
                }
            }
            return View(orginal);
        }

        public ActionResult Isyeri()
        {
            ViewBag.isyeriTuru = ct.IsyeriTurus.ToList();
            ViewBag.il = ct.illers.ToList();
            ViewBag.OdaSayisi = ct.odaSayisis.ToList();
            ViewBag.isitmaTuru = ct.isitmaTurus.ToList();
            return View();
        }

        public ActionResult IsyeriSorgula(IlanSorgu sorgu)
        {
            List<Isyeri> orginal = new List<Isyeri>();

            if (sorgu.kategori == 0) { orginal = ct.Isyeris.ToList(); }
            else { orginal = ct.Isyeris.Where(x => x.kategori == sorgu.kategori).ToList(); }

            if (sorgu.konutturu != null)
            {
                List<Isyeri> temp = new List<Isyeri>();
                foreach (int kt in sorgu.konutturu)
                {
                    temp.AddRange(orginal.Where(x => x.isyeriTuru == kt));
                }
                orginal = temp;
            }
            if (sorgu.il != 0) { orginal = orginal.Where(x => x.il == sorgu.il).ToList(); }
            if (sorgu.odasayisi != null)
            {
                List<Isyeri> temp = new List<Isyeri>();
                foreach (int os in sorgu.odasayisi)
                {
                    temp.AddRange(orginal.Where(x => x.odaSayisi == os));
                }
                orginal = temp;
            }
            if (sorgu.isitmaturu != null)
            {
                List<Isyeri> temp = new List<Isyeri>();
                foreach (int it in sorgu.isitmaturu)
                {
                    temp.AddRange(orginal.Where(x => x.isitmaTuru == it));
                }
                orginal = temp;
            }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.fiyat >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.fiyat <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (deger1 < deger2)
                        orginal = orginal.Where(p => p.fiyat > deger1 && p.fiyat < deger2).ToList();
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.metrekare >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.metrekare <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (deger1 < deger2)
                        orginal = orginal.Where(p => p.metrekare >= deger1 && p.metrekare <= deger2).ToList();
                }
            }
            return View(orginal);
        }

        public ActionResult Arsa()
        {
            ViewBag.arsaTuru = ct.ArsaTurus.ToList();
            ViewBag.il = ct.illers.ToList();
            return View();
        }

        public ActionResult ArsaSorgula(IlanSorgu sorgu)
        {
            List<Arsa> orginal = new List<Arsa>();

            if (sorgu.kategori == 0) { orginal = ct.Arsas.ToList(); }
            else { orginal = ct.Arsas.Where(x => x.kategori == sorgu.kategori).ToList(); }

            if (sorgu.konutturu != null)
            {
                List<Arsa> temp = new List<Arsa>();
                foreach (int kt in sorgu.konutturu)
                {
                    temp.AddRange(orginal.Where(x => x.arsaTuru == kt));
                }
                orginal = temp;
            }
            if (sorgu.il != 0) { orginal = orginal.Where(x => x.il == sorgu.il).ToList(); }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.fiyat >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.fiyat <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (deger1 < deger2)
                        orginal = orginal.Where(p => p.fiyat > deger1 && p.fiyat < deger2).ToList();
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { orginal = orginal.Where(p => p.metrekare >= deger).ToList(); }
                    else { orginal = orginal.Where(p => p.metrekare <= deger).ToList(); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (deger1 < deger2)
                        orginal = orginal.Where(p => p.metrekare >= deger1 && p.metrekare <= deger2).ToList();
                }
            }
            return View(orginal);
        }
        public ActionResult CikisYap()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Home");
        }

    }
    
}
