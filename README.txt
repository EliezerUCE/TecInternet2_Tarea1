Página Personal - Generador Estático
Sistema de generación de sitio web personal estático utilizando datos de SQL Server y plantillas Handlebars.

Descripción
Esta aplicación de consola en C# lee información personal desde una base de datos SQL Server y genera páginas HTML usando plantillas Handlebars. El resultado es un sitio web personal completamente funcional.
Esta aplicación de consola también genera Logs que registra toda la información e interacción en la consola, y archivos JSON con información de respaldo

Paginas generadas
o	index.html (Donde encontrarás la información básica del usuario, su genealogía y su línea de tiempo)
o	pasatiempos.html (Una página con pasatiempos y una pequeña galería de imágenes con estos)
o	youtubers.html (Donde verás su lista de youtubers favoritos)
o	cinegustos.html (Aquí están sus gustos del cine)
o	mensajes.html (Y aquí podrás ponerte en contacto con él)
Estos se encuentran en la carpeta website dentro de la carpeta del proyecto

Al ejecutar el programa deberás ingresar el ID (de la lista que se te mostrará) del usuario, y luego de presionar enter el programa validará si es correcto, y si sí, generará los documentos antes mencionados y te direccionará automáticamente a la página, y todo esto será capturado en el log, y será respaldado en los JSON.
