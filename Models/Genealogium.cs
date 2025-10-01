using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class Genealogium
{
    public int GenealogiaId { get; set; }

    public int PerfilId { get; set; }

    public string Nombre { get; set; } = null!;

    public string Parentesco { get; set; } = null!;

    public string? Descripcion { get; set; }

    public string? Foto { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
