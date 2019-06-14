using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class ResimMap : EntityTypeConfiguration<Resim>
    {
        public ResimMap()
        {
            // Primary Key
            this.HasKey(t => t.ResimId);

            // Properties
            this.Property(t => t.ResimAdresi)
                .HasMaxLength(250);

            // Table & Column Mappings
            this.ToTable("Resim");
            this.Property(t => t.ResimId).HasColumnName("ResimId");
            this.Property(t => t.IlanTuruId).HasColumnName("IlanTuruId");
            this.Property(t => t.KayitId).HasColumnName("KayitId");
            this.Property(t => t.ResimAdresi).HasColumnName("ResimAdresi");
        }
    }
}
