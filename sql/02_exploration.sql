-- ==========================================================
-- HR Analytics Dashboard
-- Archivo: 02_exploration.sql
-- Autor: Isbeth Hernández
--
-- Descripción:
-- Consultas de exploración inicial del dataset IBM HR Analytics.
-- Estas consultas permiten validar la estructura, calidad y
-- consistencia de los datos antes de realizar el análisis.
-- ==========================================================

-- ==========================================================
-- 1. Visualizar los primeros registros
--
-- Objetivo:
-- Verificar que el archivo se importó correctamente y conocer
-- la estructura general de los datos.
-- ==========================================================

SELECT *
FROM hr_employees
LIMIT 10;


-- ==========================================================
-- 2. Contar el total de empleados
--
-- Objetivo:
-- Confirmar que el dataset contiene la cantidad esperada de
-- registros.
-- ==========================================================

SELECT COUNT(*) AS total_empleados
FROM hr_employees;


-- ============================================================
-- 3. Revisar la estructura de la tabla
--
-- Objetivo:
-- Verificar los nombres de las columnas y sus tipos de datos.
-- ==========================================================

PRAGMA table_info(hr_employees);


-- ==========================================================
-- 4. Distribución de la variable Attrition
--
-- Objetivo:
-- Conocer cuántos empleados permanecen en la empresa y cuántos
-- la abandonaron.
-- ==========================================================

SELECT
    Attrition,
    COUNT(*) AS total_empleados
FROM hr_employees
GROUP BY Attrition;


-- ==========================================================
-- 5. Calcular la tasa de rotación global
--
-- Objetivo:
-- Obtener el porcentaje general de empleados que abandonaron
-- la empresa.
-- ==========================================================

SELECT
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        1
    ) AS tasa_rotacion
FROM hr_employees;