--
-- PostgreSQL database dump
--

\restrict T9FfSAL2hUbAL7KtqoDQHLBkHkZs1gmoh4MekOFArJUaUjEegTD6bJinhv9s6VE

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.3

-- Started on 2026-07-07 09:36:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 224 (class 1259 OID 16841)
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nombre character varying(120) NOT NULL,
    nacionalidad character varying(60)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16840)
-- Name: autor_id_autor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.autor ALTER COLUMN id_autor ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 16822)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16821)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categoria ALTER COLUMN id_categoria ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16832)
-- Name: editorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editorial (
    id_editorial integer NOT NULL,
    nombre character varying(100) NOT NULL,
    pais character varying(60) NOT NULL
);


ALTER TABLE public.editorial OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16831)
-- Name: editorial_id_editorial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.editorial ALTER COLUMN id_editorial ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.editorial_id_editorial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 226 (class 1259 OID 16849)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiante (
    id_estudiante integer NOT NULL,
    nombres character varying(80) NOT NULL,
    apellidos character varying(80) NOT NULL,
    carnet character varying(20) NOT NULL,
    correo character varying(120),
    telefono character varying(20)
);


ALTER TABLE public.estudiante OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16848)
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.estudiante ALTER COLUMN id_estudiante ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.estudiante_id_estudiante_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 228 (class 1259 OID 16861)
-- Name: libro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro (
    id_libro integer NOT NULL,
    titulo character varying(150) NOT NULL,
    anio_publicacion integer,
    existencia integer DEFAULT 1,
    id_categoria integer NOT NULL,
    id_editorial integer NOT NULL,
    CONSTRAINT libro_existencia_check CHECK ((existencia >= 0))
);


ALTER TABLE public.libro OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16897)
-- Name: libro_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libro_autor (
    id_libro integer NOT NULL,
    id_autor integer NOT NULL
);


ALTER TABLE public.libro_autor OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16860)
-- Name: libro_id_libro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.libro ALTER COLUMN id_libro ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.libro_id_libro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 16883)
-- Name: prestamo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prestamo (
    id_prestamo integer NOT NULL,
    fecha_prestamo date NOT NULL,
    fecha_devolucion date,
    estado character varying(20),
    id_estudiante integer NOT NULL,
    CONSTRAINT prestamo_estado_check CHECK (((estado)::text = ANY ((ARRAY['Prestado'::character varying, 'Devuelto'::character varying, 'Retrasado'::character varying])::text[])))
);


ALTER TABLE public.prestamo OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16882)
-- Name: prestamo_id_prestamo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.prestamo ALTER COLUMN id_prestamo ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.prestamo_id_prestamo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4962 (class 0 OID 16841)
-- Dependencies: 224
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id_autor, nombre, nacionalidad) FROM stdin;
1	Gabriel García Márquez	Colombia
2	Miguel de Cervantes	España
3	George Orwell	Reino Unido
4	Robert C. Martin	Estados Unidos
5	Thomas H. Cormen	Estados Unidos
6	Abraham Silberschatz	Estados Unidos
7	Ramez Elmasri	Egipto
8	Andrew S. Tanenbaum	Países Bajos
9	Herbert Schildt	Estados Unidos
10	Ian Sommerville	Escocia
11	Gabriel García Márquez	Colombia
12	Miguel de Cervantes	España
13	George Orwell	Reino Unido
14	Robert C. Martin	Estados Unidos
15	Thomas H. Cormen	Estados Unidos
16	Abraham Silberschatz	Estados Unidos
17	Ramez Elmasri	Egipto
18	Andrew S. Tanenbaum	Países Bajos
19	Herbert Schildt	Estados Unidos
20	Ian Sommerville	Escocia
\.


--
-- TOC entry 4958 (class 0 OID 16822)
-- Dependencies: 220
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id_categoria, nombre) FROM stdin;
\.


--
-- TOC entry 4960 (class 0 OID 16832)
-- Dependencies: 222
-- Data for Name: editorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editorial (id_editorial, nombre, pais) FROM stdin;
\.


--
-- TOC entry 4964 (class 0 OID 16849)
-- Dependencies: 226
-- Data for Name: estudiante; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiante (id_estudiante, nombres, apellidos, carnet, correo, telefono) FROM stdin;
1	Juan	Pérez	INA001	juan@ina.edu.sv	70000001
2	María	López	INA002	maria@ina.edu.sv	70000002
3	Carlos	Hernández	INA003	carlos@ina.edu.sv	70000003
4	Ana	Martínez	INA004	ana@ina.edu.sv	70000004
5	José	Ramírez	INA005	jose@ina.edu.sv	70000005
6	Laura	Morales	INA006	laura@ina.edu.sv	70000006
7	Pedro	Castillo	INA007	pedro@ina.edu.sv	70000007
8	Sofía	Reyes	INA008	sofia@ina.edu.sv	70000008
9	Luis	Flores	INA009	luis@ina.edu.sv	70000009
10	Daniela	Gómez	INA010	daniela@ina.edu.sv	70000010
\.


