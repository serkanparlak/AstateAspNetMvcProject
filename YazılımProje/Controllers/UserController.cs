using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using YazılımProje.Controllers.LoginControllers;
using YazılımProje.Models;
using YazılımProje.ModelViews;

namespace YazılımProje.Controllers
{
    public class UserController : UController
    {
        YazilimProjeServerContext ct = new YazilimProjeServerContext();

        public ActionResult Index()
        {
            kullaniciID = Convert.ToInt32(Session["Kl"]);
            ViewBag.Title = "User | Genel Bakış";
            return View();
        }

        public ActionResult YeniIlan()
        {
            ViewBag.Title = "Yeni İlan";
            return View();
        }

        public ActionResult YeniIlanKonut()
        {
            ViewBag.bulKat = ct.bulunduguKats.ToList();
            ViewBag.isitTuru = ct.isitmaTurus.ToList();
            ViewBag.odaSayi = ct.odaSayisis.ToList();
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.konutTuru = ct.KonutTurus.ToList();
            ViewBag.Title = "Yeni Konut";
            ilanDurum = false;
            if (resimler.Count > 0) resimler.Clear();
            return View();
        }

        [HttpPost]
        public ActionResult YeniIlanKonut(Kontrol_Model k)
        {
            JsonModel jmodel = new JsonModel();
            string kontrol = VeriKontrolleri(k, 1);
            if (kontrol != null)
            {
                jmodel.IsSuccess = false;
                jmodel.Mesaj = kontrol;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }

            Konut yeni = new Konut();
            yeni.aciklama = k.aciklama;
            yeni.metrekare = k.metrekare;
            yeni.sahipId = Convert.ToInt32(Session["Kl"]);
            yeni.adres = k.adres;
            yeni.aktif = k.aktif == 1 ? true : false;
            yeni.baslik = k.baslik;
            yeni.yasi = k.yasi;
            yeni.bulunduguKat = k.bulunduguKat;
            yeni.depozito = k.kategori != 1 ? k.depozito : 0;
            yeni.esyaDurumu = k.esyaDurumu == 1 ? true : false;
            yeni.fiyat = k.fiyat;
            yeni.il = k.il;
            yeni.ilanTarihi = DateTime.Now;
            yeni.ilce = k.ilce;
            yeni.isitmaTuru = k.isitmaTuru;
            yeni.kategori = k.kategori;
            yeni.katSayisi = k.katSayisi;
            yeni.konutTuru = k.konutTuru;
            yeni.odaSayisi = k.odaSayisi;
            yeni.kucukResim = resimler[0];

            ct.Konuts.Add(yeni);
            {
                int kayitId = ct.Konuts.Max(x => x.KonutId) + 1;
                for (int i = 0; i < resimler.Count; i++)
                {
                    Resim yeniResim = new Resim();
                    yeniResim.KayitId = kayitId;
                    yeniResim.IlanTuruId = 1;
                    yeniResim.ResimAdresi = resimler[i];
                    ct.Resims.Add(yeniResim);
                }
                {
                    Bitmap bt = new Bitmap(Server.MapPath("~/Images/" + resimler[0]));
                    double yukseklik = bt.Height;
                    double genislik = bt.Width;
                    double oran;
                    if (genislik > 200)
                    {
                        oran = genislik / yukseklik;
                        genislik = 200;
                        yukseklik = 200 / oran;
                    }
                    Bitmap yenis = new Bitmap(bt, (int)genislik, (int)yukseklik);
                    yenis.Save(Server.MapPath("~/Images/KucukResimler/" + yeni.kucukResim));
                    yenis.Dispose();
                    bt.Dispose();
                }
            }

            try
            {
                ct.SaveChanges();
            }
            catch (Exception ex)
            {
                ilanDurum = false;
                jmodel.IsSuccess = false;
                jmodel.Mesaj = "Hata : " + ex.Message;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }
            ilanDurum = true;
            jmodel.IsSuccess = true;
            jmodel.Mesaj = "İlanınız başarıyla yayınlanmıştır..";
            return Json(jmodel, JsonRequestBehavior.AllowGet);
        }

