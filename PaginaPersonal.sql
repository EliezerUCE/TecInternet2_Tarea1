USE master

--Create database PaginaPersonal
CREATE DATABASE PaginaPersonal;
GO

USE PaginaPersonal;
GO

-- =============================================
-- 1. INFORMACI�N PERSONAL
-- =============================================
CREATE TABLE Perfil (
    PerfilID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Apellido NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Biografia NVARCHAR(500),
    Foto NVARCHAR(200)
);

-- =============================================
-- 3. GENEALOG��
-- =============================================
CREATE TABLE Genealogia (
    GenealogiaID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Parentesco NVARCHAR(50),
    Descripcion NVARCHAR(500),
    Foto NVARCHAR(200),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID),
    FOREIGN KEY (ParentescoID) REFERENCES Parentesco(ParentescoID)
);

-- =============================================
-- 4. EVENTOS IMPORTANTES
-- =============================================
CREATE TABLE Eventos (
    EventosID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Titulo NVARCHAR(150) NOT NULL,
    Descripcion NVARCHAR(300),
    Fecha DATE NOT NULL,
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- 5. PASATIEMPOS
-- =============================================
CREATE TABLE Pasatiempos (
    PasatiemposID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(300),
    Imagen NVARCHAR(200),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- 6. YOUTUBERS FAVORITOS
-- =============================================
CREATE TABLE Youtubers (
    YoutubersID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    NombreCanal NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(200),
    URL NVARCHAR(300) NOT NULL,
    Logo NVARCHAR(200),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- 7. ANIME/SERIES FAVORITAS
-- =============================================
CREATE TABLE AnimeSeries (
    AnimeSeriesID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Titulo NVARCHAR(150) NOT NULL,
    Tipo NVARCHAR(20) NOT NULL, -- 'Anime' o 'Serie'
    Descripcion NVARCHAR(400),
    Caratula NVARCHAR(200),
    TrailerYouTube NVARCHAR(50),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- 8. MENSAJES DE CONTACTO
-- =============================================
CREATE TABLE Contactos (
    ContactosID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Mensaje NVARCHAR(500) NOT NULL,
    Fecha DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- 9. REDES SOCIALES
-- =============================================
CREATE TABLE RedesSociales (
    RedesSocialesID INT IDENTITY(1,1) PRIMARY KEY,
    PerfilID INT NOT NULL,
    Red NVARCHAR(50) NOT NULL,
    Usuario NVARCHAR(100),
    URL NVARCHAR(300) NOT NULL,
	Icono NVARCHAR(200),
    FOREIGN KEY (PerfilID) REFERENCES Perfil(PerfilID)
);

-- =============================================
-- INSERTAR DATOS DE EJEMPLO
-- =============================================

-- Perfil personal
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Juan', 'P�rez', '1995-03-15', 'Desarrollador web apasionado por la tecnolog�a y los videojuegos.', 'fotos/PerfilHombre.jpg');


-- Familiares (usando PerfilID = 1 y los ParentescoID correspondientes)
INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(1, 'Carlos P�rez', 'Padre', 'Ingeniero civil, le gusta la lectura y el f�tbol.', 'fotos/Papa1.jpg'),
(1, 'Mar�a Gonz�lez', 'Madre', 'Profesora de matem�ticas, excelente cocinera.', 'fotos/Mama1.jpg'),
(1, 'Roberto P�rez', 'Abuelo', 'Abuelo paterno, veterano y gran narrador de historias.', 'fotos/Abuelo1.jpg'),
(1, 'Carmen L�pez', 'Abuela', 'Abuela paterna, costurera experta y dulcera famosa.', 'fotos/Abuela1.jpg'),
(1, 'Miguel Gonz�lez', 'Abuelo', 'Abuelo materno, carpintero maestro.', 'fotos/Abuelo2.jpg'),
(1, 'Isabel Rodr�guez', 'Abuela', 'Abuela materna, jardinera apasionada.', 'fotos/Abuela2.jpg');

-- Eventos importantes
INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(1, 'Nacimiento', 'Nac� en Santo Domingo', '1995-03-15'),
(1, 'Graduaci�n Bachillerato', 'Me gradu� del instituto con honores', '2013-06-15'),
(1, 'Primer Trabajo', 'Comenc� como desarrollador junior', '2017-08-01'),
(1, 'Certificaci�n React', 'Obtuve certificaci�n oficial en React', '2020-11-20');

-- Pasatiempos
INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(1, 'Programaci�n', 'Desarrollo aplicaciones web con JavaScript y React', 'fotos/Pasatiempos/Programacion.jpg'),
(1, 'Gaming', 'Juego videojuegos de estrategia y RPG', 'fotos/Pasatiempos/Gaming.jpg'),
(1, 'Fotograf�a', 'Tomo fotos de paisajes y retratos', 'fotos/Pasatiempos/Fotografia.jpg'),
(1, 'Lectura', 'Leo libros de ciencia ficci�n y programaci�n', 'fotos/Pasatiempos/Lectura.jpg');

-- YouTubers favoritos
INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(1, 'Midudev', 'Programaci�n web y JavaScript', 'https://youtube.com/@midudev', 'fotos/YT/midudev.jpg'),
(1, 'TheGrefg', 'Gaming y entretenimiento', 'https://youtube.com/@TheGrefg', 'fotos/YT/thegrefg.jpg'),
(1, 'Quantum Fracture', 'Divulgaci�n cient�fica', 'https://youtube.com/@QuantumFracture', 'fotos/YT/quantum.jpg');

-- Anime/Series favoritas
INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(1, 'Attack on Titan', 'Anime', 'Humanidad vs titanes gigantes', 'fotos/Serie/aot.jpg', 'LV-nazLVmgo?si=eCpBuZkpVR7S8ZO2'),
(1, 'Death Note', 'Anime', 'Estudiante con cuaderno de la muerte', 'fotos/Serie/deathnote.jpg', 'WS6bOufNi9E?si=8Ici4wAzCQO7wLMU'),
(1, 'Breaking Bad', 'Serie', 'Profesor que fabrica drogas', 'fotos/Serie/breakingbad.jpg', 'mXd1zTwcQ18?si=iy0NAyW4OgPbZO6L'),
(1, 'One Piece', 'Anime', 'Piratas en busca del tesoro', 'fotos/Serie/onepiece.jpg', 'Jvkq7akLDiA?si=TljtTHM8jWPxlfQW');

-- Redes sociales
INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(1, 'GitHub', 'juan-dev', 'https://github.com/', 'fotos/Redes/GitHub.png'),
(1, 'LinkedIn', 'juan-perez', 'https://linkedin.com/in/', 'fotos/Redes/Linkedin.png'),
(1, 'X', '@juandev', 'https://x.com/', 'fotos/Redes/X.png'),
(1, 'Instagram', 'juan_dev', 'https://instagram.com/', 'fotos/Redes/Instagram.png');












-- =============================================
-- PERFIL 2: Mar�a Rodr�guez
-- =============================================
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Mar�a', 'Rodr�guez', '1998-07-22', 'Dise�adora gr�fica y amante del arte digital.', 'fotos/PerfilMujer.jpg');

INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(2, 'Luis Rodr�guez', 'Padre', 'Contador p�blico, fan�tico del ajedrez.', 'fotos/Papa2.jpg'),
(2, 'Ana Mart�nez', 'Madre', 'Enfermera dedicada, experta en reposter�a.', 'fotos/Mama2.jpg'),
(2, 'Pedro Rodr�guez', 'Abuelo', 'Abuelo paterno, mec�nico jubilado.', 'fotos/Abuelo2.jpg'),
(2, 'Rosa Fern�ndez', 'Abuela', 'Abuela paterna, maestra jubilada.', 'fotos/Abuela2.jpg'),
(2, 'Carlos Mart�nez', 'Abuelo', 'Abuelo materno, pescador de toda la vida.', 'fotos/Abuelo1.jpg'),
(2, 'Luc�a Ram�rez', 'Abuela', 'Abuela materna, bordadora tradicional.', 'fotos/Abuela1.jpg'),
(2, 'Andrea Rodr�guez', 'Hermana', 'Hermana menor, estudiante de veterinaria.', 'fotos/Hermana2.jpg'),
(2, 'Diego Rodr�guez', 'Hermano', 'Hermano mayor, arquitecto.', 'fotos/Hermano1.jpg');

INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(2, 'Nacimiento', 'Nac� en San Crist�bal', '1998-07-22'),
(2, 'Primera Exposici�n', 'Mi primera exposici�n de arte', '2016-04-10'),
(2, 'Graduaci�n Universidad', 'Licenciatura en Dise�o Gr�fico', '2020-09-15'),
(2, 'Primer Cliente Internacional', 'Trabaj� para empresa europea', '2022-03-12');

INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(2, 'Pintura Digital', 'Creo ilustraciones digitales con Procreate', 'fotos/Pasatiempos/Pintura.jpg'),
(2, 'Yoga', 'Practico yoga y meditaci�n diariamente', 'fotos/Pasatiempos/Yoga.jpg'),
(2, 'Cocina', 'Experimento con recetas veganas', 'fotos/Pasatiempos/Cocina.jpg'),
(2, 'Viajes', 'Exploro nuevos lugares y culturas', 'fotos/Pasatiempos/Viajes.jpg');

INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(2, 'Superholly', 'Idiomas y cultura', 'https://youtube.com/@Superholly', 'fotos/YT/superholly.jpg'),
(2, 'Luisito Comunica', 'Viajes y aventuras', 'https://youtube.com/@LuisitoComunica', 'fotos/YT/luisito.jpg'),
(2, 'Paulina Cocina', 'Recetas y gastronom�a', 'https://youtube.com/@PaulinaCocina', 'fotos/YT/paulina.jpg');

INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(2, 'Your Name', 'Anime', 'Romance sobrenatural entre dos j�venes', 'fotos/Serie/yourname.jpg', 'xU47nhruN-Q?si=AbCd1234567890AB'),
(2, 'Stranger Things', 'Serie', 'Misterios sobrenaturales en los 80', 'fotos/Serie/strangerthings.jpg', 'b9EkMc79ZSU?si=XyZ9876543210ZYX'),
(2, 'Violet Evergarden', 'Anime', 'Historia emotiva de autodescubrimiento', 'fotos/Serie/violet.jpg', 'g5DiAWkhETk?si=Qwe4567890123Rty');

INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(2, 'Instagram', 'maria_designs', 'https://instagram.com/', 'fotos/Redes/Instagram.png'),
(2, 'Behance', 'mariarodriguez', 'https://behance.net/', 'fotos/Redes/Behance.png'),
(2, 'Pinterest', 'maria_art', 'https://pinterest.com/', 'fotos/Redes/Pinterest.png');

-- =============================================
-- PERFIL 3: Carlos M�ndez
-- =============================================
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Carlos', 'M�ndez', '1992-11-08', 'Ingeniero de software y entusiasta de la inteligencia artificial.', 'fotos/Primo1.jpg');

INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(3, 'Jorge M�ndez', 'Padre', 'Doctor en medicina general.', 'fotos/Papa1.jpg'),
(3, 'Patricia S�nchez', 'Madre', 'Abogada especializada en familia.', 'fotos/Mama1.jpg'),
(3, 'H�ctor M�ndez', 'Abuelo', 'Abuelo paterno, agricultor.', 'fotos/Abuelo1.jpg'),
(3, 'Elena Torres', 'Abuela', 'Abuela paterna, modista.', 'fotos/Abuela2.jpg'),
(3, 'Roberto S�nchez', 'Abuelo', 'Abuelo materno, comerciante.', 'fotos/Abuelo2.jpg'),
(3, 'Gloria Mej�a', 'Abuela', 'Abuela materna, pianista.', 'fotos/Abuela1.jpg'),
(3, 'Sof�a M�ndez', 'Hermana', 'Hermana, psic�loga cl�nica.', 'fotos/Hermana1.jpg'),
(3, 'Laura M�ndez', 'Prima', 'Prima cercana, bailarina profesional.', 'fotos/Prima2.jpg'),
(3, 'Ricardo M�ndez', 'T�o', 'T�o paterno, chef ejecutivo.', 'fotos/Tio2.jpg');

INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(3, 'Nacimiento', 'Nac� en Santiago', '1992-11-08'),
(3, 'Primer Hackathon', 'Gan� mi primer hackathon nacional', '2014-10-25'),
(3, 'Maestr�a en IA', 'Complet� maestr�a en Inteligencia Artificial', '2018-12-10'),
(3, 'Startup Fundada', 'Cofund� startup de machine learning', '2021-05-20');

INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(3, 'Machine Learning', 'Desarrollo modelos de IA y redes neuronales', 'fotos/Pasatiempos/ML.jpg'),
(3, 'Ajedrez', 'Juego ajedrez competitivo', 'fotos/Pasatiempos/Ajedrez.jpg'),
(3, 'Ciclismo', 'Salgo en bicicleta los fines de semana', 'fotos/Pasatiempos/Ciclismo.jpg'),
(3, 'Podcast', 'Grabo podcast sobre tecnolog�a', 'fotos/Pasatiempos/Podcast.jpg');

INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(3, 'Dot CSV', 'Inteligencia artificial y ciencia de datos', 'https://youtube.com/@DotCSV', 'fotos/YT/dotcsv.jpg'),
(3, 'Nate Gentile', 'Desarrollo profesional tech', 'https://youtube.com/@NateGentile', 'fotos/YT/nate.jpg'),
(3, 'Two Minute Papers', 'Investigaci�n en IA', 'https://youtube.com/@TwoMinutePapers', 'fotos/YT/twominute.jpg');

INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(3, 'Steins;Gate', 'Anime', 'Viajes en el tiempo y teor�as cient�ficas', 'fotos/Serie/steinsgate.jpg', 'muCPjK4nGF4?si=Def7890123456Ghi'),
(3, 'Mr. Robot', 'Serie', 'Hacker y conspiraciones corporativas', 'fotos/Serie/mrrobot.jpg', 'xIBiJ_SzJTA?si=Jkl1234567890Mno'),
(3, 'Code Geass', 'Anime', 'Estrategia militar y poder sobrenatural', 'fotos/Serie/codegeass.jpg', 'G8CFuZ9MseQ?si=Pqr4567890123Stu');

INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(3, 'GitHub', 'carlosmendez-ai', 'https://github.com/', 'fotos/Redes/GitHub.png'),
(3, 'LinkedIn', 'carlos-mendez-ai', 'https://linkedin.com/in/', 'fotos/Redes/Linkedin.png'),
(3, 'X', '@carlosmendezAI', 'https://x.com/', 'fotos/Redes/X.png'),
(3, 'Medium', 'carlos-mendez', 'https://medium.com/', 'fotos/Redes/Medium.png');

-- =============================================
-- PERFIL 4: Ana L�pez
-- =============================================
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Ana', 'L�pez', '2000-02-14', 'Estudiante de medicina y voluntaria en organizaciones de salud.', 'fotos/Prima1.jpg');

INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(4, 'Fernando L�pez', 'Padre', 'Ingeniero el�ctrico, amante de la m�sica.', 'fotos/Papa2.jpg'),
(4, 'Carmen D�az', 'Madre', 'Farmac�utica, coleccionista de plantas.', 'fotos/Mama2.jpg'),
(4, 'Andr�s L�pez', 'Abuelo', 'Abuelo paterno, maestro de primaria jubilado.', 'fotos/Abuelo2.jpg'),
(4, 'Marta Cruz', 'Abuela', 'Abuela paterna, tejedora artesanal.', 'fotos/Abuela1.jpg'),
(4, 'Javier D�az', 'Abuelo', 'Abuelo materno, taxista jubilado.', 'fotos/Abuelo1.jpg'),
(4, 'Beatriz Morales', 'Abuela', 'Abuela materna, cocinera tradicional.', 'fotos/Abuela2.jpg'),
(4, 'Miguel L�pez', 'Hermano', 'Hermano mayor, ingeniero industrial.', 'fotos/Hermano2.jpg'),
(4, 'Valeria L�pez', 'Hermana', 'Hermana menor, estudiante de bachillerato.', 'fotos/Hija2.jpg'),
(4, 'Gabriel D�az', 'Primo', 'Primo materno, m�sico profesional.', 'fotos/Primo1.jpg'),
(4, 'Elena D�az', 'T�a', 'T�a materna, periodista.', 'fotos/Tia2.jpg');

INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(4, 'Nacimiento', 'Nac� en La Romana', '2000-02-14'),
(4, 'Voluntariado en Cl�nica', 'Comenc� voluntariado m�dico', '2018-06-01'),
(4, 'Ingreso a Medicina', 'Aceptada en facultad de medicina', '2018-09-01'),
(4, 'Misi�n Humanitaria', 'Viaje humanitario a Hait�', '2023-07-15');

INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(4, 'Voluntariado', 'Ayudo en brigadas m�dicas comunitarias', 'fotos/Pasatiempos/Voluntariado.jpg'),
(4, 'Nataci�n', 'Nado competitivamente desde ni�a', 'fotos/Pasatiempos/Natacion.jpg'),
(4, 'M�sica', 'Toco el viol�n en orquesta juvenil', 'fotos/Pasatiempos/Musica.jpg'),
(4, 'Escritura', 'Escribo blog sobre salud preventiva', 'fotos/Pasatiempos/Escritura.jpg');

INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(4, 'Dr. Mike', 'Medicina y salud explicada', 'https://youtube.com/@DoctorMike', 'fotos/YT/drmike.jpg'),
(4, 'CrashCourse', 'Educaci�n en ciencias', 'https://youtube.com/@crashcourse', 'fotos/YT/crashcourse.jpg'),
(4, 'Osmosis', 'Educaci�n m�dica', 'https://youtube.com/@osmosis', 'fotos/YT/osmosis.jpg');

INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(4, 'Cells at Work', 'Anime', 'El cuerpo humano explicado de forma divertida', 'fotos/Serie/cellsatwork.jpg', 'v7yyaYZf2qY?si=Vwx7890123456Yza'),
(4, 'Greys Anatomy', 'Serie', 'Drama m�dico en hospital', 'fotos/Serie/greys.jpg', 'pLtTi8j04LI?si=Bcd1234567890Efg'),
(4, 'The Good Doctor', 'Serie', 'M�dico con autismo supera desaf�os', 'fotos/Serie/gooddoctor.jpg', 'fYlZDTru55g?si=Hij4567890123Klm'),
(4, 'Doctor House', 'Serie', 'M�dico genio y sarc�stico resuelve casos m�dicos imposibles', 'fotos/Serie/doctorhouse.jpg', 'CIDJh6IxmeE?si=Ab12Cd34Ef56Gh78');

INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(4, 'Instagram', 'ana_medstudent', 'https://instagram.com/', 'fotos/Redes/Instagram.png'),
(4, 'X', '@analopezMD', 'https://x.com/', 'fotos/Redes/X.png'),
(4, 'LinkedIn', 'ana-lopez-med', 'https://linkedin.com/in/', 'fotos/Redes/Linkedin.png'),
(4, 'TikTok', 'ana.med', 'https://tiktok.com/', 'fotos/Redes/TikTok.png');

-- =============================================
-- PERFIL 5: Roberto Castro
-- =============================================
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Roberto', 'Castro', '1988-05-30', 'Fot�grafo profesional y director de documentales.', 'fotos/Primo2.jpg');

INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(5, 'Manuel Castro', 'Padre', 'Piloto comercial retirado.', 'fotos/Papa1.jpg'),
(5, 'Sandra Vega', 'Madre', 'Bibliotecaria y escritora aficionada.', 'fotos/Mama1.jpg'),
(5, 'Alberto Castro', 'Abuelo', 'Abuelo paterno, fot�grafo de bodas.', 'fotos/Abuelo1.jpg'),
(5, 'Dolores N��ez', 'Abuela', 'Abuela paterna, florista.', 'fotos/Abuela2.jpg'),
(5, 'Francisco Vega', 'Abuelo', 'Abuelo materno, poeta publicado.', 'fotos/Abuelo2.jpg'),
(5, 'Raquel Herrera', 'Abuela', 'Abuela materna, pintora de acuarelas.', 'fotos/Abuela1.jpg'),
(5, 'Daniel Castro', 'Hermano', 'Hermano menor, ingeniero aeron�utico.', 'fotos/Hermano1.jpg'),
(5, 'Camila Castro', 'Hermana', 'Hermana, actriz de teatro.', 'fotos/Hermana2.jpg'),
(5, 'Mart�n Vega', 'Primo', 'Primo materno, cineasta independiente.', 'fotos/Primo1.jpg'),
(5, 'Luciana Vega', 'Prima', 'Prima materna, fot�grafa de moda.', 'fotos/Prima1.jpg'),
(5, 'Sebasti�n Castro', 'T�o', 'T�o paterno, productor musical.', 'fotos/Tio1.jpg');

INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(5, 'Nacimiento', 'Nac� en Puerto Plata', '1988-05-30'),
(5, 'Primera C�mara', 'Mi padre me regal� mi primera c�mara', '2002-12-25'),
(5, 'Exposici�n Fotogr�fica', 'Primera exposici�n individual', '2010-08-15'),
(5, 'Premio Nacional', 'Gan� premio de fotograf�a documental', '2019-11-03'),
(5, 'Documental Premiado', 'Mi documental gan� en festival internacional', '2023-05-18');

INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(5, 'Fotograf�a de Calle', 'Capturo momentos urbanos cotidianos', 'fotos/Pasatiempos/Fotografia.jpg'),
(5, 'Senderismo', 'Exploro monta�as para fotografiar naturaleza', 'fotos/Pasatiempos/Senderismo.jpg'),
(5, 'Cine Cl�sico', 'Colecciono y estudio pel�culas cl�sicas', 'fotos/Pasatiempos/Cine.jpg'),
(5, 'Buceo', 'Fotograf�a submarina en arrecifes', 'fotos/Pasatiempos/Buceo.jpg');

INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(5, 'Peter McKinnon', 'Fotograf�a y cinematograf�a', 'https://youtube.com/@PeterMcKinnon', 'fotos/YT/peter.jpg'),
(5, 'DSLR Video Shooter', 'T�cnicas de video y foto', 'https://youtube.com/@dslrvideoshooter', 'fotos/YT/dslr.jpg'),
(5, 'Matti Haapoja', 'Vlogs creativos y fotograf�a', 'https://youtube.com/@MattiHaapoja', 'fotos/YT/matti.jpg');

INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(5, 'Cowboy Bebop', 'Anime', 'Cazarrecompensas en el espacio', 'fotos/Serie/cowboybebop.jpg', 'qig4KOK2R2g?si=Nop7890123456Qrs'),
(5, 'True Detective', 'Serie', 'Detectives investigan casos complejos', 'fotos/Serie/truedetective.jpg', 'fVQUcaO4AvE?si=Tuv1234567890Wxy'),
(5, 'Samurai Champloo', 'Anime', 'Samurais en Jap�n feudal con hip-hop', 'fotos/Serie/samurai.jpg', '4OuRajFzMYI?si=Zab4567890123Cde'),
(5, 'The Crown', 'Serie', 'Historia de la realeza brit�nica', 'fotos/Serie/thecrown.jpg', 'JWtnJjn6ng0?si=Fgh7890123456Ijk');

INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(5, 'Instagram', 'roberto_fotografia', 'https://instagram.com/', 'fotos/Redes/Instagram.png'),
(5, 'Vimeo', 'robertocastro', 'https://vimeo.com/', 'fotos/Redes/Vimeo.png'),
(5, '500px', 'robertocastro', 'https://500px.com/', 'fotos/Redes/500px.png'),
(5, 'X', '@robertocastro_ph', 'https://x.com/', 'fotos/Redes/X.png');

-- =============================================
-- PERFIL 6: Sof�a Reyes
-- =============================================
INSERT INTO Perfil (Nombre, Apellido, FechaNacimiento, Biografia, Foto) VALUES
('Sof�a', 'Reyes', '1996-09-18', 'Psic�loga infantil y escritora de cuentos para ni�os.', 'fotos/Tia1.jpg');

INSERT INTO Genealogia (PerfilID, Nombre, Parentesco, Descripcion, Foto) VALUES
(6, 'Tom�s Reyes', 'Padre', 'Veterinario de animales silvestres.', 'fotos/Papa2.jpg'),
(6, 'Gabriela Ortiz', 'Madre', 'Maestra de preescolar.', 'fotos/Mama2.jpg'),
(6, 'Esteban Reyes', 'Abuelo', 'Abuelo paterno, ganadero.', 'fotos/Abuelo2.jpg'),
(6, 'Clara Jim�nez', 'Abuela', 'Abuela paterna, partera tradicional.', 'fotos/Abuela1.jpg'),
(6, 'Ra�l Ortiz', 'Abuelo', 'Abuelo materno, m�sico de merengue.', 'fotos/Abuelo1.jpg'),
(6, 'Silvia Pe�a', 'Abuela', 'Abuela materna, cuentacuentos popular.', 'fotos/Abuela2.jpg'),
(6, 'Pablo Reyes', 'Hermano', 'Hermano mayor, bi�logo marino.', 'fotos/Hermano2.jpg'),
(6, 'Emma Reyes', 'Hermana', 'Hermana menor, dise�adora de interiores.', 'fotos/Hermana1.jpg'),
(6, 'Natalia Ortiz', 'Prima', 'Prima materna, pediatra.', 'fotos/Prima2.jpg'),
(6, 'Joaqu�n Ortiz', 'Primo', 'Primo materno, maestro de m�sica.', 'fotos/Primo2.jpg'),
(6, 'Victoria Reyes', 'T�a', 'T�a paterna, trabajadora social.', 'fotos/Tia2.jpg'),
(6, 'Mateo Ortiz', 'T�o', 'T�o materno, ilustrador de libros.', 'fotos/Tio2.jpg'),
(6, 'Isabella Reyes', 'Hija', 'Hija, estudiante de primaria.', 'fotos/Hija1.jpg'),
(6, 'Lucas Reyes', 'Hijo', 'Hijo, en preescolar.', 'fotos/Hijo1.jpg');

INSERT INTO Eventos (PerfilID, Titulo, Descripcion, Fecha) VALUES
(6, 'Nacimiento', 'Nac� en Barahona', '1996-09-18'),
(6, 'Primer Cuento Publicado', 'Publiqu� mi primer cuento infantil', '2015-03-22'),
(6, 'Graduaci�n Psicolog�a', 'Licenciatura en Psicolog�a Infantil', '2019-07-10'),
(6, 'Apertura de Consultorio', 'Abr� mi consultorio privado', '2021-01-15'),
(6, 'Premio Literario', 'Gan� premio nacional de literatura infantil', '2024-04-08');

INSERT INTO Pasatiempos (PerfilID, Nombre, Descripcion, Imagen) VALUES
(6, 'Escritura Creativa', 'Escribo cuentos y f�bulas para ni�os', 'fotos/Pasatiempos/Escritura.jpg'),
(6, 'Teatro Infantil', 'Dirijo obras de teatro para ni�os', 'fotos/Pasatiempos/Teatro.jpg'),
(6, 'Jardiner�a', 'Cultivo huerto urbano con mis hijos', 'fotos/Pasatiempos/Jardineria.jpg'),
(6, 'Origami', 'Creo figuras de papel para terapia l�dica', 'fotos/Pasatiempos/Origami.jpg');

INSERT INTO Youtubers (PerfilID, NombreCanal, Descripcion, URL, Logo) VALUES
(6, 'Psych2Go', 'Psicolog�a explicada de forma visual', 'https://youtube.com/@Psych2go', 'fotos/YT/psych2go.jpg'),
(6, 'Jaime Altozano', 'Teor�a musical educativa', 'https://youtube.com/@JaimeAltozano', 'fotos/YT/jaime.jpg'),
(6, 'La Gata de Schr�dinger', 'Ciencia para todos', 'https://youtube.com/@LaGataDeSchrodinger', 'fotos/YT/gata.jpg');

INSERT INTO AnimeSeries (PerfilID, Titulo, Tipo, Descripcion, Caratula, TrailerYouTube) VALUES
(6, 'Mi Vecino Totoro', 'Anime', 'Aventuras m�gicas de dos hermanas', 'fotos/Serie/totoro.jpg', '92a7Hj0ijLs?si=Lmn4567890123Opq'),
(6, 'Anne with an E', 'Serie', 'Ni�a hu�rfana encuentra hogar', 'fotos/Serie/anne.jpg', '7ug8v7rPEh8?si=Rst7890123456Uvw'),
(6, 'Hilda', 'Serie', 'Ni�a aventurera en mundo m�gico', 'fotos/Serie/hilda.jpg', 'JaVCU7pLfyc?si=Xyz1234567890Abc'),
(6, 'A Silent Voice', 'Anime', 'Redenci�n y amistad sobre bullying', 'fotos/Serie/silentvoice.jpg', 'nfK6UgLra7g?si=Def4567890123Ghi');

INSERT INTO RedesSociales (PerfilID, Red, Usuario, URL, Icono) VALUES
(6, 'Instagram', 'sofia_psicologa', 'https://instagram.com/', 'fotos/Redes/Instagram.png'),
(6, 'Facebook', 'sofiareyespsicologa', 'https://facebook.com/', 'fotos/Redes/Facebook.png'),
(6, 'LinkedIn', 'sofia-reyes-psi', 'https://linkedin.com/in/', 'fotos/Redes/Linkedin.png'),
(6, 'Goodreads', 'sofiareyes', 'https://goodreads.com/', 'fotos/Redes/Goodreads.png');