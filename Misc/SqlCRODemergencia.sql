-- Este sql crea un procedimiento almacenado simple para Insertar datos en todas las tablas de emergencia
-- Usa metaprogramacion, es codigo que escribe codigo que ejecuta codigo. ¡Super interesante!


-- DEBES IR PASO POR PASO. ABRO SECCION, SOLO ESA PARTE DEBES EJECUTAR.
-- HAY UN PROBLEMA CON LOS TIPOS DE DATOS NCHAR, LOS CONVIERTO A NVARCHAR(10) PARA MAXIMIZAR COMPATIBILIDAD
-- VARCHAR Y NVARCHAR FUNCIONAN BIEN, SEA CUAL SEA SU TAMAÑO


-- RECUERDA 'USE [TU BASE DE DATOS]'


--------------------------------------------------------------------
-- 	SEQUENCIAS PARA CADA TABLA EN LA BASE DE DATOS ------
--------------------------------------------------------------------

DECLARE @TableName NVARCHAR(128)
DECLARE @SequenceName NVARCHAR(128)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Genera una secuencia para cada tabla
    SET @SequenceName = 'Seq_' + @TableName
    EXEC ('CREATE SEQUENCE ' + @SequenceName +
          ' START WITH 1 INCREMENT BY 1')

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor
----------------------------------------------------------------------
----------------------- FIN -------------------------------
-------------------------------------------------------------



-- INSERT! INSERTA COSAS EN TU BASE DE DATOS!

-- USA ESTO PARA CREAR UN PROCEDIMIENTO INSERTAR PARA CADA TABLA EN
-- TU BASE DE DATOS. ASUME UNA LLAVE PRIMARIA LLAMADA ID (SOLO ID, NO
-- ID_ROPA O ID_PRODUCTO). HACE CONTEO AUTOMATICO USANDO LA SEQUENCIA
-- QUE CREASTE ANTES, ASI QUE NO NECESITAS INGRESAR ID POR MANO PARA
-- CADA NUEVO INSERT.

-- TAMBIEN ASUME UNA LLAVE PRIMARIA NCHAR O VARCHAR. Y CREA DE FORMA
-- AUTOMATICA UNA LLAVE CON FORMATO. LAS PRIMERAS 3 SIGLAS DEL NOMBRE DE
-- LA TABLA Y EL NUMERO DE LA SEQUENCIA


-----------------------------------------------------------------------
--------------------------------------------------------------------
DECLARE @TableName NVARCHAR(128)
DECLARE @ColumnName NVARCHAR(128)
DECLARE @Parameters NVARCHAR(MAX)
DECLARE @Columns NVARCHAR(MAX)
DECLARE @Variables NVARCHAR(MAX)
DECLARE @SQL NVARCHAR(MAX)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Inicializamos las cadenas
    SET @Parameters = ''
    SET @Columns = ''
    SET @Variables = ''
    SET @SQL = ''

    -- Generamos la lista de parámetros, columnas y variables
    SELECT
        @Parameters = @Parameters + ', @' + COLUMN_NAME + ' ' +
                      CASE
                          WHEN DATA_TYPE = 'nchar' THEN 'VARCHAR(10)'
                          WHEN DATA_TYPE = 'varchar' THEN 'VARCHAR(50)'
                          ELSE DATA_TYPE
                      END,
        @Columns = @Columns + ', ' + COLUMN_NAME,
        @Variables = @Variables + ', ' + CASE WHEN COLUMN_NAME = 'ID' THEN
                            'CONVERT(NCHAR(10), @ProximoValor) + SPACE(10 - LEN(CONVERT(NCHAR(10), @ProximoValor)))'
                            ELSE '@' + COLUMN_NAME
                            END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName
    AND COLUMN_NAME <> 'ID' -- Exclude the ID column from parameters

    -- Eliminamos la coma inicial
    SET @Parameters = STUFF(@Parameters, 1, 2, '')
    SET @Columns = STUFF(@Columns, 1, 2, '')
    SET @Variables = STUFF(@Variables, 1, 2, '')

    -- Generamos un procedimiento almacenado para cada tabla
    SET @SQL = 'CREATE PROCEDURE Insertar' + @TableName + ' ' + @Parameters + ' AS
            BEGIN
                DECLARE @ProximoValor INT
                SET @ProximoValor = NEXT VALUE FOR [dbo].[Seq_' + @TableName + ']

                INSERT INTO ' + @TableName + ' (ID, ' + @Columns + ')
                VALUES ('''+ UPPER(LEFT(@TableName, 3)) + '''+ CONVERT(NCHAR(7), @ProximoValor) + SPACE(10 - LEN(CONVERT(NCHAR(10), @ProximoValor))), ' + @Variables + ')
            END'

    -- Imprimimos el SQL que se ejecutaría
    EXEC(@SQL)

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor
---------------------------------------------------------------------
---------------------------------------------------------------------


