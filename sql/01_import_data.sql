-- ==========================================================
-- HR Analytics Dashboard
-- Archivo: 01_import_data.sql
-- Autor: Isbeth Hernández
--
-- Descripción:
-- Este archivo documenta el proceso de importación del dataset
-- IBM HR Analytics a una base de datos SQLite.
--
-- Base de datos: hr_database.db
-- Tabla: hr_employees
-- ==========================================================

-- ==========================================================
-- PASO 1
-- Crear una base de datos SQLite
--
-- Nombre:
-- hr_database.db
-- ==========================================================

-- La base de datos fue creada utilizando la extensión
-- SQLite Viewer en Visual Studio Code.


-- ==========================================================
-- PASO 2
-- Importar el archivo CSV
--
-- Dataset:
-- IBM HR Analytics Employee Attrition & Performance
-- ==========================================================

-- El archivo CSV fue importado mediante la opción:
--
-- Import CSV
--
-- Nombre de la tabla:
--
-- hr_employees


-- ==========================================================
-- PASO 3
-- Verificar que la tabla exista
-- ==========================================================

SELECT name
FROM sqlite_master
WHERE type = 'table';


-- ==========================================================
-- PASO 4
-- Verificar el número de registros importados
-- ==========================================================

SELECT COUNT(*) AS total_empleados
FROM hr_employees;