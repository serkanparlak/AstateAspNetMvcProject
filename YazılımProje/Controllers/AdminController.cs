using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using YazılımProje.Models;
using YazılımProje.ModelViews;

namespace YazılımProje.Controllers
{
    public class AdminController : AController
    {
        YazilimProjeServerContext ct = new YazilimProjeServerContext();
        public ActionResult Index()
        {
            ViewBag.TotolUser = ct.Kullanicis.Count();
            ViewBag.TotolKonut = ct.Konuts.Count();
            ViewBag.TotalIsyeri = ct.Isyeris.Count();
            ViewBag.TotalArsa = ct.Arsas.Count();
            ViewBag.TotolIlanTuru = ct.KonutTurus.Count() + ct.isitmaTurus.Count() + ct.ArsaTurus.Count();
            int id = (int)Session["id"];
            ViewBag.TotalMesaj = ct.Mesajlars.Where(x => x.gönderenID == id | x.aliciID == id).Count();
            return View();
        }

        public ActionResult Users()
        {
            var users = ct.Kullanicis;
            return View(users);
        }

        public ActionResult User_Edit(int id)
        {
            Kullanici kl = ct.Kullanicis.SingleOrDefault(x => x.KullaniciId == id);
            ViewBag.iller = ct.illers.ToList();
            ViewBag.ilceler = kl.Ilce != 0 ? ct.ilcelers.Where(x => x.sehirId == kl.Il) : null;
            return View(kl);
        }

