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
  "idAhorro" integer NOT NULL, -- numero de su cuenta de ahorro que viene desde el banco
  CONSTRAINT "pk_idAhorro" PRIMARY KEY ("idAhorro")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarjeta.cliente
  OWNER TO postgres;
COMMENT ON COLUMN tarjeta.cliente."idAhorro" IS 'numero de su cuenta de ahorro que viene desde el banco';

-- Table: tarjeta.sucursal

-- DROP TABLE tarjeta.sucursal;

CREATE TABLE tarjeta.sucursal
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
ALTER TABLE tarjeta.sucursal
  OWNER TO postgres;

  -- Table: tarjeta.ejecutivo

-- DROP TABLE tarjeta.ejecutivo;

CREATE TABLE tarjeta.ejecutivo
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
  CONSTRAINT pk_ejecutivo PRIMARY KEY ("idEjecutivo"),
  CONSTRAINT fk_sucursal FOREIGN KEY ("idSucursal")
      REFERENCES tarjeta.sucursal ("idSucursal") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarjeta.ejecutivo
  OWNER TO postgres;

  -- Table: tarjeta."tarjetaCredito"

-- DROP TABLE tarjeta."tarjetaCredito";

CREATE TABLE tarjeta."tarjetaCredito"
(
  "idTarjeta" character varying NOT NULL, -- the printed number, in front of the card
  nombre character varying,
  apellidoa character varying,
  apellidob character varying,
  "fechaVencimiento" date,
  cvc character varying(3), -- codigo de seguridad detras de la tarjeta, 3 numeros
  tipo character varying, -- visa o mastercard
  "idCliente" integer,
  CONSTRAINT pk_tarjeta PRIMARY KEY ("idTarjeta")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarjeta."tarjetaCredito"
  OWNER TO postgres;
COMMENT ON COLUMN tarjeta."tarjetaCredito"."idTarjeta" IS 'the printed number, in front of the card';
COMMENT ON COLUMN tarjeta."tarjetaCredito".cvc IS 'codigo de seguridad detras de la tarjeta, 3 numeros';
COMMENT ON COLUMN tarjeta."tarjetaCredito".tipo IS 'visa o mastercard';

-- Table: tarjeta."tarjetaDatos"

-- DROP TABLE tarjeta."tarjetaDatos";

CREATE TABLE tarjeta."tarjetaDatos"
(
  "fechaEmision" date,
  limite integer, -- es igual a: 5 veces su cuenta de ahorro + 500
  tasa integer, -- de 3 a 7 %
  "idEjecutivo" integer, -- el idEjecutivo que la emitio
  "idSucursal" integer, -- idSucursal del ejecutivo que la emitio
  "idCliente" integer,
  "idAhorro" integer,
  CONSTRAINT fk_ahorro FOREIGN KEY ("idAhorro")
      REFERENCES tarjeta.cliente ("idAhorro") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE tarjeta."tarjetaDatos"
  OWNER TO postgres;
COMMENT ON COLUMN tarjeta."tarjetaDatos".limite IS 'es igual a: 5 veces su cuenta de ahorro + 500';
COMMENT ON COLUMN tarjeta."tarjetaDatos".tasa IS 'de 3 a 7 %';
COMMENT ON COLUMN tarjeta."tarjetaDatos"."idEjecutivo" IS 'el idEjecutivo que la emitio';
COMMENT ON COLUMN tarjeta."tarjetaDatos"."idSucursal" IS 'idSucursal del ejecutivo que la emitio';



