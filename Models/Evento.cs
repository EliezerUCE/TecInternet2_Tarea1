using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class Evento
{
    public int EventosId { get; set; }

    public int PerfilId { get; set; }

    public string Titulo { get; set; } = null!;

    public string? Descripcion { get; set; }

    public DateOnly Fecha { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
