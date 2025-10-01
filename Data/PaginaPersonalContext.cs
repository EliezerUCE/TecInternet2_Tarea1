using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Tarea1.Models;

namespace Tarea1.Data;

public partial class PaginaPersonalContext : DbContext
{
    public PaginaPersonalContext()
    {
    }

    public PaginaPersonalContext(DbContextOptions<PaginaPersonalContext> options)
        : base(options)
    {
    }

    public virtual DbSet<AnimeSeries> AnimeSeries { get; set; }

    public virtual DbSet<Contacto> Contactos { get; set; }

    public virtual DbSet<Evento> Eventos { get; set; }

    public virtual DbSet<Genealogium> Genealogia { get; set; }

    public virtual DbSet<Pasatiempo> Pasatiempos { get; set; }

    public virtual DbSet<PasatiemposImg> PasatiemposImgs { get; set; }

    public virtual DbSet<Perfil> Perfils { get; set; }

    public virtual DbSet<RedesSociale> RedesSociales { get; set; }

    public virtual DbSet<Youtuber> Youtubers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=ELIEZER\\MSSQLSERVER2;Database=PaginaPersonal;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<AnimeSeries>(entity =>
        {
            entity.HasKey(e => e.AnimeSeriesId).HasName("PK__AnimeSer__32286D62918B7CA7");

            entity.Property(e => e.AnimeSeriesId).HasColumnName("AnimeSeriesID");
            entity.Property(e => e.Caratula).HasMaxLength(200);
            entity.Property(e => e.Descripcion).HasMaxLength(400);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");
            entity.Property(e => e.Tipo).HasMaxLength(20);
            entity.Property(e => e.Titulo).HasMaxLength(150);
            entity.Property(e => e.TrailerYouTube).HasMaxLength(50);

            entity.HasOne(d => d.Perfil).WithMany(p => p.AnimeSeries)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__AnimeSeri__Perfi__48CFD27E");
        });

        modelBuilder.Entity<Contacto>(entity =>
        {
            entity.HasKey(e => e.ContactosId).HasName("PK__Contacto__DDAEC7B59787F19A");

            entity.Property(e => e.ContactosId).HasColumnName("ContactosID");
            entity.Property(e => e.Email).HasMaxLength(150);
            entity.Property(e => e.Fecha)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.Mensaje).HasMaxLength(500);
            entity.Property(e => e.Nombre).HasMaxLength(100);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");

            entity.HasOne(d => d.Perfil).WithMany(p => p.Contactos)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Contactos__Perfi__4CA06362");
        });

        modelBuilder.Entity<Evento>(entity =>
        {
            entity.HasKey(e => e.EventosId).HasName("PK__Eventos__4D4BA431E1ACB891");

            entity.Property(e => e.EventosId).HasColumnName("EventosID");
            entity.Property(e => e.Descripcion).HasMaxLength(300);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");
            entity.Property(e => e.Titulo).HasMaxLength(150);

            entity.HasOne(d => d.Perfil).WithMany(p => p.Eventos)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Eventos__PerfilI__403A8C7D");
        });

        modelBuilder.Entity<Genealogium>(entity =>
        {
            entity.HasKey(e => e.GenealogiaId).HasName("PK__Genealog__910012E760090CD4");

            entity.Property(e => e.GenealogiaId).HasColumnName("GenealogiaID");
            entity.Property(e => e.Descripcion).HasMaxLength(500);
            entity.Property(e => e.Foto).HasMaxLength(200);
            entity.Property(e => e.Nombre).HasMaxLength(100);
            entity.Property(e => e.Parentesco).HasMaxLength(50);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");

            entity.HasOne(d => d.Perfil).WithMany(p => p.Genealogia)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Genealogi__Perfi__3C69FB99");
        });

        modelBuilder.Entity<Pasatiempo>(entity =>
        {
            entity.HasKey(e => e.PasatiemposId).HasName("PK__Pasatiem__1087E962F78ECB0F");

            entity.Property(e => e.PasatiemposId).HasColumnName("PasatiemposID");
            entity.Property(e => e.Descripcion).HasMaxLength(300);
            entity.Property(e => e.Imagen).HasMaxLength(200);
            entity.Property(e => e.Nombre).HasMaxLength(100);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");

            entity.HasOne(d => d.Perfil).WithMany(p => p.Pasatiempos)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Pasatiemp__Perfi__4316F928");
        });

        modelBuilder.Entity<PasatiemposImg>(entity =>
        {
            entity.HasKey(e => e.PasatiemposImgsId);

            entity.Property(e => e.PasatiemposImgsId).HasColumnName("PasatiemposImgsID");
            entity.Property(e => e.Descripcion).HasMaxLength(500);
            entity.Property(e => e.Imagen).HasMaxLength(200);
            entity.Property(e => e.Nombre).HasMaxLength(150);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");

            entity.HasOne(d => d.Perfil).WithMany(p => p.PasatiemposImgs)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_PasatiemposImgs_Perfil");
        });

        modelBuilder.Entity<Perfil>(entity =>
        {
            entity.HasKey(e => e.PerfilId).HasName("PK__Perfil__0C005B66417C8483");

            entity.ToTable("Perfil");

            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");
            entity.Property(e => e.Apellido).HasMaxLength(100);
            entity.Property(e => e.Biografia).HasMaxLength(500);
            entity.Property(e => e.Foto).HasMaxLength(200);
            entity.Property(e => e.Nombre).HasMaxLength(100);
        });

        modelBuilder.Entity<RedesSociale>(entity =>
        {
            entity.HasKey(e => e.RedesSocialesId).HasName("PK__RedesSoc__9DA271C2560928BF");

            entity.Property(e => e.RedesSocialesId).HasColumnName("RedesSocialesID");
            entity.Property(e => e.Icono).HasMaxLength(300);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");
            entity.Property(e => e.Red).HasMaxLength(50);
            entity.Property(e => e.Url)
                .HasMaxLength(300)
                .HasColumnName("URL");
            entity.Property(e => e.Usuario).HasMaxLength(100);

            entity.HasOne(d => d.Perfil).WithMany(p => p.RedesSociales)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__RedesSoci__Perfi__4F7CD00D");
        });

        modelBuilder.Entity<Youtuber>(entity =>
        {
            entity.HasKey(e => e.YoutubersId).HasName("PK__Youtuber__AB661E38A2236ECF");

            entity.Property(e => e.YoutubersId).HasColumnName("YoutubersID");
            entity.Property(e => e.Descripcion).HasMaxLength(200);
            entity.Property(e => e.Logo).HasMaxLength(200);
            entity.Property(e => e.NombreCanal).HasMaxLength(100);
            entity.Property(e => e.PerfilId).HasColumnName("PerfilID");
            entity.Property(e => e.Url)
                .HasMaxLength(300)
                .HasColumnName("URL");

            entity.HasOne(d => d.Perfil).WithMany(p => p.Youtubers)
                .HasForeignKey(d => d.PerfilId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Youtubers__Perfi__45F365D3");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
