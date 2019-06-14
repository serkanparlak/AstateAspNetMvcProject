using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class KullaniciMap : EntityTypeConfiguration<Kullanici>
    {
        public KullaniciMap()
        {
            // Primary Key
            this.HasKey(t => t.KullaniciId);

            // Properties
            this.Property(t => t.AdSoyad)
                .HasMaxLength(50);

            this.Property(t => t.Sifre)
                .HasMaxLength(20);

            this.Property(t => t.Adres)
                .HasMaxLength(200);

            this.Property(t => t.Email)
                .HasMaxLength(100);

            this.Property(t => t.Telefon)
                .HasMaxLength(15);

            // Table & Column Mappings
            this.ToTable("Kullanici");
            this.Property(t => t.KullaniciId).HasColumnName("KullaniciId");
            this.Property(t => t.AdSoyad).HasColumnName("AdSoyad");
            this.Property(t => t.Sifre).HasColumnName("Sifre");
            this.Property(t => t.Il).HasColumnName("Il");
            this.Property(t => t.Ilce).HasColumnName("Ilce");
            this.Property(t => t.Adres).HasColumnName("Adres");
            this.Property(t => t.Email).HasColumnName("Email");
            this.Property(t => t.Telefon).HasColumnName("Telefon");
            this.Property(t => t.KayitTarihi).HasColumnName("KayitTarihi");
        }
    }
}