        string VeriKontrolleri(Kontrol_Model k, int IlanTuru)
        {
            string sonuc = null;
            if (k.kategori == 0) sonuc = "kategori";
            else if (k.konutTuru == 0) sonuc = "konutTuru";
            else if (String.IsNullOrWhiteSpace(k.baslik)) sonuc = "baslik";
            else if (k.fiyat <= 0) sonuc = "fiyat";
            else if (k.kategori == 2 && k.depozito == 0) sonuc = "depozito";
            else if (k.il == 0) sonuc = "il";
            else if (k.ilce == 0) sonuc = "ilce";
            else if (String.IsNullOrWhiteSpace(k.adres)) sonuc = "adres";
            else if (k.metrekare <= 0) sonuc = "metrekare";
            else if (k.aktif == 0) sonuc = "aktif";
            else if (String.IsNullOrWhiteSpace(k.aciklama)) sonuc = "aciklama";
            else if (resimler.Count == 0) sonuc = "resimler";
            else if (IlanTuru == 3) { return sonuc; }

            else if (k.odaSayisi == 0) sonuc = "odaSayisi";
            else if (k.isitmaTuru == 0) sonuc = "isitmaTuru";
            else if (k.katSayisi <= 0) sonuc = "katSayisi";
            else if (k.bulunduguKat == 0 || k.bulunduguKat > k.katSayisi + 6) sonuc = "bulunduguKat";
            else if (k.yasi < 0) sonuc = "yasi";
            else if (k.esyaDurumu == 0) sonuc = "esyaDurumu";
            return sonuc;
        }

        static List<string> resimler = new List<string>();
        static bool ilanDurum;

        [HttpPost]
        public JsonResult ResimYukle(int id)
        {
            JsonModel jMod = new JsonModel();
            for (int i = 0; i < Request.Files.Count; i++)
            {
                if (resimler.Count > 4)
                {
                    jMod.IsSuccess = false;
                    jMod.Mesaj = "Maksimum 5 resim yükleyebilirsin!";
                    return Json(jMod, JsonRequestBehavior.AllowGet);
                }
            }
            try
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    string orgIsim = Request.Files[i].FileName;
                    string uzanti = Path.GetExtension(orgIsim);
                    var yeniIsim = Guid.NewGuid() + uzanti;
                    Image resim = Image.FromStream(Request.Files[i].InputStream);

                    Bitmap bt = new Bitmap(resim);
                    double genislik = bt.Width;
                    double yukseklik = bt.Height;
                    double oran = genislik / yukseklik;
                    if (genislik > 800)
                    {
                        genislik = 800;
                        yukseklik = 800 / oran;
                    }
                    Bitmap yenis = new Bitmap(bt, (int)genislik, (int)yukseklik);
                    yenis.Save(Server.MapPath("~/Images/" + yeniIsim));
                    yenis.Dispose();
                    bt.Dispose();

                    resimler.Add(yeniIsim);
                }
            }
            catch (Exception ex)
            {
                jMod.IsSuccess = false;
                jMod.Mesaj = "Hata : " + ex.Message;
                return Json(jMod, JsonRequestBehavior.AllowGet);
            }

