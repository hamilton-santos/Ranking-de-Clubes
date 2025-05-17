--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2025-05-17 15:01:54

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
-- TOC entry 4829 (class 1262 OID 16458)
-- Name: ranking-de-clubes; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "ranking-de-clubes" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE "ranking-de-clubes" OWNER TO postgres;

\connect -reuse-previous=on "dbname='ranking-de-clubes'"

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16524)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    world_cups integer
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17483)
-- Name: summary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.summary (
    rank_type character varying(255) NOT NULL,
    season integer NOT NULL,
    css character varying(255),
    direction character varying(255),
    points numeric(4,1),
    "position" numeric(4,2),
    titles integer[],
    country_id character varying(255) NOT NULL,
    team_id character varying(255) NOT NULL,
    CONSTRAINT summary_direction_check CHECK (((direction)::text = ANY ((ARRAY['UP'::character varying, 'STABLE'::character varying, 'CAUTION'::character varying, 'DOWN'::character varying])::text[])))
);


ALTER TABLE public.summary OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16472)
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    id character varying(255) NOT NULL,
    name character varying(255),
    country_id character varying(255)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17513)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    id integer NOT NULL,
    season integer,
    team_id character varying(255),
    tournament_id character varying(255)
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17512)
-- Name: titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.titles_id_seq OWNER TO postgres;

--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 220
-- Name: titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titles_id_seq OWNED BY public.titles.id;


--
-- TOC entry 216 (class 1259 OID 16477)
-- Name: tournament_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournament_groups (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    points numeric(2,1) NOT NULL,
    notes character varying(255),
    "order" integer
);


ALTER TABLE public.tournament_groups OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16482)
-- Name: tournaments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tournaments (
    id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying
);


ALTER TABLE public.tournaments OWNER TO postgres;

--
-- TOC entry 4654 (class 2604 OID 17516)
-- Name: titles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles ALTER COLUMN id SET DEFAULT nextval('public.titles_id_seq'::regclass);


--
-- TOC entry 4820 (class 0 OID 16524)
-- Dependencies: 218
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries VALUES ('ARGENTINA', 'Argentina', 3);
INSERT INTO public.countries VALUES ('ITALIA', 'Itália', 4);
INSERT INTO public.countries VALUES ('ALEMANHA', 'Alemanha', 4);
INSERT INTO public.countries VALUES ('FRANCA', 'França', 2);
INSERT INTO public.countries VALUES ('INGLATERRA', 'Inglaterra', 1);
INSERT INTO public.countries VALUES ('BRASIL', 'Brasil', 5);
INSERT INTO public.countries VALUES ('ESPANHA', 'Espanha', 1);


