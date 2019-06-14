using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class bulunduguKatMap : EntityTypeConfiguration<bulunduguKat>
    {
        public bulunduguKatMap()
        {
            // Primary Key
            this.HasKey(t => t.bulunduguKatId);

            // Properties
            this.Property(t => t.bulunduguKatAdi)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("bulunduguKat");
            this.Property(t => t.bulunduguKatId).HasColumnName("bulunduguKatId");
            this.Property(t => t.bulunduguKatAdi).HasColumnName("bulunduguKatAdi");
        }
    }
}
