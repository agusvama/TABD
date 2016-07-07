SET SEARCH_PATH TO banco;

-- Table: cliente

-- DROP TABLE cliente;

CREATE TABLE cliente
(
  "idCliente" integer NOT NULL,
  "nombre" character varying,
  "apellidoa" character varying,
  "apellidob" character varying,
  "calle" character varying,
  "numero" integer,
  "colonia" character varying,
  "ciudad" character varying,
  "cp" integer,
  "fnacimiento" date,
  CONSTRAINT pk_cliente PRIMARY KEY ("idCliente")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cliente
  OWNER TO postgres;

-- Table: sucursal

-- DROP TABLE sucursal;

CREATE TABLE sucursal
(
  "idSucursal" integer NOT NULL,
  "calle" character varying,
  "numero" integer,
  "colonia" character varying,
  "ciudad" character varying,
  "cp" integer,
  "fapertura" date,
  CONSTRAINT pk_sucursal PRIMARY KEY ("idSucursal")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE sucursal
  OWNER TO postgres;
-- Table: ejecutivo

-- DROP TABLE ejecutivo;

CREATE TABLE ejecutivo
(
  "idEjecutivo" integer NOT NULL,
  "nombre" character varying,
  "apellidoa" character varying,
  "apellidob" character varying,
  "idSucursal" integer,
  "fnacimiento" date,
  "fcontratacion" date,
  "calle" character varying,
  "numero" integer,
  "colonia" character varying,
  "ciudad" character varying,
  "cp" integer,
  CONSTRAINT pk_ejecutivo PRIMARY KEY ("idEjecutivo")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ejecutivo
  OWNER TO postgres;


-- Table: servicio

-- DROP TABLE servicio;

CREATE TABLE servicio
(
  "idServicio" integer NOT NULL,
  "nombreServicio" character varying,
  CONSTRAINT pk_servicio PRIMARY KEY ("idServicio")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE servicio
  OWNER TO postgres;

-- Table: ahorro

-- DROP TABLE ahorro;

CREATE TABLE ahorro
(
  "idAhorro" integer NOT NULL,
  "idServicio" integer,
  "idCliente" integer,
  "idEjecutivo" integer,
  "idSucursal" integer,
  "fcontratacion" date,
  CONSTRAINT pk_ahorro PRIMARY KEY ("idAhorro"),
  CONSTRAINT fk_cliente FOREIGN KEY ("idCliente")
      REFERENCES cliente ("idCliente") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ejecutivo FOREIGN KEY ("idEjecutivo")
      REFERENCES ejecutivo ("idEjecutivo") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_servicio FOREIGN KEY ("idServicio")
      REFERENCES servicio ("idServicio") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_sucursal FOREIGN KEY ("idSucursal")
      REFERENCES sucursal ("idSucursal") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE ahorro
  OWNER TO postgres;

-- Table: "movimiento"

-- DROP TABLE "movimiento";

CREATE TABLE "movimiento"
(
  "idMovimiento" integer NOT NULL,
  "idAhorro" integer,
  "debe" integer,
  "haber" integer,
  "fmovimiento" date,
  "idSucursal" integer,
  "idEjecutivo" integer,
  CONSTRAINT pk_movimiento PRIMARY KEY ("idMovimiento"),
  CONSTRAINT fk_ahorro FOREIGN KEY ("idAhorro")
      REFERENCES ahorro ("idAhorro") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "movimiento"
  OWNER TO postgres;

-- Table: prestamo

-- DROP TABLE prestamo;

CREATE TABLE prestamo
(
  "idPrestamo" integer NOT NULL,
  "idServicio" integer,
  "idCliente" integer,
  "idSucursal" integer,
  "idEjecutivo" integer,
  "monto" integer,
  "plazo" character varying,
  "interes" integer,
  "interesmoratorio" integer,
  "fcontratacion" date,
  CONSTRAINT pk_prestamo PRIMARY KEY ("idPrestamo"),
  CONSTRAINT fk_cliente FOREIGN KEY ("idCliente")
      REFERENCES cliente ("idCliente") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_ejecutivo FOREIGN KEY ("idEjecutivo")
      REFERENCES ejecutivo ("idEjecutivo") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_servicio FOREIGN KEY ("idServicio")
      REFERENCES servicio ("idServicio") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT fk_sucursal FOREIGN KEY ("idSucursal")
      REFERENCES sucursal ("idSucursal") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE prestamo
  OWNER TO postgres;

