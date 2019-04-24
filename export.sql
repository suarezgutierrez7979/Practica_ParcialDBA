--------------------------------------------------------
--  File created - Tuesday-April-23-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View CANTIDAD_HUECOS_BLOQUEADOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MAURICIO"."CANTIDAD_HUECOS_BLOQUEADOS" ("APELLIDOS", "NOMBRES", "CODIGO_INTERNO", "ESTADO", "ENCARGADO_ID", "ENCARGADO_COUNT") AS 
  SELECT E.APELLIDOS ,E.NOMBRES, E.CODIGO_INTERNO, H.ESTADO, H.ENCARGADO_ID, COUNT(H.ENCARGADO_ID) OVER (PARTITION BY ENCARGADO_ID)ENCARGADO_COUNT
FROM ENCARGADOS E INNER JOIN HUECOS H
ON H.ENCARGADO_ID=E.ID
WHERE H.ESTADO='BLOQUEADO';
--------------------------------------------------------
--  DDL for View HUECOS_PENDIENTES_Y_ESTUDIO
--------------------------------------------------------

  CREATE OR REPLACE FORCE NONEDITIONABLE VIEW "MAURICIO"."HUECOS_PENDIENTES_Y_ESTUDIO" ("APELLIDOS", "CODIGO_INTERNO", "ESTADO", "APELLIDO_COUNT") AS 
  SELECT E.APELLIDOS ,E.CODIGO_INTERNO, H.ESTADO, COUNT(E.APELLIDOS) OVER (PARTITION BY E.APELLIDOS)APELLIDO_COUNT
FROM ENCARGADOS E INNER JOIN HUECOS H
ON H.ENCARGADO_ID=E.ID
WHERE H.ESTADO='PENDIENTE';
