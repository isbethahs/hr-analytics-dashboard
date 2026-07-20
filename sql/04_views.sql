-- ============================================
-- HR Analytics Dashboard
-- Archivo: 04_views.sql
-- Autor: Isbeth Hernández-- ============================================
-- HR Analytics Dashboard
-- Archivo: 04_views.sql
-- Autor: Isbeth Hernández
-- ============================================

-- Descripción:
-- Este archivo contiene las vistas SQL utilizadas
-- para simplificar el acceso a los principales
-- indicadores del proyecto HR Analytics Dashboard.
--
-- Las vistas permiten reutilizar consultas,
-- mejorar la organización del código y facilitar
-- futuras conexiones con herramientas como
-- Power BI u otras soluciones de Business Intelligence.
-- ============================================



-- ==========================================================
-- VISTA 1
-- Tasa de rotación por departamento
--
-- Objetivo:
-- Resumir el total de empleados, las salidas y la tasa
-- de rotación para cada departamento.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_departamento AS

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

GROUP BY Department;



-- ==========================================================
-- VISTA 2
-- Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de
-- rotación dentro de la organización.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_cargo AS

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

GROUP BY JobRole;



-- ==========================================================
-- VISTA 3
-- Rotación según horas extra
--
-- Objetivo:
-- Comparar la tasa de rotación entre empleados
-- que realizan horas extra y quienes no.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_overtime AS

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

GROUP BY OverTime;



-- ==========================================================
-- VISTA 4
-- Rotación por rango de antigüedad
--
-- Objetivo:
-- Analizar cómo varía la rotación según los años
-- de permanencia en la empresa.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_antiguedad AS

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

    END;



-- ==========================================================
-- VISTA 5
-- Distribución de empleados por género
--
-- Objetivo:
-- Mostrar la composición total de la plantilla
-- según el género de los empleados.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_distribucion_genero AS

SELECT

    Gender,

    COUNT(*) AS total_empleados

FROM hr_employees

GROUP BY Gender;



-- ==========================================================
-- VISTA 6
-- KPIs globales
--
-- Objetivo:
-- Consolidar los principales indicadores utilizados
-- en el dashboard ejecutivo.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_kpis_globales AS

SELECT

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS headcount_activo,

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

    ) AS tasa_rotacion,

    ROUND(

        AVG(JobSatisfaction),

        1

    ) AS satisfaccion_promedio,

    SUM(

        CASE

            WHEN JobSatisfaction <= 2 THEN 1

            ELSE 0

        END

    ) AS empleados_con_baja_satisfaccion

FROM hr_employees;



-- ==========================================================
-- Verificación de vistas creadas
--
-- Objetivo:
-- Listar todas las vistas disponibles en la base
-- de datos una vez ejecutado este archivo.
-- ==========================================================

SELECT

    name

FROM sqlite_master

WHERE type = 'view'

ORDER BY name;
-- ============================================

-- Descripción:
-- Este archivo contiene las vistas SQL utilizadas
-- para simplificar el acceso a los principales
-- indicadores del proyecto HR Analytics Dashboard.
--
-- Las vistas permiten reutilizar consultas,
-- mejorar la organización del código y facilitar
-- futuras conexiones con herramientas como
-- Power BI u otras soluciones de Business Intelligence.
-- ============================================



-- ==========================================================
-- VISTA 1
-- Tasa de rotación por departamento
--
-- Objetivo:
-- Resumir el total de empleados, las salidas y la tasa
-- de rotación para cada departamento.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_departamento AS

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

GROUP BY Department;



-- ==========================================================
-- VISTA 2
-- Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de
-- rotación dentro de la organización.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_cargo AS

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

GROUP BY JobRole;



-- ==========================================================
-- VISTA 3
-- Rotación según horas extra
--
-- Objetivo:
-- Comparar la tasa de rotación entre empleados
-- que realizan horas extra y quienes no.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_overtime AS

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

GROUP BY OverTime;



-- ==========================================================
-- VISTA 4
-- Rotación por rango de antigüedad
--
-- Objetivo:
-- Analizar cómo varía la rotación según los años
-- de permanencia en la empresa.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_antiguedad AS

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

    END;



-- ==========================================================
-- VISTA 5
-- Distribución de empleados por género
--
-- Objetivo:
-- Mostrar la composición total de la plantilla
-- según el género de los empleados.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_distribucion_genero AS

SELECT

    Gender,

    COUNT(*) AS total_empleados

FROM hr_employees

GROUP BY Gender;



