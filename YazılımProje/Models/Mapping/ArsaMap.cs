using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class ArsaMap : EntityTypeConfiguration<Arsa>
    {
        public ArsaMap()
        {
            // Primary Key
            this.HasKey(t => t.ArsaId);

            // Properties
            this.Property(t => t.baslik)
                .HasMaxLength(100);

            this.Property(t => t.adres)
                .HasMaxLength(300);

            this.Property(t => t.kucukResim)
                .HasMaxLength(100);

            // Table & Column Mappings
            this.ToTable("Arsa");
            this.Property(t => t.ArsaId).HasColumnName("ArsaId");
            this.Property(t => t.kategori).HasColumnName("kategori");
            this.Property(t => t.sahipId).HasColumnName("sahipId");
            this.Property(t => t.arsaTuru).HasColumnName("arsaTuru");
            this.Property(t => t.baslik).HasColumnName("baslik");
            this.Property(t => t.fiyat).HasColumnName("fiyat");
            this.Property(t => t.depozito).HasColumnName("depozito");
            this.Property(t => t.aktif).HasColumnName("aktif");
            this.Property(t => t.il).HasColumnName("il");
            this.Property(t => t.ilce).HasColumnName("ilce");
            this.Property(t => t.adres).HasColumnName("adres");
            this.Property(t => t.metrekare).HasColumnName("metrekare");
            this.Property(t => t.aciklama).HasColumnName("aciklama");
            this.Property(t => t.ilanTarihi).HasColumnName("ilanTarihi");
            this.Property(t => t.kucukResim).HasColumnName("kucukResim");

            // Relationships
            this.HasOptional(t => t.ArsaTuru1)
                .WithMany(t => t.Arsas)
                .HasForeignKey(d => d.arsaTuru);
            this.HasOptional(t => t.ilceler)
                .WithMany(t => t.Arsas)
                .HasForeignKey(d => d.ilce);
            this.HasOptional(t => t.iller)
                .WithMany(t => t.Arsas)
                .HasForeignKey(d => d.il);
            this.HasOptional(t => t.Kullanici)
                .WithMany(t => t.Arsas)
                .HasForeignKey(d => d.sahipId);

        }
    }
}
