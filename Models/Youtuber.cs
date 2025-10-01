using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class Youtuber
{
    public int YoutubersId { get; set; }

    public int PerfilId { get; set; }

    public string NombreCanal { get; set; } = null!;

    public string? Descripcion { get; set; }

    public string Url { get; set; } = null!;

    public string? Logo { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
