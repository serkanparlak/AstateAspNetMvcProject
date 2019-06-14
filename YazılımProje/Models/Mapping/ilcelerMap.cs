using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class ilcelerMap : EntityTypeConfiguration<ilceler>
    {
        public ilcelerMap()
        {
            // Primary Key
            this.HasKey(t => t.ilceId);

            // Properties
            this.Property(t => t.ilceId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ilce)
                .HasMaxLength(255);

            this.Property(t => t.sehirId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Table & Column Mappings
            this.ToTable("ilceler");
            this.Property(t => t.ilceId).HasColumnName("ilceId");
            this.Property(t => t.ilce).HasColumnName("ilce");
            this.Property(t => t.sehirId).HasColumnName("sehirId");
        }
    }
}