--
-- TOC entry 4821 (class 0 OID 17483)
-- Dependencies: 219
-- Data for Name: summary; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4817 (class 0 OID 16472)
-- Dependencies: 215
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.teams VALUES ('ARGENTINOS_JUNIORS', 'Argentinos Juniors', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ARSENAL', 'Arsenal', 'INGLATERRA');
INSERT INTO public.teams VALUES ('ASTON_VILLA', 'Aston Villa', 'INGLATERRA');
INSERT INTO public.teams VALUES ('ATALANTA', 'Atalanta', 'ITALIA');
INSERT INTO public.teams VALUES ('AUXERRE', 'Auxerre', 'FRANCA');
INSERT INTO public.teams VALUES ('BAHIA', 'Bahia', 'BRASIL');
INSERT INTO public.teams VALUES ('BANFIELD', 'Banfield', 'ARGENTINA');
INSERT INTO public.teams VALUES ('BARCELONA', 'Barcelona', 'ESPANHA');
INSERT INTO public.teams VALUES ('BARNSLEY', 'Barnsley', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BASTIA', 'Bastia', 'FRANCA');
INSERT INTO public.teams VALUES ('BAYERN_DE_MUNIQUE', 'FC Bayern München', 'ALEMANHA');
INSERT INTO public.teams VALUES ('BLACKBURN_OLYMPIC', 'Blackburn Olympic', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BLACKBURN_ROVERS', 'Blackburn Rovers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BLACKPOOL', 'Blackpool', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BOCA_JUNIORS', 'Boca Juniors', 'ARGENTINA');
INSERT INTO public.teams VALUES ('BOLOGNA', 'Bologna', 'ITALIA');
INSERT INTO public.teams VALUES ('BORDEAUX', 'Bordeaux', 'FRANCA');
INSERT INTO public.teams VALUES ('BORUSSIA_DORTMUND', 'Borussia Dortmund', 'ALEMANHA');
INSERT INTO public.teams VALUES ('BOTAFOGO', 'Botafogo', 'BRASIL');
INSERT INTO public.teams VALUES ('BURNLEY', 'Burnley', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CAGLIARI', 'Cagliari', 'ITALIA');
INSERT INTO public.teams VALUES ('CARDIFF', 'Cardiff City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CASALE', 'Casale', 'ITALIA');
INSERT INTO public.teams VALUES ('CASG_PARIS', 'CASG Paris', 'FRANCA');
INSERT INTO public.teams VALUES ('CHELSEA', 'Chelsea', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CLAPHAM_ROVERS', 'Clapham Rovers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CLUB_FRANCAIS', 'Club Français', 'FRANCA');
INSERT INTO public.teams VALUES ('CORINTHIANS', 'Corinthians', 'BRASIL');
INSERT INTO public.teams VALUES ('CORITIBA', 'Coritiba', 'BRASIL');
INSERT INTO public.teams VALUES ('COVENTRY_CITY', 'Coventry City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CRICIUMA', 'Criciúma', 'BRASIL');
INSERT INTO public.teams VALUES ('CRUZEIRO', 'Cruzeiro', 'BRASIL');
INSERT INTO public.teams VALUES ('DERBY_COUNTY', 'Derby County', 'INGLATERRA');
INSERT INTO public.teams VALUES ('EINTRACHT_BRAUNSCHWEIG', 'Eintracht Braunschweig', 'ALEMANHA');
INSERT INTO public.teams VALUES ('EINTRACHT_FRANKFURT', 'Eintracht Frankfurt', 'ALEMANHA');
INSERT INTO public.teams VALUES ('ESPANYOL', 'Espanyol', 'ESPANHA');
INSERT INTO public.teams VALUES ('ESTUDIANTIL_PORTENO', 'Estudiantil Porteño', 'ARGENTINA');
INSERT INTO public.teams VALUES ('EVERTON', 'Everton', 'INGLATERRA');
INSERT INTO public.teams VALUES ('FIORENTINA', 'Fiorentina', 'ITALIA');
INSERT INTO public.teams VALUES ('FLAMENGO', 'Flamengo', 'BRASIL');
INSERT INTO public.teams VALUES ('FLUMINENSE', 'Fluminense', 'BRASIL');
INSERT INTO public.teams VALUES ('FORTUNA_DUSSELDORF', 'Fortuna Düsseldorf', 'ALEMANHA');
INSERT INTO public.teams VALUES ('FREIBURGER_FC', 'Freiburger FC', 'ALEMANHA');
INSERT INTO public.teams VALUES ('GENOA', 'Genoa', 'ITALIA');
INSERT INTO public.teams VALUES ('GREMIO', 'Grêmio', 'BRASIL');
INSERT INTO public.teams VALUES ('GUARANI', 'Guarani', 'BRASIL');
INSERT INTO public.teams VALUES ('GUINGAMP', 'Guingamp', 'FRANCA');
INSERT INTO public.teams VALUES ('HOLSTEIN_KIEL', 'Holstein Kiel', 'ALEMANHA');
INSERT INTO public.teams VALUES ('HUDDERSFIELD_TOWN', 'Huddersfield Town', 'INGLATERRA');
INSERT INTO public.teams VALUES ('HURACAN', 'Huracán', 'ARGENTINA');
INSERT INTO public.teams VALUES ('INDEPENDIENTE', 'Independiente', 'ARGENTINA');
INSERT INTO public.teams VALUES ('INTERNACIONAL', 'Internacional', 'BRASIL');
INSERT INTO public.teams VALUES ('IPSWICH_TOWN', 'Ipswich Town', 'INGLATERRA');
INSERT INTO public.teams VALUES ('JUVENTUDE', 'Juventude', 'BRASIL');
INSERT INTO public.teams VALUES ('JUVENTUS', 'Juventus', 'ITALIA');
INSERT INTO public.teams VALUES ('KAISERSLAUTERN', '1. FC Kaiserslautern', 'ALEMANHA');
INSERT INTO public.teams VALUES ('KARLSRUHER_FV', 'Karlsruher Fussball Verein', 'ALEMANHA');
INSERT INTO public.teams VALUES ('KARLSRUHER_SC', 'Karlsruher SC', 'ALEMANHA');
INSERT INTO public.teams VALUES ('KICKERS_OFFENBACH', 'Kickers Offenbach', 'ALEMANHA');
INSERT INTO public.teams VALUES ('LANUS', 'Lanús', 'ARGENTINA');
INSERT INTO public.teams VALUES ('LAZIO', 'Lazio', 'ITALIA');
INSERT INTO public.teams VALUES ('LE_HAVRE', 'Le Havre', 'FRANCA');
INSERT INTO public.teams VALUES ('LEICESTER_CITY', 'Leicester City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('LENS', 'Lens', 'FRANCA');
INSERT INTO public.teams VALUES ('LILLE', 'Lille', 'FRANCA');
INSERT INTO public.teams VALUES ('LIVERPOOL', 'Liverpool', 'INGLATERRA');
INSERT INTO public.teams VALUES ('LORIENT', 'Lorient', 'FRANCA');
INSERT INTO public.teams VALUES ('MALLORCA', 'Mallorca', 'ESPANHA');
INSERT INTO public.teams VALUES ('MANCHESTER_CITY', 'Manchester City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('MANCHESTER_UNITED', 'Manchester United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('METZ', 'Metz', 'FRANCA');
INSERT INTO public.teams VALUES ('MILAN', 'Milan', 'ITALIA');
INSERT INTO public.teams VALUES ('MONTPELLIER', 'Montpellier', 'FRANCA');
INSERT INTO public.teams VALUES ('NANCY', 'Nancy', 'FRANCA');
INSERT INTO public.teams VALUES ('NANTES', 'Nantes', 'FRANCA');
INSERT INTO public.teams VALUES ('TSV_1860_MUNCHEN', 'TSV 1860 München', 'ALEMANHA');
INSERT INTO public.teams VALUES ('ATLETICO_MADRID', 'Atlético Madrid', 'ESPANHA');
INSERT INTO public.teams VALUES ('BORUSSIA_MONCHENGLADBACH', 'Borussia Mönchengladbach', 'ALEMANHA');
INSERT INTO public.teams VALUES ('BAYER_LEVERKUSEN', 'Bayer 04 Leverkusen', 'ALEMANHA');
INSERT INTO public.teams VALUES ('KFC_UERDINGEN_05', 'KFC Uerdingen 05', 'ALEMANHA');
INSERT INTO public.teams VALUES ('ALUMNI', 'Alumni', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ARSENAL_SARANDI', 'Arsenal', 'ARGENTINA');
INSERT INTO public.teams VALUES ('CHACARITA_JUNIORS', 'Chacarita Juniors', 'ARGENTINA');
INSERT INTO public.teams VALUES ('DOCK_SUD', 'Dock Sud', 'ARGENTINA');
INSERT INTO public.teams VALUES ('FERRO_CARRIL_OESTE', 'Ferro Carril Oeste', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ARENAS_CLUB', 'Arenas', 'ESPANHA');
INSERT INTO public.teams VALUES ('BURY', 'Bury', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CANNES', 'Cannes', 'FRANCA');
INSERT INTO public.teams VALUES ('DEPORTIVO_LA_CORUNA', 'La Coruña', 'ESPANHA');
INSERT INTO public.teams VALUES ('ATHLETIC_BILBAO', 'Athletic Bilbao', 'ESPANHA');
INSERT INTO public.teams VALUES ('LYON', 'Lyon', 'FRANCA');
INSERT INTO public.teams VALUES ('MONACO', 'Monaco', 'FRANCA');
INSERT INTO public.teams VALUES ('ATHLETICO_PR', 'Athletico-PR', 'BRASIL');
INSERT INTO public.teams VALUES ('ATLETICO_MG', 'Atlético-MG', 'BRASIL');
INSERT INTO public.teams VALUES ('BELLA_VISTA', 'Bella Vista', NULL);
INSERT INTO public.teams VALUES ('CENTRAL_ESPANOL', 'Central Español', NULL);
INSERT INTO public.teams VALUES ('DANUBIO', 'Danubio', NULL);
INSERT INTO public.teams VALUES ('MONTEVIDEO_WANDERERS', 'Montevideo Wanderers', NULL);
INSERT INTO public.teams VALUES ('NACIONAL', 'Nacional', NULL);
INSERT INTO public.teams VALUES ('NAPOLI', 'Napoli', 'ITALIA');
INSERT INTO public.teams VALUES ('NEWCASTLE', 'Newcastle United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('NICE', 'Nice', 'FRANCA');
INSERT INTO public.teams VALUES ('NOTTINGHAM_FOREST', 'Nottingham Forest', 'INGLATERRA');
INSERT INTO public.teams VALUES ('NOTTS_COUNTY', 'Notts County', 'INGLATERRA');
INSERT INTO public.teams VALUES ('NOVESE', 'Novese', 'ITALIA');
INSERT INTO public.teams VALUES ('NURNBERG', '1. FC Nürnberg', 'ALEMANHA');
INSERT INTO public.teams VALUES ('OLD_CALEDONIANS', 'Old Caledonians', 'ARGENTINA');
INSERT INTO public.teams VALUES ('OLYMPIQUE_DE_PARIS', 'Olympique de Paris', 'FRANCA');
INSERT INTO public.teams VALUES ('PALMEIRAS', 'Palmeiras', 'BRASIL');
INSERT INTO public.teams VALUES ('PARMA', 'Parma', 'ITALIA');
INSERT INTO public.teams VALUES ('PATRONATO', 'Patronato', 'ARGENTINA');
INSERT INTO public.teams VALUES ('PAULISTA', 'Paulista', 'BRASIL');
INSERT INTO public.teams VALUES ('PORTENO', 'Porteño', 'ARGENTINA');
INSERT INTO public.teams VALUES ('PORTSMOUTH', 'Portsmouth', 'INGLATERRA');
INSERT INTO public.teams VALUES ('PRESTON', 'Preston North End', 'INGLATERRA');
INSERT INTO public.teams VALUES ('PRO_VERCELLI', 'Pro Vercelli', 'ITALIA');
INSERT INTO public.teams VALUES ('QUILMES', 'Quilmes', 'ARGENTINA');
INSERT INTO public.teams VALUES ('RB_LEIPZIG', 'RB Leipzig', 'ALEMANHA');
INSERT INTO public.teams VALUES ('REAL_BETIS', 'Real Betis', 'ESPANHA');
INSERT INTO public.teams VALUES ('REAL_MADRID', 'Real Madrid', 'ESPANHA');
INSERT INTO public.teams VALUES ('REAL_SOCIEDAD', 'Real Sociedad', 'ESPANHA');
INSERT INTO public.teams VALUES ('REAL_ZARAGOZA', 'Real Zaragoza', 'ESPANHA');
INSERT INTO public.teams VALUES ('RIVER_PLATE', 'River Plate', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ROMA', 'Roma', 'ITALIA');
INSERT INTO public.teams VALUES ('ROSARIO_CENTRAL', 'Rosario Central', 'ARGENTINA');
INSERT INTO public.teams VALUES ('SAMPDORIA', 'Sampdoria', 'ITALIA');
INSERT INTO public.teams VALUES ('SAN_LORENZO', 'San Lorenzo', 'ARGENTINA');
INSERT INTO public.teams VALUES ('SANTO_ANDRE', 'Santo André', 'BRASIL');
INSERT INTO public.teams VALUES ('SANTOS', 'Santos', 'BRASIL');
INSERT INTO public.teams VALUES ('SAO_PAULO', 'São Paulo', 'BRASIL');
INSERT INTO public.teams VALUES ('SEVILLA', 'Sevilla', 'ESPANHA');
INSERT INTO public.teams VALUES ('SHEFFIELD_UNITED', 'Sheffield United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SHEFFIELD_WEDNESDAY', 'Sheffield Wednesday', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SOUCHAUX', 'Sochaux', 'FRANCA');
INSERT INTO public.teams VALUES ('SOUTHAMPTON', 'Southampton', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SPORT', 'Sport', 'BRASIL');
INSERT INTO public.teams VALUES ('SPVGG_FURTH', 'SpVgg Greuther Fürth', 'ALEMANHA');
INSERT INTO public.teams VALUES ('SUNDERLAND', 'Sunderland', 'INGLATERRA');
INSERT INTO public.teams VALUES ('TORINO', 'Torino', 'ITALIA');
INSERT INTO public.teams VALUES ('TOTTENHAM', 'Tottenham Hotspur', 'INGLATERRA');
INSERT INTO public.teams VALUES ('TOULOUSE', 'Toulouse', 'FRANCA');
INSERT INTO public.teams VALUES ('VADO', 'Vado', 'ITALIA');
INSERT INTO public.teams VALUES ('VALENCIA', 'Valencia', 'ESPANHA');
INSERT INTO public.teams VALUES ('VELEZ_SARSFIELD', 'Vélez Sarsfield', 'ARGENTINA');
INSERT INTO public.teams VALUES ('VENEZIA', 'Venezia', 'ITALIA');
INSERT INTO public.teams VALUES ('WERDER_BREMEN', 'SV Werder Bremen', 'ALEMANHA');
INSERT INTO public.teams VALUES ('WEST_BROMWICH', 'West Bromwich Albion', 'INGLATERRA');
INSERT INTO public.teams VALUES ('WEST_HAM', 'West Ham United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('WIGAN', 'Wigan Athletic', 'INGLATERRA');
INSERT INTO public.teams VALUES ('WOLVERHAMPTON', 'Wolverhampton', 'INGLATERRA');
INSERT INTO public.teams VALUES ('AJAX', 'Ajax', NULL);
INSERT INTO public.teams VALUES ('ONCE_CALDAS', 'Once Caldas', NULL);
INSERT INTO public.teams VALUES ('PSV_EINDHOVEN', 'PSV Eindhoven', NULL);
INSERT INTO public.teams VALUES ('PORTO', 'FC Porto', NULL);
INSERT INTO public.teams VALUES ('BENFICA', 'Benfica', NULL);
INSERT INTO public.teams VALUES ('ATLETICO_NACIONAL', 'Atlético Nacional', NULL);
INSERT INTO public.teams VALUES ('OLIMPIA', 'Olimpia', NULL);
INSERT INTO public.teams VALUES ('CELTIC', 'Celtic', NULL);
INSERT INTO public.teams VALUES ('STEAUA_BUCARESTE', 'CSA Steaua București', NULL);
INSERT INTO public.teams VALUES ('FEYENOORD', 'Feyenoord', NULL);
INSERT INTO public.teams VALUES ('BOLTON_WANDERERS', 'Bolton Wanderers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BRADFORD_CITY', 'Bradford City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('COLO_COLO', 'Colo Colo', NULL);
INSERT INTO public.teams VALUES ('KOLN', '1. FC Köln', 'ALEMANHA');
INSERT INTO public.teams VALUES ('DRESDNER_EISLOWEN', 'Dresdner Eislöwen', 'ALEMANHA');
INSERT INTO public.teams VALUES ('HAMBURGER_SV', 'Hamburger SV', 'ALEMANHA');
INSERT INTO public.teams VALUES ('HANNOVER_96', 'Hannover 96', 'ALEMANHA');
INSERT INTO public.teams VALUES ('HERTHA_BSC', 'Hertha BSC', 'ALEMANHA');
INSERT INTO public.teams VALUES ('INTER', 'Inter', 'ITALIA');
INSERT INTO public.teams VALUES ('LDU', 'LDU', NULL);
INSERT INTO public.teams VALUES ('WOLFSBURG', 'VfL Wolfsburg', 'ALEMANHA');
INSERT INTO public.teams VALUES ('VICENZA', 'Vicenza', 'ITALIA');
INSERT INTO public.teams VALUES ('BELGRANO', 'Belgrano Athletic', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ESTUDIANTES', 'Estudiantes', 'ARGENTINA');
INSERT INTO public.teams VALUES ('GIMNASIA_Y_ESGRIMA', 'Gimnasia y Esgrima', 'ARGENTINA');
INSERT INTO public.teams VALUES ('SPORTIVO_BARRACAS', 'Barracas', 'ARGENTINA');
INSERT INTO public.teams VALUES ('PENAROL', 'Peñarol', NULL);
INSERT INTO public.teams VALUES ('REAL_UNION', 'Real Unión', 'ESPANHA');
INSERT INTO public.teams VALUES ('OLD_CARTHUSIANS', 'Old Carthusians', 'INGLATERRA');
INSERT INTO public.teams VALUES ('OLD_ETONIANS', 'Old Etonians', 'INGLATERRA');
INSERT INTO public.teams VALUES ('OXFORD_UNIVERSITY', 'Oxford University', 'INGLATERRA');
INSERT INTO public.teams VALUES ('ROYAL_ENGINEERS', 'Royal Engineers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('WANDERERS', 'Wanderers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('WIMBLEDON', 'Wimbledon', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CHARLTON_ATHLETIC', 'Charlton', 'INGLATERRA');
INSERT INTO public.teams VALUES ('CA_PARIS_CHARENTON', 'Paris-Charenton', 'FRANCA');
INSERT INTO public.teams VALUES ('CRVENA_ZVEZDA', 'Crvena zvezda', NULL);
INSERT INTO public.teams VALUES ('EXCELSIOR_AC', 'Excelsior', 'FRANCA');
INSERT INTO public.teams VALUES ('RACING', 'Racing', 'ARGENTINA');
INSERT INTO public.teams VALUES ('SEDAN', 'Sedan', 'FRANCA');
INSERT INTO public.teams VALUES ('SETE', 'Sète', 'FRANCA');
INSERT INTO public.teams VALUES ('STRASBOURG', 'Strasbourg', 'FRANCA');
INSERT INTO public.teams VALUES ('RAMPLA_JUNIORS', 'Rampla Juniors', NULL);
INSERT INTO public.teams VALUES ('CLUB_CICLISTA_SAN_SEBASTIAN', 'Club Ciclista', 'ESPANHA');
INSERT INTO public.teams VALUES ('VASCO', 'Vasco', 'BRASIL');
INSERT INTO public.teams VALUES ('RAPID_WIEN', 'SK Rapid Wien', 'ALEMANHA');
INSERT INTO public.teams VALUES ('RIVER_PLATE_FC', 'River Plate FC', NULL);
INSERT INTO public.teams VALUES ('DEFENSOR_SPORTING', 'Defensor', NULL);
INSERT INTO public.teams VALUES ('PROGRESSO', 'Progreso', NULL);
INSERT INTO public.teams VALUES ('LEEDS_UNITED', 'Leeds United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('LOMAS', 'Lomas', 'ARGENTINA');
INSERT INTO public.teams VALUES ('NEWELLS_OLD_BOYS', 'Newell''s Old Boys', 'ARGENTINA');
INSERT INTO public.teams VALUES ('ROT_WEISS_ESSEN', 'Rot-Weiss Essen', 'ALEMANHA');
INSERT INTO public.teams VALUES ('SAINT_ETIENNE', 'Saint-Étienne', 'FRANCA');
INSERT INTO public.teams VALUES ('SCHALKE_04', 'FC Schalke 04', 'ALEMANHA');
INSERT INTO public.teams VALUES ('SCHWARZ_WEISS_ESSEN', 'Schwarz-Weiss Essen', 'ALEMANHA');
INSERT INTO public.teams VALUES ('UNION_BERLIN', '1. FC Union Berlin', 'ALEMANHA');
INSERT INTO public.teams VALUES ('LOKOMOTIVE_LEIPZIG', '1. FC Lokomotive Leipzig', 'ALEMANHA');
INSERT INTO public.teams VALUES ('STUTTGART', 'VfB Stuttgart', 'ALEMANHA');
INSERT INTO public.teams VALUES ('MANNHEIM', 'VfR Mannheim', 'ALEMANHA');
INSERT INTO public.teams VALUES ('VIKTORIA_BERLIN', 'Viktoria Berlin', 'ALEMANHA');
INSERT INTO public.teams VALUES ('ST_ANDREWS', 'St. Andrews', 'ARGENTINA');
INSERT INTO public.teams VALUES ('RACING_PARIS', 'Racing', 'FRANCA');
INSERT INTO public.teams VALUES ('HELLAS_VERONA', 'Verona', 'ITALIA');
INSERT INTO public.teams VALUES ('OLYMPIQUE_MARSEILLE', 'Marseille', 'FRANCA');
INSERT INTO public.teams VALUES ('PSG', 'PSG', 'FRANCA');
INSERT INTO public.teams VALUES ('STADE_REIMS', 'Reims', 'FRANCA');
INSERT INTO public.teams VALUES ('STADE_RENNAIS', 'Rennes', 'FRANCA');
INSERT INTO public.teams VALUES ('RED_STAR_FC', 'Red Star 93', 'FRANCA');
INSERT INTO public.teams VALUES ('OLYMPIQUE_LILLOIS', 'Olympique Lillois', 'FRANCA');
INSERT INTO public.teams VALUES ('CENTRAL_CORDOBA', 'Central Córdoba', 'ARGENTINA');
INSERT INTO public.teams VALUES ('LIVERPOOL_URUGUAI', 'Liverpool', NULL);
INSERT INTO public.teams VALUES ('PACHUCA', 'Pachuca', NULL);
INSERT INTO public.teams VALUES ('AL_AHLY', 'Al-Ahly', NULL);
INSERT INTO public.teams VALUES ('CIENCIANO', 'Cienciano', NULL);
INSERT INTO public.teams VALUES ('UNIVERSIDAD_CHILE', 'Universidad de Chile', NULL);
INSERT INTO public.teams VALUES ('SANTA_FE', 'Santa Fe', NULL);
INSERT INTO public.teams VALUES ('CHAPECOENSE', 'Chapecoense', 'BRASIL');
INSERT INTO public.teams VALUES ('DEL_VALLE', 'Indpendiente del Valle', NULL);
INSERT INTO public.teams VALUES ('DEFENSA_JUSTICIA', 'Defensa y Justicia', 'ARGENTINA');
INSERT INTO public.teams VALUES ('COLON', 'Colón', 'ARGENTINA');
INSERT INTO public.teams VALUES ('TALLERES', 'Talleres', 'ARGENTINA');
INSERT INTO public.teams VALUES ('IFK_GOTEBORG', 'IFK Göteborg', NULL);
INSERT INTO public.teams VALUES ('GALATASARAY', 'Galatasaray', NULL);
INSERT INTO public.teams VALUES ('CSKA', 'CSKA Moscow', NULL);
INSERT INTO public.teams VALUES ('ZENIT', 'Zenit', NULL);
INSERT INTO public.teams VALUES ('SHAKHTAR', 'Shakhtar Donetsk', NULL);
INSERT INTO public.teams VALUES ('VILLARREAL', 'Villarreal', 'ESPANHA');
INSERT INTO public.teams VALUES ('OLYMPIACOS', 'Olympiacos', NULL);
INSERT INTO public.teams VALUES ('DYNAMO_KYIV', 'Dynamo Kyiv', NULL);
INSERT INTO public.teams VALUES ('ABERDEEN', 'Aberdeen', NULL);
INSERT INTO public.teams VALUES ('KV_MECHELEN', 'KV Mechelen', NULL);
INSERT INTO public.teams VALUES ('NORWICH', 'Norwich City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BIRMINGHAM', 'Birmingham City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('QPR', 'Queens Park Rangers', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SWINDON', 'Swindon Town', 'INGLATERRA');
INSERT INTO public.teams VALUES ('STOKE_CITY', 'Stoke City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('OXFORD_UNITED', 'Oxford United', 'INGLATERRA');
INSERT INTO public.teams VALUES ('LUTON_TOWN', 'Luton Town', 'INGLATERRA');
INSERT INTO public.teams VALUES ('MIDDLESBROUGH', 'Middlesbrough', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SWANSEA', 'Swansea City', 'INGLATERRA');
INSERT INTO public.teams VALUES ('SELECAO_INGLATERRA', 'Seleção da Inglaterra', 'INGLATERRA');
INSERT INTO public.teams VALUES ('PROFISSIONAIS_INGLATERRA', 'Profissionais da Inglaterra', 'INGLATERRA');
INSERT INTO public.teams VALUES ('AMADORES_INGLATERRA', 'Amadores da Inglaterra', 'INGLATERRA');
INSERT INTO public.teams VALUES ('BRIGHTON', 'Brighton & Hove Albion', 'INGLATERRA');
INSERT INTO public.teams VALUES ('ANDERLECHT', ' Anderlecht', NULL);
INSERT INTO public.teams VALUES ('CRYSTAL_PALACE', 'Crystal Palace', 'INGLATERRA');


--
-- TOC entry 4823 (class 0 OID 17513)
-- Dependencies: 221
-- Data for Name: titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.titles VALUES (2, 1960, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (3, 1961, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5713, 1988, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5714, 1989, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (6, 1964, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (7, 1965, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (8, 1966, 'CRUZEIRO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (9, 1967, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (10, 1967, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (11, 1968, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5715, 1990, 'NAPOLI', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (13, 1969, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (14, 1970, 'FLUMINENSE', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (15, 1971, 'ATLETICO_MG', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (16, 1972, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5716, 1991, 'SAMPDORIA', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (18, 1974, 'VASCO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (19, 1975, 'INTERNACIONAL', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (20, 1976, 'INTERNACIONAL', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5717, 1992, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (22, 1978, 'GUARANI', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (23, 1979, 'INTERNACIONAL', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (24, 1980, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (25, 1981, 'GREMIO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (26, 1982, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (27, 1983, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (28, 1984, 'FLUMINENSE', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (29, 1985, 'CORITIBA', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5718, 1993, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5719, 1994, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5720, 1995, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (33, 1989, 'VASCO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (34, 1990, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (35, 1991, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (36, 1992, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (37, 1993, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (38, 1994, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (39, 1995, 'BOTAFOGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (40, 1996, 'GREMIO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (41, 1997, 'VASCO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (42, 1998, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (43, 1999, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (45, 2001, 'ATHLETICO_PR', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (46, 2002, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (47, 2003, 'CRUZEIRO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (48, 2004, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (49, 2005, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (50, 2006, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (51, 2007, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (52, 2008, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (53, 2009, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (54, 2010, 'FLUMINENSE', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (55, 2011, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (56, 2012, 'FLUMINENSE', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (57, 2013, 'CRUZEIRO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (58, 2014, 'CRUZEIRO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (59, 2015, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (60, 2016, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (61, 2017, 'CORINTHIANS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (62, 2018, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (63, 2019, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5722, 1997, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (65, 2021, 'ATLETICO_MG', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (66, 2022, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (67, 1989, 'GREMIO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (68, 1990, 'FLAMENGO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (69, 1991, 'CRICIUMA', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (70, 1992, 'INTERNACIONAL', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (71, 1993, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (72, 1994, 'GREMIO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (73, 1995, 'CORINTHIANS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (74, 1996, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (75, 1997, 'GREMIO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (76, 1998, 'PALMEIRAS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (77, 1999, 'JUVENTUDE', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (78, 2000, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (79, 2001, 'GREMIO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (80, 2002, 'CORINTHIANS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (81, 2003, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (82, 2004, 'SANTO_ANDRE', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (83, 2005, 'PAULISTA', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (84, 2006, 'FLAMENGO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (85, 2007, 'FLUMINENSE', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (86, 2008, 'SPORT', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (87, 2009, 'CORINTHIANS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (88, 2010, 'SANTOS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (89, 2011, 'VASCO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (90, 2012, 'PALMEIRAS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (91, 2013, 'FLAMENGO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (92, 2014, 'ATLETICO_MG', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (93, 2015, 'PALMEIRAS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (94, 2016, 'GREMIO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (95, 2017, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (96, 2018, 'CRUZEIRO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (97, 2019, 'ATHLETICO_PR', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (98, 2020, 'PALMEIRAS', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (99, 2021, 'ATLETICO_MG', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (100, 2022, 'FLAMENGO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (107, 1962, 'SANTOS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (108, 1963, 'SANTOS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (109, 1976, 'CRUZEIRO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (110, 1981, 'FLAMENGO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (111, 1983, 'GREMIO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (112, 1992, 'SAO_PAULO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (113, 1993, 'SAO_PAULO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (114, 1995, 'GREMIO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (115, 1997, 'CRUZEIRO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (116, 1998, 'VASCO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (117, 1999, 'PALMEIRAS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (118, 2005, 'SAO_PAULO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (119, 2006, 'INTERNACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (120, 2010, 'INTERNACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (121, 2011, 'SANTOS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (122, 2012, 'CORINTHIANS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (123, 2013, 'ATLETICO_MG', 'LIBERTADORES');
INSERT INTO public.titles VALUES (124, 2017, 'GREMIO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (125, 2019, 'FLAMENGO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (127, 2021, 'PALMEIRAS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (128, 2022, 'FLAMENGO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5723, 1998, 'LAZIO', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (1, 1959, 'BAHIA', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (146, 1962, 'SANTOS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (147, 1963, 'SANTOS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (148, 1981, 'FLAMENGO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (149, 1983, 'GREMIO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (150, 1992, 'SAO_PAULO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (151, 1993, 'SAO_PAULO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (152, 2000, 'CORINTHIANS', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (153, 2005, 'SAO_PAULO', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (154, 2006, 'INTERNACIONAL', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (155, 2012, 'CORINTHIANS', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (156, 1937, 'ATLETICO_MG', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (157, 2023, 'SAO_PAULO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (158, 2023, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (159, 2023, 'FLUMINENSE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (558, 2023, 'NAPOLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (559, 2022, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (561, 2020, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (562, 2019, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (563, 2018, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (564, 2017, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (565, 2016, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (566, 2015, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (567, 2014, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (568, 2013, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (569, 2012, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (570, 2011, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5725, 2000, 'LAZIO', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5726, 2001, 'ROMA', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5727, 2002, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5728, 2003, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5729, 2004, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (576, 2004, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (577, 2003, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (578, 2002, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (579, 2001, 'ROMA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (580, 2000, 'LAZIO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (582, 1998, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (583, 1997, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (584, 1996, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (585, 1995, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (586, 1994, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (587, 1993, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (588, 1992, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (589, 1991, 'SAMPDORIA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (590, 1990, 'NAPOLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (592, 1988, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (593, 1987, 'NAPOLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (594, 1986, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5731, 2006, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (596, 1984, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (597, 1983, 'ROMA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (598, 1982, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (599, 1981, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (601, 1979, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (602, 1978, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (603, 1977, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (604, 1976, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (605, 1975, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (606, 1974, 'LAZIO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (607, 1973, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (608, 1972, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5733, 2008, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (610, 1970, 'CAGLIARI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (611, 1969, 'FIORENTINA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (612, 1968, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (613, 1967, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5735, 2010, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (616, 1964, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5736, 2011, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (618, 1962, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (619, 1960, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (620, 1961, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (621, 1999, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (622, 1958, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (623, 1957, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (624, 1956, 'FIORENTINA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (625, 1955, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5737, 2012, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5738, 2013, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (629, 1951, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (630, 1952, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (631, 1943, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (632, 1949, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (633, 1948, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (634, 1947, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (635, 1946, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (636, 1942, 'ROMA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (637, 1941, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (639, 1939, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5740, 2015, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (641, 1936, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (642, 1937, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (643, 1931, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (644, 1935, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (645, 1934, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (646, 1933, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (647, 1932, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (650, 1929, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (651, 1928, 'TORINO', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (652, 1926, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (653, 1925, 'BOLOGNA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (654, 1924, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (655, 1923, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (656, 1922, 'NOVESE', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (657, 1922, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (658, 1921, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (660, 1915, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (661, 1914, 'CASALE', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (662, 1913, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (663, 1912, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5743, 2018, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5745, 2020, 'JUVENTUS', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5732, 2007, 'ROMA', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5734, 2009, 'LAZIO', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5739, 2014, 'NAPOLI', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5741, 2016, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5742, 2017, 'LAZIO', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5744, 2019, 'LAZIO', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (664, 1911, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5746, 2021, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (666, 1909, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (667, 1908, 'PRO_VERCELLI', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (668, 1907, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (669, 1906, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (670, 1905, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (671, 1904, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (672, 1903, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (673, 1902, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (674, 1901, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (675, 1900, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (676, 1899, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (677, 1898, 'GENOA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (679, 2007, 'MILAN', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (5748, 2024, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (5749, 2025, 'MILAN', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (682, 1969, 'MILAN', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (683, 1985, 'JUVENTUS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (684, 1989, 'MILAN', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (685, 1990, 'MILAN', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (686, 1996, 'JUVENTUS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (687, 1922, 'VADO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (688, 1936, 'TORINO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (689, 1937, 'GENOA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (690, 1938, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5750, 1987, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (692, 1940, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (693, 1941, 'VENEZIA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (694, 1942, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (695, 1943, 'TORINO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (696, 1958, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (697, 1959, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (698, 1960, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (699, 1961, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (700, 1962, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (701, 1963, 'ATALANTA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (702, 1964, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (703, 1965, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (704, 1966, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (705, 1967, 'MILAN', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (706, 1968, 'TORINO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (707, 1969, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (708, 1970, 'BOLOGNA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (709, 1971, 'TORINO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (710, 1972, 'MILAN', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (711, 1973, 'MILAN', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (712, 1974, 'BOLOGNA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (713, 1975, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (714, 1976, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (715, 1977, 'MILAN', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5751, 1988, 'WERDER_BREMEN', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (717, 1979, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (718, 1980, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (719, 1981, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5752, 1989, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (721, 1983, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (722, 1984, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (723, 1985, 'SAMPDORIA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (724, 1986, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (725, 1987, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (726, 1988, 'SAMPDORIA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (727, 1989, 'SAMPDORIA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (728, 1990, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (729, 1991, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (730, 1992, 'PARMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (731, 1993, 'TORINO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (732, 1994, 'SAMPDORIA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (733, 1995, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (734, 1996, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (735, 1997, 'VICENZA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (736, 1998, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (737, 1999, 'PARMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (738, 2000, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (739, 2001, 'FIORENTINA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (740, 2002, 'PARMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (741, 2003, 'MILAN', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (742, 2004, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5753, 1990, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5754, 1991, 'KAISERSLAUTERN', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (745, 2007, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (746, 2008, 'ROMA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (747, 2009, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5755, 1992, 'STUTTGART', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5756, 1993, 'WERDER_BREMEN', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (750, 2012, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (751, 2013, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (752, 2014, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (753, 2015, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (754, 2016, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (755, 2017, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (756, 2018, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (757, 2019, 'LAZIO', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (758, 2020, 'NAPOLI', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (759, 2021, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5757, 1994, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5758, 1995, 'BORUSSIA_DORTMUND', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5759, 1996, 'BORUSSIA_DORTMUND', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5760, 2010, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5761, 2011, 'BORUSSIA_DORTMUND', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (765, 1985, 'JUVENTUS', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (766, 1996, 'JUVENTUS', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (767, 1969, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (768, 1989, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (769, 1990, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (770, 1994, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (771, 2003, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (772, 2007, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (773, 1963, 'MILAN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2140, 1956, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2141, 1957, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2142, 1958, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2143, 1959, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2144, 1960, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2145, 1961, 'BENFICA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2146, 1962, 'BENFICA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2147, 1966, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2148, 1967, 'CELTIC', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2149, 1968, 'MANCHESTER_UNITED', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2150, 1970, 'FEYENOORD', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2151, 1971, 'AJAX', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2152, 1972, 'AJAX', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2153, 1973, 'AJAX', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2154, 1974, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2155, 1975, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2156, 1976, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2157, 1977, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2158, 1978, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2159, 1979, 'NOTTINGHAM_FOREST', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2160, 1980, 'NOTTINGHAM_FOREST', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2161, 1981, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2162, 1982, 'ASTON_VILLA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (5762, 2012, 'BORUSSIA_DORTMUND', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2164, 1984, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2165, 1986, 'STEAUA_BUCARESTE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2166, 1987, 'PORTO', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2167, 1988, 'PSV_EINDHOVEN', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (5763, 2013, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2169, 1992, 'BARCELONA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (5764, 2014, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2171, 1995, 'AJAX', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2172, 1997, 'BORUSSIA_DORTMUND', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2173, 1998, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2174, 1999, 'MANCHESTER_UNITED', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2175, 2000, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2176, 2001, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2177, 2002, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2178, 2004, 'PORTO', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2179, 2005, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2180, 2006, 'BARCELONA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2181, 2008, 'MANCHESTER_UNITED', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2182, 2009, 'BARCELONA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2183, 2011, 'BARCELONA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2184, 2012, 'CHELSEA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2185, 2013, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2186, 2014, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2187, 2015, 'BARCELONA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2188, 2016, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2189, 2017, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2190, 2018, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2191, 2019, 'LIVERPOOL', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2192, 2020, 'BAYERN_DE_MUNIQUE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2193, 2021, 'CHELSEA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2194, 2022, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2195, 2023, 'MANCHESTER_CITY', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2196, 2008, 'MANCHESTER_UNITED', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2197, 2009, 'BARCELONA', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2198, 2011, 'BARCELONA', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2199, 2013, 'BAYERN_DE_MUNIQUE', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2200, 2014, 'REAL_MADRID', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2201, 2015, 'BARCELONA', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2202, 2016, 'REAL_MADRID', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2203, 2017, 'REAL_MADRID', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2204, 2018, 'REAL_MADRID', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2205, 2019, 'LIVERPOOL', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2206, 2020, 'BAYERN_DE_MUNIQUE', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2207, 2021, 'CHELSEA', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2208, 2022, 'REAL_MADRID', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2209, 2023, 'MANCHESTER_CITY', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (2210, 1960, 'REAL_MADRID', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2211, 1961, 'PENAROL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2212, 1966, 'PENAROL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2213, 1967, 'RACING', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (5765, 2015, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2215, 1970, 'FEYENOORD', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2216, 1971, 'NACIONAL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2217, 1972, 'AJAX', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2218, 1973, 'INDEPENDIENTE', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (5766, 2016, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2220, 1976, 'BAYERN_DE_MUNIQUE', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2221, 1977, 'BOCA_JUNIORS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2222, 1979, 'OLIMPIA', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2223, 1980, 'NACIONAL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2224, 1982, 'PENAROL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2225, 1984, 'INDEPENDIENTE', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2226, 1986, 'RIVER_PLATE', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2227, 1987, 'PORTO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2228, 1988, 'NACIONAL', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (5767, 2017, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2230, 1994, 'VELEZ_SARSFIELD', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2231, 1995, 'AJAX', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2232, 1997, 'BORUSSIA_DORTMUND', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2233, 1998, 'REAL_MADRID', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2234, 1999, 'MANCHESTER_UNITED', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2235, 2000, 'BOCA_JUNIORS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2236, 2001, 'BAYERN_DE_MUNIQUE', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2237, 2002, 'REAL_MADRID', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2238, 2003, 'BOCA_JUNIORS', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2239, 2004, 'PORTO', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2240, 1960, 'PENAROL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2241, 1961, 'PENAROL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2242, 1964, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2243, 1965, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2244, 1966, 'PENAROL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2245, 1967, 'RACING', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5768, 2018, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5769, 2019, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5770, 2020, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2249, 1971, 'NACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2250, 1972, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2251, 1973, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2252, 1974, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2253, 1975, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2254, 1977, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2255, 1978, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2256, 1979, 'OLIMPIA', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2257, 1980, 'NACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2258, 1982, 'PENAROL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2259, 1984, 'INDEPENDIENTE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2260, 1985, 'ARGENTINOS_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2261, 1986, 'RIVER_PLATE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2262, 1987, 'PENAROL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2263, 1988, 'NACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2264, 1989, 'ATLETICO_NACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2265, 1990, 'OLIMPIA', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5771, 2021, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2267, 1994, 'VELEZ_SARSFIELD', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2268, 1996, 'RIVER_PLATE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2269, 2000, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2270, 2001, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2271, 2002, 'OLIMPIA', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2272, 2003, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2273, 2004, 'ONCE_CALDAS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2274, 2007, 'BOCA_JUNIORS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5772, 2022, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5773, 2023, 'BAYERN_DE_MUNIQUE', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (2277, 2014, 'SAN_LORENZO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2278, 2015, 'RIVER_PLATE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2279, 2016, 'ATLETICO_NACIONAL', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2280, 2018, 'RIVER_PLATE', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5774, 2024, 'BAYER_LEVERKUSEN', 'DFL_SUPERCUP');
INSERT INTO public.titles VALUES (5775, 1982, 'REAL_SOCIEDAD', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5776, 1983, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2284, 1907, 'FREIBURGER_FC', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5777, 1984, 'ATHLETIC_BILBAO', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2286, 1909, 'KARLSRUHER_SC', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2287, 1910, 'KARLSRUHER_FV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5778, 1985, 'ATLETICO_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2289, 1912, 'HOLSTEIN_KIEL', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5779, 1988, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2291, 1914, 'SPVGG_FURTH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2292, 1920, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2293, 1921, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5780, 1989, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2295, 1924, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2296, 1925, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2297, 1926, 'SPVGG_FURTH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2298, 1927, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5781, 1990, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2300, 1929, 'SPVGG_FURTH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5782, 1991, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5783, 1992, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2303, 1932, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2304, 1933, 'FORTUNA_DUSSELDORF', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5784, 1993, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5785, 1994, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2307, 1936, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5786, 1995, 'DEPORTIVO_LA_CORUNA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5787, 1996, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5788, 1997, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5789, 1998, 'MALLORCA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5790, 1999, 'VALENCIA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5791, 2000, 'DEPORTIVO_LA_CORUNA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5792, 2001, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5793, 2002, 'DEPORTIVO_LA_CORUNA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2316, 1948, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5794, 2003, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5795, 2004, 'REAL_ZARAGOZA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2319, 1951, 'KAISERSLAUTERN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5796, 2005, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2321, 1953, 'KAISERSLAUTERN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5797, 2006, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5798, 2007, 'SEVILLA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2324, 1956, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2325, 1957, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5799, 2008, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2327, 1959, 'EINTRACHT_FRANKFURT', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5800, 2009, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2329, 1961, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2331, 1963, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5801, 2010, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2333, 1965, 'WERDER_BREMEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5802, 2011, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2335, 1967, 'EINTRACHT_BRAUNSCHWEIG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2336, 1968, 'NURNBERG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2337, 1969, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5803, 2012, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5804, 2013, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2340, 1972, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2341, 1973, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2342, 1974, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5805, 2014, 'ATLETICO_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5806, 2015, 'ATHLETIC_BILBAO', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5807, 2016, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5808, 2017, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5809, 2018, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2348, 1980, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2349, 1981, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5810, 2020, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5811, 2021, 'ATHLETIC_BILBAO', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5812, 2022, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2353, 1985, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2354, 1986, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2355, 1987, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2356, 1988, 'WERDER_BREMEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2357, 1989, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2358, 1990, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2359, 1991, 'KAISERSLAUTERN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5813, 2023, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2361, 1993, 'WERDER_BREMEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2362, 1994, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2363, 1995, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2364, 1996, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2365, 1997, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2366, 1998, 'KAISERSLAUTERN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2367, 1999, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2368, 2000, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2369, 2001, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2370, 2002, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2371, 2003, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2372, 2004, 'WERDER_BREMEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2373, 2005, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2374, 2006, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5814, 2024, 'REAL_MADRID', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (2376, 2008, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2378, 2010, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2379, 2011, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2380, 2012, 'BORUSSIA_DORTMUND', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2381, 2013, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2382, 2014, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2383, 2015, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2384, 2016, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2385, 2017, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2386, 2018, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2387, 2019, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2388, 2020, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2389, 2021, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2330, 1962, 'KOLN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2377, 2009, 'WOLFSBURG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2390, 2022, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2391, 2023, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2392, 1935, 'NURNBERG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5815, 2025, 'BARCELONA', 'SUPERCOPA_ESPANA');
INSERT INTO public.titles VALUES (5816, 1955, 'STADE_REIMS', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5817, 1956, 'SEDAN', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2396, 1939, 'NURNBERG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5818, 1957, 'SAINT_ETIENNE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5819, 1958, 'STADE_REIMS', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5820, 1959, 'LE_HAVRE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5821, 1960, 'STADE_REIMS', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5822, 1961, 'MONACO', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2403, 1955, 'KARLSRUHER_SC', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2404, 1956, 'KARLSRUHER_SC', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2405, 1957, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5823, 1962, 'SAINT_ETIENNE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5824, 1965, 'NANTES', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2409, 1961, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2410, 1962, 'NURNBERG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5825, 1966, 'STADE_REIMS', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5826, 1967, 'SAINT_ETIENNE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2413, 1965, 'BORUSSIA_DORTMUND', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2414, 1966, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2415, 1967, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2417, 1969, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2418, 1970, 'KICKERS_OFFENBACH', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2419, 1971, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5827, 1968, 'SAINT_ETIENNE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5828, 1969, 'SAINT_ETIENNE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2422, 1974, 'EINTRACHT_FRANKFURT', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2423, 1975, 'EINTRACHT_FRANKFURT', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5829, 1970, 'NICE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5830, 1971, 'STADE_RENNAIS', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5831, 1971, 'OLYMPIQUE_MARSEILLE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2427, 1979, 'FORTUNA_DUSSELDORF', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2428, 1980, 'FORTUNA_DUSSELDORF', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2429, 1981, 'EINTRACHT_FRANKFURT', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2430, 1982, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5832, 1972, 'BASTIA', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2432, 1984, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5833, 1973, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2434, 1986, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5834, 1985, 'MONACO', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2436, 1988, 'EINTRACHT_FRANKFURT', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2437, 1989, 'BORUSSIA_DORTMUND', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2438, 1990, 'KAISERSLAUTERN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2439, 1991, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5835, 1986, 'BORDEAUX', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5836, 1995, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2442, 1994, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5837, 1997, 'MONACO', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2444, 1996, 'KAISERSLAUTERN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5838, 1998, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2446, 1998, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2447, 1999, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2448, 2000, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5839, 1999, 'NANTES', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5840, 2000, 'MONACO', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2451, 2003, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2452, 2004, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2453, 2005, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2454, 2006, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2455, 2007, 'NURNBERG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2456, 2008, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2457, 2009, 'WERDER_BREMEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2458, 2010, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5841, 2001, 'NANTES', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2460, 2012, 'BORUSSIA_DORTMUND', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2461, 2013, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2462, 2014, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2464, 2016, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2465, 2017, 'BORUSSIA_DORTMUND', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2466, 2018, 'EINTRACHT_FRANKFURT', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2467, 2019, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2468, 2020, 'BAYERN_DE_MUNIQUE', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2469, 2021, 'BORUSSIA_DORTMUND', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2470, 2022, 'RB_LEIPZIG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2471, 2023, 'RB_LEIPZIG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2472, 1889, 'PRESTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2473, 1890, 'PRESTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2474, 1891, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2475, 1892, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2476, 1893, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2477, 1894, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2478, 1895, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2479, 1896, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2480, 1897, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2481, 1898, 'SHEFFIELD_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2482, 1899, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2483, 1900, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2484, 1901, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2485, 1902, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2486, 1903, 'SHEFFIELD_WEDNESDAY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2487, 1904, 'SHEFFIELD_WEDNESDAY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2488, 1905, 'NEWCASTLE', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2489, 1906, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2490, 1907, 'NEWCASTLE', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2491, 1908, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2492, 1909, 'NEWCASTLE', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2493, 1910, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2494, 1911, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2495, 1912, 'BLACKBURN_ROVERS', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2496, 1913, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2497, 1914, 'BLACKBURN_ROVERS', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2498, 1915, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2499, 1920, 'WEST_BROMWICH', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2500, 1921, 'BURNLEY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2501, 1922, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2502, 1923, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2503, 1924, 'HUDDERSFIELD_TOWN', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2408, 1960, 'BORUSSIA_MONCHENGLADBACH', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2416, 1968, 'KOLN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2400, 1943, 'RAPID_WIEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5842, 2002, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2463, 2015, 'WOLFSBURG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2504, 1925, 'HUDDERSFIELD_TOWN', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2505, 1926, 'HUDDERSFIELD_TOWN', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2506, 1927, 'NEWCASTLE', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2507, 1928, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2508, 1929, 'SHEFFIELD_WEDNESDAY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2509, 1930, 'SHEFFIELD_WEDNESDAY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2510, 1931, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2511, 1932, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2512, 1933, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2513, 1934, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2514, 1935, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2515, 1936, 'SUNDERLAND', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2516, 1937, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2517, 1938, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2518, 1939, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2519, 1947, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2520, 1948, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2521, 1949, 'PORTSMOUTH', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2522, 1950, 'PORTSMOUTH', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2523, 1951, 'TOTTENHAM', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2524, 1952, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2525, 1953, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2526, 1954, 'WOLVERHAMPTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2527, 1955, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2528, 1956, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2529, 1957, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2530, 1958, 'WOLVERHAMPTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2531, 1959, 'WOLVERHAMPTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2532, 1960, 'BURNLEY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2533, 1961, 'TOTTENHAM', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2534, 1962, 'IPSWICH_TOWN', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2535, 1963, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2536, 1964, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2537, 1965, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2538, 1966, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2539, 1967, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2540, 1968, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (5843, 2003, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2542, 1970, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2543, 1971, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2544, 1972, 'DERBY_COUNTY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2545, 1973, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (5844, 2004, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2547, 1975, 'DERBY_COUNTY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2548, 1976, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2549, 1977, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2550, 1978, 'NOTTINGHAM_FOREST', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2551, 1979, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2552, 1980, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2553, 1981, 'ASTON_VILLA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2554, 1982, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2555, 1983, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2556, 1984, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2557, 1985, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2558, 1986, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2559, 1987, 'EVERTON', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2560, 1988, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2561, 1989, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2562, 1990, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2563, 1991, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (5845, 2005, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2565, 1993, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2566, 1994, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2567, 1995, 'BLACKBURN_ROVERS', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2568, 1996, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2569, 1997, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2570, 1998, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2571, 1999, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2572, 2000, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2573, 2001, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2574, 2002, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2575, 2003, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2576, 2004, 'ARSENAL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2577, 2005, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2578, 2006, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2579, 2007, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2580, 2008, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2581, 2009, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2582, 2010, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2583, 2011, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2584, 2012, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2585, 2013, 'MANCHESTER_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2586, 2014, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2587, 2015, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2588, 2016, 'LEICESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2589, 2017, 'CHELSEA', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2590, 2018, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2591, 2019, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2592, 2020, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2593, 2021, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2594, 2022, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2595, 2023, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2596, 1872, 'WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2597, 1873, 'WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2598, 1874, 'OXFORD_UNIVERSITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2599, 1875, 'ROYAL_ENGINEERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2601, 1876, 'WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2603, 1877, 'WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2604, 1878, 'WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2605, 1879, 'OLD_ETONIANS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2606, 1880, 'CLAPHAM_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2607, 1881, 'OLD_CARTHUSIANS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2608, 1882, 'OLD_ETONIANS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2609, 1883, 'BLACKBURN_OLYMPIC', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2610, 1884, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2611, 1885, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2612, 1886, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2614, 1887, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2615, 1888, 'WEST_BROMWICH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2616, 1889, 'PRESTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2617, 1890, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2618, 1891, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2619, 1892, 'WEST_BROMWICH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2620, 1893, 'WOLVERHAMPTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5846, 2006, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2621, 1894, 'NOTTS_COUNTY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2622, 1895, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2623, 1896, 'SHEFFIELD_WEDNESDAY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2624, 1897, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2625, 1898, 'NOTTINGHAM_FOREST', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2626, 1899, 'SHEFFIELD_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2627, 1900, 'BURY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2628, 1901, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2630, 1902, 'SHEFFIELD_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2632, 1903, 'BURY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2633, 1904, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2634, 1905, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2635, 1906, 'EVERTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2636, 1907, 'SHEFFIELD_WEDNESDAY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2637, 1908, 'WOLVERHAMPTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2638, 1909, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2639, 1910, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5847, 2007, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2643, 1912, 'BARNSLEY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2645, 1913, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2646, 1914, 'BURNLEY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2647, 1915, 'SHEFFIELD_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2648, 1920, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2649, 1921, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2650, 1922, 'HUDDERSFIELD_TOWN', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5848, 2008, 'BORDEAUX', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2652, 1924, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2653, 1925, 'SHEFFIELD_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5849, 2009, 'BORDEAUX', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2655, 1927, 'CARDIFF', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2656, 1928, 'BLACKBURN_ROVERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5850, 2010, 'OLYMPIQUE_MARSEILLE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2658, 1930, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2659, 1931, 'WEST_BROMWICH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2660, 1932, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2661, 1933, 'EVERTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2662, 1934, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2663, 1935, 'SHEFFIELD_WEDNESDAY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2664, 1936, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2665, 1937, 'SUNDERLAND', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2666, 1938, 'PRESTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2667, 1939, 'PORTSMOUTH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2668, 1946, 'DERBY_COUNTY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5851, 2011, 'OLYMPIQUE_MARSEILLE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2670, 1948, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2671, 1949, 'WOLVERHAMPTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2672, 1950, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2673, 1951, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2674, 1952, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2675, 1953, 'BLACKPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2676, 1954, 'WEST_BROMWICH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2677, 1955, 'NEWCASTLE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2678, 1956, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2679, 1957, 'ASTON_VILLA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5852, 2012, 'LYON', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2681, 1959, 'NOTTINGHAM_FOREST', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2682, 1960, 'WOLVERHAMPTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2683, 1961, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2684, 1962, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2685, 1963, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2686, 1964, 'WEST_HAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2687, 1965, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2688, 1966, 'EVERTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2689, 1967, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2690, 1968, 'WEST_BROMWICH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2691, 1969, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2692, 1970, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2694, 1971, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5853, 2013, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2696, 1973, 'SUNDERLAND', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2697, 1974, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2698, 1975, 'WEST_HAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2699, 1976, 'SOUTHAMPTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2700, 1977, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2701, 1978, 'IPSWICH_TOWN', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2702, 1979, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2703, 1980, 'WEST_HAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2704, 1981, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2706, 1982, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2708, 1983, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2710, 1984, 'EVERTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2711, 1985, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2712, 1986, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2713, 1987, 'COVENTRY_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2714, 1988, 'WIMBLEDON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2715, 1989, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2716, 1990, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2718, 1991, 'TOTTENHAM', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2719, 1992, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2720, 1993, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2722, 1994, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2723, 1995, 'EVERTON', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2724, 1996, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2725, 1997, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2726, 1998, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2727, 1999, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2728, 2000, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2729, 2001, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2730, 2002, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2731, 2003, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2732, 2004, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2733, 2005, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2734, 2006, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2735, 2007, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2736, 2008, 'PORTSMOUTH', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2737, 2009, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2738, 2010, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2739, 2011, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2740, 2012, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2741, 2013, 'WIGAN', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2742, 2014, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2743, 2015, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2744, 2016, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2745, 2017, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2746, 2018, 'CHELSEA', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2747, 2019, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2748, 2020, 'ARSENAL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2749, 2021, 'LEICESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2750, 2022, 'LIVERPOOL', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2751, 2023, 'MANCHESTER_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2752, 1903, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2753, 1904, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2754, 1905, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2755, 1906, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2756, 1907, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2757, 1908, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5854, 2014, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2759, 1910, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2760, 1910, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2761, 1911, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2762, 1912, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5855, 2015, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2764, 1913, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2765, 1914, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2766, 1915, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2767, 1916, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2768, 1917, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2769, 1918, 'REAL_UNION', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2770, 1919, 'ARENAS_CLUB', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2771, 1920, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2772, 1921, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2773, 1922, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2774, 1923, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2775, 1924, 'REAL_UNION', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2776, 1925, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2777, 1926, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2778, 1927, 'REAL_UNION', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2779, 1928, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2780, 1929, 'ESPANYOL', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2781, 1930, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2782, 1931, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2783, 1932, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2784, 1933, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2785, 1934, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2786, 1935, 'SEVILLA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2787, 1936, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2788, 1939, 'SEVILLA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2789, 1940, 'ESPANYOL', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2790, 1941, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2791, 1942, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2792, 1943, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2793, 1944, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2794, 1945, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2795, 1946, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2796, 1947, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2797, 1948, 'SEVILLA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2798, 1949, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2799, 1950, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2800, 1951, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2801, 1952, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2802, 1953, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2803, 1954, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2804, 1955, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2805, 1956, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2806, 1957, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2807, 1958, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2808, 1959, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5856, 2016, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5857, 2017, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2811, 1962, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2812, 1963, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2813, 1964, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5858, 2018, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2815, 1966, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2816, 1967, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2817, 1968, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2818, 1969, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2819, 1970, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2820, 1971, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5859, 2019, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2822, 1973, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2823, 1974, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2824, 1975, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5860, 2020, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2826, 1977, 'REAL_BETIS', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2827, 1978, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2828, 1979, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2829, 1980, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2830, 1981, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2831, 1982, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2832, 1983, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2833, 1984, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5861, 2022, 'LILLE', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2835, 1986, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2836, 1987, 'REAL_SOCIEDAD', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2837, 1988, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2838, 1989, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2839, 1990, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5862, 2023, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (5863, 2024, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2842, 1993, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2843, 1994, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2844, 1995, 'DEPORTIVO_LA_CORUNA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5864, 2025, 'PSG', 'TROPHEE_CHAMPIONS');
INSERT INTO public.titles VALUES (2846, 1997, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2847, 1998, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2848, 1999, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2849, 2000, 'ESPANYOL', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2850, 2001, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2851, 2002, 'DEPORTIVO_LA_CORUNA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2852, 2003, 'MALLORCA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2853, 2004, 'REAL_ZARAGOZA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2854, 2005, 'REAL_BETIS', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2855, 2006, 'ESPANYOL', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2856, 2007, 'SEVILLA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2857, 2008, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2858, 2009, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2859, 2010, 'SEVILLA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2860, 2011, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2861, 2012, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2863, 2014, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2864, 2015, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2865, 2016, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2866, 2017, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2867, 2018, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2868, 2019, 'VALENCIA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2869, 2020, 'REAL_SOCIEDAD', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2870, 2021, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2871, 2022, 'REAL_BETIS', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2872, 2023, 'REAL_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2873, 2023, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2874, 2022, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (5865, 2025, 'BAYERN_DE_MUNIQUE', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2876, 2020, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2877, 2019, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2878, 2018, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2879, 2017, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2880, 2016, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2881, 2015, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (5866, 2025, 'BOLOGNA', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (2883, 2013, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2884, 2012, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2885, 2011, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2886, 2010, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2887, 2009, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2888, 2008, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2889, 2007, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2890, 2006, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2891, 2005, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2892, 2004, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2893, 2003, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2894, 2002, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2895, 2001, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2896, 2000, 'DEPORTIVO_LA_CORUNA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2897, 1999, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2898, 1998, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2899, 1997, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (5867, 2025, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2901, 1995, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2902, 1994, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2903, 1993, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2904, 1992, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2905, 1991, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2906, 1990, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2907, 1989, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2908, 1988, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2909, 1987, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2910, 1986, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2911, 1985, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2912, 1984, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2913, 1983, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2914, 1982, 'REAL_SOCIEDAD', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2915, 1981, 'REAL_SOCIEDAD', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2916, 1980, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2917, 1979, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2918, 1978, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (5868, 2025, 'CRYSTAL_PALACE', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2920, 1976, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2921, 1975, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2922, 1974, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2924, 1972, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2925, 1971, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2927, 1969, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2928, 1968, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2929, 1967, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2931, 1965, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2932, 1964, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2933, 1963, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2934, 1962, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2935, 1961, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2936, 1960, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2937, 1959, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2938, 1958, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2939, 1957, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2940, 1956, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2941, 1955, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2942, 1954, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2943, 1953, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2944, 1952, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2947, 1949, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2948, 1948, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2949, 1947, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2950, 1946, 'SEVILLA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2951, 1945, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2952, 1944, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2953, 1943, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2954, 1942, 'VALENCIA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2957, 1936, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2958, 1935, 'REAL_BETIS', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2959, 1934, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2960, 1933, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2961, 1932, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2962, 1931, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2963, 1930, 'ATHLETIC_BILBAO', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2964, 1929, 'BARCELONA', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2992, 1934, 'SETE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2993, 1935, 'SOUCHAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2994, 1936, 'RACING_PARIS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2996, 1938, 'SOUCHAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2997, 1939, 'SETE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2998, 1946, 'LILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3002, 1950, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3003, 1951, 'NICE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3004, 1952, 'NICE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3006, 1954, 'LILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3008, 1956, 'NICE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5721, 1996, 'FIORENTINA', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (3011, 1959, 'NICE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5724, 1999, 'PARMA', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (3013, 1961, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5730, 2005, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (3015, 1963, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5747, 2023, 'INTER', 'SUPERCOPPA_ITALIANA');
INSERT INTO public.titles VALUES (3017, 1965, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3018, 1966, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3025, 1973, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3029, 1977, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3030, 1978, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3031, 1979, 'STRASBOURG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3032, 1980, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3034, 1982, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3035, 1983, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3036, 1984, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3037, 1985, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3039, 1987, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3040, 1988, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3046, 1995, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3047, 1996, 'AUXERRE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3048, 1997, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3049, 1998, 'LENS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3050, 1999, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3051, 2000, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3052, 2001, 'NANTES', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3053, 2002, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3054, 2003, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3055, 2004, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3056, 2005, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3057, 2006, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3058, 2007, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3059, 2008, 'LYON', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3060, 2009, 'BORDEAUX', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3062, 2011, 'LILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3063, 2012, 'MONTPELLIER', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3068, 2017, 'MONACO', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3072, 2021, 'LILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3075, 1918, 'OLYMPIQUE_DE_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3076, 1919, 'CASG_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3082, 1925, 'CASG_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3086, 1929, 'MONTPELLIER', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3087, 1930, 'SETE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3088, 1931, 'CLUB_FRANCAIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3089, 1932, 'CANNES', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3091, 1934, 'SETE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3093, 1936, 'RACING_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3094, 1937, 'SOUCHAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3096, 1939, 'RACING_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3097, 1940, 'RACING_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3098, 1941, 'BORDEAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3101, 1944, 'NANCY', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3102, 1945, 'RACING_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3103, 1946, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3104, 1947, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3105, 1948, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3106, 1949, 'RACING_PARIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3108, 1951, 'STRASBOURG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3109, 1952, 'NICE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3110, 1953, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3111, 1954, 'NICE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3112, 1955, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3113, 1956, 'SEDAN', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3114, 1957, 'TOULOUSE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3116, 1959, 'LE_HAVRE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3117, 1960, 'MONACO', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3118, 1961, 'SEDAN', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3120, 1963, 'MONACO', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3121, 1964, 'LYON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3123, 1966, 'STRASBOURG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3124, 1967, 'LYON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3130, 1973, 'LYON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3135, 1978, 'NANCY', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3136, 1979, 'NANTES', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3137, 1980, 'MONACO', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3138, 1981, 'BASTIA', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3141, 1984, 'METZ', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3142, 1985, 'MONACO', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3143, 1986, 'BORDEAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3144, 1987, 'BORDEAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3145, 1988, 'METZ', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3147, 1990, 'MONTPELLIER', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3148, 1991, 'MONACO', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3150, 1994, 'AUXERRE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3152, 1996, 'AUXERRE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3153, 1997, 'NICE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3155, 1999, 'NANTES', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3156, 2000, 'NANTES', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3157, 2001, 'STRASBOURG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3158, 2002, 'LORIENT', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3159, 2003, 'AUXERRE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3161, 2005, 'AUXERRE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3163, 2007, 'SOUCHAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3164, 2008, 'LYON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3165, 2009, 'GUINGAMP', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3167, 2011, 'LILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3168, 2012, 'LYON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3169, 2013, 'BORDEAUX', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3170, 2014, 'GUINGAMP', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3178, 2022, 'NANTES', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3179, 2023, 'TOULOUSE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3181, 1891, 'OLD_CALEDONIANS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3189, 1900, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3190, 1901, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3191, 1902, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3192, 1903, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3194, 1905, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3195, 1906, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3196, 1907, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3198, 1909, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3199, 1910, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3200, 1911, 'ALUMNI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3201, 1912, 'QUILMES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3202, 1918, 'PORTENO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3203, 1913, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3205, 1914, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3206, 1914, 'PORTENO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3207, 1915, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3208, 1916, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3209, 1917, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3210, 1918, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3211, 1919, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3212, 1919, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3213, 1920, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3214, 1920, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3215, 1921, 'HURACAN', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3216, 1921, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3217, 1922, 'HURACAN', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3218, 1922, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3219, 1923, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3220, 1923, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3221, 1924, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3222, 1924, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3223, 1925, 'HURACAN', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3224, 1925, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3225, 1926, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3226, 1926, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3227, 1927, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3228, 1928, 'HURACAN', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3230, 1930, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3231, 1931, 'ESTUDIANTIL_PORTENO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3232, 1931, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3233, 1932, 'SPORTIVO_BARRACAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3234, 1932, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3235, 1933, 'DOCK_SUD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3236, 1933, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3237, 1934, 'ESTUDIANTIL_PORTENO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3238, 1934, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3239, 1935, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3240, 1936, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3241, 1936, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3242, 1936, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3243, 1937, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3244, 1938, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3245, 1939, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3246, 1940, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3247, 1941, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3248, 1942, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3249, 1943, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3250, 1944, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3251, 1945, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3252, 1946, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3253, 1947, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3254, 1948, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3255, 1949, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3256, 1950, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3257, 1951, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3258, 1952, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3259, 1953, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3260, 1954, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3261, 1955, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3262, 1956, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3263, 1957, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3264, 1958, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3265, 1959, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3266, 1960, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3267, 1961, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3268, 1962, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3269, 1963, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3270, 1964, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3271, 1965, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3272, 1966, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3274, 1967, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3275, 1968, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3276, 1968, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3277, 1969, 'CHACARITA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3278, 1969, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3279, 1970, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3280, 1970, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3281, 1971, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3282, 1971, 'ROSARIO_CENTRAL', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3283, 1972, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3284, 1972, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3285, 1973, 'HURACAN', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3286, 1973, 'ROSARIO_CENTRAL', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3288, 1974, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3289, 1975, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3290, 1975, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3291, 1976, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3292, 1976, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3293, 1977, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3294, 1977, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3295, 1978, 'QUILMES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3296, 1978, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3297, 1979, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3298, 1979, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3299, 1980, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3300, 1980, 'ROSARIO_CENTRAL', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3301, 1981, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3302, 1981, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3304, 1982, 'FERRO_CARRIL_OESTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3305, 1983, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3307, 1984, 'ARGENTINOS_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3308, 1984, 'FERRO_CARRIL_OESTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3309, 1985, 'ARGENTINOS_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3310, 1986, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3311, 1987, 'ROSARIO_CENTRAL', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3313, 1989, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3314, 1990, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3316, 1991, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3318, 1992, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3319, 1993, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3320, 1993, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3321, 1994, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3322, 1994, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3323, 1995, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3324, 1995, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3325, 1996, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3326, 1996, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3327, 1997, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3328, 1997, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3329, 1998, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3330, 1998, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3331, 1999, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3332, 1999, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3333, 2000, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3334, 2000, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3335, 2001, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3336, 2001, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3337, 2002, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3338, 2002, 'INDEPENDIENTE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3339, 2003, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3340, 2003, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3341, 2004, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3343, 2005, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3344, 2005, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3345, 2006, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3347, 2007, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3348, 2007, 'LANUS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3349, 2008, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3350, 2008, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3351, 2009, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3352, 2009, 'BANFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3353, 2010, 'ARGENTINOS_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3355, 2011, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3356, 2011, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3358, 2012, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3360, 2012, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3361, 2013, 'SAN_LORENZO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3362, 2014, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3363, 2014, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3364, 2015, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3365, 2016, 'LANUS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3366, 2017, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3367, 2018, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3368, 2019, 'RACING', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3369, 2020, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3370, 2021, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3371, 2022, 'BOCA_JUNIORS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3372, 2023, 'RIVER_PLATE', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3373, 1969, 'BOCA_JUNIORS', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3374, 2012, 'BOCA_JUNIORS', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3376, 2014, 'HURACAN', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3377, 2015, 'BOCA_JUNIORS', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3378, 2016, 'RIVER_PLATE', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3379, 2017, 'RIVER_PLATE', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3380, 2018, 'ROSARIO_CENTRAL', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3381, 2019, 'RIVER_PLATE', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3382, 2020, 'BOCA_JUNIORS', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3383, 2022, 'PATRONATO', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3506, 1950, 'JUVENTUS', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (3507, 1959, 'MILAN', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (2334, 1966, 'TSV_1860_MUNCHEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2399, 1942, 'TSV_1860_MUNCHEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2412, 1964, 'TSV_1860_MUNCHEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (3357, 2012, 'ARSENAL_SARANDI', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3375, 2013, 'ARSENAL_SARANDI', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (2219, 1974, 'ATLETICO_MADRID', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2809, 1960, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2810, 1961, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2814, 1965, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2821, 1972, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2825, 1976, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2834, 1985, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2840, 1991, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2841, 1992, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2845, 1996, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2862, 2013, 'ATLETICO_MADRID', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2875, 2021, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2882, 2014, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2900, 1996, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2919, 1977, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2923, 1973, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2926, 1970, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2930, 1966, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2945, 1951, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2946, 1950, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2955, 1941, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2956, 1940, 'ATLETICO_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (2338, 1970, 'BORUSSIA_MONCHENGLADBACH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2339, 1971, 'BORUSSIA_MONCHENGLADBACH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2343, 1975, 'BORUSSIA_MONCHENGLADBACH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2344, 1976, 'BORUSSIA_MONCHENGLADBACH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2345, 1977, 'BORUSSIA_MONCHENGLADBACH', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2421, 1973, 'BORUSSIA_MONCHENGLADBACH', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2443, 1995, 'BORUSSIA_MONCHENGLADBACH', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2441, 1993, 'BAYER_LEVERKUSEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2433, 1985, 'KFC_UERDINGEN_05', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (3188, 1899, 'BELGRANO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3193, 1904, 'BELGRANO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3197, 1908, 'BELGRANO', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (2651, 1923, 'BOLTON_WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2654, 1926, 'BOLTON_WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2657, 1929, 'BOLTON_WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2680, 1958, 'BOLTON_WANDERERS', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2641, 1911, 'BRADFORD_CITY', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (3077, 1920, 'CA_PARIS_CHARENTON', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (2758, 1909, 'CLUB_CICLISTA_SAN_SEBASTIAN', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2266, 1991, 'COLO_COLO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2332, 1964, 'KOLN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2346, 1978, 'KOLN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2425, 1977, 'KOLN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2426, 1978, 'KOLN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2431, 1983, 'KOLN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2314, 1943, 'DRESDNER_EISLOWEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2315, 1944, 'DRESDNER_EISLOWEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2397, 1940, 'DRESDNER_EISLOWEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2398, 1941, 'DRESDNER_EISLOWEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2168, 1991, 'CRVENA_ZVEZDA', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2229, 1991, 'CRVENA_ZVEZDA', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2214, 1968, 'ESTUDIANTES', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (2246, 1968, 'ESTUDIANTES', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2247, 1969, 'ESTUDIANTES', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2248, 1970, 'ESTUDIANTES', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2669, 1947, 'CHARLTON_ATHLETIC', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (2999, 1947, 'EXCELSIOR_AC', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3090, 1933, 'EXCELSIOR_AC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (2163, 1983, 'HAMBURGER_SV', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2294, 1923, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2299, 1928, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2328, 1960, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2347, 1979, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2350, 1982, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2351, 1983, 'HAMBURGER_SV', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2411, 1963, 'HAMBURGER_SV', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2424, 1976, 'HAMBURGER_SV', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2435, 1987, 'HAMBURGER_SV', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2309, 1938, 'HANNOVER_96', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2322, 1954, 'HANNOVER_96', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2440, 1992, 'HANNOVER_96', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2301, 1930, 'HERTHA_BSC', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2302, 1931, 'HERTHA_BSC', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (560, 2021, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (571, 2010, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (572, 2009, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (573, 2008, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (574, 2007, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (575, 2006, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (591, 1989, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (600, 1980, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (609, 1971, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (614, 1965, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (615, 1966, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (617, 1963, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (626, 1953, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (627, 1954, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (638, 1940, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (640, 1938, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (649, 1930, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (659, 1920, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (665, 1910, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (678, 2010, 'INTER', 'MUNDIAL_DE_CLUBES');
INSERT INTO public.titles VALUES (680, 1964, 'INTER', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (681, 1965, 'INTER', 'INTERCONTINENTAL');
INSERT INTO public.titles VALUES (691, 1939, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (716, 1978, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (720, 1982, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (743, 2005, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (744, 2006, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (748, 2010, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (749, 2011, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (760, 2022, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (761, 2023, 'INTER', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (762, 1964, 'INTER', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (763, 1965, 'INTER', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (764, 2010, 'INTER', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2275, 2008, 'LDU', 'LIBERTADORES');
INSERT INTO public.titles VALUES (2541, 1969, 'LEEDS_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2546, 1974, 'LEEDS_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2564, 1992, 'LEEDS_UNITED', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (2695, 1972, 'LEEDS_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (3182, 1894, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3183, 1894, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3184, 1895, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3185, 1896, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3186, 1897, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3187, 1898, 'LOMAS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3287, 1974, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3312, 1988, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3315, 1990, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3317, 1992, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3342, 2004, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3359, 2013, 'NEWELLS_OLD_BOYS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (2991, 1933, 'OLYMPIQUE_LILLOIS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2170, 1993, 'OLYMPIQUE_MARSEILLE', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (2995, 1937, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3000, 1948, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3023, 1971, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3024, 1972, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3041, 1989, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3042, 1990, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3043, 1991, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3044, 1992, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3061, 2010, 'OLYMPIQUE_MARSEILLE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3081, 1924, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3083, 1926, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3084, 1927, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3092, 1935, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3095, 1938, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3100, 1943, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3126, 1969, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3129, 1972, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3133, 1976, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3146, 1989, 'OLYMPIQUE_MARSEILLE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3229, 1929, 'GIMNASIA_Y_ESGRIMA', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3038, 1986, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3045, 1994, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3064, 2013, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (2312, 1941, 'RAPID_WIEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2395, 1938, 'RAPID_WIEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (3078, 1921, 'RED_STAR_FC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3079, 1922, 'RED_STAR_FC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3080, 1923, 'RED_STAR_FC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3085, 1928, 'RED_STAR_FC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3099, 1942, 'RED_STAR_FC', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3001, 1949, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3005, 1953, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3007, 1955, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3010, 1958, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3012, 1960, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3014, 1962, 'STADE_REIMS', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3107, 1950, 'STADE_REIMS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3115, 1958, 'STADE_REIMS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3122, 1965, 'STADE_RENNAIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3128, 1971, 'STADE_RENNAIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3175, 2019, 'STADE_RENNAIS', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (2323, 1955, 'ROT_WEISS_ESSEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2401, 1953, 'ROT_WEISS_ESSEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (3009, 1957, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3016, 1964, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3019, 1967, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3020, 1968, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3021, 1969, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3022, 1970, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3026, 1974, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3027, 1975, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3028, 1976, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3033, 1981, 'SAINT_ETIENNE', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3119, 1962, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3125, 1968, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3127, 1970, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3131, 1974, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3132, 1975, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3134, 1977, 'SAINT_ETIENNE', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (2305, 1934, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2306, 1935, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2308, 1937, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2310, 1939, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2311, 1940, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2313, 1942, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2326, 1958, 'SCHALKE_04', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2394, 1937, 'SCHALKE_04', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2420, 1972, 'SCHALKE_04', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2449, 2001, 'SCHALKE_04', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2450, 2002, 'SCHALKE_04', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2459, 2011, 'SCHALKE_04', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2407, 1959, 'SCHWARZ_WEISS_ESSEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2282, 1905, 'UNION_BERLIN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (595, 1985, 'HELLAS_VERONA', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (2281, 1903, 'LOKOMOTIVE_LEIPZIG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2283, 1906, 'LOKOMOTIVE_LEIPZIG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2290, 1913, 'LOKOMOTIVE_LEIPZIG', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2393, 1936, 'LOKOMOTIVE_LEIPZIG', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2318, 1950, 'STUTTGART', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2320, 1952, 'STUTTGART', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2352, 1984, 'STUTTGART', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2360, 1992, 'STUTTGART', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2375, 2007, 'STUTTGART', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2402, 1954, 'STUTTGART', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2406, 1958, 'STUTTGART', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2445, 1997, 'STUTTGART', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (2317, 1949, 'MANNHEIM', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2285, 1908, 'VIKTORIA_BERLIN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2288, 1911, 'VIKTORIA_BERLIN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (2763, 1913, 'REAL_UNION', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (2276, 2009, 'ESTUDIANTES', 'LIBERTADORES');
INSERT INTO public.titles VALUES (3204, 1913, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3273, 1967, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3303, 1982, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3306, 1983, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3346, 2006, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3354, 2010, 'ESTUDIANTES', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (3384, 2023, 'ESTUDIANTES', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (3065, 2014, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3066, 2015, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3067, 2016, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3069, 2018, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3070, 2019, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3071, 2020, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3073, 2022, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3074, 2023, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (3139, 1982, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3140, 1983, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3149, 1993, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3151, 1995, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3154, 1998, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3160, 2004, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3162, 2006, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3166, 2010, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3171, 2015, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3172, 2016, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3173, 2017, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3174, 2018, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3176, 2020, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3177, 2021, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (3180, 1891, 'ST_ANDREWS', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (4, 1962, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5, 1963, 'SANTOS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (12, 1968, 'BOTAFOGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (17, 1973, 'PALMEIRAS', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (21, 1977, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (30, 1986, 'SAO_PAULO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (31, 1987, 'SPORT', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (32, 1988, 'BAHIA', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (44, 2000, 'VASCO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (64, 2020, 'FLAMENGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (126, 2020, 'PALMEIRAS', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5032, 2024, 'ATHLETIC_BILBAO', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5033, 2024, 'BAYER_LEVERKUSEN', 'CAMPEONATO_ALEMAO');
INSERT INTO public.titles VALUES (5035, 2024, 'INTER', 'CAMPEONATO_ITALIANO');
INSERT INTO public.titles VALUES (5036, 2024, 'REAL_MADRID', 'CAMPEONATO_ESPANHOL');
INSERT INTO public.titles VALUES (5037, 2024, 'JUVENTUS', 'COPA_DA_ITALIA');
INSERT INTO public.titles VALUES (5038, 2024, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5039, 2024, 'MANCHESTER_CITY', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (5041, 2024, 'MANCHESTER_UNITED', 'COPA_DA_INGLATERRA');
INSERT INTO public.titles VALUES (5042, 2024, 'BAYER_LEVERKUSEN', 'COPA_DA_ALEMANHA');
INSERT INTO public.titles VALUES (5043, 2024, 'PSG', 'COPA_DA_FRANCA');
INSERT INTO public.titles VALUES (5045, 2024, 'REAL_MADRID', 'CHAMPIONS_LEAGUE');
INSERT INTO public.titles VALUES (5046, 2024, 'FLAMENGO', 'COPA_DO_BRASIL');
INSERT INTO public.titles VALUES (5047, 2024, 'BOTAFOGO', 'LIBERTADORES');
INSERT INTO public.titles VALUES (5050, 2024, 'BOTAFOGO', 'CAMPEONATO_BRASILEIRO');
INSERT INTO public.titles VALUES (5051, 2024, 'CENTRAL_CORDOBA', 'COPA_DA_ARGENTINA');
INSERT INTO public.titles VALUES (5053, 2024, 'VELEZ_SARSFIELD', 'CAMPEONATO_ARGENTINO');
INSERT INTO public.titles VALUES (5054, 2024, 'REAL_MADRID', 'INTERCONTINENTAL_FIFA');
INSERT INTO public.titles VALUES (5234, 2025, 'BARCELONA', 'COPA_DA_ESPANHA');
INSERT INTO public.titles VALUES (5235, 2025, 'PSG', 'CAMPEONATO_FRANCES');
INSERT INTO public.titles VALUES (5236, 2025, 'LIVERPOOL', 'CAMPEONATO_INGLES');
INSERT INTO public.titles VALUES (5237, 2024, 'PACHUCA', 'FIFA_DERBY_AMERICAS_CUP');
INSERT INTO public.titles VALUES (5238, 2024, 'AL_AHLY', 'FIFA_AFRICAN_ASIA_PACIFIC_CUP');
INSERT INTO public.titles VALUES (5239, 2024, 'PACHUCA', 'FIFA_CHALLENGER_CUP');
INSERT INTO public.titles VALUES (5240, 2002, 'SAN_LORENZO', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5241, 2003, 'CIENCIANO', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5242, 2004, 'BOCA_JUNIORS', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5243, 2005, 'BOCA_JUNIORS', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5244, 2006, 'PACHUCA', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5245, 2007, 'ARSENAL_SARANDI', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5246, 2008, 'INTERNACIONAL', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5247, 2009, 'LDU', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5248, 2010, 'INDEPENDIENTE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5249, 2011, 'UNIVERSIDAD_CHILE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5250, 2012, 'SAO_PAULO', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5251, 2013, 'LANUS', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5252, 2014, 'RIVER_PLATE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5253, 2015, 'SANTA_FE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5254, 2016, 'CHAPECOENSE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5255, 2017, 'INDEPENDIENTE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5256, 2018, 'ATHLETICO_PR', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5257, 2019, 'DEL_VALLE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5258, 2020, 'DEFENSA_JUSTICIA', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5259, 2021, 'ATHLETICO_PR', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5260, 2022, 'DEL_VALLE', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5261, 2023, 'LDU', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5262, 2024, 'RACING', 'CONMEBOL_SUDAMERICANA');
INSERT INTO public.titles VALUES (5263, 1989, 'NACIONAL', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5264, 1990, 'BOCA_JUNIORS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5265, 1991, 'OLIMPIA', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5266, 1992, 'COLO_COLO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5267, 1993, 'SAO_PAULO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5268, 1994, 'SAO_PAULO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5269, 1995, 'INDEPENDIENTE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5270, 1996, 'GREMIO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5271, 1997, 'VELEZ_SARSFIELD', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5272, 1998, 'CRUZEIRO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5273, 2003, 'OLIMPIA', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5274, 2004, 'CIENCIANO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5275, 2005, 'BOCA_JUNIORS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5276, 2006, 'BOCA_JUNIORS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5277, 2007, 'INTERNACIONAL', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5278, 2008, 'BOCA_JUNIORS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5279, 2009, 'LDU', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5280, 2010, 'LDU', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5281, 2011, 'INTERNACIONAL', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5282, 2012, 'SANTOS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5283, 2013, 'CORINTHIANS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5284, 2014, 'ATLETICO_MG', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5285, 2015, 'RIVER_PLATE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5286, 2016, 'RIVER_PLATE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5287, 2017, 'ATLETICO_NACIONAL', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5288, 2018, 'GREMIO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5289, 2019, 'RIVER_PLATE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5290, 2020, 'FLAMENGO', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5291, 2021, 'DEFENSA_JUSTICIA', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5292, 2022, 'PALMEIRAS', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5293, 2023, 'DEL_VALLE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5294, 2024, 'FLUMINENSE', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5295, 2025, 'RACING', 'CONMEBOL_RECOPA');
INSERT INTO public.titles VALUES (5296, 1990, 'GREMIO', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5297, 1991, 'CORINTHIANS', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5298, 2020, 'FLAMENGO', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5299, 2021, 'FLAMENGO', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5300, 2022, 'ATLETICO_MG', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5301, 2023, 'PALMEIRAS', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5302, 2024, 'SAO_PAULO', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5303, 2025, 'FLAMENGO', 'SUPERCOPA_REI');
INSERT INTO public.titles VALUES (5419, 2020, 'BOCA_JUNIORS', 'COPA_DE_LA_LIGA_PROFESIONAL');
INSERT INTO public.titles VALUES (5420, 2021, 'COLON', 'COPA_DE_LA_LIGA_PROFESIONAL');
INSERT INTO public.titles VALUES (5421, 2022, 'BOCA_JUNIORS', 'COPA_DE_LA_LIGA_PROFESIONAL');
INSERT INTO public.titles VALUES (5422, 2023, 'ROSARIO_CENTRAL', 'COPA_DE_LA_LIGA_PROFESIONAL');
INSERT INTO public.titles VALUES (5423, 2024, 'ESTUDIANTES', 'COPA_DE_LA_LIGA_PROFESIONAL');
INSERT INTO public.titles VALUES (5424, 2012, 'ARSENAL_SARANDI', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5425, 2013, 'VELEZ_SARSFIELD', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5426, 2014, 'HURACAN', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5427, 2015, 'SAN_LORENZO', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5428, 2016, 'LANUS', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5429, 2017, 'RIVER_PLATE', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5430, 2018, 'BOCA_JUNIORS', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5431, 2019, 'RIVER_PLATE', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5432, 2022, 'BOCA_JUNIORS', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5433, 2023, 'RIVER_PLATE', 'SUPERCOPA_ARGENTINA');
INSERT INTO public.titles VALUES (5434, 2022, 'RACING', 'SUPERCOPA_INTERNACIONAL');
INSERT INTO public.titles VALUES (5435, 2023, 'TALLERES', 'SUPERCOPA_INTERNACIONAL');
INSERT INTO public.titles VALUES (5436, 2020, 'RACING', 'TROFEO_CAMPEONES_LIGA');
INSERT INTO public.titles VALUES (5437, 2021, 'RIVER_PLATE', 'TROFEO_CAMPEONES_LIGA');
INSERT INTO public.titles VALUES (5438, 2022, 'RACING', 'TROFEO_CAMPEONES_LIGA');
INSERT INTO public.titles VALUES (5439, 2023, 'RIVER_PLATE', 'TROFEO_CAMPEONES_LIGA');
INSERT INTO public.titles VALUES (5440, 2024, 'ESTUDIANTES', 'TROFEO_CAMPEONES_LIGA');
INSERT INTO public.titles VALUES (5441, 1972, 'TOTTENHAM', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5442, 1973, 'LIVERPOOL', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5443, 1974, 'FEYENOORD', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5444, 1975, 'BORUSSIA_MONCHENGLADBACH', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5445, 1976, 'LIVERPOOL', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5446, 1977, 'JUVENTUS', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5447, 1978, 'PSV_EINDHOVEN', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5448, 1979, 'BORUSSIA_MONCHENGLADBACH', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5449, 1980, 'EINTRACHT_FRANKFURT', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5450, 1981, 'IPSWICH_TOWN', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5451, 1982, 'IFK_GOTEBORG', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5452, 1983, 'ANDERLECHT', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5453, 1984, 'TOTTENHAM', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5454, 1985, 'REAL_MADRID', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5455, 1986, 'REAL_MADRID', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5456, 1987, 'IFK_GOTEBORG', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5457, 1988, 'BAYER_LEVERKUSEN', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5458, 1989, 'NAPOLI', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5459, 1990, 'JUVENTUS', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5460, 1991, 'INTER', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5461, 1992, 'AJAX', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5462, 1993, 'JUVENTUS', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5463, 1994, 'INTER', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5464, 1995, 'PARMA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5465, 1996, 'BAYERN_DE_MUNIQUE', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5466, 1997, 'SCHALKE_04', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5467, 1998, 'INTER', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5468, 1999, 'PARMA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5469, 2000, 'GALATASARAY', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5470, 2001, 'LIVERPOOL', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5471, 2002, 'FEYENOORD', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5472, 2003, 'PORTO', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5473, 2004, 'VALENCIA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5474, 2005, 'CSKA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5475, 2006, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5476, 2007, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5477, 2008, 'ZENIT', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5478, 2009, 'SHAKHTAR', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5479, 2010, 'ATLETICO_MADRID', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5480, 2011, 'PORTO', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5481, 2012, 'ATLETICO_MADRID', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5482, 2013, 'CHELSEA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5483, 2014, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5484, 2015, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5485, 2016, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5486, 2017, 'MANCHESTER_UNITED', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5487, 2018, 'ATLETICO_MADRID', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5488, 2019, 'CHELSEA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5489, 2020, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5490, 2021, 'VILLARREAL', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5491, 2022, 'EINTRACHT_FRANKFURT', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5492, 2023, 'SEVILLA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5493, 2024, 'ATALANTA', 'UEFA_EUROPA_LEAGUE');
INSERT INTO public.titles VALUES (5494, 2022, 'ROMA', 'UEFA_CONFERENCE_LEAGUE');
INSERT INTO public.titles VALUES (5495, 2023, 'WEST_HAM', 'UEFA_CONFERENCE_LEAGUE');
INSERT INTO public.titles VALUES (5496, 2024, 'OLYMPIACOS', 'UEFA_CONFERENCE_LEAGUE');
INSERT INTO public.titles VALUES (5497, 1973, 'AJAX', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5498, 1975, 'DYNAMO_KYIV', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5499, 1976, 'ANDERLECHT', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5500, 1977, 'LIVERPOOL', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5501, 1978, 'ANDERLECHT', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5502, 1979, 'NOTTINGHAM_FOREST', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5503, 1980, 'VALENCIA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5504, 1982, 'ASTON_VILLA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5505, 1983, 'ABERDEEN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5506, 1984, 'JUVENTUS', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5507, 1986, 'STEAUA_BUCARESTE', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5508, 1987, 'PORTO', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5509, 1988, 'KV_MECHELEN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5510, 1989, 'MILAN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5511, 1990, 'MILAN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5512, 1991, 'MANCHESTER_UNITED', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5513, 1992, 'BARCELONA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5514, 1993, 'PARMA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5515, 1994, 'MILAN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5516, 1995, 'AJAX', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5517, 1996, 'JUVENTUS', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5518, 1997, 'BARCELONA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5519, 1998, 'CHELSEA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5520, 1999, 'LAZIO', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5521, 2000, 'GALATASARAY', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5522, 2001, 'LIVERPOOL', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5523, 2002, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5524, 2003, 'MILAN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5525, 2004, 'VALENCIA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5526, 2005, 'LIVERPOOL', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5527, 2006, 'SEVILLA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5528, 2007, 'MILAN', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5529, 2008, 'ZENIT', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5530, 2009, 'BARCELONA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5531, 2010, 'ATLETICO_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5532, 2011, 'BARCELONA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5533, 2012, 'ATLETICO_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5534, 2013, 'BAYERN_DE_MUNIQUE', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5535, 2014, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5536, 2015, 'BARCELONA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5537, 2016, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5538, 2017, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5539, 2018, 'ATLETICO_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5540, 2019, 'LIVERPOOL', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5541, 2020, 'BAYERN_DE_MUNIQUE', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5542, 2021, 'CHELSEA', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5543, 2022, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5544, 2023, 'MANCHESTER_CITY', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5545, 2024, 'REAL_MADRID', 'UEFA_SUPER_CUP');
INSERT INTO public.titles VALUES (5546, 1961, 'ASTON_VILLA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5547, 1962, 'NORWICH', 'EFL_CUP');
INSERT INTO public.titles VALUES (5548, 1963, 'BIRMINGHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5549, 1964, 'LEICESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5550, 1965, 'CHELSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5551, 1966, 'WEST_BROMWICH', 'EFL_CUP');
INSERT INTO public.titles VALUES (5552, 1967, 'QPR', 'EFL_CUP');
INSERT INTO public.titles VALUES (5553, 1968, 'LEEDS_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5554, 1969, 'SWINDON', 'EFL_CUP');
INSERT INTO public.titles VALUES (5555, 1970, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5556, 1971, 'TOTTENHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5557, 1972, 'STOKE_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5558, 1973, 'TOTTENHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5559, 1974, 'WOLVERHAMPTON', 'EFL_CUP');
INSERT INTO public.titles VALUES (5560, 1975, 'ASTON_VILLA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5561, 1976, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5562, 1977, 'ASTON_VILLA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5563, 1978, 'NOTTINGHAM_FOREST', 'EFL_CUP');
INSERT INTO public.titles VALUES (5564, 1979, 'NOTTINGHAM_FOREST', 'EFL_CUP');
INSERT INTO public.titles VALUES (5565, 1980, 'WOLVERHAMPTON', 'EFL_CUP');
INSERT INTO public.titles VALUES (5566, 1981, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5567, 1982, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5568, 1983, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5569, 1984, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5570, 1985, 'NORWICH', 'EFL_CUP');
INSERT INTO public.titles VALUES (5571, 1986, 'OXFORD_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5572, 1987, 'ARSENAL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5573, 1988, 'LUTON_TOWN', 'EFL_CUP');
INSERT INTO public.titles VALUES (5574, 1989, 'NOTTINGHAM_FOREST', 'EFL_CUP');
INSERT INTO public.titles VALUES (5575, 1990, 'NOTTINGHAM_FOREST', 'EFL_CUP');
INSERT INTO public.titles VALUES (5576, 1991, 'SHEFFIELD_WEDNESDAY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5577, 1992, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5578, 1993, 'ARSENAL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5579, 1994, 'ASTON_VILLA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5580, 1995, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5581, 1996, 'ASTON_VILLA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5582, 1997, 'LEICESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5583, 1998, 'CHELSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5584, 1999, 'TOTTENHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5585, 2000, 'LEICESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5586, 2001, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5587, 2002, 'BLACKBURN_ROVERS', 'EFL_CUP');
INSERT INTO public.titles VALUES (5588, 2003, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5589, 2004, 'MIDDLESBROUGH', 'EFL_CUP');
INSERT INTO public.titles VALUES (5590, 2005, 'CHELSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5591, 2006, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5592, 2007, 'CHELSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5593, 2008, 'TOTTENHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5594, 2009, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5595, 2010, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5596, 2011, 'BIRMINGHAM', 'EFL_CUP');
INSERT INTO public.titles VALUES (5597, 2012, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5598, 2013, 'SWANSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5599, 2014, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5600, 2015, 'CHELSEA', 'EFL_CUP');
INSERT INTO public.titles VALUES (5601, 2016, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5602, 2017, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5603, 2018, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5604, 2019, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5605, 2020, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5606, 2021, 'MANCHESTER_CITY', 'EFL_CUP');
INSERT INTO public.titles VALUES (5607, 2022, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5608, 2023, 'MANCHESTER_UNITED', 'EFL_CUP');
INSERT INTO public.titles VALUES (5609, 2024, 'LIVERPOOL', 'EFL_CUP');
INSERT INTO public.titles VALUES (5610, 2025, 'NEWCASTLE', 'EFL_CUP');
INSERT INTO public.titles VALUES (5611, 1908, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5612, 1909, 'NEWCASTLE', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5613, 1910, 'BRIGHTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5614, 1911, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5615, 1912, 'BLACKBURN_ROVERS', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5616, 1913, 'PROFISSIONAIS_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5617, 1920, 'WEST_BROMWICH', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5618, 1921, 'TOTTENHAM', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5619, 1922, 'HUDDERSFIELD_TOWN', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5620, 1923, 'PROFISSIONAIS_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5621, 1924, 'PROFISSIONAIS_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5622, 1925, 'AMADORES_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5623, 1926, 'AMADORES_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5624, 1927, 'CARDIFF', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5625, 1928, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5626, 1929, 'PROFISSIONAIS_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5627, 1930, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5628, 1931, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5629, 1932, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5630, 1933, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5631, 1934, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5632, 1935, 'SHEFFIELD_WEDNESDAY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5633, 1936, 'SUNDERLAND', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5634, 1937, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5635, 1938, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5636, 1948, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5637, 1949, 'PORTSMOUTH', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5638, 1950, 'SELECAO_INGLATERRA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5639, 1951, 'TOTTENHAM', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5640, 1952, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5641, 1953, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5642, 1954, 'WEST_BROMWICH', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5643, 1955, 'CHELSEA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5644, 1956, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5645, 1957, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5646, 1958, 'BOLTON_WANDERERS', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5647, 1959, 'WOLVERHAMPTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5648, 1960, 'BURNLEY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5649, 1961, 'TOTTENHAM', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5650, 1962, 'TOTTENHAM', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5651, 1963, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5652, 1964, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5653, 1965, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5654, 1966, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5655, 1967, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5656, 1968, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5657, 1969, 'LEEDS_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5658, 1970, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5659, 1971, 'LEICESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5660, 1972, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5661, 1973, 'BURNLEY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5662, 1974, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5663, 1975, 'DERBY_COUNTY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5664, 1976, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5665, 1977, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5666, 1978, 'NOTTINGHAM_FOREST', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5667, 1979, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5668, 1980, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5669, 1981, 'ASTON_VILLA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5670, 1982, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5671, 1983, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5672, 1984, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5673, 1985, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5674, 1986, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5675, 1987, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5676, 1988, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5677, 1989, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5678, 1990, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5679, 1991, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5680, 1992, 'LEEDS_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5681, 1993, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5682, 1994, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5683, 1995, 'EVERTON', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5684, 1996, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5685, 1997, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5686, 1998, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5687, 1999, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5688, 2000, 'CHELSEA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5689, 2001, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5690, 2002, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5691, 2003, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5692, 2004, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5693, 2005, 'CHELSEA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5694, 2006, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5695, 2007, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5696, 2008, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5697, 2009, 'CHELSEA', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5698, 2010, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5699, 2011, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5700, 2012, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5701, 2013, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5702, 2014, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5703, 2015, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5704, 2016, 'MANCHESTER_UNITED', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5705, 2017, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5706, 2018, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5707, 2019, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5708, 2020, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5709, 2021, 'LEICESTER_CITY', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5710, 2022, 'LIVERPOOL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5711, 2023, 'ARSENAL', 'COMMUNITY_SHIELD');
INSERT INTO public.titles VALUES (5712, 2024, 'MANCHESTER_CITY', 'COMMUNITY_SHIELD');


--
-- TOC entry 4818 (class 0 OID 16477)
-- Dependencies: 216
-- Data for Name: tournament_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tournament_groups VALUES ('NACIONAL', 'Nacionais', 1.0, 'Os títulos que concedem ao clube o troféu de campeão nacional. (Ex: Brasileirão, LaLiga)', 3);
INSERT INTO public.tournament_groups VALUES ('CONTINENTAL', 'Continentais', 2.0, 'Os títulos que concedem ao clube o troféu de campeão continental. (Ex: CONMEBOL Libertadores, UEFA Champions League)', 2);
INSERT INTO public.tournament_groups VALUES ('MUNDIAL', 'Mundiais', 3.0, 'Os títulos que concedem ao clube o troféu de campeão mundial. (Ex: FIFA Club World Cup, FIFA Intercontinental Cup, Toyota European/South American Cup)', 1);
INSERT INTO public.tournament_groups VALUES ('COPA', 'Copas', 0.5, 'Grandes títulos que não são os maiores campeonatos de seu escopo. (Ex: Copa do Brasil, CONMEBOL Sudamericana, UEFA Europa League, UEFA Conference League, FA Cup, EFL Cup, Copa Argentina, Copa de La Liga Profesional)', 4);
INSERT INTO public.tournament_groups VALUES ('SUPERCOPA', 'Minicopas', 0.2, 'Títulos oficiais em âmbito nacional ou internacional geralmente com poucos jogos e teor de comemoração. (Ex: Supercopa Rei, CONMEBOL Recopa, UEFA Super Cup, FIFA Challenger Cup, Supercoppa Italiana, Trofeo de Campeones de la Liga Profesional)', 5);


--
-- TOC entry 4819 (class 0 OID 16482)
-- Dependencies: 217
-- Data for Name: tournaments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tournaments VALUES ('TROFEO_CAMPEONES_LIGA', 'SUPERCOPA', 'Trofeo de Campeones de la Liga Profesional');
INSERT INTO public.tournaments VALUES ('SUPERCOPA_REI', 'SUPERCOPA', 'Supercopa Rei');
INSERT INTO public.tournaments VALUES ('INTERCONTINENTAL_FIFA', 'MUNDIAL', 'FIFA Intercontinental Cup');
INSERT INTO public.tournaments VALUES ('INTERCONTINENTAL', 'MUNDIAL', 'Toyota Cup/Intercontinental Cup');
INSERT INTO public.tournaments VALUES ('COPA_DO_BRASIL', 'COPA', 'Copa do Brasil');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_INGLES', 'NACIONAL', 'Premier League/First Division/Football League');
INSERT INTO public.tournaments VALUES ('COPA_DA_INGLATERRA', 'COPA', 'FA Cup');
INSERT INTO public.tournaments VALUES ('COPA_DA_ESPANHA', 'COPA', 'Copa del Rey');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_ESPANHOL', 'NACIONAL', 'LaLiga');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_ARGENTINO', 'NACIONAL', 'Primera División');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_FRANCES', 'NACIONAL', 'Ligue 1');
INSERT INTO public.tournaments VALUES ('CHAMPIONS_LEAGUE', 'CONTINENTAL', 'UEFA Champions League');
INSERT INTO public.tournaments VALUES ('LIBERTADORES', 'CONTINENTAL', 'CONMEBOL Libertadores');
INSERT INTO public.tournaments VALUES ('MUNDIAL_DE_CLUBES', 'MUNDIAL', 'FIFA Club World Cup');
INSERT INTO public.tournaments VALUES ('COPA_DA_ARGENTINA', 'COPA', 'Copa Argentina');
INSERT INTO public.tournaments VALUES ('COPA_DA_ALEMANHA', 'COPA', 'DFB Pokal');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_ALEMAO', 'NACIONAL', 'Bundesliga/Deutsche Fußballmeisterschaft');
INSERT INTO public.tournaments VALUES ('COPA_DA_ITALIA', 'COPA', 'Coppa Italia');
INSERT INTO public.tournaments VALUES ('COPA_DA_FRANCA', 'COPA', 'Coupe de France');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_ITALIANO', 'NACIONAL', 'Serie A');
INSERT INTO public.tournaments VALUES ('CAMPEONATO_BRASILEIRO', 'NACIONAL', 'Brasileirão');
INSERT INTO public.tournaments VALUES ('FIFA_DERBY_AMERICAS_CUP', 'SUPERCOPA', 'FIFA Derby of the Americas');
INSERT INTO public.tournaments VALUES ('FIFA_AFRICAN_ASIA_PACIFIC_CUP', 'SUPERCOPA', 'FIFA African-Asian-Pacific Cup');
INSERT INTO public.tournaments VALUES ('FIFA_CHALLENGER_CUP', 'SUPERCOPA', 'FIFA Challenger Cup');
INSERT INTO public.tournaments VALUES ('CONMEBOL_SUDAMERICANA', 'COPA', 'CONMEBOL Sudamericana');
INSERT INTO public.tournaments VALUES ('CONMEBOL_RECOPA', 'SUPERCOPA', 'CONMEBOL Recopa');
INSERT INTO public.tournaments VALUES ('UEFA_EUROPA_LEAGUE', 'COPA', 'UEFA Europa League');
INSERT INTO public.tournaments VALUES ('UEFA_CONFERENCE_LEAGUE', 'COPA', 'UEFA Conference League');
INSERT INTO public.tournaments VALUES ('UEFA_SUPER_CUP', 'SUPERCOPA', 'UEFA Super Cup');
INSERT INTO public.tournaments VALUES ('DFL_SUPERCUP', 'SUPERCOPA', 'DFL Supercup');
INSERT INTO public.tournaments VALUES ('SUPERCOPA_ESPANA', 'SUPERCOPA', 'Supercopa de España');
INSERT INTO public.tournaments VALUES ('TROPHEE_CHAMPIONS', 'SUPERCOPA', 'Trophée des Champions');
INSERT INTO public.tournaments VALUES ('EFL_CUP', 'COPA', 'EFL Cup');
INSERT INTO public.tournaments VALUES ('COMMUNITY_SHIELD', 'SUPERCOPA', 'Community Shield');
INSERT INTO public.tournaments VALUES ('SUPERCOPPA_ITALIANA', 'SUPERCOPA', 'Supercoppa Italiana');
INSERT INTO public.tournaments VALUES ('COPA_DE_LA_LIGA_PROFESIONAL', 'COPA', 'Copa de la Liga Profesional');
INSERT INTO public.tournaments VALUES ('SUPERCOPA_ARGENTINA', 'SUPERCOPA', 'Supercopa Argentina');
INSERT INTO public.tournaments VALUES ('SUPERCOPA_INTERNACIONAL', 'SUPERCOPA', 'Supercopa Internacional');


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 220
-- Name: titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.titles_id_seq', 5868, true);


--
-- TOC entry 4663 (class 2606 OID 17145)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 4665 (class 2606 OID 17491)
-- Name: summary summary_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT summary_pkey PRIMARY KEY (country_id, rank_type, season, team_id);


--
-- TOC entry 4657 (class 2606 OID 16492)
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- TOC entry 4667 (class 2606 OID 17520)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16494)
-- Name: tournament_groups tournament_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournament_groups
    ADD CONSTRAINT tournament_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 16496)
-- Name: tournaments tournaments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT tournaments_pkey PRIMARY KEY (id);


--
-- TOC entry 4668 (class 2606 OID 17196)
-- Name: teams country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT country FOREIGN KEY (country_id) REFERENCES public.countries(id) NOT VALID;


--
-- TOC entry 4672 (class 2606 OID 17635)
-- Name: titles fk8l83yn2hm8r778tytnlyossho; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT fk8l83yn2hm8r778tytnlyossho FOREIGN KEY (tournament_id) REFERENCES public.tournaments(id);


--
-- TOC entry 4670 (class 2606 OID 17679)
-- Name: summary fkdmq8dpt14u231g6qgtc11pp8d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT fkdmq8dpt14u231g6qgtc11pp8d FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- TOC entry 4671 (class 2606 OID 17684)
-- Name: summary fkkseob2oy6gj9evxahq8vm9qk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.summary
    ADD CONSTRAINT fkkseob2oy6gj9evxahq8vm9qk2 FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- TOC entry 4669 (class 2606 OID 16504)
-- Name: tournaments group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tournaments
    ADD CONSTRAINT "group" FOREIGN KEY (group_id) REFERENCES public.tournament_groups(id);


--
-- TOC entry 4673 (class 2606 OID 17619)
-- Name: titles team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT team FOREIGN KEY (team_id) REFERENCES public.teams(id) ON UPDATE CASCADE NOT VALID;


-- Completed on 2025-05-17 15:01:54

--
-- PostgreSQL database dump complete
--

