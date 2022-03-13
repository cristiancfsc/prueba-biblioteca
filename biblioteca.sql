--
-- PostgreSQL database dump
--

-- Dumped from database version 10.20
-- Dumped by pg_dump version 10.20

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    codigo_autor integer NOT NULL,
    nombre character varying(15),
    apellido character varying(15),
    nacimiento integer,
    muerte integer,
    tipo_autor character varying(11)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- Name: libro_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_autor (
    id_libro character varying(15),
    id_codigo_autor integer
);


ALTER TABLE public.libro_autor OWNER TO postgres;

--
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    isbn character varying(15) NOT NULL,
    titulo character varying(50),
    paginas integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- Name: libros_prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros_prestamos (
    id_libro character varying(15),
    id_prestamo integer
);


ALTER TABLE public.libros_prestamos OWNER TO postgres;

--
-- Name: prestamos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamos (
    id integer NOT NULL,
    id_socio character varying(12),
    libro character varying(50),
    socio character varying(50),
    fecha_prestamo date,
    fecha_devolucion date
);


ALTER TABLE public.prestamos OWNER TO postgres;

--
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    rut character varying(12) NOT NULL,
    nombre character varying(15),
    apellido character varying(15),
    direccion character varying(40),
    telefono integer
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (codigo_autor, nombre, apellido, nacimiento, muerte, tipo_autor) FROM stdin;
1	Andres	Ulloa	1982	\N	Principal
2	Sergio	Mardones	1950	2012	Principal
3	Jose	Salgado	1968	2020	Principal
4	Ana	Salgado	1972	\N	Coautor
5	Martin	Porta	1976	\N	Principal
\.


--
-- Data for Name: libro_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_autor (id_libro, id_codigo_autor) FROM stdin;
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (isbn, titulo, paginas) FROM stdin;
111-1111111-111	Cuentos de terror	344
222-2222222-222	Poes¡as contemporaneas	167
333-3333333-333	Historia de Asia	511
444-4444444-444	Manual de mec nica	298
\.


--
-- Data for Name: libros_prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros_prestamos (id_libro, id_prestamo) FROM stdin;
\.


--
-- Data for Name: prestamos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamos (id, id_socio, libro, socio, fecha_prestamo, fecha_devolucion) FROM stdin;
1	1111111-1	Cuentos de terror	Juan Soto	2020-01-20	2020-01-27
2	5555555-5	Poes¡as contemporaneas	Silvana Mu¤oz	2020-01-20	2020-01-30
3	3333333-3	Historia de Asia	Sandra Aguilar	2020-01-22	2020-01-30
4	4444444-4	Manual de mec nica	Esteban Jerez	2020-01-23	2020-01-30
5	2222222-2	Cuentos de terror	Ana P‚rez	2020-01-27	2020-02-04
6	1111111-1	Manual de mec nica	Juan Soto	2020-01-31	2020-02-12
7	3333333-3	Poes¡as contemporaneas	Sandra Aguilar	2020-01-31	2020-02-12
\.


--
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (rut, nombre, apellido, direccion, telefono) FROM stdin;
1111111-1	Juan	Soto	Avenida 1, Santiago	911111111
2222222-2	Ana	P‚rez	Pasaje 2, Santiago	922222222
3333333-3	Sandra	Aguilar	Avenida 2, Santiago	933333333
4444444-4	Esteban	Jerez	Avenida 3, Santiago	944444444
5555555-5	Silvana	Mu¤oz	Pasaje 3, Santiago	955555555
\.


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (codigo_autor);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (isbn);


--
-- Name: prestamos prestamos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_pkey PRIMARY KEY (id);


--
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (rut);


--
-- Name: libro_autor libro_autor_id_codigo_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autor
    ADD CONSTRAINT libro_autor_id_codigo_autor_fkey FOREIGN KEY (id_codigo_autor) REFERENCES public.autor(codigo_autor);


--
-- Name: libro_autor libro_autor_id_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autor
    ADD CONSTRAINT libro_autor_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(isbn);


--
-- Name: libros_prestamos libros_prestamos_id_libro_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_prestamos
    ADD CONSTRAINT libros_prestamos_id_libro_fkey FOREIGN KEY (id_libro) REFERENCES public.libros(isbn);


--
-- Name: libros_prestamos libros_prestamos_id_prestamo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros_prestamos
    ADD CONSTRAINT libros_prestamos_id_prestamo_fkey FOREIGN KEY (id_prestamo) REFERENCES public.prestamos(id);


--
-- Name: prestamos prestamos_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamos
    ADD CONSTRAINT prestamos_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socios(rut);


--
-- PostgreSQL database dump complete
--

