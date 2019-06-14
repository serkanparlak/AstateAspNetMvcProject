using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class isitmaTuruMap : EntityTypeConfiguration<isitmaTuru>
    {
        public isitmaTuruMap()
        {
            // Primary Key
            this.HasKey(t => t.isitmaTuruId);

            // Properties
            this.Property(t => t.isitmaTuruId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.isitmaTuruAdi)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("isitmaTuru");
            this.Property(t => t.isitmaTuruId).HasColumnName("isitmaTuruId");
            this.Property(t => t.isitmaTuruAdi).HasColumnName("isitmaTuruAdi");
        }
    }
}
