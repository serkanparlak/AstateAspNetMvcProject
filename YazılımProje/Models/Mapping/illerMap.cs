using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class illerMap : EntityTypeConfiguration<iller>
    {
        public illerMap()
        {
            // Primary Key
            this.HasKey(t => t.ilId);

            // Properties
            this.Property(t => t.sehir)
                .HasMaxLength(255);

            // Table & Column Mappings
            this.ToTable("iller");
            this.Property(t => t.ilId).HasColumnName("ilId");
            this.Property(t => t.sehir).HasColumnName("sehir");
        }
    }
}
