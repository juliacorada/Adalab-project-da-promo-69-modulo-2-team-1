CREATE SCHEMA IF NOT EXISTS musicstream;

USE musicstream;

 

-- ¿Cabezas de cartel? Veámos los 9 artistas con más popularidad (oyentes):

SELECT artista, listeners
FROM artistas
ORDER BY listeners DESC
LIMIT 9;

-- Queen? Pero si Freddy Mercury falleció hace años... a ver qué dice su bio? Y Metallica? Son mayorcetes para el estilo de música que tocan...(sin ánimo de ofender)

SELECT artista, biografia
FROM artistas
WHERE artista IN ('Queen','Metallica');

-- Entonces, Queen sigue haciendo directos... (¡nos sirve!) y Metallica son buenísimos pero mayores... Además es un Rock más tirando a Metal. Los dejamos como suplentes (preferentes):) Repartamos a los que nos quedan por géneros:

SELECT DISTINCT a.artista, c.genre, a.similares, a.listeners -- añadimos campo similares por si nos hiciera falta sustituir algun artista, buscar más rápido :P
FROM artistas a
INNER JOIN canciones c  ON c.artist_name = a.artista
ORDER BY a.listeners DESC
LIMIT 11; -- 11? Sí, es que al haber varios géneros por artista, no son solo 9 filas.

-- Empecemos... Queen (+Adam Lambert) sería el primero, pero para abrir estaría interesante poner algún artista de habla hispana, así que a tope con Bad Bunny.
-- Vamos con Muse y a pesar de que el género aparece como Alternativo, sabemos que es bastante tirando hacia el rock, así que pasamos directamente a Billie Eilish, que tiene un estilo único aunque sea alternativo.
-- Ahora tocan los Foo Fighters, mucho rock de calidad, así que buscamos algo diferente para compartir cabeza de cartel... Rosalía es española, cierre perfecto.

-- El resto? Vamos a dividir los 21 que nos faltan entre tres (7 por día), ordenados por "listeners" y de cada tramo enviamos dos a cada día, para que quede repartido equitativamente:

SELECT artista, listeners -- Okay tenemos los 7 siguientes, miremos ahora géneros y similares.
FROM artistas
ORDER BY listeners DESC
LIMIT 7 OFFSET 9; -- Omite las 9 filas anteriores y dame las 7 siguientes

SELECT DISTINCT a.artista, c.genre, a.similares, a.listeners 
FROM artistas a
INNER JOIN canciones c  ON c.artist_name = a.artista
ORDER BY a.listeners DESC
LIMIT 10 OFFSET 11;
 -- Extremoduro va a ser que no, que el robe nos dejó el año pasado... En similares aparecen Fito y Fitipaldi, así que vamos con ello.
 -- Sabina el primer día que es Pop bastante clásico, con Mägo de Oz que son cañeros cañeros (Rock).
 -- Residente es el único rapero, directo al viernes con... ¿Fito? Son bastante distintos, podría ir guay para mezclar públicos.
 -- Estopa con Rata Blanca el sábado. Seguimos:
 -- Ahora pongamos parecidos, para que tengas la necesidad de quedarte a un concierto más.
 
 SELECT artista, listeners -- Okay tenemos los 7 siguientes, miremos ahora géneros y similares.
FROM artistas
ORDER BY listeners DESC
LIMIT 7 OFFSET 16; -- Omite las 16 filas anteriores y dame las 7 siguientes

SELECT DISTINCT a.artista, c.genre, a.similares, a.listeners 
FROM artistas a
INNER JOIN canciones c  ON c.artist_name = a.artista
ORDER BY a.listeners DESC
LIMIT 9 OFFSET 20;
 
