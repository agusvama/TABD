
-- Database: banco

-- DROP DATABASE banco;

CREATE DATABASE banco
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'es_MX.UTF-8'
       LC_CTYPE = 'es_MX.UTF-8'
       CONNECTION LIMIT = -1;

-- Schema: banco

-- DROP SCHEMA banco;

CREATE SCHEMA banco
  AUTHORIZATION postgres;


-- Table: banco.cliente

-- DROP TABLE banco.cliente;

CREATE TABLE banco.cliente
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
ALTER TABLE banco.cliente
  OWNER TO postgres;


-- Table: banco.sucursal

-- DROP TABLE banco.sucursal;

CREATE TABLE banco.sucursal
(
  "idSucursal" integer NOT NULL,
  calle character varying,
  numero integer,
  colonia character varying,
  ciudad character varying,
  cp integer,
  fapertura date,
  telefono character varying,
  CONSTRAINT pk_sucursal PRIMARY KEY ("idSucursal")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.sucursal
  OWNER TO postgres;


-- Table: banco.ejecutivo

-- DROP TABLE banco.ejecutivo;

CREATE TABLE banco.ejecutivo
(
  "idEjecutivo" integer NOT NULL,
  nombre character varying,
  apellidoa character varying,
  apellidob character varying,
  "idSucursal" integer,
  fnacimiento date,
  fcontratacion date,
  calle character varying,
  numero integer,
  colonia character varying,
  ciudad character varying,
  cp integer,
  telefono character varying,
  CONSTRAINT pk_ejecutivo PRIMARY KEY ("idEjecutivo")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.ejecutivo
  OWNER TO postgres;


-- Table: banco.servicio

-- DROP TABLE banco.servicio;

CREATE TABLE banco.servicio
(
  "idServicio" integer NOT NULL,
  "nombreServicio" character varying,
  CONSTRAINT pk_servicio PRIMARY KEY ("idServicio")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.servicio
  OWNER TO postgres;


-- Table: banco.ahorro

-- DROP TABLE banco.ahorro;

CREATE TABLE banco.ahorro
(
  "idAhorro" integer NOT NULL,
  "idServicio" integer,
  "idCliente" integer,
  "idEjecutivo" integer,
  "idSucursal" integer,
  fcontratacion date,
  CONSTRAINT pk_ahorro PRIMARY KEY ("idAhorro"),
  CONSTRAINT fk_cliente FOREIGN KEY ("idCliente")
      REFERENCES banco.cliente ("idCliente") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_servicio FOREIGN KEY ("idServicio")
      REFERENCES banco.servicio ("idServicio") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_sucursal FOREIGN KEY ("idSucursal")
      REFERENCES banco.sucursal ("idSucursal") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.ahorro
  OWNER TO postgres;


-- Table: banco.movimiento

-- DROP TABLE banco.movimiento;

CREATE TABLE banco.movimiento
(
  "idMovimiento" integer NOT NULL,
  "idAhorro" integer,
  debe integer,
  haber integer,
  fmovimiento date,
  "idSucursal" integer,
  "idEjecutivo" integer,
  CONSTRAINT pk_movimiento PRIMARY KEY ("idMovimiento"),
  CONSTRAINT fk_ahorro FOREIGN KEY ("idAhorro")
      REFERENCES banco.ahorro ("idAhorro") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.movimiento
  OWNER TO postgres;


-- Table: banco.prestamo

-- DROP TABLE banco.prestamo;

CREATE TABLE banco.prestamo
(
  "idPrestamo" integer NOT NULL,
  "idServicio" integer,
  "idCliente" integer,
  "idSucursal" integer,
  "idEjecutivo" integer,
  monto integer,
  plazo character varying,
  interes integer,
  interesmoratorio integer,
  fcontratacion date,
  CONSTRAINT pk_prestamo PRIMARY KEY ("idPrestamo"),
  CONSTRAINT fk_cliente FOREIGN KEY ("idCliente")
      REFERENCES banco.cliente ("idCliente") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_servicio FOREIGN KEY ("idServicio")
      REFERENCES banco.servicio ("idServicio") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_sucursal FOREIGN KEY ("idSucursal")
      REFERENCES banco.sucursal ("idSucursal") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE banco.prestamo
  OWNER TO postgres;