-- UPDATE!!
-- ESTE NO ESTOY SEGURO SI FUNCIONARA

-- ES UN UPDATE ENTERO, MODIFICAS UNO, MODIFICAS TODOS.
-- TAMBIEN, NECESITAS EL ID CORRECTO

---------------------------------------------------------------------
---------------------------------------------------------------------

DECLARE @TableName NVARCHAR(128)
DECLARE @Columns NVARCHAR(MAX)
DECLARE @Parameters NVARCHAR(MAX)
DECLARE @SQL NVARCHAR(MAX)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Inicializamos las cadenas
    SET @Columns = ''
    SET @Parameters = ''
    SET @SQL = ''

    -- Generamos la lista de columnas y parámetros para UPDATE
    SELECT
        @Columns = @Columns +
            CASE
                WHEN COLUMN_NAME = 'ID' THEN '' -- Evita asignar un nuevo valor a la clave primaria
                ELSE ', ' + COLUMN_NAME + ' = @' + COLUMN_NAME
            END,

        @Parameters = @Parameters + ', @' + COLUMN_NAME + ' ' +
                      CASE
                          WHEN DATA_TYPE = 'nchar' THEN 'VARCHAR(10)' -- Cambia a VARCHAR(10)
                          WHEN DATA_TYPE = 'varchar' THEN 'VARCHAR(50)' -- O usa el tamaño adecuado
                          ELSE DATA_TYPE
                      END
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = @TableName

    -- Eliminamos la coma inicial
    SET @Columns = STUFF(@Columns, 1, 2, '')
    SET @Parameters = STUFF(@Parameters, 1, 2, '')

    -- Generamos un procedimiento almacenado para cada tabla
    SET @SQL = 'CREATE PROCEDURE Actualizar' + @TableName + ' ' + @Parameters + ' AS
            BEGIN
                UPDATE ' + @TableName + '
                SET ' + @Columns + '
                WHERE ID = @ID;
            END'

    -- Ejecutamos el SQL generado
    EXEC(@SQL)

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor
---------------------------------------------
---------------------------------------------

-- DELETE!
-- BORRA ESE DATO!

-- ESTE DE HECHO ES SUPER SIMPLE. DALE UN ID, LO BORRA
----------------------------------------
----------------------------------------
DECLARE @TableName NVARCHAR(128)
DECLARE @SQL NVARCHAR(MAX)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generamos un procedimiento almacenado para cada tabla
    SET @SQL = 'CREATE PROCEDURE Eliminar' + @TableName + ' @ID nvarchar(10) AS
            BEGIN
                DELETE FROM ' + @TableName + '
                WHERE ID = @ID;
            END'

    -- Ejecutamos el SQL generado
    EXEC(@SQL)

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor
---------------------------------------------------------
---------------------------------------------------------


-- LEER!
-- LEE UN DATO EN ESPECIFICO EN ESA TABLA!

