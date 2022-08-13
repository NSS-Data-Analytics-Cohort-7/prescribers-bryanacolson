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

-- Dumped from database version 13.1 (Ubuntu 13.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.1 (Ubuntu 13.1-1.pgdg20.04+1)

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

DROP DATABASE prescribers;
--
-- Name: prescribers; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE prescribers WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE prescribers OWNER TO postgres;

\connect prescribers

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
-- Name: cbsa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cbsa (
    fipscounty character varying(5),
    cbsa text,
    cbsaname text
);


ALTER TABLE public.cbsa OWNER TO postgres;

--
-- Name: drug; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drug (
    drug_name text,
    generic_name text,
    opioid_drug_flag text,
    long_acting_opioid_drug_flag text,
    antibiotic_drug_flag text,
    antipsychotic_drug_flag text
);


ALTER TABLE public.drug OWNER TO postgres;

--
-- Name: fips_county; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fips_county (
    county text,
    state character(2),
    fipscounty character varying(5),
    fipsstate character(2)
);


ALTER TABLE public.fips_county OWNER TO postgres;

--
-- Name: overdoses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.overdoses (
    fipscounty character varying(5),
    deaths numeric,
    suppressed boolean
);


ALTER TABLE public.overdoses OWNER TO postgres;

--
-- Name: population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population (
    fipscounty character(5),
    population numeric
);


ALTER TABLE public.population OWNER TO postgres;

--
-- Name: prescriber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriber (
    npi numeric,
    nppes_provider_last_org_name text,
    nppes_provider_first_name text,
    nppes_provider_mi text,
    nppes_credentials text,
    nppes_provider_gender text,
    nppes_entity_code text,
    nppes_provider_street1 text,
    nppes_provider_street2 text,
    nppes_provider_city text,
    nppes_provider_zip5 text,
    nppes_provider_zip4 text,
    nppes_provider_state text,
    nppes_provider_country text,
    specialty_description text,
    description_flag text,
    medicare_prvdr_enroll_status text
);


ALTER TABLE public.prescriber OWNER TO postgres;

--
-- Name: prescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescription (
    npi numeric,
    drug_name text,
    bene_count numeric,
    total_claim_count numeric,
    total_30_day_fill_count numeric,
    total_day_supply numeric,
    total_drug_cost numeric,
    bene_count_ge65 numeric,
    bene_count_ge65_suppress_flag text,
    total_claim_count_ge65 numeric,
    ge65_suppress_flag text,
    total_30_day_fill_count_ge65 numeric,
    total_day_supply_ge65 numeric,
    total_drug_cost_ge65 numeric
);


ALTER TABLE public.prescription OWNER TO postgres;

--
-- Name: zip_fips; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zip_fips (
    zip character varying(5),
    fipscounty character varying(5),
    res_ratio numeric,
    bus_ratio numeric,
    oth_ratio numeric,
    tot_ratio numeric
);


ALTER TABLE public.zip_fips OWNER TO postgres;

--
-- Data for Name: cbsa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cbsa (fipscounty, cbsa, cbsaname) FROM stdin;
\.
COPY public.cbsa (fipscounty, cbsa, cbsaname) FROM '$$PATH$$/3026.dat';

--
-- Data for Name: drug; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drug (drug_name, generic_name, opioid_drug_flag, long_acting_opioid_drug_flag, antibiotic_drug_flag, antipsychotic_drug_flag) FROM stdin;
\.
COPY public.drug (drug_name, generic_name, opioid_drug_flag, long_acting_opioid_drug_flag, antibiotic_drug_flag, antipsychotic_drug_flag) FROM '$$PATH$$/3022.dat';

--
-- Data for Name: fips_county; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fips_county (county, state, fipscounty, fipsstate) FROM stdin;
\.
COPY public.fips_county (county, state, fipscounty, fipsstate) FROM '$$PATH$$/3021.dat';

--
-- Data for Name: overdoses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.overdoses (fipscounty, deaths, suppressed) FROM stdin;
\.
COPY public.overdoses (fipscounty, deaths, suppressed) FROM '$$PATH$$/3027.dat';

--
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.population (fipscounty, population) FROM stdin;
\.
COPY public.population (fipscounty, population) FROM '$$PATH$$/3025.dat';

--
-- Data for Name: prescriber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescriber (npi, nppes_provider_last_org_name, nppes_provider_first_name, nppes_provider_mi, nppes_credentials, nppes_provider_gender, nppes_entity_code, nppes_provider_street1, nppes_provider_street2, nppes_provider_city, nppes_provider_zip5, nppes_provider_zip4, nppes_provider_state, nppes_provider_country, specialty_description, description_flag, medicare_prvdr_enroll_status) FROM stdin;
\.
COPY public.prescriber (npi, nppes_provider_last_org_name, nppes_provider_first_name, nppes_provider_mi, nppes_credentials, nppes_provider_gender, nppes_entity_code, nppes_provider_street1, nppes_provider_street2, nppes_provider_city, nppes_provider_zip5, nppes_provider_zip4, nppes_provider_state, nppes_provider_country, specialty_description, description_flag, medicare_prvdr_enroll_status) FROM '$$PATH$$/3024.dat';

--
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescription (npi, drug_name, bene_count, total_claim_count, total_30_day_fill_count, total_day_supply, total_drug_cost, bene_count_ge65, bene_count_ge65_suppress_flag, total_claim_count_ge65, ge65_suppress_flag, total_30_day_fill_count_ge65, total_day_supply_ge65, total_drug_cost_ge65) FROM stdin;
\.
COPY public.prescription (npi, drug_name, bene_count, total_claim_count, total_30_day_fill_count, total_day_supply, total_drug_cost, bene_count_ge65, bene_count_ge65_suppress_flag, total_claim_count_ge65, ge65_suppress_flag, total_30_day_fill_count_ge65, total_day_supply_ge65, total_drug_cost_ge65) FROM '$$PATH$$/3023.dat';

--
-- Data for Name: zip_fips; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zip_fips (zip, fipscounty, res_ratio, bus_ratio, oth_ratio, tot_ratio) FROM stdin;
\.
COPY public.zip_fips (zip, fipscounty, res_ratio, bus_ratio, oth_ratio, tot_ratio) FROM '$$PATH$$/3020.dat';

--
-- PostgreSQL database dump complete
--

