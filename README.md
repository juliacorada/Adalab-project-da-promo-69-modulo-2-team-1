# proyecto-da-promo-69-modulo-2-team-1
# 🎵 O Son Do Camiño 2027 — Análisis de Viabilidad Artística
> *"La música es el camino. Nosotros solo ponemos el cartel."*

---

## 📖 Contexto

Con motivo de la próxima edición del **O Son Do Camiño 2027**, la organización del festival nos ha encargado un análisis exhaustivo para determinar qué artistas del panorama actual tienen más probabilidades de garantizar el éxito del evento.

Para ello, la plantilla de la organización lanzó una consulta interna sobre sus artistas favoritos. Con esa lista en mano, nuestro equipo ha cruzado datos de dos grandes fuentes de información musical:

- **Last.fm** → métricas de popularidad, biografías y artistas similares
- **Deezer** → catálogo discográfico, géneros y actividad reciente

El objetivo: **convertir preferencias subjetivas en criterios objetivos de viabilidad** para construir el cartel más sólido posible.

---

## 🎤 Cartel Oficial

O Son Do Camiño ha agotado en tiempo récord los abonos de su próxima edición en el Monte do Gozo, confirmando una vez más lo que ya nadie discute: este festival es una de las citas musicales más importantes de Europa.

### 🟡 Xoves 17
| Artista | |
|---|---|
| **QUEEN** + Adam Lambert | Cabeza de cartel |
| **BAD BUNNY** | Cabeza de cartel |
| Joaquín Sabina | |
| Mägo de Oz | |
| Marea | |
| La Fuga | |
| Veintiuno | |
| Ojete Calor | |

### 🟠 Venres 18
| Artista | |
|---|---|
| **MUSE** | Cabeza de cartel |
| **BILLIE EILISH** | Cabeza de cartel |
| Residente | |
| Fito y Fitipaldis | |
| Love of Lesbian | |
| Enrique Bunbury | |
| Mr. Kilombo | |
| Taburete | |

### 🔴 Sábado 19
| Artista | |
|---|---|
| **FOO FIGHTERS** | Cabeza de cartel |
| **ROSALÍA** | Cabeza de cartel |
| Estopa | |
| Rata Blanca | |
| Vetusta Morla | |
| Mikel Izal | |
| Rozalén | |
| La Plazuela | |

### 🎸 Suplentes
Maná · Metallica · Kaiser Chiefs · The Lumineers · Ginebras · Leiva

---

## 🗄️ Base de Datos

El proyecto trabaja con tres tablas principales en **MySQL**:

### `artistas` (Last.fm)
| Campo | Descripción |
|---|---|
| `artista` | Nombre del artista (PK) |
| `biografia` | Biografía extraída de Last.fm |
| `listeners` | Oyentes únicos mensuales |
| `playcount` | Reproducciones totales históricas |
| `similares` | Artistas similares según Last.fm |

### `canciones` (Deezer)
| Campo | Descripción |
|---|---|
| `artist_id` | ID del artista en Deezer |
| `artist_name` | Nombre del artista |
| `album_title` | Título del álbum |
| `track_title` | Título de la canción |
| `type` | Tipo de contenido |
| `year` | Año de lanzamiento |
| `genre` | Género musical |
| `genre_id` | ID del género |

### `tracks_lastfm` (Last.fm)
| Campo | Descripción |
|---|---|
| `artista` | Nombre del artista |
| `track` | Título de la canción |
| `playcount` | Reproducciones de la canción |
| `listeners` | Oyentes únicos de la canción |

---

## 🔗 Cruce de Tablas

Las dos APIs utilizan sistemas de IDs propios e incompatibles entre sí, por lo que el cruce se realiza por **nombre de artista** usando normalización de texto (`LOWER`) para evitar fallos por diferencias de capitalización.

---

## 📊 Criterios de Viabilidad Analizados

### 1. 🔥 Popularidad
Ranking de artistas por oyentes y reproducciones totales en Last.fm. Los grandes números indican tirón de público real.

### 2. 📅 Actividad Reciente
Artistas con lanzamientos en Deezer durante 2024, 2025 o 2026. Un artista activo tiene más probabilidades de estar de gira y con material nuevo que presentar.

### 3. 🎸 Diversidad de Géneros
Distribución del cartel por géneros musicales. Un festival equilibrado evita saturar a un mismo perfil de público y amplía el alcance del evento.

### 4. 🤝 Artistas Relacionados
Análisis del campo `similares` de Last.fm para detectar solapamientos de audiencia entre artistas y optimizar la distribución por días o escenarios.

### 5. 🎵 Volumen de Repertorio
Número de álbumes y canciones disponibles en Deezer. Un artista con catálogo amplio puede ofrecer un set list más variado e interesante.

---

## 🏆 Objetivo Final

Generar un **informe de viabilidad** que permita a la organización del O Son Do Camiño 2027 tomar decisiones fundamentadas sobre:

- Qué artistas incluir en el cartel
- Cómo distribuirlos por escenarios y días
- Qué combinaciones maximizan la asistencia y la satisfacción del público

---

## 🛠️ Tecnologías

- **Python** — extracción y transformación de datos
- **Deezer API** — catálogo discográfico, géneros y actividad reciente
- **Last.fm API** — datos de popularidad, biografías y artistas similares
- **MySQL 8.0** — almacenamiento, gestión y consulta de la base de datos
- **Pandas** — manipulación y transformación de datos
- **Matplotlib / Seaborn** — visualización de resultados
- **GitHub** — control de versiones en equipo

---

## 📁 Estructura del Proyecto

```
├── notebooks/
│   ├── Deezer.ipynb              # Extracción datos Deezer
│   ├── lastfm.ipynb              # Extracción datos Last.fm
│   └── etl_musicstream.ipynb     # Base de datos, consultas y gráficas
├── data/
│   ├── deezer_artists.csv
│   ├── lastfm_artistas.csv
│   ├── lastfm_tracks.csv
│   ├── df_final.csv
│   └── MusicStream_preguntas.sql
└── README.md
```

---

## 👥 Equipo

- 🌟 Estefania Zamorano Mancilla 
- 🌟 Julia Corada Montano
- 🌟 Jezabel Sanchez Romero
- 🌟 Cristina Millán Mejías

Proyecto desarrollado como ejercicio de integración y análisis de datos procedentes de múltiples APIs en MySQL Workbench.

---

*O Son Do Camiño 2027 — Que el camino elija la música.*