            jMod.IsSuccess = true;
            jMod.Mesaj = resimler.Count.ToString();
            return Json(jMod, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public void ResimTemizle()
        {
            if (!ilanDurum && resimler.Count > 0)
            {
                foreach (string resimAd in resimler)
                {
                    System.IO.File.Delete(Server.MapPath("/Images/" + resimAd));
                }
                resimler.Clear();
                ilanDurum = false;
            }
        }

        [HttpGet]
        public ActionResult IlceGetir(int id)
        {
            var ilces = ct.ilcelers.Where(x => x.sehirId == id).Select(x => new { x.ilce, x.ilceId, x.sehirId }).ToList();
            return Json(ilces, JsonRequestBehavior.AllowGet);
        }

        // -- Yeni İşyeri
        public ActionResult YeniIlanIsyeri()
        {
            ViewBag.bulKat = ct.bulunduguKats.ToList();
            ViewBag.isitTuru = ct.isitmaTurus.ToList();
            ViewBag.odaSayi = ct.odaSayisis.ToList();
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.IsyeriTuru = ct.IsyeriTurus.ToList();
            ilanDurum = false;
            if (resimler.Count > 0) resimler.Clear();
            ViewBag.Title = "Yeni Isyeri";
            return View();
        }

        [HttpPost]
        public ActionResult YeniIlanIsyeri(Kontrol_Model k)
        {
            JsonModel jmodel = new JsonModel();
            string kontrol = VeriKontrolleri(k, 2);
            if (kontrol != null)
            {
                jmodel.IsSuccess = false;
                jmodel.Mesaj = kontrol;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }

            Isyeri yeni = new Isyeri();
            yeni.aciklama = k.aciklama;
            yeni.metrekare = k.metrekare;
            yeni.sahipId = Convert.ToInt32(Session["Kl"]);
            yeni.adres = k.adres;
            yeni.aktif = k.aktif == 1 ? true : false;
            yeni.baslik = k.baslik;
            yeni.binaYasi = k.yasi;
            yeni.bulunduguKat = k.bulunduguKat;
            yeni.depozito = k.kategori == 2 ? k.depozito : 0;
            yeni.esyaDurumu = k.esyaDurumu == 1 ? true : false;
            yeni.fiyat = k.fiyat;
            yeni.il = k.il;
            yeni.ilanTarihi = DateTime.Now;
            yeni.ilce = k.ilce;
            yeni.isitmaTuru = k.isitmaTuru;
            yeni.kategori = k.kategori;
            yeni.katSayisi = k.katSayisi;
            yeni.isyeriTuru = k.konutTuru;
            yeni.odaSayisi = k.odaSayisi;
            yeni.kucukResim = resimler[0];
            ct.Isyeris.Add(yeni);
            {
                int kayitId = ct.Isyeris.Max(x => x.IsyeriId) + 1;
                for (int i = 0; i < resimler.Count; i++)
                {
                    Resim yeniResim = new Resim();
                    yeniResim.KayitId = kayitId;
                    yeniResim.IlanTuruId = 2;
                    yeniResim.ResimAdresi = resimler[i];
                    ct.Resims.Add(yeniResim);
                }
                {
                    Bitmap bt = new Bitmap(Server.MapPath("~/Images/" + resimler[0]));
                    double yukseklik = bt.Height;
                    double genislik = bt.Width;
                    double oran;
                    if (genislik > 500)
                    {
                        oran = genislik / yukseklik;
                        genislik = 500;
                        yukseklik = 500 / oran;
                    }
                    Bitmap yenis = new Bitmap(bt, (int)genislik, (int)yukseklik);
                    yenis.Save(Server.MapPath("~/Images/KucukResimler/" + yeni.kucukResim));
                    yenis.Dispose();
                    bt.Dispose();
                }
            }
            try
            {
                ct.SaveChanges();
            }
            catch (Exception ex)
            {
                ilanDurum = false;
                jmodel.IsSuccess = false;
                jmodel.Mesaj = "Hata : " + ex.Message;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }
            ilanDurum = true;
            jmodel.IsSuccess = true;
            jmodel.Mesaj = "İlanınız başarıyla yayınlanmıştır..";
            return Json(jmodel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult YeniIlanArsa()
        {
            ViewBag.bulKat = ct.bulunduguKats.ToList();
            ViewBag.isitTuru = ct.isitmaTurus.ToList();
            ViewBag.odaSayi = ct.odaSayisis.ToList();
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.ArsaTuru = ct.ArsaTurus.ToList();
            ilanDurum = false;
            if (resimler.Count > 0) resimler.Clear();
            ViewBag.Title = "Yeni Arsa";
            return View();
        }

        [HttpPost]
        public ActionResult YeniIlanArsa(Kontrol_Model k)
        {
            JsonModel jmodel = new JsonModel();
            string kontrol = VeriKontrolleri(k, 3);
            if (kontrol != null)
            {
                jmodel.IsSuccess = false;
                jmodel.Mesaj = kontrol;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }

            Arsa yeni = new Arsa();
            yeni.aciklama = k.aciklama;
            yeni.metrekare = k.metrekare;
            yeni.sahipId = Convert.ToInt32(Session["Kl"]);
            yeni.adres = k.adres;
            yeni.aktif = k.aktif == 1 ? true : false;
            yeni.baslik = k.baslik;
            yeni.depozito = k.kategori == 2 ? k.depozito : 0;
            yeni.fiyat = k.fiyat;
            yeni.il = k.il;
            yeni.ilanTarihi = DateTime.Now;
            yeni.ilce = k.ilce;
            yeni.kategori = k.kategori;
            yeni.arsaTuru = k.konutTuru;
            yeni.kucukResim = resimler[0];
            ct.Arsas.Add(yeni);
            {
                int kayitId = ct.Arsas.Max(x => x.ArsaId) + 1;
                for (int i = 0; i < resimler.Count; i++)
                {
                    Resim yeniResim = new Resim();
                    yeniResim.KayitId = kayitId;
                    yeniResim.IlanTuruId = 3;
                    yeniResim.ResimAdresi = resimler[i];
                    ct.Resims.Add(yeniResim);
                }
                {
                    Bitmap bt = new Bitmap(Server.MapPath("~/Images/" + resimler[0]));
                    double yukseklik = bt.Height;
                    double genislik = bt.Width;
                    double oran;
                    if (genislik > 200)
                    {
                        oran = genislik / yukseklik;
                        genislik = 200;
                        yukseklik = 200 / oran;
                    }
                    Bitmap yenis = new Bitmap(bt, (int)genislik, (int)yukseklik);
                    yenis.Save(Server.MapPath("~/Images/KucukResimler/" + yeni.kucukResim));
                    yenis.Dispose();
                    bt.Dispose();
                }
            }
            try
            {

                ct.SaveChanges();
            }
            catch (Exception ex)
            {
                ilanDurum = false;
                jmodel.IsSuccess = false;
                jmodel.Mesaj = "Hata : " + ex.Message;
                return Json(jmodel, JsonRequestBehavior.AllowGet);
            }
            ilanDurum = true;
            jmodel.IsSuccess = true;
            jmodel.Mesaj = "İlanınız başarıyla yayınlanmıştır..";
            return Json(jmodel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult IlanSorgula(int id)
        {
            sorguTuruID = id;
            return View();
        }

        static IlanSorgu sorgu;
        static int kullaniciID;
        static int sorguTuruID;

        [HttpPost]
        public ActionResult IlanSorgula(IlanSorgu srg)
        {
            sorgu = srg;
            if (srg.ilanTuru == 1)
            {
                return RedirectToAction("ListeKonutSorgu");
            }
            else if (srg.ilanTuru == 2)
            {
                return RedirectToAction("ListeIsyeriSorgu");
            }
            else
            {
                return RedirectToAction("ListeArsaSorgu");
            }
        }

        public ActionResult ListeKonutSorgu()
        {
            ViewBag.OdaSayisi = ct.odaSayisis.ToList();
            ViewBag.il = ct.illers.ToList();
            ViewBag.KonutTuru = ct.KonutTurus.ToList();
            var knt = from i in ct.Konuts select i;
            if (sorguTuruID == 0) { knt = from i in ct.Konuts where i.sahipId == kullaniciID select i; }

            if (sorgu.kategori != 0)
            {
                knt = knt.Where(x => x.kategori == sorgu.kategori);
            }
            if (sorgu.ozelarama != null && !string.IsNullOrWhiteSpace(sorgu.ozelarama))
            {
                knt = from i in knt where i.baslik.Contains(sorgu.ozelarama) select i;
            }
            if (sorgu.odasayisi != null)
            {
                int count = sorgu.odasayisi.Length;
                int deger1 = sorgu.odasayisi[0];
                if (count == 1) knt = knt.Where(s => s.odaSayisi == deger1);
                else if (count == 2)
                {
                    int deger2 = sorgu.odasayisi[1];
                    knt = knt.Where(s => s.odaSayisi == deger1 || s.odaSayisi == deger2);
                }
                else
                {
                    int deger2 = sorgu.odasayisi[1];
                    int deger3 = sorgu.odasayisi[2];
                    knt = knt.Where(s => s.odaSayisi == deger1 || s.odaSayisi == deger2 || s.odaSayisi == deger3);
                }

            }
            if (sorgu.konutturu != null)
            {
                int count = sorgu.konutturu.Length;
                int deger1 = sorgu.konutturu[0];
                if (count == 1) knt = knt.Where(s => s.konutTuru == deger1);
                else if (count == 2)
                {
                    int deger2 = sorgu.konutturu[1];
                    knt = knt.Where(s => s.konutTuru == deger1 || s.konutTuru == deger2);
                }
                else
                {
                    int deger2 = sorgu.konutturu[1];
                    int deger3 = sorgu.konutturu[2];
                    knt = knt.Where(s => s.konutTuru == deger1 || s.konutTuru == deger2 || s.konutTuru == deger3);
                }
            }
            if (sorgu.il != 0)
            {
                knt = from i in knt where i.il == sorgu.il select i;
            }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { knt = knt.Where(p => p.fiyat >= deger); }
                    else { knt = knt.Where(p => p.fiyat <= deger); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (deger1 < deger2)
                        knt = knt.Where(p => p.fiyat > deger1 && p.fiyat < deger2);
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { knt = knt.Where(p => p.metrekare >= deger); }
                    else { knt = knt.Where(p => p.metrekare <= deger); }
                }
                else
                {
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (deger1 < deger2)
                        knt = knt.Where(p => p.metrekare >= deger1 && p.metrekare <= deger2);
                }
            }

            return View(knt);
        }

        public ActionResult ListeIsyeriSorgu()
        {
            ViewBag.OdaSayisi = ct.odaSayisis.ToList();
            ViewBag.il = ct.illers.ToList();
            ViewBag.IsyeriTuru = ct.IsyeriTurus.ToList();

            var isyeri = from i in ct.Isyeris select i;
            if (sorguTuruID == 0) isyeri = from i in ct.Isyeris where i.sahipId == kullaniciID select i;
            if (sorgu.kategori != 0)
            {
                isyeri = isyeri.Where(x => x.kategori == sorgu.kategori);
            }
            if (sorgu.odasayisi != null)
            {
                int count = sorgu.odasayisi.Length;
                int deger1 = sorgu.odasayisi[0];
                if (count == 1) isyeri = isyeri.Where(s => s.odaSayisi == deger1);
                else if (count == 2)
                {
                    int deger2 = sorgu.odasayisi[1];
                    isyeri = isyeri.Where(s => s.odaSayisi == deger1 || s.odaSayisi == deger2);
                }
                else
                {
                    int deger2 = sorgu.odasayisi[1];
                    int deger3 = sorgu.odasayisi[2];
                    isyeri = isyeri.Where(s => s.odaSayisi == deger1 || s.odaSayisi == deger2 || s.odaSayisi == deger3);
                }

            }
            if (sorgu.konutturu != null)
            {
                int count = sorgu.konutturu.Length;
                int deger1 = sorgu.konutturu[0];
                if (count == 1) isyeri = isyeri.Where(s => s.isyeriTuru == deger1);
                else if (count == 2)
                {
                    int deger2 = sorgu.konutturu[1];
                    isyeri = isyeri.Where(s => s.isyeriTuru == deger1 || s.isyeriTuru == deger2);
                }
                else
                {
                    int deger2 = sorgu.konutturu[1];
                    int deger3 = sorgu.konutturu[2];
                    isyeri = isyeri.Where(s => s.isyeriTuru == deger1 || s.isyeriTuru == deger2 || s.isyeriTuru == deger3);
                }
            }
            if (sorgu.il != 0)
            {
                isyeri = from i in isyeri where i.il == sorgu.il select i;
            }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { isyeri = isyeri.Where(p => p.fiyat > deger); }
                    else { isyeri = isyeri.Where(p => p.fiyat < deger); }
                }
                else
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (olcu == "min") { isyeri = isyeri.Where(p => p.fiyat > deger1 && p.fiyat < deger2); }
                    else { isyeri = isyeri.Where(p => p.fiyat < deger1 && p.fiyat > deger2); }
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { isyeri = isyeri.Where(p => p.metrekare > deger); }
                    else { isyeri = isyeri.Where(p => p.metrekare < deger); }
                }
                else
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (olcu == "min") { isyeri = isyeri.Where(p => p.metrekare > deger1 && p.metrekare < deger2); }
                    else { isyeri = isyeri.Where(p => p.metrekare < deger1 && p.metrekare > deger2); }
                }
            }

            return View(isyeri);
        }

