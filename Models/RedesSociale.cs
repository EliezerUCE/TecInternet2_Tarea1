using System;
using System.Collections.Generic;

namespace Tarea1.Models;

public partial class RedesSociale
{
    public int RedesSocialesId { get; set; }

    public int PerfilId { get; set; }

    public string Red { get; set; } = null!;

    public string? Usuario { get; set; }

    public string Url { get; set; } = null!;

    public string? Icono { get; set; }

    public virtual Perfil Perfil { get; set; } = null!;
}
