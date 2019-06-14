using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using YazılımProje.Models.Mapping;

namespace YazılımProje.Models
{
    public partial class YazilimProjeServerContext : DbContext
    {
        static YazilimProjeServerContext()
        {
            Database.SetInitializer<YazilimProjeServerContext>(null);
        }

        public YazilimProjeServerContext()
            : base("Name=YazilimProjeServerContext")
        {
        }

        public DbSet<Arsa> Arsas { get; set; }
        public DbSet<ArsaTuru> ArsaTurus { get; set; }
        public DbSet<bulunduguKat> bulunduguKats { get; set; }
        public DbSet<Isyeri> Isyeris { get; set; }
        public DbSet<IsyeriTuru> IsyeriTurus { get; set; }
        public DbSet<ilceler> ilcelers { get; set; }
        public DbSet<iller> illers { get; set; }
        public DbSet<isitmaTuru> isitmaTurus { get; set; }
        public DbSet<Konut> Konuts { get; set; }
        public DbSet<KonutTuru> KonutTurus { get; set; }
        public DbSet<Kullanici> Kullanicis { get; set; }
        public DbSet<Mesajlar> Mesajlars { get; set; }
        public DbSet<odaSayisi> odaSayisis { get; set; }
        public DbSet<Resim> Resims { get; set; }
        public DbSet<sysdiagram> sysdiagrams { get; set; }
        public DbSet<Yonetici> Yoneticis { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new ArsaMap());
            modelBuilder.Configurations.Add(new ArsaTuruMap());
            modelBuilder.Configurations.Add(new bulunduguKatMap());
            modelBuilder.Configurations.Add(new IsyeriMap());
            modelBuilder.Configurations.Add(new IsyeriTuruMap());
            modelBuilder.Configurations.Add(new ilcelerMap());
            modelBuilder.Configurations.Add(new illerMap());
            modelBuilder.Configurations.Add(new isitmaTuruMap());
            modelBuilder.Configurations.Add(new KonutMap());
            modelBuilder.Configurations.Add(new KonutTuruMap());
            modelBuilder.Configurations.Add(new KullaniciMap());
            modelBuilder.Configurations.Add(new MesajlarMap());
            modelBuilder.Configurations.Add(new odaSayisiMap());
            modelBuilder.Configurations.Add(new ResimMap());
            modelBuilder.Configurations.Add(new sysdiagramMap());
            modelBuilder.Configurations.Add(new YoneticiMap());
        }
    }
}