        public ActionResult ListeArsaSorgu()
        {
            ViewBag.il = ct.illers.ToList();
            ViewBag.ArsaTuru = ct.ArsaTurus.ToList();

            var arsa = from i in ct.Arsas select i;
            if (sorguTuruID == 0) arsa = from i in ct.Arsas where i.sahipId == kullaniciID select i;
            if (sorgu.kategori != 0)
            {
                arsa = arsa.Where(x => x.kategori == sorgu.kategori);
            }
            if (sorgu.konutturu != null)
            {
                int count = sorgu.konutturu.Length;
                int deger1 = sorgu.konutturu[0];
                if (count == 1) arsa = arsa.Where(s => s.arsaTuru == deger1);
                else if (count == 2)
                {
                    int deger2 = sorgu.konutturu[1];
                    arsa = arsa.Where(s => s.arsaTuru == deger1 || s.arsaTuru == deger2);
                }
                else
                {
                    int deger2 = sorgu.konutturu[1];
                    int deger3 = sorgu.konutturu[2];
                    arsa = arsa.Where(s => s.arsaTuru == deger1 || s.arsaTuru == deger2 || s.arsaTuru == deger3);
                }
            }
            if (sorgu.il != 0)
            {
                arsa = from i in arsa where i.il == sorgu.il select i;
            }
            if (sorgu.fiyat != null)
            {
                if (sorgu.fiyat.Length == 1)
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    if (olcu == "min") { arsa = arsa.Where(p => p.fiyat > deger); }
                    else { arsa = arsa.Where(p => p.fiyat < deger); }
                }
                else
                {
                    string olcu = sorgu.fiyat[0].Split('-')[0];
                    int deger1 = Convert.ToInt32(sorgu.fiyat[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.fiyat[1].Split('-')[1]);
                    if (olcu == "min") { arsa = arsa.Where(p => p.fiyat > deger1 && p.fiyat < deger2); }
                    else { arsa = arsa.Where(p => p.fiyat < deger1 && p.fiyat > deger2); }
                }
            }
            if (sorgu.metrekare != null)
            {
                if (sorgu.metrekare.Length == 1)
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    if (olcu == "min") { arsa = arsa.Where(p => p.metrekare > deger); }
                    else { arsa = arsa.Where(p => p.metrekare < deger); }
                }
                else
                {
                    string olcu = sorgu.metrekare[0].Split('-')[0];
                    int deger1 = Convert.ToInt32(sorgu.metrekare[0].Split('-')[1]);
                    int deger2 = Convert.ToInt32(sorgu.metrekare[1].Split('-')[1]);
                    if (olcu == "min") { arsa = arsa.Where(p => p.metrekare > deger1 && p.metrekare < deger2); }
                    else { arsa = arsa.Where(p => p.metrekare < deger1 && p.metrekare > deger2); }
                }
            }
            return View(arsa);
        }

        static int resimKayitID;
        static int resimKayitTuru;
        public ActionResult KonutGoster(int id)
        {
            resimKayitID = id;
            resimKayitTuru = 1; //Konut
            var konut = ct.Konuts.FirstOrDefault(x => x.KonutId == id);
            return View(konut);
        }

        public ActionResult IsyeriGoster(int id)
        {
            resimKayitID = id;
            resimKayitTuru = 2; //Işyeri
            var isyeri = ct.Isyeris.FirstOrDefault(x => x.IsyeriId == id);
            return View(isyeri);
        }
        public ActionResult ArsaGoster(int id)
        {
            resimKayitID = id;
            resimKayitTuru = 3; //Arsa
            var arsa = ct.Arsas.FirstOrDefault(x => x.ArsaId == id);
            return View(arsa);
        }

        public ActionResult ResimGaleri()
        {
            var resims = ct.Resims.Where(x => x.IlanTuruId == resimKayitTuru && x.KayitId == resimKayitID).ToList();
            ViewBag.ResimSayi = resims.Count;
            return View(resims);
        }

        public ActionResult IlanKonutGuncelle(int id)
        {
            var konut = ct.Konuts.SingleOrDefault(x => x.KonutId == id);
            ViewBag.bulKat = ct.bulunduguKats.ToList();
            ViewBag.isitTuru = ct.isitmaTurus.ToList();
            ViewBag.odaSayi = ct.odaSayisis.ToList();
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.Ilceler = ct.ilcelers.Where(x => x.sehirId == konut.il);
            ViewBag.konutTuru = ct.KonutTurus.ToList();
            guncellenenIlanId = id;
            return View(konut);
        }
        static int guncellenenIlanId;

        [HttpPost]
        public ActionResult IlanKonutGuncelle(Kontrol_Model iln)
        {
            JsonModel jmod = new JsonModel();
            resimler.Add("");
            string kontrol = VeriKontrolleri(iln, 1);
            resimler.Clear();
            if (kontrol != null)
            {
                jmod.IsSuccess = false;
                jmod.Mesaj = kontrol;
                return Json(jmod, JsonRequestBehavior.AllowGet);
            }
            Konut knt = ct.Konuts.SingleOrDefault(x => x.KonutId == guncellenenIlanId);
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

        public ActionResult IlanIsyeriGuncelle(int id)
        {
            var isyeri = ct.Isyeris.SingleOrDefault(x => x.IsyeriId == id);
            ViewBag.bulKat = ct.bulunduguKats.ToList();
            ViewBag.isitTuru = ct.isitmaTurus.ToList();
            ViewBag.odaSayi = ct.odaSayisis.ToList();
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.Ilceler = ct.ilcelers.Where(x => x.sehirId == isyeri.il);
            ViewBag.isyeriTuru = ct.IsyeriTurus.ToList();
            guncellenenIlanId = id;
            return View(isyeri);
        }

        [HttpPost]
        public JsonResult IlanIsyeriGuncelle(Kontrol_Model iln)
        {
            JsonModel jmod = new JsonModel();
            resimler.Add("");
            string kontrol = VeriKontrolleri(iln, 2);
            resimler.Clear();
            if (kontrol != null)
            {
                jmod.IsSuccess = false;
                jmod.Mesaj = kontrol;
                return Json(jmod, JsonRequestBehavior.AllowGet);
            }
            Isyeri isyri = ct.Isyeris.SingleOrDefault(x => x.IsyeriId == guncellenenIlanId);
            isyri.aciklama = iln.aciklama;
            isyri.adres = iln.adres;
            isyri.aktif = iln.aktif == 1 ? true : false;
            isyri.baslik = iln.baslik;
            isyri.bulunduguKat = iln.bulunduguKat;
            isyri.depozito = iln.kategori == 1 ? 0 : iln.depozito;
            isyri.esyaDurumu = iln.esyaDurumu == 1 ? true : false;
            isyri.fiyat = iln.fiyat;
            isyri.il = iln.il;
            isyri.ilce = iln.ilce;
            isyri.isitmaTuru = iln.isitmaTuru;
            isyri.kategori = iln.kategori;
            isyri.katSayisi = iln.katSayisi;
            isyri.isyeriTuru = iln.konutTuru;
            isyri.metrekare = iln.metrekare;
            isyri.odaSayisi = iln.odaSayisi;
            isyri.binaYasi = iln.yasi;

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

        public ActionResult IlanArsaGuncelle(int id)
        {
            var arsa = ct.Arsas.SingleOrDefault(x => x.ArsaId == id);
            ViewBag.Iller = ct.illers.ToList();
            ViewBag.Ilceler = ct.ilcelers.Where(x => x.sehirId == arsa.il);
            ViewBag.arsaTuru = ct.ArsaTurus.ToList();
            guncellenenIlanId = id;
            return View(arsa);
        }

        [HttpPost]
        public ActionResult IlanArsaGuncelle(Kontrol_Model iln)
        {
            JsonModel jmod = new JsonModel();
            resimler.Add("");
            string kontrol = VeriKontrolleri(iln, 3);
            resimler.Clear();
            if (kontrol != null)
            {
                jmod.IsSuccess = false;
                jmod.Mesaj = kontrol;
                return Json(jmod, JsonRequestBehavior.AllowGet);
            }
            Arsa ars = ct.Arsas.SingleOrDefault(x => x.ArsaId == guncellenenIlanId);
            ars.aciklama = iln.aciklama;
            ars.adres = iln.adres;
            ars.aktif = iln.aktif == 1 ? true : false;
            ars.baslik = iln.baslik;
            ars.depozito = iln.kategori == 1 ? 0 : iln.depozito;
            ars.fiyat = iln.fiyat;
            ars.il = iln.il;
            ars.ilce = iln.ilce;
            ars.kategori = iln.kategori;
            ars.metrekare = iln.metrekare;

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

        
    }
}
