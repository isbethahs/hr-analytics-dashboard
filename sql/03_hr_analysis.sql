
-- ============================================
-- HR Analytics Dashboard
-- Archivo: 03_hr_analysis.sql
-- Autor: Isbeth Hernández
--
-- Descripción:
-- Este archivo contiene consultas SQL utilizadas para analizar
-- indicadores clave de Recursos Humanos, como rotación,
-- headcount, satisfacción laboral y retención de empleados.
-- ============================================


-- ==========================================================
-- 1. Tasa de rotación por departamento
--
-- Objetivo:
-- Identificar qué departamento presenta la mayor tasa de
-- rotación de empleados.
-- ==========================================================
SELECT
    Department,
    COUNT(*) AS total_empleados,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS empleados_que_salieron,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS tasa_rotacion
FROM hr_employees
GROUP BY Department
ORDER BY tasa_rotacion DESC;

-- ==========================================================
-- 2. Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de rotación.
-- ==========================================================

SELECT
    JobRole,
    COUNT(*) AS total_empleados,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS empleados_que_salieron,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS tasa_rotacion
FROM hr_employees
GROUP BY JobRole
ORDER BY tasa_rotacion DESC;

-- ==========================================================
-- 3. Salario promedio por cargo y nivel de satisfacción
--
-- Objetivo:
-- Analizar el salario promedio de los empleados según su cargo
-- y nivel de satisfacción laboral para identificar posibles
-- patrones entre ambas variables.
-- ==========================================================

SELECT
    JobRole,
    JobSatisfaction,
    ROUND(AVG(MonthlyIncome), 0) AS salario_promedio,
    COUNT(*) AS total_empleados
FROM hr_employees
GROUP BY JobRole, JobSatisfaction
ORDER BY JobRole, JobSatisfaction;

-- ==========================================================
-- 4. Salario promedio por nivel de satisfacción
--
-- Objetivo:
-- Comparar el salario promedio entre los distintos niveles de
-- satisfacción laboral para evaluar si existe una relación
-- aparente entre ambas variables.
-- ==========================================================

SELECT
    JobSatisfaction,
    ROUND(AVG(MonthlyIncome), 0) AS salario_promedio,
    COUNT(*) AS total_empleados
FROM hr_employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- ==========================================================
-- 5. Headcount por departamento y género
--
-- Objetivo:
-- Conocer la distribución de empleados por departamento y
-- género para analizar la composición de la fuerza laboral.
-- ==========================================================

SELECT
    Department,
    Gender,
    COUNT(*) AS headcount
FROM hr_employees
GROUP BY Department, Gender
ORDER BY Department, Gender;

-- ==========================================================
-- 6. Rotación según horas extra
--
-- Objetivo:
-- Resultado esperado:
-- Comparación de la tasa de rotación entre empleados
-- Con horas extra y sin horas extra.
-- Posibles diferencias en la permanencia del personal.
-- ==========================================================

SELECT
    OverTime,
    COUNT(*) AS total_empleados,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS empleados_que_salieron,
    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS tasa_rotacion
FROM hr_employees
GROUP BY OverTime
ORDER BY tasa_rotacion DESC;

-- ==========================================================
-- 7. Antigüedad promedio según estado de rotación
--
-- Objetivo:
-- Comparar la antigüedad promedio de los empleados que
-- permanecen en la empresa con la de aquellos que la
-- abandonaron.
-- ==========================================================

SELECT
    Attrition,
    ROUND(AVG(YearsAtCompany), 1) AS promedio_anios_empresa,
    MIN(YearsAtCompany) AS minimo,
    MAX(YearsAtCompany) AS maximo,
    COUNT(*) AS total_empleados
FROM hr_employees
GROUP BY Attrition;

-- ==========================================================
-- 8. Tasa de rotación por rango de antigüedad
--
-- Objetivo:
-- Identificar en qué rangos de antigüedad se concentra la mayor
-- tasa de rotación para apoyar el análisis de retención del
-- talento.
-- ==========================================================

SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 años'
        WHEN YearsAtCompany <= 5 THEN '3-5 años'
        WHEN YearsAtCompany <= 10 THEN '6-10 años'
        ELSE 'Más de 10 años'
    END AS rango_antiguedad,

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS empleados_que_salieron,

    ROUND(
        SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1.0
                ELSE 0
            END
        ) / COUNT(*) * 100,
        1
    ) AS tasa_rotacion

FROM hr_employees

GROUP BY
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 años'
        WHEN YearsAtCompany <= 5 THEN '3-5 años'
        WHEN YearsAtCompany <= 10 THEN '6-10 años'
        ELSE 'Más de 10 años'
    END

ORDER BY tasa_rotacion DESC;