-- ==========================================================
-- VISTA 6
-- KPIs globales
--
-- Objetivo:
-- Consolidar los principales indicadores utilizados
-- en el dashboard ejecutivo.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_kpis_globales AS

SELECT

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS headcount_activo,

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

    ) AS tasa_rotacion,

    ROUND(

        AVG(JobSatisfaction),

        1

    ) AS satisfaccion_promedio,

    SUM(

        CASE

            WHEN JobSatisfaction <= 2 THEN 1

            ELSE 0

        END

    ) AS empleados_con_baja_satisfaccion

FROM hr_employees;



-- ==========================================================
-- Verificación de vistas creadas
--
-- Objetivo:
-- Listar todas las vistas disponibles en la base
-- de datos una vez ejecutado este archivo.
-- ==========================================================

SELECT

    name

FROM sqlite_master

WHERE type = 'view'

ORDER BY name;-- ============================================
-- HR Analytics Dashboard
-- Archivo: 04_views.sql
-- Autor: Isbeth Hernández
-- ============================================

-- Descripción:
-- Este archivo contiene las vistas SQL utilizadas
-- para simplificar el acceso a los principales
-- indicadores del proyecto HR Analytics Dashboard.
--
-- Las vistas permiten reutilizar consultas,
-- mejorar la organización del código y facilitar
-- futuras conexiones con herramientas como
-- Power BI u otras soluciones de Business Intelligence.
-- ============================================



-- ==========================================================
-- VISTA 1
-- Tasa de rotación por departamento
--
-- Objetivo:
-- Resumir el total de empleados, las salidas y la tasa
-- de rotación para cada departamento.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_departamento AS

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

GROUP BY Department;



-- ==========================================================
-- VISTA 2
-- Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de
-- rotación dentro de la organización.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_cargo AS

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

GROUP BY JobRole;



-- ==========================================================
-- VISTA 3
-- Rotación según horas extra
--
-- Objetivo:
-- Comparar la tasa de rotación entre empleados
-- que realizan horas extra y quienes no.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_overtime AS

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

GROUP BY OverTime;



-- ==========================================================
-- VISTA 4
-- Rotación por rango de antigüedad
--
-- Objetivo:
-- Analizar cómo varía la rotación según los años
-- de permanencia en la empresa.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_antiguedad AS

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

    END;



-- ==========================================================
-- VISTA 5
-- Distribución de empleados por género
--
-- Objetivo:
-- Mostrar la composición total de la plantilla
-- según el género de los empleados.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_distribucion_genero AS

SELECT

    Gender,

    COUNT(*) AS total_empleados

FROM hr_employees

GROUP BY Gender;



-- ==========================================================
-- VISTA 6
-- KPIs globales
--
-- Objetivo:
-- Consolidar los principales indicadores utilizados
-- en el dashboard ejecutivo.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_kpis_globales AS

SELECT

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS headcount_activo,

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

    ) AS tasa_rotacion,

    ROUND(

        AVG(JobSatisfaction),

        1

    ) AS satisfaccion_promedio,

    SUM(

        CASE

            WHEN JobSatisfaction <= 2 THEN 1

            ELSE 0

        END

    ) AS empleados_con_baja_satisfaccion

FROM hr_employees;



-- ==========================================================
-- Verificación de vistas creadas
--
-- Objetivo:
-- Listar todas las vistas disponibles en la base
-- de datos una vez ejecutado este archivo.
-- ==========================================================

SELECT

    name

FROM sqlite_master

WHERE type = 'view'

ORDER BY name;-- ============================================
-- HR Analytics Dashboard
-- Archivo: 04_views.sql
-- Autor: Isbeth Hernández
-- ============================================

-- Descripción:
-- Este archivo contiene las vistas SQL utilizadas
-- para simplificar el acceso a los principales
-- indicadores del proyecto HR Analytics Dashboard.
--
-- Las vistas permiten reutilizar consultas,
-- mejorar la organización del código y facilitar
-- futuras conexiones con herramientas como
-- Power BI u otras soluciones de Business Intelligence.
-- ============================================



-- ==========================================================
-- VISTA 1
-- Tasa de rotación por departamento
--
-- Objetivo:
-- Resumir el total de empleados, las salidas y la tasa
-- de rotación para cada departamento.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_departamento AS

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

GROUP BY Department;



-- ==========================================================
-- VISTA 2
-- Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de
-- rotación dentro de la organización.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_cargo AS

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

GROUP BY JobRole;



-- ==========================================================
-- VISTA 3
-- Rotación según horas extra
--
-- Objetivo:
-- Comparar la tasa de rotación entre empleados
-- que realizan horas extra y quienes no.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_overtime AS

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

