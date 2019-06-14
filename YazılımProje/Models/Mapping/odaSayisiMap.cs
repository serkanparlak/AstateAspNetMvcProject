using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class odaSayisiMap : EntityTypeConfiguration<odaSayisi>
    {
        public odaSayisiMap()
        {
            // Primary Key
            this.HasKey(t => t.odaSayisiId);

            // Properties
            this.Property(t => t.odaSayisiAdi)
                .HasMaxLength(10);

            // Table & Column Mappings
            this.ToTable("odaSayisi");
            this.Property(t => t.odaSayisiId).HasColumnName("odaSayisiId");
            this.Property(t => t.odaSayisiAdi).HasColumnName("odaSayisiAdi");
        }
    }
}