-- DE NUEVO, POR ID
--------------------------------------------
--------------------------------------------
DECLARE @TableName NVARCHAR(128)
DECLARE @SQL NVARCHAR(MAX)

DECLARE TableCursor CURSOR FOR
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_NAME != 'sysdiagrams'

OPEN TableCursor

FETCH NEXT FROM TableCursor INTO @TableName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Generamos un procedimiento almacenado para leer una fila por ID
    SET @SQL = 'CREATE PROCEDURE Leer' + @TableName + ' @ID nvarchar(10) AS
            BEGIN
                SELECT * FROM ' + @TableName + '
                WHERE ID = @ID;
            END'

    -- Ejecutamos el SQL generado
    EXECUTE (@SQL)

    FETCH NEXT FROM TableCursor INTO @TableName
END

CLOSE TableCursor
DEALLOCATE TableCursor









---------------------------------------------------------------
---------------------------------------------------------------

-- DROP DE EMERGENCIA
-- BORRA TODOS LOS PROCEDIMIENTOS ALMACENADOS EN LA BASE DE DATOS
-- EMPEZA DE CERO, LIMPIA TODO

-- EXCEPTO LOS PROCEDIMIENTOS ALMACENADOS DE SISTEMA, LOS QUE VENIAN ANTES

DECLARE @DropProcedureSQL NVARCHAR(MAX) = ''

SELECT @DropProcedureSQL = @DropProcedureSQL + 'DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + '.' + QUOTENAME(name) + '; '
FROM sys.procedures
WHERE
    is_ms_shipped = 0 -- No son procedimientos de sistema
    AND name NOT LIKE 'dbo.sp_%'; -- No son procedimientos dbo.sp_

-- Ejecuta las sentencias de eliminación
EXEC(@DropProcedureSQL);




------------------------------------------------------
----------------------------------------------------------

-- BORRA TODOS LOS PROCEDIMIENTOS QUE TENGAN UN NOMBRE
-- SI QUIERES BORRAR SOLO LOS PROCEDIMIENTOS QUE HIZO EL UPDATE DE AQUI, USA ESTO

-- EN ESTE SQL, GENERAMOS:
--		Actualizar
--		Eliminar
--		Insertar
--		Leer

-- Y SI ESTE SCRIPT ENCUENTRA UN PROCEDIMIENTO ALMACENADO QUE EMPIEZE CON ESO, LO BORRA, SEA LO QUE SEA QUE ESTE DESPUES
							---------------\
--  										\ |
--										   __\|

DECLARE @ProcedureNamePattern NVARCHAR(100) = 'Insertar%' -- Cambia 'TuPalabra%' por la palabra que deseas buscar
DECLARE @SQL NVARCHAR(MAX)								   	     -- ¡EN SERIO, NO TE OLVIDES DE ESTO!	

-- Crear un script para eliminar procedimientos con el patrón especificado
SET @SQL = '
    DECLARE @ProcedureName NVARCHAR(128)

    DECLARE ProcedureCursor CURSOR FOR
    SELECT SPECIFIC_NAME
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE SPECIFIC_NAME LIKE ''' + @ProcedureNamePattern + '''
    AND NOT (SPECIFIC_NAME LIKE ''sp_%'') -- Excluir procedimientos del sistema

    OPEN ProcedureCursor

    FETCH NEXT FROM ProcedureCursor INTO @ProcedureName

    WHILE @@FETCH_STATUS = 0
    BEGIN
        DECLARE @DropSQL NVARCHAR(MAX)
        SET @DropSQL = ''DROP PROCEDURE '' + @ProcedureName

        -- Ejecutar el script para eliminar el procedimiento
        EXEC sp_executesql @DropSQL

        FETCH NEXT FROM ProcedureCursor INTO @ProcedureName
    END

    CLOSE ProcedureCursor
    DEALLOCATE ProcedureCursor
'

-- Ejecutar el script
EXEC sp_executesql @SQL
