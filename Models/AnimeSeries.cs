using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class AnimeSeries
{
    public int AnimeSeriesId { get; set; }

    public int PerfilId { get; set; }

    public string Titulo { get; set; } = null!;

    public string Tipo { get; set; } = null!;

    public string? Descripcion { get; set; }

    public string? Caratula { get; set; }

    public string? TrailerYouTube { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
