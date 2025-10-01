using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class Perfil
{
    public int PerfilId { get; set; }

    public string Nombre { get; set; } = null!;

    public string Apellido { get; set; } = null!;

    public DateOnly FechaNacimiento { get; set; }

    public string? Biografia { get; set; }

    public string? Foto { get; set; }

    public virtual ICollection<AnimeSeries> AnimeSeries { get; set; } = new List<AnimeSeries>();

    public virtual ICollection<Contacto> Contactos { get; set; } = new List<Contacto>();

    public virtual ICollection<Evento> Eventos { get; set; } = new List<Evento>();

    public virtual ICollection<Genealogium> Genealogia { get; set; } = new List<Genealogium>();

    public virtual ICollection<Pasatiempo> Pasatiempos { get; set; } = new List<Pasatiempo>();

    public virtual ICollection<PasatiemposImg> PasatiemposImgs { get; set; } = new List<PasatiemposImg>();

    public virtual ICollection<RedesSociale> RedesSociales { get; set; } = new List<RedesSociale>();

    public virtual ICollection<Youtuber> Youtubers { get; set; } = new List<Youtuber>();
}
