using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class ArsaTuruMap : EntityTypeConfiguration<ArsaTuru>
    {
        public ArsaTuruMap()
        {
            // Primary Key
            this.HasKey(t => t.arsaTuruId);

            // Properties
            this.Property(t => t.arsaTuruId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.arsaTuruAdi)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("ArsaTuru");
            this.Property(t => t.arsaTuruId).HasColumnName("arsaTuruId");
            this.Property(t => t.arsaTuruAdi).HasColumnName("arsaTuruAdi");
        }
    }
}
