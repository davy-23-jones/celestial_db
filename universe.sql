--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth_in_km numeric(4,2),
    age_in_million_years integer,
    description text
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth_in_km numeric(4,2),
    age_in_million_years integer,
    description text,
    planet_id integer
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
-- Name: moon_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_planet (
    moon_id integer,
    planet_id integer,
    moon_planet_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon_planet OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_moon_planet_id_seq OWNED BY public.moon_planet.moon_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth_in_km numeric(4,2),
    age_in_million_years integer,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    distance_from_earth_in_km numeric(4,2),
    age_in_million_years integer,
    description text,
    galaxy_id integer
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
-- Name: moon_planet moon_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet ALTER COLUMN moon_planet_id SET DEFAULT nextval('public.moon_planet_moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 0.00, 13000, 'The galaxy that contains our solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, true, 99.99, 10000, 'The nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, true, 99.99, 2800, 'A small spiral galaxy and a member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', false, true, 99.99, 10000, 'A large spiral galaxy known for its well-defined spiral arms.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', false, true, 99.99, 10000, 'A bright spiral galaxy with a prominent central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', false, true, 99.99, 13000, 'A giant elliptical galaxy known for its supermassive black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (28, 'Triton', false, true, 0.36, 4600, 'The largest moon of Neptune, with geysers and a retrograde orbit.', 11);
INSERT INTO public.moon VALUES (29, 'Charon', false, true, 0.20, 4600, 'Plutos largest moon, which shares a mutual orbit with Pluto.', 12);
INSERT INTO public.moon VALUES (30, 'Eris', false, true, 0.30, 4600, 'A moon of Eris, a dwarf planet in the scattered disc.', 1);
INSERT INTO public.moon VALUES (31, 'Haumea', false, true, 0.29, 4600, 'A moon of Haumea, a dwarf planet in the Kuiper Belt.', 2);
INSERT INTO public.moon VALUES (32, 'Makemake', false, true, 0.31, 4600, 'A moon of Makemake, a dwarf planet in the Kuiper Belt.', 3);
INSERT INTO public.moon VALUES (33, 'Ceres', false, true, 0.42, 4600, 'A moon of Ceres, the largest object in the asteroid belt.', 4);
INSERT INTO public.moon VALUES (34, 'Dione', false, true, 0.40, 4600, 'A moon of Saturn, characterized by its bright and dark patches.', 5);
INSERT INTO public.moon VALUES (35, 'Enceladus', false, true, 0.23, 4600, 'A moon of Saturn with active geysers and a subsurface ocean.', 6);
INSERT INTO public.moon VALUES (36, 'Mimas', false, true, 0.21, 4600, 'A moon of Saturn, known for its large impact crater.', 7);
INSERT INTO public.moon VALUES (37, 'Tethys', false, true, 0.20, 4600, 'A moon of Saturn with a relatively smooth surface.', 8);
INSERT INTO public.moon VALUES (18, 'Moon', false, true, 0.38, 4500, 'Earths only natural satellite.', 1);
INSERT INTO public.moon VALUES (19, 'Phobos', false, true, 0.01, 400, 'One of Mars moons, very close to the planet.', 2);
INSERT INTO public.moon VALUES (20, 'Deimos', false, true, 0.02, 400, 'The smaller of Mars two moons.', 3);
INSERT INTO public.moon VALUES (21, 'Io', false, true, 0.42, 4500, 'One of Jupiters largest moons, known for its volcanic activity.', 4);
INSERT INTO public.moon VALUES (22, 'Europa', false, true, 0.61, 4500, 'A moon of Jupiter with a smooth ice-covered surface.', 5);
INSERT INTO public.moon VALUES (23, 'Ganymede', false, true, 1.07, 4500, 'The largest moon in the solar system, orbiting Jupiter.', 6);
INSERT INTO public.moon VALUES (24, 'Callisto', false, true, 1.88, 4500, 'A large moon of Jupiter with a heavily cratered surface.', 7);
INSERT INTO public.moon VALUES (25, 'Titan', false, true, 1.22, 4600, 'Saturns largest moon, with a thick atmosphere.', 8);
INSERT INTO public.moon VALUES (26, 'Rhea', false, true, 0.96, 4600, 'A moon of Saturn with a heavily cratered surface.', 9);
INSERT INTO public.moon VALUES (27, 'Iapetus', false, true, 1.15, 4600, 'Known for its two-tone coloration, one of Saturns moons.', 10);


--
-- Data for Name: moon_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_planet VALUES (19, 1, 13, 'Luna');
INSERT INTO public.moon_planet VALUES (20, 2, 14, 'Phobos_Moon');
INSERT INTO public.moon_planet VALUES (21, 3, 15, 'Deimos_Moon');
INSERT INTO public.moon_planet VALUES (22, 4, 16, 'Io_Moon');
INSERT INTO public.moon_planet VALUES (23, 5, 17, 'Europa_Moon');
INSERT INTO public.moon_planet VALUES (24, 6, 18, 'Ganymede_Moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 1.00, 4500, 'The third planet from the Sun and the only known planet to support life.', 1);
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 0.52, 4500, 'The fourth planet from the Sun, known for its red color.', 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 0.72, 4600, 'The second planet from the Sun, similar in size to Earth.', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, true, 5.20, 4600, 'The largest planet in our solar system, known for its Great Red Spot.', 1);
INSERT INTO public.planet VALUES (5, 'Saturn', false, true, 9.58, 4600, 'Famous for its prominent ring system.', 1);
INSERT INTO public.planet VALUES (6, 'Uranus', false, true, 19.22, 4600, 'The seventh planet from the Sun, known for its blue-green color.', 1);
INSERT INTO public.planet VALUES (7, 'Neptune', false, true, 30.05, 4600, 'The eighth and farthest planet from the Sun, known for its strong winds.', 1);
INSERT INTO public.planet VALUES (8, 'Mercury', false, true, 0.39, 4600, 'The closest planet to the Sun, with extreme temperature variations.', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 39.53, 4600, 'A dwarf planet located in the Kuiper Belt.', 1);
INSERT INTO public.planet VALUES (10, 'Eris', false, true, 96.00, 4600, 'A dwarf planet in the scattered disc, more massive than Pluto.', 1);
INSERT INTO public.planet VALUES (11, 'Haumea', false, true, 96.00, 4600, 'A dwarf planet in the Kuiper Belt, known for its elongated shape.', 1);
INSERT INTO public.planet VALUES (12, 'Makemake', false, true, 97.00, 4600, 'A dwarf planet in the Kuiper Belt, known for its reddish color.', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, true, 0.00, 4600, 'The star at the center of our solar system.', 1);
INSERT INTO public.star VALUES (2, 'Sirius', false, true, 8.60, 200, 'The brightest star in the night sky.', 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', false, true, 64.00, 100000, 'A red supergiant star in the constellation Orion.', 3);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', false, true, 4.37, 500, 'The closest star system to the Solar System.', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', false, true, 4.24, 400, 'The closest known star to the Sun.', 2);
INSERT INTO public.star VALUES (6, 'Arcturus', false, true, 36.70, 7000, 'One of the brightest stars in the night sky.', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: moon_planet_moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_moon_planet_id_seq', 18, true);


--
-- Name: planet_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon_planet moon_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_pkey PRIMARY KEY (moon_planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon_planet unique_nam; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT unique_nam UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon_planet moon_planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon_planet moon_planet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_planet
    ADD CONSTRAINT moon_planet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

