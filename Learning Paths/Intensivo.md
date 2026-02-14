# Plan de estudio – 7 días SnowPro Core

**Recomendación General**
* Duración: 2 a 3 horas por día.
* Formato:
    1. Estudio teórico. (1 hora)
    2. Práctica en Snowflake. (75 mins)
    3. Sesión de preguntas y respuestas. (45 mins)
* Objetivo: Entender los conceptos clave y dominar escenarios del examen de certificación.


## Día 1 - Introduction, Basic Concepts, Time Travel, Billing, and Views.

**Objetivos**

Comprender a profundidad:

1. Arquitectura multi‑cluster shared data.
    * Storage, Compute, Cloud Services.
    * Resource Monitors.
2. Virtual Warehouses. 
    * Clustering automático vs. clustering manual
3. Database & Schemas. 
4. Table Types. 
    * Transient 
    * Permanent 
    * Temporary
5. Time Travel & Fail-safe.
    * Before
    * At
6. Views.
    * Non-Materialized View
    * Materialized View
    * Secure View


**Actividades**

1. Realizar los modulos correspondientes a los cursos disponibles en Udemy o Cursera.
2. Leer [documentación oficial](https://docs.snowflake.com/en/user-guide/) sobre los temas descritos anteriormente.
3. Práctica:
    * Realizar ejercicios:
        * [01_VirtualWarehouse.sql](../Exercises/01_Architecture/01_VirtualWarehouse.sql)
        * [02_StorageMonitoring.sql](../Exercises/01_Architecture/02_StorageMonitoring.sql)
        * [03_DatabasesSchemas.sql](../Exercises/02_BasicConcepts/03_DatabasesSchemas.sql)
        * [04_TableTypes.sql](../Exercises/02_BasicConcepts/04_TableTypes.sql)
        * [05_TimeTravel.sql](../Exercises/02_BasicConcepts/05_TimeTravel.sql)
        * [06_Views.sql](../Exercises/02_BasicConcepts/06_Views.sql)
3. [Preguntas](../Documentation/Preguntas/Simulador_Preguntas.ipynb) y respuestas de arquitectura y storage (15–20 preguntas).

**Resultado esperado**
* Dominar cómo Snowflake organiza datos y separa storage/compute.
* Entender funcionamiento de los Virtual Warehouses.
* Entender los tipos de tablas y sus restricciones.
* Entender el concepto de Time Travel y sus casos de uso, asi como el Fail-Safe.
* Entender los diferentes tipos de vistas y sus casos de uso.


## Día 2 – Data Loading, Semi-Structured & Unstructured Data

**Objetivos**

1. Data Loading & Unloading.
    * Stages
        * User
        * Named
        * Internal
        * External
    * Escalado automático.
    * Clustering & micro‑partition pruning.
    * Query Profile.
    * Caching (persistente y transitorio).
2. 

* Optimizaciones típicas de Snowflake.

**Actividades**

1. Revisar query profile de distintas consultas
2. Ejecutar practicas:
```sql
CREATE WAREHOUSE ...;
SHOW WAREHOUSES;
ALTER WAREHOUSE ... SUSPEND;
ALTER WAREHOUSE ... RESUME;
DROP WAREHOUSE ...;
ALTER WAREHOUSE ... SET warehouse_size='Small';
```
3. Practicar tus preguntas sobre warehouses y performance

**Resultado esperado**
Ser capaz de explicar cómo Snowflake optimiza queries y compute.

## Día 3 – Data Loading (COPY INTO & Snowpipe)

**Objetivos**

* Diferencias entre:

    * COPY INTO table.
    * COPY INTO location.
    * Snowpipe vs. Snowpipe Streaming.
* Stages internos y externos.
* File formats (JSON, Parquet, CSV, Avro)

**Actividades**

1. Crear un stage interno y externo
2. Ejecutar practicas:
```sql
CREATE OR REPLACE STAGE database.schema.stage
url = 's3://snowflake/datasets/'
file_format = database.schema.csv_ff;

CREATE OR REPLACE STAGE database.schema.internal_stage;
```
3. Analizar tus preguntas sobre carga de datos

**Resultado esperado**
Dominar escenarios de ingestión, bulk load y streaming.

## Día 4 – Seguridad y Roles

**Objetivos**

* Control de acceso basado en roles (RBAC)
* Roles heredados, system roles
* Network policies
* Masking policies & row access policies

**Actividades**

1. Crear un rol, asignarlo y probar privilegios
```sql
CREATE ROLE analyst;
GRANT USAGE ON WAREHOUSE ...;
```
2. Crear una masking policy (simple).
3. Resolver tus preguntas de seguridad

**Resultado esperado**
Entender cómo Snowflake asegura datos a nivel objeto y fila.

## Día 5 – Casos reales + Escenarios tipo examen

**Objetivos**

* Analizar casos de la vida real conectados a:
    * Optimización
    * Seguridad
    * Carga de datos
    * Arquitectura
* Resolver escenarios similares a los del examen SnowPro

**Actividades**

1. Revisar 8–12 casos prácticos.
2. Simular decisiones de arquitecto Snowflake (qué usar y cuándo).
3. Resolver preguntas complejas que hayan surgido en dias anteriores.

**Resultado esperado**
Razonamiento aplicado, no solo memorización.

## Día 6 – Simulador + Revisión de errores

**Objetivos**

* Hacer un examen completo estilo SnowPro
* Analizar en detalle todos tus errores

**Actividades**

1. Tomar un simulador de 60–100 preguntas.
2. Crear una tabla de análisis:
    * Tema
    * Error
    * Explicación correcta
3. Reforzar temas débiles con tus preguntas.

**Resultado esperado**
Identificar los 3–5 puntos críticos que requieren reforzamiento.

## Día 7 – Simulador + Revisión de errores

**Objetivos**

* Consolidar entendimiento.
* Repasar áreas con más errores.
* Rehacer 30–40 preguntas clave.

**Actividades**

1. Enfocarte en tus temas débiles (basado en día 6).
2. Responder nuevamente tus preguntas más difíciles
3. Lectura rápida de conceptos clave:
    * Caching.
    * Micro-partitions.
    * Snowpipe.
    * Roles y políticas.
    * Query Profile.

**Resultado esperado**
Llegar al examen con confianza total y claridad conceptual.

# Recursos
1. Documentación oficial de Snoflake. [https://docs.snowflake.com/en/user-guide/]
2. Intelligen: [https://irp.cdn-website.com]
3. Tony Jacobs: [https://tonyjacobs....github.io]