using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class IsyeriTuruMap : EntityTypeConfiguration<IsyeriTuru>
    {
        public IsyeriTuruMap()
        {
            // Primary Key
            this.HasKey(t => t.isyeriTuruId);

            // Properties
            this.Property(t => t.isyeriTuruId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.isyeriTuruAdi)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("IsyeriTuru");
            this.Property(t => t.isyeriTuruId).HasColumnName("isyeriTuruId");
            this.Property(t => t.isyeriTuruAdi).HasColumnName("isyeriTuruAdi");
        }
    }
}