-- Vetusta e Izal aparecen en similares entre si, de cajón juntos. (IZAL ya no está en activo, cambiamos por Mikel Izal(mirar bio)) 
-- Bunbury con Love of Lesbian, que no son extremadamente parecidos pero al haber aparecido en solista y en grupo, le daremos un lugar.
-- La Fuga 100% con Marea, aparecen en similares también.
-- Los últimos 7:)

 SELECT artista, listeners -- Okay tenemos los 7 siguientes, miremos ahora géneros y similares.
FROM artistas
ORDER BY listeners DESC
LIMIT 7 OFFSET 23; -- Omite las 16 filas anteriores y dame las 7 siguientes

SELECT DISTINCT a.artista, c.genre, a.similares, a.listeners 
FROM artistas a
INNER JOIN canciones c  ON c.artist_name = a.artista
ORDER BY a.listeners DESC
LIMIT 11 OFFSET 29;

-- Rozalen tiene ritmos muy variados, así estilo latino, la ponemos con La Plazuela.
-- Mr. Kilombo es bastante versátil así que lo pondremos con Taburete que canta pop.
-- Y por último ya que Ojete Calor y Veintiuno comparten a Siloé como similar, y es mi favorito, los ponemos juntos.
-- CARTELAZO.
 
-- Ahora unas preguntitas.

-- ¿Cuál es el artista con más variedad de género?
   
SELECT c.artist_name Artista, COUNT(DISTINCT c.genre) Géneros
FROM canciones c
GROUP BY c.artist_name
ORDER BY Géneros DESC
LIMIT 3;
	-- Artista(s) con más géneros --> Mr. Kilombo y La Plazuela

-- ¿Qué artista tiene más reproducciones por año?

SELECT artista Artista, playcount Reproducciones
FROM artistas
ORDER BY playcount DESC
LIMIT 3;
	-- Billie Eilish es la artista con más reproducciones
 
-- ¿De qué año tenemos más canciones?
SELECT year Año, COUNT(DISTINCT track_title) Canciones
FROM canciones
GROUP BY year
ORDER BY Canciones DESC
LIMIT 3;
 
	-- 2025 es el año con más canciones (206)
 
-- ¿Qué género es el mejor valorado?
	-- No hay columna de valoración → usamos listeners como métrica de popularidad
SELECT c.genre Género, SUM(a.listeners) Oyentes
FROM canciones c
LEFT JOIN artistas a ON LOWER(a.artista) = LOWER(c.artist_name)
GROUP BY c.genre
ORDER BY Oyentes DESC
LIMIT 3;
	-- EL genero mejor valorado es Alternativo
    
-- ¿Cuál es la canción mejor valorada?  
 
SELECT track Canción, artista Artista, playcount Reproducciones
FROM tracks_lastfm
ORDER BY playcount DESC
LIMIT 3;
	-- "Birds Of A Feather" - Billie Eilish

-- ¿Cuál es el artista con más valoración?

SELECT artista Artista, listeners Oyentes
FROM artistas
ORDER BY listeners DESC
LIMIT 3;
	-- Queen
    
-- ¿Cuál es el álbum más valorado? 
	-- Agrupamos los listeners del artista por álbum
SELECT c.artist_name Artista, c.album_title album, SUM(tlf.playcount) oyentes
FROM canciones c
INNER JOIN tracks_lastfm tlf
WHERE c.track_title = tlf.track
GROUP BY c. artist_name, c.album_title
ORDER BY oyentes DESC
LIMIT 3;
		-- El album más escuchado es "The Metallica Blacklist" - Metallica
        
-- ¿Qué artistas similares podríamos oír si nos gusta un artista en concreto?
-- Sustituye 'Billie Eilish' por el artista deseado 
SELECT artista Artista, similares "Artistas similares"
FROM artistas
WHERE artista = 'Billie Eilish';

-- Si por ejemplo, me encanta Siloé, y no sé qué artistas del festival me podrían gustar...¿lo buscamos?

SELECT artista "Artistas que puedes escuchar" 
FROM artistas
WHERE similares LIKE '%siloé%';
