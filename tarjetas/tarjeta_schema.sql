-- Database: tarjeta

-- DROP DATABASE tarjeta;

CREATE DATABASE tarjeta
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_MX.UTF-8'
       LC_CTYPE = 'es_MX.UTF-8'
       CONNECTION LIMIT = -1;

-- Schema: tarjeta

-- DROP SCHEMA tarjeta;

CREATE SCHEMA tarjeta
  AUTHORIZATION postgres;

-- Table: tarjeta.cliente

-- DROP TABLE tarjeta.cliente;

CREATE TABLE tarjeta.cliente
(
  "idCliente" integer NOT NULL,
  nombre character varying,
  apellidoa character varying,
  apellidob character varying,
  calle character varying,
  numero integer,
  colonia character varying,
  ciudad character varying,
  cp integer,
  fnacimiento date,
  telefono character varying,
  CONSTRAINT pk_cliente PRIMARY KEY ("idCliente")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarjeta.cliente
  OWNER TO postgres;


