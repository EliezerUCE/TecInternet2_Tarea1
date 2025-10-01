using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class PasatiemposImg
{
    public int PasatiemposImgsId { get; set; }

    public int PerfilId { get; set; }

    public string Nombre { get; set; } = null!;

    public string Imagen { get; set; } = null!;

    public string? Descripcion { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