--
-- TOC entry 4966 (class 0 OID 16861)
-- Dependencies: 228
-- Data for Name: libro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro (id_libro, titulo, anio_publicacion, existencia, id_categoria, id_editorial) FROM stdin;
\.


--
-- TOC entry 4969 (class 0 OID 16897)
-- Dependencies: 231
-- Data for Name: libro_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libro_autor (id_libro, id_autor) FROM stdin;
\.


--
-- TOC entry 4968 (class 0 OID 16883)
-- Dependencies: 230
-- Data for Name: prestamo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prestamo (id_prestamo, fecha_prestamo, fecha_devolucion, estado, id_estudiante) FROM stdin;
1	2026-07-01	2026-07-10	Devuelto	1
2	2026-07-02	\N	Prestado	2
3	2026-07-03	\N	Prestado	3
4	2026-07-04	2026-07-12	Devuelto	4
5	2026-07-05	\N	Prestado	5
6	2026-07-06	2026-07-15	Devuelto	6
7	2026-07-07	\N	Prestado	7
8	2026-07-08	2026-07-17	Devuelto	8
9	2026-07-09	\N	Retrasado	9
10	2026-07-10	\N	Prestado	10
\.


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 223
-- Name: autor_id_autor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autor_id_autor_seq', 20, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 219
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 1, false);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 221
-- Name: editorial_id_editorial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.editorial_id_editorial_seq', 1, false);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 225
-- Name: estudiante_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiante_id_estudiante_seq', 10, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 227
-- Name: libro_id_libro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.libro_id_libro_seq', 20, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 229
-- Name: prestamo_id_prestamo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prestamo_id_prestamo_seq', 10, true);


--
-- TOC entry 4794 (class 2606 OID 16847)
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);


--
-- TOC entry 4788 (class 2606 OID 16830)
-- Name: categoria categoria_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_nombre_key UNIQUE (nombre);


--
-- TOC entry 4790 (class 2606 OID 16828)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 4792 (class 2606 OID 16839)
-- Name: editorial editorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editorial
    ADD CONSTRAINT editorial_pkey PRIMARY KEY (id_editorial);


--
-- TOC entry 4796 (class 2606 OID 16859)
-- Name: estudiante estudiante_carnet_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_carnet_key UNIQUE (carnet);


--
-- TOC entry 4798 (class 2606 OID 16857)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id_estudiante);


--
-- TOC entry 4804 (class 2606 OID 16903)
-- Name: libro_autor libro_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autor
    ADD CONSTRAINT libro_autor_pkey PRIMARY KEY (id_libro, id_autor);


--
-- TOC entry 4800 (class 2606 OID 16871)
-- Name: libro libro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT libro_pkey PRIMARY KEY (id_libro);


--
-- TOC entry 4802 (class 2606 OID 16891)
-- Name: prestamo prestamo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT prestamo_pkey PRIMARY KEY (id_prestamo);


--
-- TOC entry 4808 (class 2606 OID 16909)
-- Name: libro_autor fk_autor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autor
    ADD CONSTRAINT fk_autor FOREIGN KEY (id_autor) REFERENCES public.autor(id_autor) ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 16872)
-- Name: libro fk_categoria; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);


--
-- TOC entry 4806 (class 2606 OID 16877)
-- Name: libro fk_editorial; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro
    ADD CONSTRAINT fk_editorial FOREIGN KEY (id_editorial) REFERENCES public.editorial(id_editorial);


--
-- TOC entry 4807 (class 2606 OID 16892)
-- Name: prestamo fk_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prestamo
    ADD CONSTRAINT fk_estudiante FOREIGN KEY (id_estudiante) REFERENCES public.estudiante(id_estudiante);


--
-- TOC entry 4809 (class 2606 OID 16904)
-- Name: libro_autor fk_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libro_autor
    ADD CONSTRAINT fk_libro FOREIGN KEY (id_libro) REFERENCES public.libro(id_libro) ON DELETE CASCADE;


-- Completed on 2026-07-07 09:36:15

--
-- PostgreSQL database dump complete
--

\unrestrict T9FfSAL2hUbAL7KtqoDQHLBkHkZs1gmoh4MekOFArJUaUjEegTD6bJinhv9s6VE

