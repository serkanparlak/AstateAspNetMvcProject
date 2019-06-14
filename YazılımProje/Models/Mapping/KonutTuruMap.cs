using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class KonutTuruMap : EntityTypeConfiguration<KonutTuru>
    {
        public KonutTuruMap()
        {
            // Primary Key
            this.HasKey(t => t.konutTuruId);

            // Properties
            this.Property(t => t.konutTuruId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.konutTuruAdi)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("KonutTuru");
            this.Property(t => t.konutTuruId).HasColumnName("konutTuruId");
            this.Property(t => t.konutTuruAdi).HasColumnName("konutTuruAdi");
        }
    }
}