GROUP BY OverTime;



-- ==========================================================
-- VISTA 4
-- Rotación por rango de antigüedad
--
-- Objetivo:
-- Analizar cómo varía la rotación según los años
-- de permanencia en la empresa.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_antiguedad AS

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

    END;



-- ==========================================================
-- VISTA 5
-- Distribución de empleados por género
--
-- Objetivo:
-- Mostrar la composición total de la plantilla
-- según el género de los empleados.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_distribucion_genero AS

SELECT

    Gender,

    COUNT(*) AS total_empleados

FROM hr_employees

GROUP BY Gender;



-- ==========================================================
-- VISTA 6
-- KPIs globales
--
-- Objetivo:
-- Consolidar los principales indicadores utilizados
-- en el dashboard ejecutivo.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_kpis_globales AS

SELECT

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS headcount_activo,

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

    ) AS tasa_rotacion,

    ROUND(

        AVG(JobSatisfaction),

        1

    ) AS satisfaccion_promedio,

    SUM(

        CASE

            WHEN JobSatisfaction <= 2 THEN 1

            ELSE 0

        END

    ) AS empleados_con_baja_satisfaccion

FROM hr_employees;



-- ==========================================================
-- Verificación de vistas creadas
--
-- Objetivo:
-- Listar todas las vistas disponibles en la base
-- de datos una vez ejecutado este archivo.
-- ==========================================================

SELECT

    name

FROM sqlite_master

WHERE type = 'view'

ORDER BY name;-- ============================================
-- HR Analytics Dashboard
-- Archivo: 04_views.sql
-- Autor: Isbeth Hernández
-- ============================================

-- Descripción:
-- Este archivo contiene las vistas SQL utilizadas
-- para simplificar el acceso a los principales
-- indicadores del proyecto HR Analytics Dashboard.
--
-- Las vistas permiten reutilizar consultas,
-- mejorar la organización del código y facilitar
-- futuras conexiones con herramientas como
-- Power BI u otras soluciones de Business Intelligence.
-- ============================================



-- ==========================================================
-- VISTA 1
-- Tasa de rotación por departamento
--
-- Objetivo:
-- Resumir el total de empleados, las salidas y la tasa
-- de rotación para cada departamento.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_departamento AS

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

GROUP BY Department;



-- ==========================================================
-- VISTA 2
-- Tasa de rotación por cargo
--
-- Objetivo:
-- Identificar los cargos con mayor porcentaje de
-- rotación dentro de la organización.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_cargo AS

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

GROUP BY JobRole;



-- ==========================================================
-- VISTA 3
-- Rotación según horas extra
--
-- Objetivo:
-- Comparar la tasa de rotación entre empleados
-- que realizan horas extra y quienes no.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_overtime AS

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

GROUP BY OverTime;



-- ==========================================================
-- VISTA 4
-- Rotación por rango de antigüedad
--
-- Objetivo:
-- Analizar cómo varía la rotación según los años
-- de permanencia en la empresa.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_rotacion_por_antiguedad AS

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

    END;



-- ==========================================================
-- VISTA 5
-- Distribución de empleados por género
--
-- Objetivo:
-- Mostrar la composición total de la plantilla
-- según el género de los empleados.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_distribucion_genero AS

SELECT

    Gender,

    COUNT(*) AS total_empleados

FROM hr_employees

GROUP BY Gender;



-- ==========================================================
-- VISTA 6
-- KPIs globales
--
-- Objetivo:
-- Consolidar los principales indicadores utilizados
-- en el dashboard ejecutivo.
-- ==========================================================

CREATE VIEW IF NOT EXISTS v_kpis_globales AS

SELECT

    COUNT(*) AS total_empleados,

    SUM(
        CASE
            WHEN Attrition = 'No' THEN 1
            ELSE 0
        END
    ) AS headcount_activo,

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

    ) AS tasa_rotacion,

    ROUND(

        AVG(JobSatisfaction),

        1

    ) AS satisfaccion_promedio,

    SUM(

        CASE

            WHEN JobSatisfaction <= 2 THEN 1

            ELSE 0

        END

    ) AS empleados_con_baja_satisfaccion

FROM hr_employees;



-- ==========================================================
-- Verificación de vistas creadas
--
-- Objetivo:
-- Listar todas las vistas disponibles en la base
-- de datos una vez ejecutado este archivo.
-- ==========================================================

SELECT

    name

FROM sqlite_master

WHERE type = 'view'

ORDER BY name;