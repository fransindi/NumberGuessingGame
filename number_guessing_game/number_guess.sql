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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (6, 15, 9);
INSERT INTO public.games VALUES (7, 15, 4);
INSERT INTO public.games VALUES (8, 16, 673);
INSERT INTO public.games VALUES (9, 16, 449);
INSERT INTO public.games VALUES (10, 17, 486);
INSERT INTO public.games VALUES (11, 16, 149);
INSERT INTO public.games VALUES (12, 16, 199);
INSERT INTO public.games VALUES (13, 16, 694);
INSERT INTO public.games VALUES (14, 18, 18);
INSERT INTO public.games VALUES (15, 19, 385);
INSERT INTO public.games VALUES (16, 18, 425);
INSERT INTO public.games VALUES (17, 18, 595);
INSERT INTO public.games VALUES (18, 18, 872);
INSERT INTO public.games VALUES (19, 21, 457);
INSERT INTO public.games VALUES (20, 20, 994);
INSERT INTO public.games VALUES (21, 20, 750);
INSERT INTO public.games VALUES (22, 20, 916);
INSERT INTO public.games VALUES (23, 23, 782);
INSERT INTO public.games VALUES (24, 23, 935);
INSERT INTO public.games VALUES (25, 22, 700);
INSERT INTO public.games VALUES (26, 22, 51);
INSERT INTO public.games VALUES (27, 22, 909);
INSERT INTO public.games VALUES (28, 24, 517);
INSERT INTO public.games VALUES (29, 24, 470);
INSERT INTO public.games VALUES (30, 25, 124);
INSERT INTO public.games VALUES (31, 24, 275);
INSERT INTO public.games VALUES (32, 24, 982);
INSERT INTO public.games VALUES (33, 24, 169);
INSERT INTO public.games VALUES (34, 26, 243);
INSERT INTO public.games VALUES (35, 26, 427);
INSERT INTO public.games VALUES (36, 27, 602);
INSERT INTO public.games VALUES (37, 26, 789);
INSERT INTO public.games VALUES (38, 26, 414);
INSERT INTO public.games VALUES (39, 26, 680);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (15, 'fran', 2);
INSERT INTO public.users VALUES (17, 'user_1684680317523', 1);
INSERT INTO public.users VALUES (16, 'user_1684680317524', 5);
INSERT INTO public.users VALUES (19, 'user_1684680425996', 1);
INSERT INTO public.users VALUES (18, 'user_1684680425997', 4);
INSERT INTO public.users VALUES (21, 'user_1684680498021', 1);
INSERT INTO public.users VALUES (20, 'user_1684680498022', 3);
INSERT INTO public.users VALUES (23, 'user_1684680629848', 2);
INSERT INTO public.users VALUES (22, 'user_1684680629849', 3);
INSERT INTO public.users VALUES (25, 'user_1684680782557', 1);
INSERT INTO public.users VALUES (24, 'user_1684680782558', 5);
INSERT INTO public.users VALUES (27, 'user_1684680838818', 1);
INSERT INTO public.users VALUES (26, 'user_1684680838819', 5);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 39, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 27, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

