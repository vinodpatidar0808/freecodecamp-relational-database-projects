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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(30) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Dumbledore', 1, 11);
INSERT INTO public.users VALUES ('Harry', 1, 10);
INSERT INTO public.users VALUES ('Ronald', 1, 11);
INSERT INTO public.users VALUES ('Fabio', 1, 9);
INSERT INTO public.users VALUES ('Hermione', 1, 11);
INSERT INTO public.users VALUES ('Hagrid', 1, 9);
INSERT INTO public.users VALUES ('Voldemort', 1, 9);
INSERT INTO public.users VALUES ('Severus', 1, 11);
INSERT INTO public.users VALUES ('Dobby', 1, 9);
INSERT INTO public.users VALUES ('Sirius', 1, 9);
INSERT INTO public.users VALUES ('Ginny', 1, 8);
INSERT INTO public.users VALUES ('Lily', 1, 12);
INSERT INTO public.users VALUES ('James', 1, 12);
INSERT INTO public.users VALUES ('Moody', 1, 8);
INSERT INTO public.users VALUES ('Neville', 1, 10);
INSERT INTO public.users VALUES ('Frodo', 1, 9);
INSERT INTO public.users VALUES ('Luna', 1, 11);
INSERT INTO public.users VALUES ('Draco', 1, 7);
INSERT INTO public.users VALUES ('George', 1, 13);
INSERT INTO public.users VALUES ('Mario', 1, 9);
INSERT INTO public.users VALUES ('Fred', 1, 9);
INSERT INTO public.users VALUES ('Harry james potter', 1, 9);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

