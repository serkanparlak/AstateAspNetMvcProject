using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class YoneticiMap : EntityTypeConfiguration<Yonetici>
    {
        public YoneticiMap()
        {
            // Primary Key
            this.HasKey(t => t.YoneticiID);

            // Properties
            this.Property(t => t.AdSoyad)
                .HasMaxLength(50);

            this.Property(t => t.Sifre)
                .HasMaxLength(20);

            this.Property(t => t.Email)
                .IsRequired()
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("Yonetici");
            this.Property(t => t.YoneticiID).HasColumnName("YoneticiID");
            this.Property(t => t.AdSoyad).HasColumnName("AdSoyad");
            this.Property(t => t.Sifre).HasColumnName("Sifre");
            this.Property(t => t.Email).HasColumnName("Email");
        }
    }
}