        [HttpGet]
        public JsonResult IlceGetir(int id)
        {
            var ilces = ct.ilcelers.Where(x => x.sehirId == id).Select(x => new { x.ilce, x.ilceId, x.sehirId }).ToList();
            return Json(ilces, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult User_Update(int id, Kullanici kl)
        {
            Kullanici gncKl = ct.Kullanicis.SingleOrDefault(x => x.KullaniciId == id);
            if (gncKl != null)
            {
                if (errs != null) errs.Clear();
                if ((errs = Kontrol(kl)).Count > 0) { back = "/Admin/User_Edit/" + id; return RedirectToAction("Oops"); }
                gncKl.AdSoyad = kl.AdSoyad;
                gncKl.Email = kl.Email;
                gncKl.Il = kl.Il;
                gncKl.Ilce = kl.Ilce;
                gncKl.Sifre = kl.Sifre;
                gncKl.Telefon = kl.Telefon;
                gncKl.Adres = kl.Adres;
                ct.SaveChanges();
            }
            return RedirectToAction("Users", "Admin");
        }

        private List<string> Kontrol(Kullanici kl)
        {
            List<string> sorun = new List<string>();
            if (string.IsNullOrWhiteSpace(kl.AdSoyad)) { sorun.Add("Ad Soyad boş olamaz"); }
            if (string.IsNullOrWhiteSpace(kl.Email)) { sorun.Add("E-mail boş olamaz"); }
            if ((kl.Email != null && kl.Email.IndexOf("@") == -1)) { sorun.Add("E-mail'i doğru girdiğinizden emin olun"); }
            if (string.IsNullOrWhiteSpace(kl.Sifre)) { sorun.Add("Şifre boş olamaz"); }
            if (kl.Sifre.Length < 4) { sorun.Add("Şifre en az 4 karakter içermelidir"); }
            if (kl.Telefon.Length != 11) { sorun.Add("Telefonu kontrol ediniz"); }
            if (kl.Il == null) { sorun.Add("İl seçmediniz"); }
            if (kl.Ilce == null) { sorun.Add("İlçe seçmediniz"); }
            if (string.IsNullOrWhiteSpace(kl.Adres)) { sorun.Add("Açık adres girmediniz"); }
            return sorun;
        }

        static List<string> errs;
        static string back;

        public ActionResult Oops()
        {
            ViewBag.Back = back;
            return View(errs);
        }

        public ActionResult User_Delete(int id)
        {
            Kullanici Kl = ct.Kullanicis.SingleOrDefault(x => x.KullaniciId == id);
            if (Kl != null)
            {
                ct.Kullanicis.Remove(Kl);
                ct.SaveChanges();
            }
            return RedirectToAction("Users");
        }

        public ActionResult IlanTurleri()
        {
            ViewBag.ArsaTur = ct.ArsaTurus.ToList();
            ViewBag.ArsaSayi = ct.ArsaTurus.ToList().Count;
            ViewBag.KonutTur = ct.KonutTurus.ToList();
            ViewBag.KonutSayi = ct.KonutTurus.ToList().Count;
            ViewBag.IsyeriTur = ct.IsyeriTurus.ToList();
            ViewBag.IsyeriSayi = ct.IsyeriTurus.ToList().Count;
            return View();
        }

        [HttpPost]
        public JsonResult konutTuruEkle(string kntTur)
        {
            try
            {
                int id = ct.KonutTurus.Max(x => x.konutTuruId);
                KonutTuru ktur = new KonutTuru();
                ktur.konutTuruId = ++id;
                ktur.konutTuruAdi = kntTur;
                ct.KonutTurus.Add(ktur);
                ct.SaveChanges();
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }

        [HttpPost]
        public JsonResult isyeriTuruEkle(string isyTur)
        {
            try
            {
                int id = ct.IsyeriTurus.Max(x => x.isyeriTuruId);
                IsyeriTuru ktur = new IsyeriTuru();
                ktur.isyeriTuruId = ++id;
                ktur.isyeriTuruAdi = isyTur;
                ct.IsyeriTurus.Add(ktur);
                ct.SaveChanges();
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }

        [HttpPost]
        public JsonResult arsaTuruEkle(string arsTur)
        {
            try
            {
                int id = ct.ArsaTurus.Max(x => x.arsaTuruId);
                ArsaTuru ktur = new ArsaTuru();
                ktur.arsaTuruId = ++id;
                ktur.arsaTuruAdi = arsTur;
                ct.ArsaTurus.Add(ktur);
                ct.SaveChanges();
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }

        public ActionResult KonutListele(IlanSorgu filtre)
        {
            ViewBag.SorguDongu = filtre;
            ViewBag.Kullanici = ct.Kullanicis;
            ViewBag.KonutTuru = ct.KonutTurus;
            ViewBag.il = ct.illers;
            ViewBag.ilce = ct.ilcelers.Where(x => x.sehirId == filtre.il);
            ViewBag.isitmaTuru = ct.isitmaTurus;
            ViewBag.odasayisi = ct.odaSayisis;
            List<Konut> konuts = new List<Konut>();
            if (filtre.metrekare != null) //post olma durumu
            {
                var knt = from i in ct.Konuts select i;
                if (filtre.ilansahibi != 0)
                {
                    knt = knt.Where(s => s.sahipId == filtre.ilansahibi);
                }
                if (filtre.ilanTuru != 0)
                {
                    knt = knt.Where(s => s.konutTuru == filtre.ilanTuru);
                }
                if (filtre.isitmaturu[0] != 0)
                {
                    //knt = knt.Where(s => s.isitmaTuru == filtre.isitmaturu[0]); //Dizi mantığı desteklenmemekteymiş..
                    int isit = filtre.isitmaturu[0];
                    knt = from i in knt where i.isitmaTuru == isit select i;
                }
                if (filtre.odasayisi[0] != 0)
                {
                    int odas = filtre.odasayisi[0];
                    knt = knt.Where(s => s.odaSayisi == odas);
                }
                if (filtre.il != 0)
                {
                    knt = from i in knt where i.il == filtre.il select i;
                }
                if (filtre.ilce != 0)
                {
                    knt = from i in knt where i.ilce == filtre.ilce select i;
                }
                konuts = knt.ToList();
                ViewBag.KonutSayi = konuts.Count;
            }
            return View(konuts);
        }

        public ActionResult IsyeriListele(IlanSorgu filtre)
        {
            ViewBag.SorguDongu = filtre;
            ViewBag.Kullanici = ct.Kullanicis;
            ViewBag.IsyeriTuru = ct.IsyeriTurus;
            ViewBag.il = ct.illers;
            ViewBag.ilce = ct.ilcelers.Where(x => x.sehirId == filtre.il);
            ViewBag.isitmaTuru = ct.isitmaTurus;
            ViewBag.odasayisi = ct.odaSayisis;
            List<Isyeri> isyeris = new List<Isyeri>();
            if (filtre.metrekare != null) //post olma durumu
            {
                var isy = from i in ct.Isyeris select i;
                if (filtre.ilansahibi != 0)
                {
                    isy = isy.Where(s => s.sahipId == filtre.ilansahibi);
                }
                if (filtre.ilanTuru != 0)
                {
                    isy = isy.Where(s => s.isyeriTuru == filtre.ilanTuru);
                }
                if (filtre.isitmaturu[0] != 0)
                {
                    int istma = filtre.isitmaturu[0];
                    isy = isy.Where(s => s.isitmaTuru == istma);
                }
                if (filtre.odasayisi[0] != 0)
                {
                    int odas = filtre.odasayisi[0];
                    isy = isy.Where(s => s.odaSayisi == odas);
                }
                if (filtre.il != 0)
                {
                    isy = from i in isy where i.il == filtre.il select i;
                }
                if (filtre.ilce != 0)
                {
                    isy = from i in isy where i.ilce == filtre.ilce select i;
                }
                isyeris = isy.ToList();
                ViewBag.IsyeriSayi = isyeris.Count;
            }
            return View(isyeris);
        }

        public ActionResult ArsaListele(IlanSorgu filtre)
        {
            ViewBag.SorguDongu = filtre;
            ViewBag.Kullanici = ct.Kullanicis;
            ViewBag.ArsaTuru = ct.ArsaTurus;
            ViewBag.il = ct.illers;
            ViewBag.ilce = ct.ilcelers.Where(x => x.sehirId == filtre.il);
            var arsas = new List<Arsa>();
            if (filtre.metrekare != null) //post olma durumu
            {
                var ars = from i in ct.Arsas select i;
                if (filtre.ilansahibi != 0)
                {
                    ars = ars.Where(s => s.sahipId == filtre.ilansahibi);
                }
                if (filtre.ilanTuru != 0)
                {
                    ars = ars.Where(s => s.arsaTuru == filtre.ilanTuru);
                }
                if (filtre.il != 0)
                {
                    ars = from i in ars where i.il == filtre.il select i;
                }
                if (filtre.ilce != 0)
                {
                    ars = from i in ars where i.ilce == filtre.ilce select i;
                }
                arsas = ars.ToList();
                ViewBag.ArsaSayi = arsas.Count;
            }
            return View(arsas);
        }

        public ActionResult KonutDuzenle(int id)
        {
            Konut k = ct.Konuts.SingleOrDefault(x => x.KonutId == id);
            ViewBag.bulKat = ct.bulunduguKats;
            ViewBag.isitTuru = ct.isitmaTurus;
            ViewBag.odaSayi = ct.odaSayisis;
            ViewBag.Iller = ct.illers;
            ViewBag.Ilceler = ct.ilcelers.Where(x => x.sehirId == k.il);
            ViewBag.konutTuru = ct.KonutTurus;
            ViewBag.resimler = ct.Resims.Where(x => x.KayitId == k.KonutId && x.IlanTuruId == 1);
            return View(k);
        }

        [HttpPost]
        public ActionResult KonutDuzenle(Kontrol_Model iln)
        {
            JsonModel jmod = new JsonModel();
            string kontrol = VeriKontrolleri(iln);
            if (kontrol != null)
            {
                jmod.IsSuccess = false;
                jmod.Mesaj = kontrol;
                return Json(jmod, JsonRequestBehavior.AllowGet);
            }
            Konut knt = ct.Konuts.SingleOrDefault(x => x.KonutId == iln.id);
            knt.aciklama = iln.aciklama;
            knt.adres = iln.adres;
            knt.aktif = iln.aktif == 1 ? true : false;
            knt.baslik = iln.baslik;
            knt.bulunduguKat = iln.bulunduguKat;
            knt.depozito = iln.kategori == 1 ? 0 : iln.depozito;
            knt.esyaDurumu = iln.esyaDurumu == 1 ? true : false;
            knt.fiyat = iln.fiyat;
            knt.il = iln.il;
            knt.ilce = iln.ilce;
            knt.isitmaTuru = iln.isitmaTuru;
            knt.kategori = iln.kategori;
            knt.katSayisi = iln.katSayisi;
            knt.konutTuru = iln.konutTuru;
            knt.metrekare = iln.metrekare;
            knt.odaSayisi = iln.odaSayisi;
            knt.yasi = iln.yasi;

            try
            {
                ct.SaveChanges();
                jmod.IsSuccess = true;
                jmod.Mesaj = "Ilan başarıyla güncellenmiştir.";
            }
            catch
            {
                jmod.IsSuccess = false;
            }
            return Json(jmod, JsonRequestBehavior.AllowGet);
        }

        string VeriKontrolleri(Kontrol_Model k)
        {
            string sonuc = null;
            if (k.kategori == 0) sonuc = "kategori";
            else if (k.konutTuru == 0) sonuc = "konutTuru";
            else if (string.IsNullOrWhiteSpace(k.baslik)) sonuc = "baslik";
            else if (k.fiyat <= 0) sonuc = "fiyat";
            else if (k.kategori == 2 && k.depozito == 0) sonuc = "depozito";
            else if (k.il == 0) sonuc = "il";
            else if (k.ilce == 0) sonuc = "ilce";
            else if (string.IsNullOrWhiteSpace(k.adres)) sonuc = "adres";
            else if (k.metrekare <= 0) sonuc = "metrekare";
            else if (k.aktif == 0) sonuc = "aktif";
            else if (string.IsNullOrWhiteSpace(k.aciklama)) sonuc = "aciklama";
            else if (k.odaSayisi == 0) sonuc = "odaSayisi";
            else if (k.isitmaTuru == 0) sonuc = "isitmaTuru";
            else if (k.katSayisi <= 0) sonuc = "katSayisi";
            else if (k.bulunduguKat == 0 || k.bulunduguKat > k.katSayisi + 6) sonuc = "bulunduguKat";
            else if (k.yasi < 0) sonuc = "yasi";
            else if (k.esyaDurumu == 0) sonuc = "esyaDurumu";
            return sonuc;
        }

        public ActionResult Mesajlar()
        {
            int id = (int)Session["id"];
            var gelenmesajlar = ct.Mesajlars.Where(x => x.aliciID == id).OrderByDescending(x => x.tarih);
            ViewBag.gidenmesajlar = ct.Mesajlars.Where(x => x.gönderenID == id).OrderByDescending(x => x.tarih);
            return View(gelenmesajlar);
        }

        public ActionResult MesajYaz(int id)
        {
            SelectList list;
            if (id != 0)
            {
                list = new SelectList(ct.Kullanicis, "KullaniciId", "AdSoyad", id);
            }
            else
            {
                list = new SelectList(ct.Kullanicis, "KullaniciId", "AdSoyad");
            }
            ViewBag.Users = list;
            return View();
        }

        [HttpPost]
        public ActionResult MesajYaz(Mesajlar msj)
        {
            Mesajlar yeni = new Mesajlar();
            yeni.gönderenID = (int)Session["id"];
            yeni.tarih = DateTime.Now;
            yeni.aliciID = msj.aliciID;
            yeni.konu = msj.konu;
            yeni.mesaj = msj.mesaj;
            ct.Mesajlars.Add(yeni);
            ct.SaveChanges();
            return RedirectToAction("Mesajlar");
        }
    }
}
