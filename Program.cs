using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using System.Security.Principal;
using Dapper;
using HandlebarsDotNet;
using System.Text;
using System.Linq;
using Serilog;
using Microsoft.EntityFrameworkCore;
using Tarea1.Data;
using Tarea1.Models;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Diagnostics;

//SeriLog
Log.Logger = new LoggerConfiguration()
    .WriteTo.File("logs/app-.log",
        rollingInterval: RollingInterval.Day)
    .CreateLogger();



Log.Information("Iniciando programa");
Log.Information("Cargando perfiles desde la base de datos");
Console.WriteLine("Cargando... ");

using var context = new PaginaPersonalContext();

var perfiles = context.Perfils.ToList();

Console.Clear();
Log.Information("Programa iniciado correctamente");
Console.WriteLine("\nLista de Perfiles Disponibles:\n");

foreach (var perfil in perfiles)
{
    Console.WriteLine($"ID: {perfil.PerfilId} - {perfil.Nombre} {perfil.Apellido}");
}

Console.Write("\nIngrese el ID del perfil para generar su página: ");
Log.Information("Esperando entrada del usuario para seleccionar perfil");

int perfilIdSeleccionado;
while (!int.TryParse(Console.ReadLine(), out perfilIdSeleccionado) ||
       !perfiles.Any(p => p.PerfilId == perfilIdSeleccionado))
{
    Log.Error("ID inválido ingresado");
    Console.ForegroundColor = ConsoleColor.Red;
    Console.WriteLine("\nID inválido. Por favor ingrese un ID de la lista.");
    Console.Write("Ingrese el ID del perfil: ");
}

Log.Information($"Perfil con ID {perfilIdSeleccionado} seleccionado");
Log.Information("Generando páginas HTML");

Console.ForegroundColor = ConsoleColor.Yellow;
Console.WriteLine("\nGenerando página...");

var perfilConRelaciones = context.Perfils
    .Include(p => p.Genealogia)
    .Include(p => p.Eventos)
    .Include(p => p.Pasatiempos)
    .Include(p => p.Youtubers)
    .Include(p => p.AnimeSeries)
    .Include(p => p.Contactos)
    .Include(p => p.RedesSociales)
    .Include(p => p.PasatiemposImgs)
    .FirstOrDefault(p => p.PerfilId == perfilIdSeleccionado);


var templatePerfiles = File.ReadAllText("templates\\index.html", Encoding.UTF8);
var templatePer = Handlebars.Compile(templatePerfiles);

var templatePasatiempos = File.ReadAllText("templates\\pasatiempos.html", Encoding.UTF8);
var templatePas = Handlebars.Compile(templatePasatiempos);

var templateYoutubers = File.ReadAllText("templates\\youtubers.html", Encoding.UTF8);
var templateYou = Handlebars.Compile(templateYoutubers);

var templateCineGustos = File.ReadAllText("templates\\cinegustos.html", Encoding.UTF8);
var templateCin = Handlebars.Compile(templateCineGustos);

var templateMensajes = File.ReadAllText("templates\\mensajes.html", Encoding.UTF8);
var templateMen = Handlebars.Compile(templateMensajes);


var perfilSeleccionado = perfiles.First(p => p.PerfilId == perfilIdSeleccionado);

var perfilCompleto = new
{
    perfil = perfilConRelaciones,
    perfiles = new[] { perfilConRelaciones }.ToList(),
    genealogias = perfilConRelaciones.Genealogia.ToList(),
    eventos = perfilConRelaciones.Eventos.ToList(),
    pasatiempos = perfilConRelaciones.Pasatiempos.ToList(),
    youtubers = perfilConRelaciones.Youtubers.ToList(),
    animeseries = perfilConRelaciones.AnimeSeries.ToList(),
    contactos = perfilConRelaciones.Contactos.ToList(),
    redessociales = perfilConRelaciones.RedesSociales.ToList(),
    pasatiemposImgs = perfilConRelaciones.PasatiemposImgs.ToList()
};

Console.ForegroundColor = ConsoleColor.White;

var htmlContentPerfiles = templatePer(perfilCompleto);
var htmlContentPasatiempos = templatePas(perfilCompleto);
var htmlContentYoutubers = templateYou(perfilCompleto);
var htmlContentCineGustos = templateCin(perfilCompleto);
var htmlContentMensajes = templateMen(perfilCompleto);



File.WriteAllText("website\\index.html", htmlContentPerfiles, Encoding.UTF8);
File.WriteAllText("website\\pasatiempos.html", htmlContentPasatiempos, Encoding.UTF8);
File.WriteAllText("website\\youtubers.html", htmlContentYoutubers, Encoding.UTF8);
File.WriteAllText("website\\cinegustos.html", htmlContentCineGustos, Encoding.UTF8);
File.WriteAllText("website\\mensajes.html", htmlContentMensajes, Encoding.UTF8);

Log.Information("Páginas HTML generadas exitosamente");
Log.Information("Generando archivos JSON");

//Jsons
File.WriteAllText("JSONs\\index.json", htmlContentPerfiles, Encoding.UTF8);
File.WriteAllText("JSONs\\pasatiempos.json", htmlContentPasatiempos, Encoding.UTF8);
File.WriteAllText("JSONs\\youtubers.json", htmlContentYoutubers, Encoding.UTF8);
File.WriteAllText("JSONs\\cinegustos.json", htmlContentCineGustos, Encoding.UTF8);
File.WriteAllText("JSONs\\mensajes.json", htmlContentMensajes, Encoding.UTF8);

//o
string miJson = JsonSerializer.Serialize(perfilCompleto, new JsonSerializerOptions
{
    WriteIndented = true,
    ReferenceHandler = ReferenceHandler.IgnoreCycles
});

File.WriteAllText("perfil.json", miJson, Encoding.UTF8);

Log.Information("Formulario Home cargado.");
//No se cual es mejor forma, asi que hice ambas xD

Console.ForegroundColor = ConsoleColor.Green;
Console.WriteLine($"\nPágina generada exitosamente para {perfilSeleccionado.Nombre} {perfilSeleccionado.Apellido}.");
Console.ResetColor();
Console.WriteLine(Path.GetFullPath("website\\index.html"));

Process.Start(new ProcessStartInfo
{
    FileName = Path.GetFullPath("website\\index.html"),
    UseShellExecute = true
});
Log.Information("Abriendo página en el navegador predeterminado");