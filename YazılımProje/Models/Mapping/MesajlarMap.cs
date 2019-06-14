using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace YazılımProje.Models.Mapping
{
    public class MesajlarMap : EntityTypeConfiguration<Mesajlar>
    {
        public MesajlarMap()
        {
            // Primary Key
            this.HasKey(t => t.id);

            // Properties
            this.Property(t => t.mesaj)
                .IsRequired();

            this.Property(t => t.konu)
                .HasMaxLength(50);

            // Table & Column Mappings
            this.ToTable("Mesajlar");
            this.Property(t => t.id).HasColumnName("id");
            this.Property(t => t.gönderenID).HasColumnName("gönderenID");
            this.Property(t => t.aliciID).HasColumnName("aliciID");
            this.Property(t => t.tarih).HasColumnName("tarih");
            this.Property(t => t.okundumu).HasColumnName("okundumu");
            this.Property(t => t.mesaj).HasColumnName("mesaj");
            this.Property(t => t.konu).HasColumnName("konu");

            // Relationships
            this.HasRequired(t => t.Kullanici)
                .WithMany(t => t.Mesajlars)
                .HasForeignKey(d => d.aliciID);
            this.HasRequired(t => t.Kullanici1)
                .WithMany(t => t.Mesajlars1)
                .HasForeignKey(d => d.gönderenID);

        }
    }
}
