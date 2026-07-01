# Chess Games SQL Analysis

## Descripción

Este proyecto consiste en el análisis de datos de partidas de ajedrez utilizando **MySQL**. Se construyó una base de datos relacional a partir de un conjunto de datos con miles de partidas para explorar patrones relacionados con el rendimiento de los jugadores, las aperturas más utilizadas y los resultados de las partidas.

El objetivo fue aplicar consultas SQL para responder preguntas de negocio y fortalecer habilidades en análisis de datos utilizando bases de datos relacionales.

---

## Objetivos

* Construir una base de datos en MySQL.
* Importar y organizar datos desde archivos CSV.
* Analizar el rendimiento de jugadores y partidas.
* Explorar aperturas y resultados del juego.
* Practicar consultas SQL de nivel básico, intermedio y avanzado.

---

## Dataset

El conjunto de datos incluye información de miles de partidas de ajedrez, entre ellas:

* Identificador de la partida
* Tipo de partida (rated o casual)
* Número de movimientos
* Resultado de la partida
* Ganador
* Rating del jugador con blancas
* Rating del jugador con negras
* Apertura utilizada
* Código ECO de la apertura
* Secuencia de movimientos

---

## Herramientas utilizadas

* MySQL
* SQL
* GitHub

---

## Conceptos SQL utilizados

* CREATE DATABASE
* CREATE TABLE
* SELECT
* WHERE
* ORDER BY
* GROUP BY
* COUNT()
* AVG()
* SUM()
* ROUND()
* CASE
* HAVING
* UNION ALL
* LIMIT

---

## Consultas desarrolladas

Durante el proyecto se desarrollaron consultas para analizar:

* Total de partidas registradas.
* Resultados por ganador.
* Formas más comunes de finalizar una partida.
* Promedio de rating de los jugadores.
* Aperturas más utilizadas.
* Aperturas con mayor porcentaje de victorias.
* Partidas más largas.
* Relación entre diferencia de rating y resultado.
* Ranking de jugadores según victorias.
* Comparación entre nivel de los jugadores y duración de las partidas.

---

## Preguntas de negocio

* ¿Cuáles son las aperturas más utilizadas?
* ¿Qué aperturas presentan mejores tasas de victoria?
* ¿Cómo influye la diferencia de rating en el resultado?
* ¿Qué jugadores presentan mejores porcentajes de victoria?
* ¿Las partidas entre jugadores de mayor nivel duran más movimientos?
* ¿Qué tipo de finalización es más frecuente?

---

## Principales aprendizajes

Durante este proyecto se reforzaron habilidades en:

* Diseño de bases de datos relacionales.
* Importación de archivos CSV.
* Desarrollo de consultas SQL de diferentes niveles.
* Análisis exploratorio de datos.
* Interpretación de métricas deportivas mediante SQL.

---

## Estructura del proyecto

```
chess-games-sql-analysis
│
├── games.csv
├── chess_games_queries.sql
└── README.md
```

---

## Conclusión

Este proyecto demuestra el uso de SQL para analizar datos de partidas de ajedrez mediante consultas que permiten identificar patrones de juego, evaluar aperturas, estudiar el rendimiento de los jugadores y explorar factores que influyen en los resultados de las partidas.

Forma parte de mi portafolio de proyectos de análisis de datos utilizando **Excel, Power BI, SQL y Python**.
