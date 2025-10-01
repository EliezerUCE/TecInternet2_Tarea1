using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class Contacto
{
    public int ContactosId { get; set; }

    public int PerfilId { get; set; }

    public string Nombre { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Mensaje { get; set; } = null!;

    public DateTime? Fecha { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
