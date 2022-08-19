--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth integer,
    distance_from_sun integer,
    age_in_millions_of_years numeric(2,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    planet_id integer,
    distance_from_earth integer,
    distance_from_sun integer,
    age_in_millions_of_years numeric(2,1)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: new_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.new_table (
    new_table_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.new_table OWNER TO freecodecamp;

--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.new_table_new_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_table_new_table_id_seq OWNER TO freecodecamp;

--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.new_table_new_table_id_seq OWNED BY public.new_table.new_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    star_id integer NOT NULL,
    distance_from_earth integer,
    distance_from_sun integer,
    age_in_millions_of_years numeric(2,1)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean,
    galaxy_id integer NOT NULL,
    distance_from_earth integer,
    distance_from_sun integer,
    age_in_millions_of_years numeric(2,1)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: new_table new_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table ALTER COLUMN new_table_id SET DEFAULT nextval('public.new_table_new_table_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon2', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon3', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'moon4', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'moon5', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'moon6', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'moon7', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'moon8', NULL, NULL, 8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'moon9', NULL, NULL, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'moon10', NULL, NULL, 10, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'moon11', NULL, NULL, 11, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'moon12', NULL, NULL, 12, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'moon13', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'moon14', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'moon15', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'moon16', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'moon17', NULL, NULL, 7, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'moon18', NULL, NULL, 8, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'moon19', NULL, NULL, 9, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'moon20', NULL, NULL, 10, NULL, NULL, NULL);


--
-- Data for Name: new_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.new_table VALUES (1, 'name1', NULL);
INSERT INTO public.new_table VALUES (2, 'name2', NULL);
INSERT INTO public.new_table VALUES (3, 'name3', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet1', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'planet2', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'planet3', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'planet4', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'planet5', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'planet6', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'planet7', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'planet8', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'planet9', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'planet10', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'planet11', NULL, NULL, 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'planet12', NULL, NULL, 6, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star2', NULL, NULL, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 'star3', NULL, NULL, 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 'star4', NULL, NULL, 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'star5', NULL, NULL, 5, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'star6', NULL, NULL, 6, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: new_table_new_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.new_table_new_table_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon_unq UNIQUE (name);


--
-- Name: planet name_planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_unq UNIQUE (name);


--
-- Name: star name_star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_unq UNIQUE (name);


--
-- Name: galaxy name_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unq UNIQUE (name);


--
-- Name: new_table new_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_name_key UNIQUE (name);


--
-- Name: new_table new_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.new_table
    ADD CONSTRAINT new_table_pkey PRIMARY KEY (new_table_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
