--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE curso2;
--
-- Name: curso2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE curso2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE curso2 OWNER TO postgres;

\connect curso2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: colores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colores (
    color1 character varying(50),
    color2 character varying(50)
);


ALTER TABLE public.colores OWNER TO postgres;

--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    nombre character varying(50),
    departamento character varying(50)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: ocupaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ocupaciones (
    id_ocupacion integer NOT NULL,
    tipo_ocupacion character varying(100) NOT NULL,
    tipo_descripcion character varying(300)
);


ALTER TABLE public.ocupaciones OWNER TO postgres;

--
-- Name: ocupaciones_id_ocupacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ocupaciones_id_ocupacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ocupaciones_id_ocupacion_seq OWNER TO postgres;

--
-- Name: ocupaciones_id_ocupacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ocupaciones_id_ocupacion_seq OWNED BY public.ocupaciones.id_ocupacion;


--
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_producto integer,
    cantidad integer,
    importe_total integer
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_pedido_seq OWNER TO postgres;

--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;


--
-- Name: precios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.precios (
    articulo character varying(100),
    precio integer,
    descuento integer
);


ALTER TABLE public.precios OWNER TO postgres;

--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre character varying(50),
    precio integer
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_producto_seq OWNER TO postgres;

--
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- Name: productos_vendidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.productos_vendidos AS
 SELECT productos.nombre,
    pedidos.cantidad
   FROM (public.productos
     JOIN public.pedidos ON ((productos.id_producto = pedidos.id_producto)));


ALTER TABLE public.productos_vendidos OWNER TO postgres;

--
-- Name: tabla1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tabla1 (
    columna1 character varying(50),
    columna2 character varying(50),
    columna3 character varying(50)
);


ALTER TABLE public.tabla1 OWNER TO postgres;

--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido1 character varying(100) NOT NULL,
    apellido2 character varying(100) NOT NULL,
    "contraseña" character varying(100) NOT NULL,
    mail character varying(200) NOT NULL,
    "fecha_creación" timestamp without time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: usuarios_ocupaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_ocupaciones (
    id_usuario integer,
    id_ocupacion integer
);


ALTER TABLE public.usuarios_ocupaciones OWNER TO postgres;

--
-- Name: ocupaciones id_ocupacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocupaciones ALTER COLUMN id_ocupacion SET DEFAULT nextval('public.ocupaciones_id_ocupacion_seq'::regclass);


--
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);


--
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Data for Name: colores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colores (color1, color2) FROM stdin;
\.
COPY public.colores (color1, color2) FROM '$$PATH$$/3194.dat';

--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (nombre, departamento) FROM stdin;
\.
COPY public.departamentos (nombre, departamento) FROM '$$PATH$$/3192.dat';

--
-- Data for Name: ocupaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ocupaciones (id_ocupacion, tipo_ocupacion, tipo_descripcion) FROM stdin;
\.
COPY public.ocupaciones (id_ocupacion, tipo_ocupacion, tipo_descripcion) FROM '$$PATH$$/3189.dat';

--
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id_pedido, id_producto, cantidad, importe_total) FROM stdin;
\.
COPY public.pedidos (id_pedido, id_producto, cantidad, importe_total) FROM '$$PATH$$/3196.dat';

--
-- Data for Name: precios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.precios (articulo, precio, descuento) FROM stdin;
\.
COPY public.precios (articulo, precio, descuento) FROM '$$PATH$$/3191.dat';

--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, nombre, precio) FROM stdin;
\.
COPY public.productos (id_producto, nombre, precio) FROM '$$PATH$$/3198.dat';

--
-- Data for Name: tabla1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tabla1 (columna1, columna2, columna3) FROM stdin;
\.
COPY public.tabla1 (columna1, columna2, columna3) FROM '$$PATH$$/3193.dat';

--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre, apellido1, apellido2, "contraseña", mail, "fecha_creación") FROM stdin;
\.
COPY public.usuarios (id_usuario, nombre, apellido1, apellido2, "contraseña", mail, "fecha_creación") FROM '$$PATH$$/3187.dat';

--
-- Data for Name: usuarios_ocupaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_ocupaciones (id_usuario, id_ocupacion) FROM stdin;
\.
COPY public.usuarios_ocupaciones (id_usuario, id_ocupacion) FROM '$$PATH$$/3190.dat';

--
-- Name: ocupaciones_id_ocupacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ocupaciones_id_ocupacion_seq', 3, true);


--
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 2, true);


--
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 2, true);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 2, true);


--
-- Name: ocupaciones ocupaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocupaciones
    ADD CONSTRAINT ocupaciones_pkey PRIMARY KEY (id_ocupacion);


--
-- Name: usuarios usuarios_mail_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_mail_key UNIQUE (mail);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: usuarios_ocupaciones usuarios_ocupaciones_id_ocupacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_ocupaciones
    ADD CONSTRAINT usuarios_ocupaciones_id_ocupacion_fkey FOREIGN KEY (id_ocupacion) REFERENCES public.ocupaciones(id_ocupacion);


--
-- Name: usuarios_ocupaciones usuarios_ocupaciones_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_ocupaciones
    ADD CONSTRAINT usuarios_ocupaciones_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario);


--
-- PostgreSQL database dump complete
--

