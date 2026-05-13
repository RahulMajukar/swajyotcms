--
-- PostgreSQL database dump
--

\restrict tM9roi1JD9r4jsDUoaeJV19FIqbevkcAvfa0oVhdhpJ2Usa14lQQcQpqqMrf0xh

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

--
-- Name: enum__forms_v_version_confirmation_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__forms_v_version_confirmation_type AS ENUM (
    'message',
    'redirect'
);


ALTER TYPE public.enum__forms_v_version_confirmation_type OWNER TO postgres;

--
-- Name: enum__forms_v_version_redirect_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__forms_v_version_redirect_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum__forms_v_version_redirect_type OWNER TO postgres;

--
-- Name: enum__forms_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__forms_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__forms_v_version_status OWNER TO postgres;

--
-- Name: enum__industries_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__industries_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__industries_v_version_status OWNER TO postgres;

--
-- Name: enum__pages_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__pages_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__pages_v_version_status OWNER TO postgres;

--
-- Name: enum__services_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__services_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__services_v_version_status OWNER TO postgres;

--
-- Name: enum__solutions_v_version_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__solutions_v_version_category AS ENUM (
    'analytics-ai',
    'enterprise-computing',
    'digital-process-automation',
    'quality-management',
    'information-management',
    'manufacturing',
    'service-excellence'
);


ALTER TYPE public.enum__solutions_v_version_category OWNER TO postgres;

--
-- Name: enum__solutions_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__solutions_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__solutions_v_version_status OWNER TO postgres;

--
-- Name: enum__webinars_v_version_event_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__webinars_v_version_event_status AS ENUM (
    'upcoming',
    'live',
    'past',
    'coming-soon'
);


ALTER TYPE public.enum__webinars_v_version_event_status OWNER TO postgres;

--
-- Name: enum__webinars_v_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum__webinars_v_version_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum__webinars_v_version_status OWNER TO postgres;

--
-- Name: enum_contact_submissions_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_contact_submissions_status AS ENUM (
    'new',
    'in-progress',
    'resolved'
);


ALTER TYPE public.enum_contact_submissions_status OWNER TO postgres;

--
-- Name: enum_forms_confirmation_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_forms_confirmation_type AS ENUM (
    'message',
    'redirect'
);


ALTER TYPE public.enum_forms_confirmation_type OWNER TO postgres;

--
-- Name: enum_forms_redirect_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_forms_redirect_type AS ENUM (
    'reference',
    'custom'
);


ALTER TYPE public.enum_forms_redirect_type OWNER TO postgres;

--
-- Name: enum_forms_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_forms_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_forms_status OWNER TO postgres;

--
-- Name: enum_industries_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_industries_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_industries_status OWNER TO postgres;

--
-- Name: enum_pages_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_pages_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_pages_status OWNER TO postgres;

--
-- Name: enum_partners_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_partners_category AS ENUM (
    'data-analytics',
    'enterprise-computing',
    'plm',
    'automation',
    'other'
);


ALTER TYPE public.enum_partners_category OWNER TO postgres;

--
-- Name: enum_services_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_services_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_services_status OWNER TO postgres;

--
-- Name: enum_solutions_category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_solutions_category AS ENUM (
    'analytics-ai',
    'enterprise-computing',
    'digital-process-automation',
    'quality-management',
    'information-management',
    'manufacturing',
    'service-excellence'
);


ALTER TYPE public.enum_solutions_category OWNER TO postgres;

--
-- Name: enum_solutions_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_solutions_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_solutions_status OWNER TO postgres;

--
-- Name: enum_webinars_event_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_webinars_event_status AS ENUM (
    'upcoming',
    'live',
    'past',
    'coming-soon'
);


ALTER TYPE public.enum_webinars_event_status OWNER TO postgres;

--
-- Name: enum_webinars_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_webinars_status AS ENUM (
    'draft',
    'published'
);


ALTER TYPE public.enum_webinars_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _forms_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_submit_button_label character varying,
    version_confirmation_type public.enum__forms_v_version_confirmation_type DEFAULT 'message'::public.enum__forms_v_version_confirmation_type,
    version_confirmation_message jsonb,
    version_redirect_type public.enum__forms_v_version_redirect_type DEFAULT 'reference'::public.enum__forms_v_version_redirect_type,
    version_redirect_url character varying,
    version_slug character varying,
    version_description character varying,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_email_settings_send_confirmation_email boolean DEFAULT true,
    version_email_settings_send_notification_email boolean DEFAULT true,
    version_email_settings_submitter_email_field character varying DEFAULT 'email'::character varying,
    version_email_settings_confirmation_subject character varying,
    version_email_settings_confirmation_body character varying,
    version_email_settings_notify_to character varying,
    version_email_settings_notification_subject character varying,
    version_email_settings_notification_body character varying,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__forms_v_version_status DEFAULT 'draft'::public.enum__forms_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


ALTER TABLE public._forms_v OWNER TO postgres;

--
-- Name: _forms_v_blocks_checkbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_checkbox (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    required boolean,
    default_value boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_checkbox OWNER TO postgres;

--
-- Name: _forms_v_blocks_checkbox_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_checkbox_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_checkbox_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_checkbox_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_checkbox_id_seq OWNED BY public._forms_v_blocks_checkbox.id;


--
-- Name: _forms_v_blocks_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_email (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    required boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_email OWNER TO postgres;

--
-- Name: _forms_v_blocks_email_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_email_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_email_id_seq OWNED BY public._forms_v_blocks_email.id;


--
-- Name: _forms_v_blocks_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_message (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    message jsonb,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_message OWNER TO postgres;

--
-- Name: _forms_v_blocks_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_message_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_message_id_seq OWNED BY public._forms_v_blocks_message.id;


--
-- Name: _forms_v_blocks_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_number (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value numeric,
    required boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_number OWNER TO postgres;

--
-- Name: _forms_v_blocks_number_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_number_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_number_id_seq OWNED BY public._forms_v_blocks_number.id;


--
-- Name: _forms_v_blocks_select; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_select (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    placeholder character varying,
    required boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_select OWNER TO postgres;

--
-- Name: _forms_v_blocks_select_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_select_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_select_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_select_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_select_id_seq OWNED BY public._forms_v_blocks_select.id;


--
-- Name: _forms_v_blocks_select_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_select_options (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    label character varying,
    value character varying,
    _uuid character varying
);


ALTER TABLE public._forms_v_blocks_select_options OWNER TO postgres;

--
-- Name: _forms_v_blocks_select_options_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_select_options_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_select_options_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_select_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_select_options_id_seq OWNED BY public._forms_v_blocks_select_options.id;


--
-- Name: _forms_v_blocks_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_text (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_text OWNER TO postgres;

--
-- Name: _forms_v_blocks_text_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_text_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_text_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_text_id_seq OWNED BY public._forms_v_blocks_text.id;


--
-- Name: _forms_v_blocks_textarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_blocks_textarea (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id integer NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    _uuid character varying,
    block_name character varying
);


ALTER TABLE public._forms_v_blocks_textarea OWNER TO postgres;

--
-- Name: _forms_v_blocks_textarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_blocks_textarea_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_blocks_textarea_id_seq OWNER TO postgres;

--
-- Name: _forms_v_blocks_textarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_blocks_textarea_id_seq OWNED BY public._forms_v_blocks_textarea.id;


--
-- Name: _forms_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_id_seq OWNER TO postgres;

--
-- Name: _forms_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_id_seq OWNED BY public._forms_v.id;


--
-- Name: _forms_v_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer
);


ALTER TABLE public._forms_v_rels OWNER TO postgres;

--
-- Name: _forms_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_rels_id_seq OWNER TO postgres;

--
-- Name: _forms_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_rels_id_seq OWNED BY public._forms_v_rels.id;


--
-- Name: _forms_v_version_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._forms_v_version_emails (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    email_to character varying,
    cc character varying,
    bcc character varying,
    reply_to character varying,
    email_from character varying,
    subject character varying DEFAULT 'You''ve received a new message.'::character varying,
    message jsonb,
    _uuid character varying
);


ALTER TABLE public._forms_v_version_emails OWNER TO postgres;

--
-- Name: _forms_v_version_emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._forms_v_version_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._forms_v_version_emails_id_seq OWNER TO postgres;

--
-- Name: _forms_v_version_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._forms_v_version_emails_id_seq OWNED BY public._forms_v_version_emails.id;


--
-- Name: _industries_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._industries_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_short_description character varying,
    version_description jsonb,
    version_cover_image_id integer,
    version_icon_id integer,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__industries_v_version_status DEFAULT 'draft'::public.enum__industries_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


ALTER TABLE public._industries_v OWNER TO postgres;

--
-- Name: _industries_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._industries_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._industries_v_id_seq OWNER TO postgres;

--
-- Name: _industries_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._industries_v_id_seq OWNED BY public._industries_v.id;


--
-- Name: _industries_v_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._industries_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    solutions_id integer
);


ALTER TABLE public._industries_v_rels OWNER TO postgres;

--
-- Name: _industries_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._industries_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._industries_v_rels_id_seq OWNER TO postgres;

--
-- Name: _industries_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._industries_v_rels_id_seq OWNED BY public._industries_v_rels.id;


--
-- Name: _pages_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._pages_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_content jsonb,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__pages_v_version_status DEFAULT 'draft'::public.enum__pages_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


ALTER TABLE public._pages_v OWNER TO postgres;

--
-- Name: _pages_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._pages_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._pages_v_id_seq OWNER TO postgres;

--
-- Name: _pages_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._pages_v_id_seq OWNED BY public._pages_v.id;


--
-- Name: _services_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._services_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_short_description character varying,
    version_description jsonb,
    version_cover_image_id integer,
    version_icon_id integer,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__services_v_version_status DEFAULT 'draft'::public.enum__services_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


ALTER TABLE public._services_v OWNER TO postgres;

--
-- Name: _services_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._services_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._services_v_id_seq OWNER TO postgres;

--
-- Name: _services_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._services_v_id_seq OWNED BY public._services_v.id;


--
-- Name: _services_v_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._services_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    solutions_id integer
);


ALTER TABLE public._services_v_rels OWNER TO postgres;

--
-- Name: _services_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._services_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._services_v_rels_id_seq OWNER TO postgres;

--
-- Name: _services_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._services_v_rels_id_seq OWNED BY public._services_v_rels.id;


--
-- Name: _services_v_version_highlights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._services_v_version_highlights (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    point character varying,
    _uuid character varying
);


ALTER TABLE public._services_v_version_highlights OWNER TO postgres;

--
-- Name: _services_v_version_highlights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._services_v_version_highlights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._services_v_version_highlights_id_seq OWNER TO postgres;

--
-- Name: _services_v_version_highlights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._services_v_version_highlights_id_seq OWNED BY public._services_v_version_highlights.id;


--
-- Name: _solutions_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._solutions_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_category public.enum__solutions_v_version_category,
    version_short_description character varying,
    version_description jsonb,
    version_cover_image_id integer,
    version_icon_id integer,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__solutions_v_version_status DEFAULT 'draft'::public.enum__solutions_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean
);


ALTER TABLE public._solutions_v OWNER TO postgres;

--
-- Name: _solutions_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._solutions_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._solutions_v_id_seq OWNER TO postgres;

--
-- Name: _solutions_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._solutions_v_id_seq OWNED BY public._solutions_v.id;


--
-- Name: _solutions_v_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._solutions_v_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    industries_id integer
);


ALTER TABLE public._solutions_v_rels OWNER TO postgres;

--
-- Name: _solutions_v_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._solutions_v_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._solutions_v_rels_id_seq OWNER TO postgres;

--
-- Name: _solutions_v_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._solutions_v_rels_id_seq OWNED BY public._solutions_v_rels.id;


--
-- Name: _solutions_v_version_highlights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._solutions_v_version_highlights (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    point character varying,
    _uuid character varying
);


ALTER TABLE public._solutions_v_version_highlights OWNER TO postgres;

--
-- Name: _solutions_v_version_highlights_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._solutions_v_version_highlights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._solutions_v_version_highlights_id_seq OWNER TO postgres;

--
-- Name: _solutions_v_version_highlights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._solutions_v_version_highlights_id_seq OWNED BY public._solutions_v_version_highlights.id;


--
-- Name: _webinars_v; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._webinars_v (
    id integer NOT NULL,
    parent_id integer,
    version_title character varying,
    version_slug character varying,
    version_event_status public.enum__webinars_v_version_event_status DEFAULT 'upcoming'::public.enum__webinars_v_version_event_status,
    version_date timestamp(3) with time zone,
    version_short_description character varying,
    version_description jsonb,
    version_cover_image_id integer,
    version_registration_url character varying,
    version_recording_url character varying,
    version_partner_id integer,
    version_seo_meta_title character varying,
    version_seo_meta_description character varying,
    version_seo_og_image_id integer,
    version_seo_no_index boolean DEFAULT false,
    version_updated_at timestamp(3) with time zone,
    version_created_at timestamp(3) with time zone,
    version__status public.enum__webinars_v_version_status DEFAULT 'draft'::public.enum__webinars_v_version_status,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    latest boolean,
    version_registration_form_id integer
);


ALTER TABLE public._webinars_v OWNER TO postgres;

--
-- Name: _webinars_v_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._webinars_v_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._webinars_v_id_seq OWNER TO postgres;

--
-- Name: _webinars_v_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._webinars_v_id_seq OWNED BY public._webinars_v.id;


--
-- Name: _webinars_v_version_speakers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._webinars_v_version_speakers (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id integer NOT NULL,
    name character varying,
    role character varying,
    photo_id integer,
    _uuid character varying
);


ALTER TABLE public._webinars_v_version_speakers OWNER TO postgres;

--
-- Name: _webinars_v_version_speakers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public._webinars_v_version_speakers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public._webinars_v_version_speakers_id_seq OWNER TO postgres;

--
-- Name: _webinars_v_version_speakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public._webinars_v_version_speakers_id_seq OWNED BY public._webinars_v_version_speakers.id;


--
-- Name: contact_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_submissions (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    phone character varying,
    company character varying,
    subject character varying,
    message character varying NOT NULL,
    status public.enum_contact_submissions_status DEFAULT 'new'::public.enum_contact_submissions_status,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact_submissions OWNER TO postgres;

--
-- Name: contact_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contact_submissions_id_seq OWNER TO postgres;

--
-- Name: contact_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_submissions_id_seq OWNED BY public.contact_submissions.id;


--
-- Name: footer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer (
    id integer NOT NULL,
    brand_description character varying DEFAULT 'Over 10 years helping companies reach their financial and branding goals through Digital Transformation Solutions & Services.'::character varying,
    show_address boolean DEFAULT true,
    show_social boolean DEFAULT true,
    copyright character varying,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.footer OWNER TO postgres;

--
-- Name: footer_bottom_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer_bottom_links (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.footer_bottom_links OWNER TO postgres;

--
-- Name: footer_columns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer_columns (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    heading character varying NOT NULL
);


ALTER TABLE public.footer_columns OWNER TO postgres;

--
-- Name: footer_columns_links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer_columns_links (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    url character varying NOT NULL
);


ALTER TABLE public.footer_columns_links OWNER TO postgres;

--
-- Name: footer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.footer_id_seq OWNER TO postgres;

--
-- Name: footer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footer_id_seq OWNED BY public.footer.id;


--
-- Name: form_submissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_submissions (
    id integer NOT NULL,
    form_id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.form_submissions OWNER TO postgres;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.form_submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.form_submissions_id_seq OWNER TO postgres;

--
-- Name: form_submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.form_submissions_id_seq OWNED BY public.form_submissions.id;


--
-- Name: form_submissions_submission_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.form_submissions_submission_data (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    field character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.form_submissions_submission_data OWNER TO postgres;

--
-- Name: forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms (
    id integer NOT NULL,
    title character varying,
    submit_button_label character varying,
    confirmation_type public.enum_forms_confirmation_type DEFAULT 'message'::public.enum_forms_confirmation_type,
    confirmation_message jsonb,
    redirect_type public.enum_forms_redirect_type DEFAULT 'reference'::public.enum_forms_redirect_type,
    redirect_url character varying,
    slug character varying,
    description character varying,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    email_settings_send_confirmation_email boolean DEFAULT true,
    email_settings_send_notification_email boolean DEFAULT true,
    email_settings_submitter_email_field character varying DEFAULT 'email'::character varying,
    email_settings_confirmation_subject character varying,
    email_settings_confirmation_body character varying,
    email_settings_notify_to character varying,
    email_settings_notification_subject character varying,
    email_settings_notification_body character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_forms_status DEFAULT 'draft'::public.enum_forms_status
);


ALTER TABLE public.forms OWNER TO postgres;

--
-- Name: forms_blocks_checkbox; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_checkbox (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    required boolean,
    default_value boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_checkbox OWNER TO postgres;

--
-- Name: forms_blocks_email; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_email (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_email OWNER TO postgres;

--
-- Name: forms_blocks_message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_message (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    message jsonb,
    block_name character varying
);


ALTER TABLE public.forms_blocks_message OWNER TO postgres;

--
-- Name: forms_blocks_number; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_number (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value numeric,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_number OWNER TO postgres;

--
-- Name: forms_blocks_select; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_select (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    placeholder character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_select OWNER TO postgres;

--
-- Name: forms_blocks_select_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_select_options (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying,
    value character varying
);


ALTER TABLE public.forms_blocks_select_options OWNER TO postgres;

--
-- Name: forms_blocks_text; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_text (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_text OWNER TO postgres;

--
-- Name: forms_blocks_textarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_blocks_textarea (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    _path text NOT NULL,
    id character varying NOT NULL,
    name character varying,
    label character varying,
    width numeric,
    default_value character varying,
    required boolean,
    block_name character varying
);


ALTER TABLE public.forms_blocks_textarea OWNER TO postgres;

--
-- Name: forms_emails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_emails (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    email_to character varying,
    cc character varying,
    bcc character varying,
    reply_to character varying,
    email_from character varying,
    subject character varying DEFAULT 'You''ve received a new message.'::character varying,
    message jsonb
);


ALTER TABLE public.forms_emails OWNER TO postgres;

--
-- Name: forms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_id_seq OWNER TO postgres;

--
-- Name: forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_id_seq OWNED BY public.forms.id;


--
-- Name: forms_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forms_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    pages_id integer
);


ALTER TABLE public.forms_rels OWNER TO postgres;

--
-- Name: forms_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forms_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forms_rels_id_seq OWNER TO postgres;

--
-- Name: forms_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forms_rels_id_seq OWNED BY public.forms_rels.id;


--
-- Name: industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industries (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    short_description character varying,
    description jsonb,
    cover_image_id integer,
    icon_id integer,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_industries_status DEFAULT 'draft'::public.enum_industries_status
);


ALTER TABLE public.industries OWNER TO postgres;

--
-- Name: industries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.industries_id_seq OWNER TO postgres;

--
-- Name: industries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industries_id_seq OWNED BY public.industries.id;


--
-- Name: industries_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.industries_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    solutions_id integer
);


ALTER TABLE public.industries_rels OWNER TO postgres;

--
-- Name: industries_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.industries_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.industries_rels_id_seq OWNER TO postgres;

--
-- Name: industries_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.industries_rels_id_seq OWNED BY public.industries_rels.id;


--
-- Name: main_nav; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_nav (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.main_nav OWNER TO postgres;

--
-- Name: main_nav_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.main_nav_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.main_nav_id_seq OWNER TO postgres;

--
-- Name: main_nav_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.main_nav_id_seq OWNED BY public.main_nav.id;


--
-- Name: main_nav_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_nav_items (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    link character varying
);


ALTER TABLE public.main_nav_items OWNER TO postgres;

--
-- Name: main_nav_items_children; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_nav_items_children (
    _order integer NOT NULL,
    _parent_id character varying NOT NULL,
    id character varying NOT NULL,
    label character varying NOT NULL,
    link character varying NOT NULL,
    description character varying
);


ALTER TABLE public.main_nav_items_children OWNER TO postgres;

--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    alt character varying NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    url character varying,
    thumbnail_u_r_l character varying,
    filename character varying,
    mime_type character varying,
    filesize numeric,
    width numeric,
    height numeric,
    focal_x numeric,
    focal_y numeric,
    sizes_thumbnail_url character varying,
    sizes_thumbnail_width numeric,
    sizes_thumbnail_height numeric,
    sizes_thumbnail_mime_type character varying,
    sizes_thumbnail_filesize numeric,
    sizes_thumbnail_filename character varying,
    sizes_card_url character varying,
    sizes_card_width numeric,
    sizes_card_height numeric,
    sizes_card_mime_type character varying,
    sizes_card_filesize numeric,
    sizes_card_filename character varying
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    content jsonb,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_pages_status DEFAULT 'draft'::public.enum_pages_status
);


ALTER TABLE public.pages OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO postgres;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners (
    id integer NOT NULL,
    name character varying NOT NULL,
    slug character varying,
    category public.enum_partners_category NOT NULL,
    logo_id integer NOT NULL,
    description character varying,
    detail_content jsonb,
    website character varying,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.partners OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_id_seq OWNER TO postgres;

--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: partners_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    solutions_id integer
);


ALTER TABLE public.partners_rels OWNER TO postgres;

--
-- Name: partners_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.partners_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.partners_rels_id_seq OWNER TO postgres;

--
-- Name: partners_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.partners_rels_id_seq OWNED BY public.partners_rels.id;


--
-- Name: payload_kv; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_kv (
    id integer NOT NULL,
    key character varying NOT NULL,
    data jsonb NOT NULL
);


ALTER TABLE public.payload_kv OWNER TO postgres;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_kv_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_kv_id_seq OWNER TO postgres;

--
-- Name: payload_kv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_kv_id_seq OWNED BY public.payload_kv.id;


--
-- Name: payload_locked_documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_locked_documents (
    id integer NOT NULL,
    global_slug character varying,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_locked_documents OWNER TO postgres;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_locked_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_id_seq OWNER TO postgres;

--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_locked_documents_id_seq OWNED BY public.payload_locked_documents.id;


--
-- Name: payload_locked_documents_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_locked_documents_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer,
    media_id integer,
    solutions_id integer,
    services_id integer,
    industries_id integer,
    partners_id integer,
    webinars_id integer,
    team_id integer,
    contact_submissions_id integer,
    pages_id integer,
    forms_id integer,
    form_submissions_id integer
);


ALTER TABLE public.payload_locked_documents_rels OWNER TO postgres;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_locked_documents_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNER TO postgres;

--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_locked_documents_rels_id_seq OWNED BY public.payload_locked_documents_rels.id;


--
-- Name: payload_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_migrations (
    id integer NOT NULL,
    name character varying,
    batch numeric,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_migrations OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_migrations_id_seq OWNER TO postgres;

--
-- Name: payload_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_migrations_id_seq OWNED BY public.payload_migrations.id;


--
-- Name: payload_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_preferences (
    id integer NOT NULL,
    key character varying,
    value jsonb,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payload_preferences OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_preferences_id_seq OWNED BY public.payload_preferences.id;


--
-- Name: payload_preferences_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payload_preferences_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    users_id integer
);


ALTER TABLE public.payload_preferences_rels OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payload_preferences_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNER TO postgres;

--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payload_preferences_rels_id_seq OWNED BY public.payload_preferences_rels.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    short_description character varying,
    description jsonb,
    cover_image_id integer,
    icon_id integer,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_services_status DEFAULT 'draft'::public.enum_services_status
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_highlights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_highlights (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    point character varying
);


ALTER TABLE public.services_highlights OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: services_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    solutions_id integer
);


ALTER TABLE public.services_rels OWNER TO postgres;

--
-- Name: services_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_rels_id_seq OWNER TO postgres;

--
-- Name: services_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_rels_id_seq OWNED BY public.services_rels.id;


--
-- Name: site_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings (
    id integer NOT NULL,
    company_name character varying DEFAULT 'Swajyot Technologies Pvt. Ltd.'::character varying NOT NULL,
    tagline character varying DEFAULT 'Always Creating Value'::character varying,
    email character varying DEFAULT 'info@swajyot.co.in'::character varying,
    phone character varying DEFAULT '+91-80-4010 9777 / 88'::character varying,
    address_line1 character varying DEFAULT '#5, 7th ''C'' Cross, Ashwini Layout'::character varying,
    address_line2 character varying DEFAULT 'Koramangala Intermediate Road'::character varying,
    address_city character varying DEFAULT 'Bengaluru'::character varying,
    address_state character varying DEFAULT 'Karnataka'::character varying,
    address_pincode character varying DEFAULT '560047'::character varying,
    address_country character varying DEFAULT 'India'::character varying,
    social_linkedin character varying,
    social_twitter character varying,
    social_facebook character varying,
    social_instagram character varying,
    social_youtube character varying,
    social_pinterest character varying,
    logo_id integer,
    favicon_id integer,
    default_s_e_o_meta_title character varying DEFAULT 'Swajyot Technologies – Digital Transformation Solutions'::character varying,
    default_s_e_o_meta_description character varying DEFAULT 'Swajyot Technologies delivers enterprise-grade Analytics & AI, Digital Process Automation, and Computing Management solutions across Manufacturing, Pharma, Healthcare, and Energy sectors.'::character varying,
    default_s_e_o_og_image_id integer,
    updated_at timestamp(3) with time zone,
    created_at timestamp(3) with time zone
);


ALTER TABLE public.site_settings OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.site_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.site_settings_id_seq OWNER TO postgres;

--
-- Name: site_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.site_settings_id_seq OWNED BY public.site_settings.id;


--
-- Name: site_settings_office_hours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.site_settings_office_hours (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    days character varying NOT NULL,
    hours character varying NOT NULL
);


ALTER TABLE public.site_settings_office_hours OWNER TO postgres;

--
-- Name: solutions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solutions (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    category public.enum_solutions_category,
    short_description character varying,
    description jsonb,
    cover_image_id integer,
    icon_id integer,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_solutions_status DEFAULT 'draft'::public.enum_solutions_status
);


ALTER TABLE public.solutions OWNER TO postgres;

--
-- Name: solutions_highlights; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solutions_highlights (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    point character varying
);


ALTER TABLE public.solutions_highlights OWNER TO postgres;

--
-- Name: solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solutions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solutions_id_seq OWNER TO postgres;

--
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solutions_id_seq OWNED BY public.solutions.id;


--
-- Name: solutions_rels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solutions_rels (
    id integer NOT NULL,
    "order" integer,
    parent_id integer NOT NULL,
    path character varying NOT NULL,
    industries_id integer
);


ALTER TABLE public.solutions_rels OWNER TO postgres;

--
-- Name: solutions_rels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solutions_rels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.solutions_rels_id_seq OWNER TO postgres;

--
-- Name: solutions_rels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solutions_rels_id_seq OWNED BY public.solutions_rels.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id integer NOT NULL,
    name character varying NOT NULL,
    role character varying NOT NULL,
    bio character varying,
    photo_id integer,
    linked_in character varying,
    "order" numeric DEFAULT 0,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.team_id_seq OWNER TO postgres;

--
-- Name: team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.team_id_seq OWNED BY public.team.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    reset_password_token character varying,
    reset_password_expiration timestamp(3) with time zone,
    salt character varying,
    hash character varying,
    login_attempts numeric DEFAULT 0,
    lock_until timestamp(3) with time zone,
    name character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_sessions (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    created_at timestamp(3) with time zone,
    expires_at timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.users_sessions OWNER TO postgres;

--
-- Name: webinars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webinars (
    id integer NOT NULL,
    title character varying,
    slug character varying,
    event_status public.enum_webinars_event_status DEFAULT 'upcoming'::public.enum_webinars_event_status,
    date timestamp(3) with time zone,
    short_description character varying,
    description jsonb,
    cover_image_id integer,
    registration_url character varying,
    recording_url character varying,
    partner_id integer,
    seo_meta_title character varying,
    seo_meta_description character varying,
    seo_og_image_id integer,
    seo_no_index boolean DEFAULT false,
    updated_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    created_at timestamp(3) with time zone DEFAULT now() NOT NULL,
    _status public.enum_webinars_status DEFAULT 'draft'::public.enum_webinars_status,
    registration_form_id integer
);


ALTER TABLE public.webinars OWNER TO postgres;

--
-- Name: webinars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.webinars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.webinars_id_seq OWNER TO postgres;

--
-- Name: webinars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.webinars_id_seq OWNED BY public.webinars.id;


--
-- Name: webinars_speakers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webinars_speakers (
    _order integer NOT NULL,
    _parent_id integer NOT NULL,
    id character varying NOT NULL,
    name character varying,
    role character varying,
    photo_id integer
);


ALTER TABLE public.webinars_speakers OWNER TO postgres;

--
-- Name: _forms_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v ALTER COLUMN id SET DEFAULT nextval('public._forms_v_id_seq'::regclass);


--
-- Name: _forms_v_blocks_checkbox id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_checkbox ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_checkbox_id_seq'::regclass);


--
-- Name: _forms_v_blocks_email id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_email ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_email_id_seq'::regclass);


--
-- Name: _forms_v_blocks_message id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_message ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_message_id_seq'::regclass);


--
-- Name: _forms_v_blocks_number id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_number ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_number_id_seq'::regclass);


--
-- Name: _forms_v_blocks_select id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_select_id_seq'::regclass);


--
-- Name: _forms_v_blocks_select_options id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select_options ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_select_options_id_seq'::regclass);


--
-- Name: _forms_v_blocks_text id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_text ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_text_id_seq'::regclass);


--
-- Name: _forms_v_blocks_textarea id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_textarea ALTER COLUMN id SET DEFAULT nextval('public._forms_v_blocks_textarea_id_seq'::regclass);


--
-- Name: _forms_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_rels ALTER COLUMN id SET DEFAULT nextval('public._forms_v_rels_id_seq'::regclass);


--
-- Name: _forms_v_version_emails id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_version_emails ALTER COLUMN id SET DEFAULT nextval('public._forms_v_version_emails_id_seq'::regclass);


--
-- Name: _industries_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v ALTER COLUMN id SET DEFAULT nextval('public._industries_v_id_seq'::regclass);


--
-- Name: _industries_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v_rels ALTER COLUMN id SET DEFAULT nextval('public._industries_v_rels_id_seq'::regclass);


--
-- Name: _pages_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v ALTER COLUMN id SET DEFAULT nextval('public._pages_v_id_seq'::regclass);


--
-- Name: _services_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v ALTER COLUMN id SET DEFAULT nextval('public._services_v_id_seq'::regclass);


--
-- Name: _services_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_rels ALTER COLUMN id SET DEFAULT nextval('public._services_v_rels_id_seq'::regclass);


--
-- Name: _services_v_version_highlights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_version_highlights ALTER COLUMN id SET DEFAULT nextval('public._services_v_version_highlights_id_seq'::regclass);


--
-- Name: _solutions_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v ALTER COLUMN id SET DEFAULT nextval('public._solutions_v_id_seq'::regclass);


--
-- Name: _solutions_v_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_rels ALTER COLUMN id SET DEFAULT nextval('public._solutions_v_rels_id_seq'::regclass);


--
-- Name: _solutions_v_version_highlights id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_version_highlights ALTER COLUMN id SET DEFAULT nextval('public._solutions_v_version_highlights_id_seq'::regclass);


--
-- Name: _webinars_v id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v ALTER COLUMN id SET DEFAULT nextval('public._webinars_v_id_seq'::regclass);


--
-- Name: _webinars_v_version_speakers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v_version_speakers ALTER COLUMN id SET DEFAULT nextval('public._webinars_v_version_speakers_id_seq'::regclass);


--
-- Name: contact_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_submissions ALTER COLUMN id SET DEFAULT nextval('public.contact_submissions_id_seq'::regclass);


--
-- Name: footer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer ALTER COLUMN id SET DEFAULT nextval('public.footer_id_seq'::regclass);


--
-- Name: form_submissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_submissions ALTER COLUMN id SET DEFAULT nextval('public.form_submissions_id_seq'::regclass);


--
-- Name: forms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms ALTER COLUMN id SET DEFAULT nextval('public.forms_id_seq'::regclass);


--
-- Name: forms_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_rels ALTER COLUMN id SET DEFAULT nextval('public.forms_rels_id_seq'::regclass);


--
-- Name: industries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries ALTER COLUMN id SET DEFAULT nextval('public.industries_id_seq'::regclass);


--
-- Name: industries_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries_rels ALTER COLUMN id SET DEFAULT nextval('public.industries_rels_id_seq'::regclass);


--
-- Name: main_nav id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav ALTER COLUMN id SET DEFAULT nextval('public.main_nav_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: partners_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_rels ALTER COLUMN id SET DEFAULT nextval('public.partners_rels_id_seq'::regclass);


--
-- Name: payload_kv id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_kv ALTER COLUMN id SET DEFAULT nextval('public.payload_kv_id_seq'::regclass);


--
-- Name: payload_locked_documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_id_seq'::regclass);


--
-- Name: payload_locked_documents_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_locked_documents_rels_id_seq'::regclass);


--
-- Name: payload_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_migrations ALTER COLUMN id SET DEFAULT nextval('public.payload_migrations_id_seq'::regclass);


--
-- Name: payload_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_id_seq'::regclass);


--
-- Name: payload_preferences_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels ALTER COLUMN id SET DEFAULT nextval('public.payload_preferences_rels_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: services_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_rels ALTER COLUMN id SET DEFAULT nextval('public.services_rels_id_seq'::regclass);


--
-- Name: site_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings ALTER COLUMN id SET DEFAULT nextval('public.site_settings_id_seq'::regclass);


--
-- Name: solutions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions ALTER COLUMN id SET DEFAULT nextval('public.solutions_id_seq'::regclass);


--
-- Name: solutions_rels id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_rels ALTER COLUMN id SET DEFAULT nextval('public.solutions_rels_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.team_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: webinars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars ALTER COLUMN id SET DEFAULT nextval('public.webinars_id_seq'::regclass);


--
-- Data for Name: _forms_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v (id, parent_id, version_title, version_submit_button_label, version_confirmation_type, version_confirmation_message, version_redirect_type, version_redirect_url, version_slug, version_description, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_email_settings_send_confirmation_email, version_email_settings_send_notification_email, version_email_settings_submitter_email_field, version_email_settings_confirmation_subject, version_email_settings_confirmation_body, version_email_settings_notify_to, version_email_settings_notification_subject, version_email_settings_notification_body, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
2	1	Qsutra Analytical Tool Webinar Link	\N	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thank you for regirstering", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	qsutra-analytical-tool-webinar	\N	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-27 10:30:03.919+05:30	2026-04-27 07:43:13.812+05:30	published	2026-04-27 10:30:04.401+05:30	2026-04-27 10:30:04.401+05:30	t
1	1	Qsutra Analytical Tool Webinar Link	\N	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thank you for regirstering", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	qsutra-analytical-tool-webinar	\N	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-27 07:43:13.814+05:30	2026-04-27 07:43:13.812+05:30	published	2026-04-27 07:43:14.174+05:30	2026-04-27 07:43:14.174+05:30	f
6	2	GageFx Intro	Apply	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thankuuu", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-intro	\N	\N	\N	\N	f	t	t	email	\N	Thanku....	\N	\N	\N	2026-04-27 16:33:47.713+05:30	2026-04-27 16:28:25.146+05:30	published	2026-04-27 16:33:47.932+05:30	2026-04-27 16:33:47.932+05:30	t
3	2	GageFx Intro	Apply	message	\N	reference	\N	gagefx-intro	\N	\N	\N	\N	f	t	t	email	\N	Thanku....	\N	\N	\N	2026-04-27 16:28:25.153+05:30	2026-04-27 16:28:25.146+05:30	draft	2026-04-27 16:28:25.642+05:30	2026-04-27 16:28:25.642+05:30	f
5	2	GageFx Intro	Apply	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thankuuu", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-intro	\N	\N	\N	\N	f	t	t	email	\N	Thanku....	\N	\N	\N	2026-04-27 16:29:04.203+05:30	2026-04-27 16:28:25.146+05:30	published	2026-04-27 16:29:04.428+05:30	2026-04-27 16:29:04.428+05:30	f
4	2	GageFx Intro	Apply	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thankuuu", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-intro	\N	\N	\N	\N	f	t	t	email	\N	Thanku....	\N	\N	\N	2026-04-27 16:29:02.116+05:30	2026-04-27 16:28:25.146+05:30	draft	2026-04-27 16:29:02.116+05:30	2026-04-27 16:29:02.116+05:30	f
7	3	\N	\N	message	\N	reference	\N	\N	\N	\N	\N	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-27 16:36:04.266+05:30	2026-04-27 16:36:04.265+05:30	draft	2026-04-27 16:36:04.483+05:30	2026-04-27 16:36:04.483+05:30	t
8	4	GageFx Inro Webinar	\N	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Submit ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-inro-webinar	\N	\N	\N	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-30 16:37:35.595+05:30	2026-04-30 16:37:35.591+05:30	published	2026-04-30 16:37:35.987+05:30	2026-04-30 16:37:35.987+05:30	t
\.


--
-- Data for Name: _forms_v_blocks_checkbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_checkbox (_order, _parent_id, _path, id, name, label, width, required, default_value, _uuid, block_name) FROM stdin;
1	7	version.fields	1	\N	\N	\N	\N	\N	69ef42d10306e6243d8e3b7a	\N
\.


--
-- Data for Name: _forms_v_blocks_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_email (_order, _parent_id, _path, id, name, label, width, required, _uuid, block_name) FROM stdin;
2	1	version.fields	1	email	Enter Email	\N	t	69eec5d203be0f4f01d4ed3e	\N
2	2	version.fields	2	email	Enter Email	\N	t	69eec5d203be0f4f01d4ed3e	\N
2	7	version.fields	3	\N	\N	\N	\N	69ef42dc0306e6243d8e3b7c	\N
\.


--
-- Data for Name: _forms_v_blocks_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_message (_order, _parent_id, _path, id, message, _uuid, block_name) FROM stdin;
5	2	version.fields	1	\N	69eeed46d2e9e0ddd3d2e3d4	\N
\.


--
-- Data for Name: _forms_v_blocks_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_number (_order, _parent_id, _path, id, name, label, width, default_value, required, _uuid, block_name) FROM stdin;
3	1	version.fields	1	phone	Enter Phone	\N	\N	\N	69eec5df03be0f4f01d4ed40	\N
3	2	version.fields	2	phone	Enter Phone	\N	\N	\N	69eec5df03be0f4f01d4ed40	\N
\.


--
-- Data for Name: _forms_v_blocks_select; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_select (_order, _parent_id, _path, id, name, label, width, default_value, placeholder, required, _uuid, block_name) FROM stdin;
4	1	version.fields	1	gender	Select gender	\N	\N	\N	\N	69eec5f403be0f4f01d4ed42	\N
4	2	version.fields	2	gender	Select gender	\N	\N	\N	\N	69eec5f403be0f4f01d4ed42	\N
1	6	version.fields	3	nandini	n	\N	\N	\N	\N	69ef426b0306e6243d8e3b76	\N
3	7	version.fields	4	\N	\N	\N	\N	\N	\N	69ef42e90306e6243d8e3b7e	\N
\.


--
-- Data for Name: _forms_v_blocks_select_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_select_options (_order, _parent_id, id, label, value, _uuid) FROM stdin;
1	1	1	Male	m	69eec60b03be0f4f01d4ed44
2	1	2	Female	f	69eec61103be0f4f01d4ed46
1	2	3	Male	male	69eec60b03be0f4f01d4ed44
2	2	4	Female	female	69eec61103be0f4f01d4ed46
1	3	5	sjsg	yes	69ef42750306e6243d8e3b78
\.


--
-- Data for Name: _forms_v_blocks_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_text (_order, _parent_id, _path, id, name, label, width, default_value, required, _uuid, block_name) FROM stdin;
1	1	version.fields	1	name	Enter Name	\N	\N	\N	69eec5c903be0f4f01d4ed3c	\N
1	2	version.fields	2	name	Enter Name	\N	\N	\N	69eec5c903be0f4f01d4ed3c	\N
1	8	version.fields	3	name	Enter Name	\N	\N	t	69f3374415ac974356066156	Enter Name
\.


--
-- Data for Name: _forms_v_blocks_textarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_blocks_textarea (_order, _parent_id, _path, id, name, label, width, default_value, required, _uuid, block_name) FROM stdin;
\.


--
-- Data for Name: _forms_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_rels (id, "order", parent_id, path, pages_id) FROM stdin;
\.


--
-- Data for Name: _forms_v_version_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._forms_v_version_emails (_order, _parent_id, id, email_to, cc, bcc, reply_to, email_from, subject, message, _uuid) FROM stdin;
1	3	1	\N	info@swajyot.co.in	\N	info@swajyot.co.in	info@swajyot.co.in	You've received a new message.	\N	69ef40d1592ed73d09895c7f
1	4	2	\N	info@swajyot.co.in	\N	info@swajyot.co.in	info@swajyot.co.in	You've received a new message.	\N	69ef40d1592ed73d09895c7f
1	5	3	\N	info@swajyot.co.in	\N	info@swajyot.co.in	info@swajyot.co.in	You've received a new message.	\N	69ef40d1592ed73d09895c7f
1	6	4	\N	info@swajyot.co.in	\N	info@swajyot.co.in	info@swajyot.co.in	You've received a new message.	\N	69ef40d1592ed73d09895c7f
\.


--
-- Data for Name: _industries_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._industries_v (id, parent_id, version_title, version_slug, version_short_description, version_description, version_cover_image_id, version_icon_id, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
2	2	Information Technology & Software Services	information-technology-software-services	Custom software development, cloud solutions, and digital transformation services tailored for modern businesses.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full Description", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We empower businesses with innovative Information Technology and Software Services designed to improve efficiency, scalability, and growth. Our expertise covers custom software development, web and mobile applications, enterprise solutions, cloud integration, DevOps, and IT consulting.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From startups to large enterprises, we help organizations streamline operations, enhance customer experiences, and accelerate digital transformation using modern technologies and best practices.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team specializes in delivering secure, scalable, and high-performance solutions that align with business goals while ensuring long-term sustainability and innovation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether it’s building robust backend systems, modern frontend applications, or complete end-to-end digital platforms, we provide technology solutions that drive real business value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Information Technology & Software Services | Swajyot	Expert software development, cloud solutions, and IT consulting services for startups and enterprises to accelerate digital transformation.\n\nSuggested Solutions\nCustom Software Development\nWeb Application Development\nMobile App Development\nCloud Solutions\nDevOps & Automation\nEnterprise Application Development\nAPI Development & Integration\nIT Consulting Services	\N	f	2026-04-27 08:23:56.151+05:30	2026-04-27 08:23:56.151+05:30	published	2026-04-27 08:23:56.238+05:30	2026-04-27 08:23:56.238+05:30	t
3	3	Banking, Financial Services & Insurance (BFSI)	banking-financial-services-insurance-bfsi	Secure digital solutions for banking, financial services, and insurance businesses to improve operations, customer experience, and compliance.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Swajyot delivers advanced technology solutions for Banking, Financial Services, and Insurance (BFSI) organizations, helping them modernize operations, strengthen security, and enhance customer trust in a rapidly evolving financial ecosystem.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our expertise includes core banking solutions, digital payment platforms, fintech applications, loan management systems, insurance claim processing platforms, customer onboarding systems, fraud detection solutions, and compliance-driven enterprise applications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We support banks, NBFCs, insurance providers, fintech startups, and financial institutions with scalable and secure systems that improve transaction efficiency, customer engagement, and regulatory compliance. Our solutions are designed with high-level security, data protection, and seamless integration capabilities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From digital banking platforms to insurance automation and financial analytics systems, we help businesses accelerate innovation while ensuring reliability, performance, and risk management.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With strong domain knowledge and modern technology expertise, Swajyot empowers BFSI organizations to stay competitive and deliver smarter financial services.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	BFSI Software Solutions | Banking & Financial Services | Swajyot	Secure software solutions for banking, fintech, insurance, and financial services including digital payments, loan systems, and compliance platforms.	\N	f	2026-04-27 08:25:13.855+05:30	2026-04-27 08:25:13.855+05:30	published	2026-04-27 08:25:14.011+05:30	2026-04-27 08:25:14.011+05:30	t
6	1	Healthcare	healthcare	Deliver affordable, accessible, and robust healthcare services through analytics, automation, and electronic health record management.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare organisations face mounting pressure to deliver affordable, accessible, and high-quality patient care while managing complex operational and compliance requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records management — freeing clinical staff to focus on patient outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-27 14:46:12.775+05:30	2026-04-22 08:43:13.04+05:30	published	2026-04-27 14:46:12.785+05:30	2026-04-27 14:46:12.785+05:30	f
5	5	Pharmaceuticals & Life Sciences	pharmaceuticals-life-sciences	Critical drug study & development, clinical trials, and regulatory compliance reporting powered by advanced analytics and automation.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences organisations require the highest standards of data integrity, regulatory compliance, and analytical rigour.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's solutions support critical drug study & development, clinical trials, regulatory compliance reporting, data analytics, and clinical data management — with emphasis on cost efficiency and operational excellence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:12.727+05:30	2026-04-27 14:46:12.726+05:30	published	2026-04-27 14:46:12.733+05:30	2026-04-27 14:46:12.733+05:30	f
9	5	Pharmaceuticals & Life Sciences	pharmaceuticals-life-sciences	Critical drug study & development, clinical trials, and regulatory compliance reporting powered by advanced analytics and automation.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences organisations require the highest standards of data integrity, regulatory compliance, and analytical rigour.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's solutions support critical drug study & development, clinical trials, regulatory compliance reporting, data analytics, and clinical data management — with emphasis on cost efficiency and operational excellence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:13.325+05:30	2026-04-27 14:46:12.726+05:30	published	2026-04-27 15:29:13.33+05:30	2026-04-27 15:29:13.33+05:30	f
8	4	General Manufacturing	general-manufacturing	Data-driven quality control, process automation, and operational excellence solutions tailored for manufacturers of all sizes.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot provides manufacturers with integrated analytics, quality management, and automation solutions to continuously monitor quality, costs, defects, and customer satisfaction.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:13.285+05:30	2026-04-27 14:46:12.51+05:30	published	2026-04-27 15:29:13.296+05:30	2026-04-27 15:29:13.296+05:30	f
1	1	Healthcare	healthcare	Empowering healthcare organizations with secure, scalable, and data-driven digital solutions to improve patient care and operational efficiency.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "The healthcare industry is rapidly evolving with the adoption of digital technologies. We help healthcare providers, hospitals, and health-tech companies modernize their systems, improve patient outcomes, and ensure data security through innovative software solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Expertise", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build scalable and secure healthcare applications that comply with industry standards and regulations. Our solutions focus on improving patient engagement, streamlining workflows, and enabling real-time data access.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key Solutions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Electronic Health Records (EHR) and Electronic Medical Records (EMR) systems  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Healthcare data analytics and reporting  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Telemedicine and remote consultation platforms  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Hospital management systems  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "AI-powered diagnostics and predictive analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improved patient experience and engagement  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhanced data security and compliance  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Faster decision-making with real-time insights  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Streamlined hospital operations  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Reduced operational costs  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Choose Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We combine technical expertise with industry knowledge to deliver reliable and efficient healthcare solutions. Our approach ensures scalability, security, and seamless integration with existing systems.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Use Cases", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Patient management systems  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Appointment scheduling platforms  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Medical data analysis  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Remote patient monitoring systems  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Started", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Partner with us to transform your healthcare services with modern digital solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-22 08:43:13.04+05:30	2026-04-22 08:43:13.04+05:30	published	2026-04-22 08:43:13.21+05:30	2026-04-22 08:43:13.21+05:30	f
12	4	General Manufacturing	general-manufacturing	Data-driven quality control, process automation, and operational excellence solutions tailored for manufacturers of all sizes.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot provides manufacturers with integrated analytics, quality management, and automation solutions to continuously monitor quality, costs, defects, and customer satisfaction.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.601+05:30	2026-04-27 14:46:12.51+05:30	published	2026-04-27 15:41:34.605+05:30	2026-04-27 15:41:34.605+05:30	f
4	4	General Manufacturing	general-manufacturing	Data-driven quality control, process automation, and operational excellence solutions tailored for manufacturers of all sizes.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot provides manufacturers with integrated analytics, quality management, and automation solutions to continuously monitor quality, costs, defects, and customer satisfaction.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:12.511+05:30	2026-04-27 14:46:12.51+05:30	published	2026-04-27 14:46:12.521+05:30	2026-04-27 14:46:12.521+05:30	f
13	5	Pharmaceuticals & Life Sciences	pharmaceuticals-life-sciences	Critical drug study & development, clinical trials, and regulatory compliance reporting powered by advanced analytics and automation.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences organisations require the highest standards of data integrity, regulatory compliance, and analytical rigour.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's solutions support critical drug study & development, clinical trials, regulatory compliance reporting, data analytics, and clinical data management — with emphasis on cost efficiency and operational excellence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.637+05:30	2026-04-27 14:46:12.726+05:30	published	2026-04-27 15:41:34.641+05:30	2026-04-27 15:41:34.641+05:30	f
14	1	Healthcare	healthcare	Deliver affordable, accessible, and robust healthcare services through analytics, automation, and electronic health record management.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare organisations face mounting pressure to deliver affordable, accessible, and high-quality patient care while managing complex operational and compliance requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records management — freeing clinical staff to focus on patient outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-27 15:41:34.661+05:30	2026-04-22 08:43:13.04+05:30	published	2026-04-27 15:41:34.665+05:30	2026-04-27 15:41:34.665+05:30	f
16	4	General Manufacturing	general-manufacturing	Data-driven quality control, process automation, and operational excellence solutions tailored for manufacturers of all sizes.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot provides manufacturers with integrated analytics, quality management, and automation solutions to continuously monitor quality, costs, defects, and customer satisfaction.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.407+05:30	2026-04-27 14:46:12.51+05:30	published	2026-04-27 15:43:15.415+05:30	2026-04-27 15:43:15.415+05:30	t
17	5	Pharmaceuticals & Life Sciences	pharmaceuticals-life-sciences	Critical drug study & development, clinical trials, and regulatory compliance reporting powered by advanced analytics and automation.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences organisations require the highest standards of data integrity, regulatory compliance, and analytical rigour.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's solutions support critical drug study & development, clinical trials, regulatory compliance reporting, data analytics, and clinical data management — with emphasis on cost efficiency and operational excellence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.449+05:30	2026-04-27 14:46:12.726+05:30	published	2026-04-27 15:43:15.453+05:30	2026-04-27 15:43:15.453+05:30	t
18	1	Healthcare	healthcare	Deliver affordable, accessible, and robust healthcare services through analytics, automation, and electronic health record management.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare organisations face mounting pressure to deliver affordable, accessible, and high-quality patient care while managing complex operational and compliance requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records management — freeing clinical staff to focus on patient outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-27 15:43:15.473+05:30	2026-04-22 08:43:13.04+05:30	published	2026-04-27 15:43:15.478+05:30	2026-04-27 15:43:15.478+05:30	t
10	1	Healthcare	healthcare	Deliver affordable, accessible, and robust healthcare services through analytics, automation, and electronic health record management.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare organisations face mounting pressure to deliver affordable, accessible, and high-quality patient care while managing complex operational and compliance requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records management — freeing clinical staff to focus on patient outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-27 15:29:13.343+05:30	2026-04-22 08:43:13.04+05:30	published	2026-04-27 15:29:13.346+05:30	2026-04-27 15:29:13.346+05:30	f
19	6	Energy & Resources	energy-resources	Operational excellence, predictive maintenance, and data-driven decision-making for energy and resource sector organisations.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Energy & Resources organisations must operate with maximum efficiency, reliability, and safety while navigating volatile markets and increasing regulatory demands.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's analytics, process automation, and decision management solutions help energy organisations reduce downtime, optimise asset performance, and make faster, better-informed decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.497+05:30	2026-04-27 14:46:12.833+05:30	published	2026-04-27 15:43:15.507+05:30	2026-04-27 15:43:15.507+05:30	t
15	6	Energy & Resources	energy-resources	Operational excellence, predictive maintenance, and data-driven decision-making for energy and resource sector organisations.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Energy & Resources organisations must operate with maximum efficiency, reliability, and safety while navigating volatile markets and increasing regulatory demands.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's analytics, process automation, and decision management solutions help energy organisations reduce downtime, optimise asset performance, and make faster, better-informed decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.683+05:30	2026-04-27 14:46:12.833+05:30	published	2026-04-27 15:41:34.687+05:30	2026-04-27 15:41:34.687+05:30	f
11	6	Energy & Resources	energy-resources	Operational excellence, predictive maintenance, and data-driven decision-making for energy and resource sector organisations.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Energy & Resources organisations must operate with maximum efficiency, reliability, and safety while navigating volatile markets and increasing regulatory demands.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's analytics, process automation, and decision management solutions help energy organisations reduce downtime, optimise asset performance, and make faster, better-informed decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:13.36+05:30	2026-04-27 14:46:12.833+05:30	published	2026-04-27 15:29:13.363+05:30	2026-04-27 15:29:13.363+05:30	f
7	6	Energy & Resources	energy-resources	Operational excellence, predictive maintenance, and data-driven decision-making for energy and resource sector organisations.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Energy & Resources organisations must operate with maximum efficiency, reliability, and safety while navigating volatile markets and increasing regulatory demands.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's analytics, process automation, and decision management solutions help energy organisations reduce downtime, optimise asset performance, and make faster, better-informed decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:12.833+05:30	2026-04-27 14:46:12.833+05:30	published	2026-04-27 14:46:12.86+05:30	2026-04-27 14:46:12.86+05:30	f
\.


--
-- Data for Name: _industries_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._industries_v_rels (id, "order", parent_id, path, solutions_id) FROM stdin;
1	1	3	version.solutions	2
\.


--
-- Data for Name: _pages_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._pages_v (id, parent_id, version_title, version_slug, version_content, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
2	1	Privacy Policy	privacy-policy	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This Privacy Policy unveils the security practices of Swajyot, This Policy administers how we use and ensure individual data that we gather when you visit our site, utilize our administrations, or generally draw in with us. Any practices or indicates that are explicit Swajyot are additionally clearly set apart out in this Policy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We are attentive about the individual data we request that you give and the individual data that we gather about you through the task of our administrations. We store individual data for just as long as we have the motivation to keep it. We go for full straightforwardness on how we collect, use, and offer your very own information.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data We Collect", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We possibly gather data about you on the off chance that we have the motivation to do as such for instance, to give our Services, to speak with you, or to improve our Services. We gather data in three different ways: if and when you give data to us, consequently through working our Services, and from outside sources, How about we go over the data that we gather.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data You Provide to Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It’s most likely nothing unexpected that we gather data that you give to us. The sum and kind of data rely upon the unique circumstance and how we utilize the data. We perhaps accumulate information about you if we have the inspiration to do all things considered, for example, to give our Services, to talk with you, or to improve our Services. We accumulate information in three distinct ways: if and when you offer information to us, thus through working our Services, and from outside sources, How about we go over the information that we assemble.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For Cookies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We use “cookies” on this site. A treat is a bit of information put away on a site guest’s hard drive to enable us to improve your entrance to our site and distinguish rehash guests to our site. For example, when we utilize a treat to distinguish you, you would not need to sign in a secret phrase more than once, subsequently sparing time while on our site. Cookies can likewise empower us to track and focus on the interests of our clients to upgrade the experience on our site. Utilization of a treat is not the slightest bit connected to any by and by recognizable data on our site.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	Privacy Policy for Swajyot pvt ltd	This Privacy Policy unveils the security practices of Swajyot, This Policy administers how we use and ensure individual data that we gather when you visit our site, utilize our administrations, or generally draw in with us. Any practices or indicates that are explicit Swajyot are additionally clearly set apart out in this Policy.	\N	f	2026-04-22 08:24:05.701+05:30	2026-04-22 08:21:55.761+05:30	published	2026-04-22 08:24:05.758+05:30	2026-04-22 08:24:05.758+05:30	t
1	1	Privacy Policy	privacy-policy	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "# Privacy Policy", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Welcome to Swajyot Technology. Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you visit our website.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 1. Information We Collect", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We may collect the following types of information:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "### a) Personal Information", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Name", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Email address", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Phone number", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Company name (if applicable)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This information is collected when you:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Fill out contact forms", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Apply for jobs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Subscribe to newsletters", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "### b) Non-Personal Information", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Browser type", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* IP address", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Device information", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Pages visited on our website", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This helps us improve our website experience.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 2. How We Use Your Information", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We use your information to:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Respond to your inquiries", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Provide services and support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Improve our website and user experience", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Send updates or promotional emails (only if you opt-in)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 3. Sharing of Information", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We do **not sell, trade, or rent** your personal information.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We may share information only:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* With trusted service providers who help operate our website", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* When required by law or legal processes", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 4. Data Security", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We implement appropriate security measures to protect your data from unauthorized access, alteration, or disclosure.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "However, no method of transmission over the internet is 100% secure.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 5. Cookies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our website may use cookies to:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Enhance user experience", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Analyze website traffic", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You can choose to disable cookies through your browser settings.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 6. Third-Party Links", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our website may contain links to third-party websites.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We are not responsible for their privacy practices.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 7. Your Rights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "You have the right to:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Access your personal data", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Request correction or deletion", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "* Withdraw consent for data usage", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To exercise these rights, contact us at:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "📧 **[Insert Email Address]**", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 8. Changes to This Policy", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We may update this Privacy Policy from time to time.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Changes will be posted on this page with an updated effective date.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## 9. Contact Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If you have any questions regarding this Privacy Policy, you can contact us:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "**Swajyot Technology**", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "📧 Email: [Insert Email]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "📞 Phone: [Insert Phone Number]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "🌐 Website: [Insert Website URL]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "*By using our website, you agree to this Privacy Policy.*", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	\N	f	2026-04-22 08:21:55.762+05:30	2026-04-22 08:21:55.761+05:30	published	2026-04-22 08:21:55.835+05:30	2026-04-22 08:21:55.835+05:30	f
\.


--
-- Data for Name: _services_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._services_v (id, parent_id, version_title, version_slug, version_short_description, version_description, version_cover_image_id, version_icon_id, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
4	2	Software Developement	software-developement	Build web Applications	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Development Services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s fast-changing and highly competitive business environment, software must be flexible, scalable, and future-ready—just like your business. As technology evolves rapidly and customer expectations continue to rise, businesses need software solutions that are not only powerful but also adaptable to market demands. Developing such software requires deep technical expertise, strategic planning, and the ability to stay ahead of constantly changing industry standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our expert team specializes in developing world-class web applications, desktop software, enterprise systems, and mobile applications using the latest technologies and robust open-source frameworks. We focus on building scalable, secure, and user-friendly applications that improve efficiency, enhance customer experience, and drive business success.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our software development approach covers the complete Software Development Life Cycle (SDLC), ensuring a smooth and structured development process from start to finish. This includes:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirement Analysis & Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We begin by understanding your business objectives, technical requirements, and user expectations. Our team performs detailed planning to define the project scope, timelines, technology stack, and execution strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "UI/UX Design", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We design intuitive, engaging, and user-friendly interfaces that create seamless digital experiences. Our goal is to ensure your software is not only functional but also visually appealing and easy to use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom Software Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build powerful custom software solutions using modern programming languages, frameworks, and cloud-ready architectures. Whether it’s a startup MVP or a large-scale enterprise platform, we deliver solutions built for performance and reliability.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Web Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From business websites to complex enterprise portals and SaaS platforms, we create responsive, secure, and scalable web applications that perform flawlessly across devices and browsers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mobile Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We develop Android, iOS, and cross-platform mobile applications that offer speed, security, and exceptional user experiences to help businesses stay connected with customers on the go.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "API Development & System Integration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build robust APIs and integrate third-party platforms, payment gateways, CRMs, ERPs, and other business tools to streamline operations and improve productivity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Testing & Quality Assurance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quality is at the heart of our development process. We conduct thorough functional, performance, security, and usability testing to ensure bug-free, reliable, and high-performing software.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Deployment & Launch", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team ensures smooth deployment with minimal downtime, handling server configuration, cloud deployment, production setup, and launch support for a seamless go-live experience.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Maintenance & Support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software requires continuous improvement. We provide ongoing support, updates, bug fixes, performance optimization, and security enhancements to keep your applications running efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Modernization", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your existing systems are outdated, we help modernize legacy applications by upgrading technologies, improving performance, enhancing security, and making them ready for future growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With our end-to-end software development services, businesses can reduce operational challenges, improve workflow automation, increase productivity, and accelerate digital transformation. Our mission is to turn your ideas into intelligent, scalable, and business-driven software solutions that create real impact.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Software Developement	\N	\N	f	2026-04-26 23:33:35.044+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-26 23:33:35.126+05:30	2026-04-26 23:33:35.126+05:30	f
5	2	Software Developement	software-developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Development Services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s fast-changing and highly competitive business environment, software must be flexible, scalable, and future-ready—just like your business. As technology evolves rapidly and customer expectations continue to rise, businesses need software solutions that are not only powerful but also adaptable to market demands. Developing such software requires deep technical expertise, strategic planning, and the ability to stay ahead of constantly changing industry standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our expert team specializes in developing world-class web applications, desktop software, enterprise systems, and mobile applications using the latest technologies and robust open-source frameworks. We focus on building scalable, secure, and user-friendly applications that improve efficiency, enhance customer experience, and drive business success.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our software development approach covers the complete Software Development Life Cycle (SDLC), ensuring a smooth and structured development process from start to finish. This includes:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirement Analysis & Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We begin by understanding your business objectives, technical requirements, and user expectations. Our team performs detailed planning to define the project scope, timelines, technology stack, and execution strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "UI/UX Design", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We design intuitive, engaging, and user-friendly interfaces that create seamless digital experiences. Our goal is to ensure your software is not only functional but also visually appealing and easy to use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom Software Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build powerful custom software solutions using modern programming languages, frameworks, and cloud-ready architectures. Whether it’s a startup MVP or a large-scale enterprise platform, we deliver solutions built for performance and reliability.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Web Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From business websites to complex enterprise portals and SaaS platforms, we create responsive, secure, and scalable web applications that perform flawlessly across devices and browsers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mobile Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We develop Android, iOS, and cross-platform mobile applications that offer speed, security, and exceptional user experiences to help businesses stay connected with customers on the go.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "API Development & System Integration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build robust APIs and integrate third-party platforms, payment gateways, CRMs, ERPs, and other business tools to streamline operations and improve productivity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Testing & Quality Assurance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quality is at the heart of our development process. We conduct thorough functional, performance, security, and usability testing to ensure bug-free, reliable, and high-performing software.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Deployment & Launch", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team ensures smooth deployment with minimal downtime, handling server configuration, cloud deployment, production setup, and launch support for a seamless go-live experience.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Maintenance & Support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software requires continuous improvement. We provide ongoing support, updates, bug fixes, performance optimization, and security enhancements to keep your applications running efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Modernization", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your existing systems are outdated, we help modernize legacy applications by upgrading technologies, improving performance, enhancing security, and making them ready for future growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With our end-to-end software development services, businesses can reduce operational challenges, improve workflow automation, increase productivity, and accelerate digital transformation. Our mission is to turn your ideas into intelligent, scalable, and business-driven software solutions that create real impact.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Software Developement	\N	\N	f	2026-04-27 08:53:25.435+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 08:53:25.53+05:30	2026-04-27 08:53:25.53+05:30	f
1	1	Data Analytics Outsourcing	data-analytics-outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Data Analytics Outsourcing.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Analytics Outsourcing", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " is a great way for organisations to meet analytical needs, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "create agile infrastructure", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " quickly and gain access to a wide variety of expertise. In many cases, organisations do not have the luxury of setting up an in-house Analytics Team because of various reasons. This could be the result of a lack of analytical skills, lack of process expertise, and costlier upfront technology investments. They might have a team in-house, but they might have limited resources & less time. In order to overcome these barriers, we combine your Analytical needs with a mix of technologies and deep industry expertise along with agility and speed.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"tag": "h2", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Capabilities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h4", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Analytics Outsourcing Services supports the full Data Science Cycle", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h4", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Digital Data Collection & Integration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Simple and easy integration with enterprise applications such as CRM, ERP, SAP, SQL and any data platforms. Clean, prepare, and blend data easily for further analysis and deployment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Intelligence & Visualisation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Generate real-time reports and interactive dashboards online. Team members and stakeholders will be able to make timely and informed decisions based on the insights you share.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Power of Augmented Analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhanced Analytics combines the power of Predictive Analytics, Artificial Intelligence and Machine Learning – from model construction to deployment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h4", "type": "heading", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Analytics Automation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Analytics Automation delivers transformative results for your business. Automating repetitive & complex analytic processes can enable organisations to accelerate insights and actions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "left", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Advantages of Outsourcing", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Save on Upfront Technology Investments", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Build an Agile Infrastructure", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Diverse Expertise is Accessible", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Create a Data Culture Environment", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better Business Decisions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Accelerate Digital Transformation", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 7, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "ROI in Real Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 8, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhance Operational Efficiency", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 9, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improve Customer Experience", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 10, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Maintain Traceability and Compliance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}}	1	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-22 08:14:35.791+05:30	2026-04-22 08:14:35.79+05:30	published	2026-04-22 08:14:36.009+05:30	2026-04-22 08:14:36.009+05:30	f
9	2	Software Development	software-developement	Fully customisable, scalable & modular software — web, desktop and mobile applications built with cutting-edge open-source technologies across the full SDLC.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "With today's disruptive business environment, software must be built to adapt, just like your business. Our Software Development Services are fully Customisable, Scalable & Modular.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We provide industry-leading development services helping businesses worldwide build, manage, and modernise applications using cutting-edge and open-source technologies across the entire Software Development Life Cycle — from design through deployment and maintenance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Service Offerings", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Desktop Application Development: Windows, Linux, and macOS applications built for performance and reliability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile Application Development: Native and cross-platform Android & iOS apps.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Web Application Development: Agile-driven, full-stack web applications with rigorous testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "UI/UX Design: User-friendly, interactive, multi-channel digital experiences.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Software Testing: Cross-browser, multi-OS, multi-device compatibility testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Staff Augmentation: Expert development teams that extend your in-house capability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Stack", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Python, Microsoft .NET, Mendix, macOS, Linux, iOS, Android — built on proven technologies for long-term maintainability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	4	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 15:29:13.098+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 15:29:13.111+05:30	2026-04-27 15:29:13.111+05:30	f
8	1	Analytics Outsourcing	data-analytics-outsourcing	Meet your analytical needs quickly — blending Data Science, Analytics & Automation to build agile infrastructure and access diverse expertise without large upfront investment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "There are unprecedented opportunities to develop agile products and services in today's data-driven world through the blending of Data Science, Analytics & Automation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Outsourcing is a great way for organisations to meet analytical needs, create agile infrastructure quickly, and gain access to a wide variety of expertise. Many organisations lack in-house analytical capabilities due to skill gaps, process inexperience, or substantial technology costs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies combines analytical requirements with technological solutions and industry knowledge to deliver agile, rapid results.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Data Collection & Integration, Business Intelligence & Visualisation, Power of Augmented Analytics, and Analytics Automation — the full data science cycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Advantages of Outsourcing", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Save on upfront technology investments, build an agile infrastructure, access diverse expertise, create a data culture environment, achieve better business decisions, accelerate digital transformation, and maintain traceability and compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	5	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-27 14:46:12.45+05:30	2026-04-22 08:14:35.79+05:30	published	2026-04-27 14:46:12.465+05:30	2026-04-27 14:46:12.465+05:30	f
6	2	Software Developement	software-developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Development Services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s fast-changing and highly competitive business environment, software must be flexible, scalable, and future-ready—just like your business. As technology evolves rapidly and customer expectations continue to rise, businesses need software solutions that are not only powerful but also adaptable to market demands. Developing such software requires deep technical expertise, strategic planning, and the ability to stay ahead of constantly changing industry standards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our expert team specializes in developing world-class web applications, desktop software, enterprise systems, and mobile applications using the latest technologies and robust open-source frameworks. We focus on building scalable, secure, and user-friendly applications that improve efficiency, enhance customer experience, and drive business success.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our software development approach covers the complete Software Development Life Cycle (SDLC), ensuring a smooth and structured development process from start to finish. This includes:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirement Analysis & Planning", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We begin by understanding your business objectives, technical requirements, and user expectations. Our team performs detailed planning to define the project scope, timelines, technology stack, and execution strategy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "UI/UX Design", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We design intuitive, engaging, and user-friendly interfaces that create seamless digital experiences. Our goal is to ensure your software is not only functional but also visually appealing and easy to use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Custom Software Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build powerful custom software solutions using modern programming languages, frameworks, and cloud-ready architectures. Whether it’s a startup MVP or a large-scale enterprise platform, we deliver solutions built for performance and reliability.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Web Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From business websites to complex enterprise portals and SaaS platforms, we create responsive, secure, and scalable web applications that perform flawlessly across devices and browsers.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mobile Application Development", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We develop Android, iOS, and cross-platform mobile applications that offer speed, security, and exceptional user experiences to help businesses stay connected with customers on the go.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "API Development & System Integration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We build robust APIs and integrate third-party platforms, payment gateways, CRMs, ERPs, and other business tools to streamline operations and improve productivity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Testing & Quality Assurance", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quality is at the heart of our development process. We conduct thorough functional, performance, security, and usability testing to ensure bug-free, reliable, and high-performing software.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Deployment & Launch", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team ensures smooth deployment with minimal downtime, handling server configuration, cloud deployment, production setup, and launch support for a seamless go-live experience.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Maintenance & Support", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software requires continuous improvement. We provide ongoing support, updates, bug fixes, performance optimization, and security enhancements to keep your applications running efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Modernization", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "If your existing systems are outdated, we help modernize legacy applications by upgrading technologies, improving performance, enhancing security, and making them ready for future growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With our end-to-end software development services, businesses can reduce operational challenges, improve workflow automation, increase productivity, and accelerate digital transformation. Our mission is to turn your ideas into intelligent, scalable, and business-driven software solutions that create real impact.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 08:53:29.83+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 08:53:29.85+05:30	2026-04-27 08:53:29.85+05:30	f
11	2	Software Development	software-developement	Fully customisable, scalable & modular software — web, desktop and mobile applications built with cutting-edge open-source technologies across the full SDLC.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "With today's disruptive business environment, software must be built to adapt, just like your business. Our Software Development Services are fully Customisable, Scalable & Modular.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We provide industry-leading development services helping businesses worldwide build, manage, and modernise applications using cutting-edge and open-source technologies across the entire Software Development Life Cycle — from design through deployment and maintenance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Service Offerings", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Desktop Application Development: Windows, Linux, and macOS applications built for performance and reliability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile Application Development: Native and cross-platform Android & iOS apps.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Web Application Development: Agile-driven, full-stack web applications with rigorous testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "UI/UX Design: User-friendly, interactive, multi-channel digital experiences.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Software Testing: Cross-browser, multi-OS, multi-device compatibility testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Staff Augmentation: Expert development teams that extend your in-house capability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Stack", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Python, Microsoft .NET, Mendix, macOS, Linux, iOS, Android — built on proven technologies for long-term maintainability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	4	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 15:41:34.355+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 15:41:34.367+05:30	2026-04-27 15:41:34.367+05:30	f
13	2	Software Development	software-developement	Fully customisable, scalable & modular software — web, desktop and mobile applications built with cutting-edge open-source technologies across the full SDLC.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "With today's disruptive business environment, software must be built to adapt, just like your business. Our Software Development Services are fully Customisable, Scalable & Modular.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We provide industry-leading development services helping businesses worldwide build, manage, and modernise applications using cutting-edge and open-source technologies across the entire Software Development Life Cycle — from design through deployment and maintenance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Service Offerings", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Desktop Application Development: Windows, Linux, and macOS applications built for performance and reliability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile Application Development: Native and cross-platform Android & iOS apps.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Web Application Development: Agile-driven, full-stack web applications with rigorous testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "UI/UX Design: User-friendly, interactive, multi-channel digital experiences.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Software Testing: Cross-browser, multi-OS, multi-device compatibility testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Staff Augmentation: Expert development teams that extend your in-house capability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Stack", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Python, Microsoft .NET, Mendix, macOS, Linux, iOS, Android — built on proven technologies for long-term maintainability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	4	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 15:43:15.228+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 15:43:15.239+05:30	2026-04-27 15:43:15.239+05:30	t
2	2	Software Developement	software-developement	Build web Applications	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "left", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With today’s disruptive business environment, software must be built to adapt, just like your business is. With technology and industry standards always evolving, ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Software Development", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " isn’t an easy task. The ultimate goal of any organisation is to build a quality product & meet customer needs, but the Software Development process is constantly changing, and new tools and libraries are being created daily.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "quote", "format": "center", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With our ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Industry-Leading Software Development Services,", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " we help businesses all over the world in building, managing, and modernizing software applications more effectively. We develop world-class web, desktop, and mobile applications powered by cutting-edge and open source technologies that are scalable and provide a delightful customer experience. Our software development services encompass the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Software Development Life Cycle (SDLC)", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": ", starting from design to deployment and maintenance as well. ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null}}	\N	\N	Software Developement	\N	\N	f	2026-04-22 14:33:17.927+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-22 14:33:18.039+05:30	2026-04-22 14:33:18.039+05:30	f
7	2	Software Development	software-developement	Fully customisable, scalable & modular software — web, desktop and mobile applications built with cutting-edge open-source technologies across the full SDLC.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "With today's disruptive business environment, software must be built to adapt, just like your business. Our Software Development Services are fully Customisable, Scalable & Modular.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We provide industry-leading development services helping businesses worldwide build, manage, and modernise applications using cutting-edge and open-source technologies across the entire Software Development Life Cycle — from design through deployment and maintenance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Service Offerings", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Desktop Application Development: Windows, Linux, and macOS applications built for performance and reliability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile Application Development: Native and cross-platform Android & iOS apps.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Web Application Development: Agile-driven, full-stack web applications with rigorous testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "UI/UX Design: User-friendly, interactive, multi-channel digital experiences.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Software Testing: Cross-browser, multi-OS, multi-device compatibility testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Staff Augmentation: Expert development teams that extend your in-house capability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Stack", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Python, Microsoft .NET, Mendix, macOS, Linux, iOS, Android — built on proven technologies for long-term maintainability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	4	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 14:46:12.326+05:30	2026-04-22 14:33:17.926+05:30	published	2026-04-27 14:46:12.352+05:30	2026-04-27 14:46:12.352+05:30	f
14	1	Analytics Outsourcing	data-analytics-outsourcing	Meet your analytical needs quickly — blending Data Science, Analytics & Automation to build agile infrastructure and access diverse expertise without large upfront investment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "There are unprecedented opportunities to develop agile products and services in today's data-driven world through the blending of Data Science, Analytics & Automation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Outsourcing is a great way for organisations to meet analytical needs, create agile infrastructure quickly, and gain access to a wide variety of expertise. Many organisations lack in-house analytical capabilities due to skill gaps, process inexperience, or substantial technology costs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies combines analytical requirements with technological solutions and industry knowledge to deliver agile, rapid results.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Data Collection & Integration, Business Intelligence & Visualisation, Power of Augmented Analytics, and Analytics Automation — the full data science cycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Advantages of Outsourcing", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Save on upfront technology investments, build an agile infrastructure, access diverse expertise, create a data culture environment, achieve better business decisions, accelerate digital transformation, and maintain traceability and compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	5	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-27 15:43:15.284+05:30	2026-04-22 08:14:35.79+05:30	published	2026-04-27 15:43:15.289+05:30	2026-04-27 15:43:15.289+05:30	t
12	1	Analytics Outsourcing	data-analytics-outsourcing	Meet your analytical needs quickly — blending Data Science, Analytics & Automation to build agile infrastructure and access diverse expertise without large upfront investment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "There are unprecedented opportunities to develop agile products and services in today's data-driven world through the blending of Data Science, Analytics & Automation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Outsourcing is a great way for organisations to meet analytical needs, create agile infrastructure quickly, and gain access to a wide variety of expertise. Many organisations lack in-house analytical capabilities due to skill gaps, process inexperience, or substantial technology costs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies combines analytical requirements with technological solutions and industry knowledge to deliver agile, rapid results.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Data Collection & Integration, Business Intelligence & Visualisation, Power of Augmented Analytics, and Analytics Automation — the full data science cycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Advantages of Outsourcing", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Save on upfront technology investments, build an agile infrastructure, access diverse expertise, create a data culture environment, achieve better business decisions, accelerate digital transformation, and maintain traceability and compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	5	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-27 15:41:34.442+05:30	2026-04-22 08:14:35.79+05:30	published	2026-04-27 15:41:34.46+05:30	2026-04-27 15:41:34.46+05:30	f
10	1	Analytics Outsourcing	data-analytics-outsourcing	Meet your analytical needs quickly — blending Data Science, Analytics & Automation to build agile infrastructure and access diverse expertise without large upfront investment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "There are unprecedented opportunities to develop agile products and services in today's data-driven world through the blending of Data Science, Analytics & Automation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Outsourcing is a great way for organisations to meet analytical needs, create agile infrastructure quickly, and gain access to a wide variety of expertise. Many organisations lack in-house analytical capabilities due to skill gaps, process inexperience, or substantial technology costs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies combines analytical requirements with technological solutions and industry knowledge to deliver agile, rapid results.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Data Collection & Integration, Business Intelligence & Visualisation, Power of Augmented Analytics, and Analytics Automation — the full data science cycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Advantages of Outsourcing", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Save on upfront technology investments, build an agile infrastructure, access diverse expertise, create a data culture environment, achieve better business decisions, accelerate digital transformation, and maintain traceability and compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	5	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-27 15:29:13.161+05:30	2026-04-22 08:14:35.79+05:30	published	2026-04-27 15:29:13.167+05:30	2026-04-27 15:29:13.167+05:30	f
\.


--
-- Data for Name: _services_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._services_v_rels (id, "order", parent_id, path, solutions_id) FROM stdin;
\.


--
-- Data for Name: _services_v_version_highlights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._services_v_version_highlights (_order, _parent_id, id, point, _uuid) FROM stdin;
1	1	1	Data Analytics Outsourcing	69e835f9fad2621118a3f746
2	1	2	Swajyot Data Analytics Outsourcing	69e83600fad2621118a3f748
1	7	3	Desktop Application Development (Windows, Linux, macOS)	69ef295cd2ff65210807c799
2	7	4	Mobile Application Development (Android & iOS)	69ef295cd2ff65210807c79a
3	7	5	Web Application Development (Agile, front-end, back-end, testing)	69ef295cd2ff65210807c79b
4	7	6	UI/UX Design	69ef295cd2ff65210807c79c
5	7	7	Software Testing	69ef295cd2ff65210807c79d
6	7	8	Staff Augmentation	69ef295cd2ff65210807c79e
1	8	9	Digital Data Collection & Integration	69ef295cd2ff65210807c79f
2	8	10	Business Intelligence & Visualisation	69ef295cd2ff65210807c7a0
3	8	11	Power of Augmented Analytics	69ef295cd2ff65210807c7a1
4	8	12	Analytics Automation	69ef295cd2ff65210807c7a2
5	8	13	Save on Upfront Technology Investments	69ef295cd2ff65210807c7a3
6	8	14	Build an Agile Infrastructure	69ef295cd2ff65210807c7a4
7	8	15	Diverse Expertise is Accessible	69ef295cd2ff65210807c7a5
8	8	16	Accelerate Digital Transformation	69ef295cd2ff65210807c7a6
9	8	17	Better Business Decisions	69ef295cd2ff65210807c7a7
10	8	18	ROI in Real Time	69ef295cd2ff65210807c7a8
1	9	19	Desktop Application Development (Windows, Linux, macOS)	69ef33715419407d0c300431
2	9	20	Mobile Application Development (Android & iOS)	69ef33715419407d0c300432
3	9	21	Web Application Development (Agile, front-end, back-end, testing)	69ef33715419407d0c300433
4	9	22	UI/UX Design	69ef33715419407d0c300434
5	9	23	Software Testing	69ef33715419407d0c300435
6	9	24	Staff Augmentation	69ef33715419407d0c300436
1	10	25	Digital Data Collection & Integration	69ef33715419407d0c300437
2	10	26	Business Intelligence & Visualisation	69ef33715419407d0c300438
3	10	27	Power of Augmented Analytics	69ef33715419407d0c300439
4	10	28	Analytics Automation	69ef33715419407d0c30043a
5	10	29	Save on Upfront Technology Investments	69ef33715419407d0c30043b
6	10	30	Build an Agile Infrastructure	69ef33715419407d0c30043c
7	10	31	Diverse Expertise is Accessible	69ef33715419407d0c30043d
8	10	32	Accelerate Digital Transformation	69ef33715419407d0c30043e
9	10	33	Better Business Decisions	69ef33715419407d0c30043f
10	10	34	ROI in Real Time	69ef33715419407d0c300440
1	11	35	Desktop Application Development (Windows, Linux, macOS)	69ef36562f92593bd48ea3c3
2	11	36	Mobile Application Development (Android & iOS)	69ef36562f92593bd48ea3c4
3	11	37	Web Application Development (Agile, front-end, back-end, testing)	69ef36562f92593bd48ea3c5
4	11	38	UI/UX Design	69ef36562f92593bd48ea3c6
5	11	39	Software Testing	69ef36562f92593bd48ea3c7
6	11	40	Staff Augmentation	69ef36562f92593bd48ea3c8
1	12	41	Digital Data Collection & Integration	69ef36562f92593bd48ea3c9
2	12	42	Business Intelligence & Visualisation	69ef36562f92593bd48ea3ca
3	12	43	Power of Augmented Analytics	69ef36562f92593bd48ea3cb
4	12	44	Analytics Automation	69ef36562f92593bd48ea3cc
5	12	45	Save on Upfront Technology Investments	69ef36562f92593bd48ea3cd
6	12	46	Build an Agile Infrastructure	69ef36562f92593bd48ea3ce
7	12	47	Diverse Expertise is Accessible	69ef36562f92593bd48ea3cf
8	12	48	Accelerate Digital Transformation	69ef36562f92593bd48ea3d0
9	12	49	Better Business Decisions	69ef36562f92593bd48ea3d1
10	12	50	ROI in Real Time	69ef36562f92593bd48ea3d2
1	13	51	Desktop Application Development (Windows, Linux, macOS)	69ef36bbceae1173f40a26ec
2	13	52	Mobile Application Development (Android & iOS)	69ef36bbceae1173f40a26ed
3	13	53	Web Application Development (Agile, front-end, back-end, testing)	69ef36bbceae1173f40a26ee
4	13	54	UI/UX Design	69ef36bbceae1173f40a26ef
5	13	55	Software Testing	69ef36bbceae1173f40a26f0
6	13	56	Staff Augmentation	69ef36bbceae1173f40a26f1
1	14	57	Digital Data Collection & Integration	69ef36bbceae1173f40a26f2
2	14	58	Business Intelligence & Visualisation	69ef36bbceae1173f40a26f3
3	14	59	Power of Augmented Analytics	69ef36bbceae1173f40a26f4
4	14	60	Analytics Automation	69ef36bbceae1173f40a26f5
5	14	61	Save on Upfront Technology Investments	69ef36bbceae1173f40a26f6
6	14	62	Build an Agile Infrastructure	69ef36bbceae1173f40a26f7
7	14	63	Diverse Expertise is Accessible	69ef36bbceae1173f40a26f8
8	14	64	Accelerate Digital Transformation	69ef36bbceae1173f40a26f9
9	14	65	Better Business Decisions	69ef36bbceae1173f40a26fa
10	14	66	ROI in Real Time	69ef36bbceae1173f40a26fb
\.


--
-- Data for Name: _solutions_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._solutions_v (id, parent_id, version_title, version_slug, version_category, version_short_description, version_description, version_cover_image_id, version_icon_id, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_updated_at, version_created_at, version__status, created_at, updated_at, latest) FROM stdin;
1	1	Data Analytics & Business Intelligence	data-analytics-business-intelligence	enterprise-computing	Transform raw data into actionable insights with scalable analytics, dashboards, and AI-driven decision-making solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s data-driven world, businesses need the ability to analyze and interpret large volumes of data quickly. Our Data Analytics and Business Intelligence solutions help organizations make smarter decisions, improve performance, and gain a competitive edge.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What We Offer", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We provide end-to-end analytics solutions, from data collection and processing to visualization and reporting. Our systems are designed to be scalable, secure, and easy to use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key Capabilities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data integration from multiple sources  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data cleaning and transformation  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Interactive dashboards and reports  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-time analytics and monitoring  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Predictive analytics using AI and machine learning  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better decision-making with real-time insights  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improved operational efficiency  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhanced customer understanding  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Reduced risks through data-driven strategies  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Scalable solutions for growing businesses  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Approach", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We follow a structured approach that includes understanding your business needs, designing tailored solutions, implementing robust analytics systems, and providing ongoing support.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tools & Technologies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We work with modern tools and platforms including KNIME, Power BI, Tableau, Python, and cloud-based analytics solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Use Cases", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Sales and performance dashboards  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customer behavior analysis  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Financial reporting and forecasting  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Operational analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Marketing campaign analysis  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Started", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Leverage the power of data to drive growth and innovation in your organization with our expert analytics solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Data Analytics Solutions | Business Intelligence | Swajyot	Discover data analytics and business intelligence solutions to transform your data into insights with dashboards, AI models, and real-time reporting.	\N	f	2026-04-22 08:44:44.604+05:30	2026-04-22 08:44:44.603+05:30	published	2026-04-22 08:44:44.829+05:30	2026-04-22 08:44:44.829+05:30	t
57	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	14	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 15:43:14.688+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 15:43:14.71+05:30	2026-04-27 15:43:14.71+05:30	t
4	3	Enterprise Computing Management	enterprise-computing-management	digital-process-automation	Comprehensive end-to-end enterprise computing solutions including servers, storage, networking, security, backup, and IT infrastructure management for modern businesses.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enterprise Computing Management", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enterprise Computing Management helps organizations implement best-practice-based strategies to strengthen and optimize their overall IT infrastructure. In today’s fast-paced digital environment, businesses require reliable, secure, and scalable computing systems to support daily operations, improve productivity, and drive long-term growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Enterprise Computing Management Solutions are designed to deliver complete end-to-end services that meet all your computing and infrastructure needs. From software tools and server management to enterprise storage, backup solutions, networking, and security, we provide comprehensive support to ensure your IT ecosystem performs efficiently and securely.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We help businesses enhance their IT and infrastructure systems with top-class software and hardware solutions tailored to their operational requirements. Our focus is on improving performance, minimizing downtime, ensuring data protection, and enabling seamless business continuity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With years of expertise and a customer-first approach, we deliver intelligent infrastructure solutions that support organizations in building a strong technological foundation for future growth.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "End-to-End Solutions to Meet All Your Computing Needs", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Servers & Personal Computers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "To maintain a smooth, stable, and well-organized network environment, we provide a wide range of server and personal computer solutions. Our services include IT consulting, server setup, proactive maintenance plans, remote monitoring, and offsite backup solutions to ensure your business operations remain uninterrupted.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We help organizations choose the right hardware infrastructure, improve system performance, and reduce downtime through preventive maintenance and expert technical support.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Tools & Components", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We provide a wide range of software tools and components that help businesses improve productivity, streamline operations, and enhance software performance. Our services include software testing, development support, system optimization, and deployment of essential enterprise tools.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether it is part of a complete software development project or specialized expertise to strengthen internal teams, we deliver reliable and scalable software solutions tailored to your business requirements.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Peripherals & Accessories", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We deliver complete IT infrastructure support including peripherals and accessories that ensure smooth and uninterrupted client computing experiences. From printers, scanners, routers, and storage devices to workstations and hardware accessories, we provide everything needed for a fully functional IT environment.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our service engineers work closely with clients to meet demanding business requirements and provide best-in-class installation, maintenance, and technical support services.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Storage & Backup", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data is one of the most valuable assets of any organization. We help businesses implement secure and efficient data storage and backup solutions that protect critical information and ensure business continuity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team integrates advanced backup technologies into existing systems to reduce backup windows, minimize storage requirements, improve recovery speed, and strengthen overall data protection strategies.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Information Security", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Protecting sensitive business data is critical in today’s digital world. We help organizations secure their important information and digital assets against advanced threats, cyberattacks, and targeted security risks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our information security solutions include endpoint protection, network security, access control, threat monitoring, and risk management strategies that are easily adaptable to your business environment and compliance requirements.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Networking & Communications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s competitive economy, reducing operational costs while improving productivity is essential. We specialize in delivering complete networking and communication infrastructure solutions that help businesses stay connected, efficient, and secure.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From network design and implementation to communication systems, connectivity solutions, and infrastructure optimization, we ensure seamless collaboration across your organization.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Complete Range of Apple Products", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As an Apple Authorized Partner, we provide a complete range of Apple products and services for businesses and professionals. From MacBooks, iPads, iPhones, and iMacs to enterprise deployment and technical support, we deliver trusted Apple solutions tailored to your organization’s needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team ensures smooth procurement, setup, support, and maintenance to help businesses maximize productivity using Apple’s powerful ecosystem.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We Deliver High-Quality Products and Services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a trusted organization, we are committed to delivering high-quality products, reliable services, and strong technical leadership. Our success is built on solid technical expertise, transparent processes, shared responsibility, and customer satisfaction.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We have developed the right expertise and industry knowledge to provide our customers with the best products, solutions, and support required to meet their enterprise computing needs.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our goal is to provide top-notch Enterprise Computing Management Solutions by using the latest technologies available in the market. We believe in working with specialists and experts who bring deep knowledge and practical experience rather than generalists.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "As a company, we are dedicated to continuous innovation that improves business efficiency and enhances the overall customer experience.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-26 23:38:10.524+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-26 23:38:10.699+05:30	2026-04-26 23:38:10.699+05:30	f
2	2	Analytics & AI	analytics-ai	analytics-ai	Leverage Analytics and Artificial Intelligence to transform data into insights, improve decision-making, and drive business growth.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Analytics and Artificial Intelligence (AI) are transforming the digital landscape. In today’s IoT-driven world, data is generated every second at an exponential rate. This data can be structured, unstructured, or semi-structured.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By leveraging Analytics and AI, organizations can unlock the true value of data. These technologies help businesses improve productivity, increase revenue, understand customer behavior, and gain deeper insights into operations. Implementing Analytics and AI solutions enables organizations to stay competitive in a rapidly evolving market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Approach", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We design and implement robust Analytics frameworks tailored to business needs. Our solutions focus on scalability, accuracy, and real-time insights to support better decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core Solutions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Intelligence (BI)  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Achieve operational excellence using BI tools. We help implement and develop BI frameworks that allow you to monitor and visualize performance through interactive dashboards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big Data Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With massive volumes of data generated every second, Big Data Analytics helps extract meaningful insights. We deploy scalable frameworks to process and analyze large datasets efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Predictive Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhance customer experience, manage risks, and identify opportunities using predictive models. Our solutions help improve forecasting and decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Understand customer behavior, optimize operations, and improve revenue streams with customized business analytics frameworks tailored to your organization.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Statistical Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Gain deeper insights into processes with statistical models. We develop customized statistical frameworks to improve efficiency and productivity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quality Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improve product quality and customer satisfaction through quality analytics. Detect variations, maintain standards, and ensure consistent performance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Industry Applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "General Manufacturing  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhance operational efficiency and productivity using analytics-driven insights across manufacturing processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pharmaceuticals and Life Sciences  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Implement advanced analytics for drug development, clinical trials, and regulatory compliance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Healthcare  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Build data-driven healthcare systems that improve accessibility, affordability, and patient outcomes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technologies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our solutions are powered by industry-leading tools and technologies such as Python, Minitab, and modern AI frameworks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Started", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Adopt Analytics and AI solutions to transform your business operations and unlock new growth opportunities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-22 09:05:54.602+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-22 09:05:54.771+05:30	2026-04-22 09:05:54.771+05:30	f
5	4	Digital Process Automation	digital-process-automation	digital-process-automation	Streamline and automate your business processes to improve efficiency, reduce errors, and lower operational costs.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.635+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 08:50:21.643+05:30	2026-04-27 08:50:21.643+05:30	f
6	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Empower your organization with intelligent decision-making frameworks, business rules, and analytics-driven insights.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.822+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 08:50:21.829+05:30	2026-04-27 08:50:21.829+05:30	f
7	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Implement robust quality management systems to ensure consistent product and service excellence across every touchpoint.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.845+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 08:50:21.85+05:30	2026-04-27 08:50:21.85+05:30	f
8	7	Enterprise Information Management	enterprise-information-management	information-management	Manage and govern your enterprise information assets for accuracy, accessibility, and regulatory compliance.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.868+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 08:50:21.871+05:30	2026-04-27 08:50:21.871+05:30	f
9	8	Statistical Process Control	statistical-process-control	quality-management	Apply statistical methods to monitor, control, and continuously improve manufacturing and business processes.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.887+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 08:50:21.892+05:30	2026-04-27 08:50:21.892+05:30	f
10	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations with best-in-class processes, technologies, and lean methodologies.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.9+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 08:50:21.903+05:30	2026-04-27 08:50:21.903+05:30	f
11	10	Service Excellence	service-excellence	service-excellence	Deliver exceptional service experiences that build customer loyalty, improve satisfaction, and drive sustainable growth.	\N	\N	\N	\N	\N	\N	f	2026-04-27 08:50:21.912+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 08:50:21.915+05:30	2026-04-27 08:50:21.915+05:30	f
30	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 14:46:11.438+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 14:46:11.495+05:30	2026-04-27 14:46:11.495+05:30	f
15	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.279+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 14:30:43.289+05:30	2026-04-27 14:30:43.289+05:30	f
16	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.339+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 14:30:43.351+05:30	2026-04-27 14:30:43.351+05:30	f
17	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.397+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 14:30:43.411+05:30	2026-04-27 14:30:43.411+05:30	f
21	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 14:43:58.462+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 14:43:58.504+05:30	2026-04-27 14:43:58.504+05:30	f
12	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 14:30:42.989+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 14:30:43.027+05:30	2026-04-27 14:30:43.027+05:30	f
62	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	19	\N	\N	\N	\N	f	2026-04-27 15:43:14.894+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 15:43:14.9+05:30	2026-04-27 15:43:14.9+05:30	t
63	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	20	\N	\N	\N	\N	f	2026-04-27 15:43:14.926+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 15:43:14.935+05:30	2026-04-27 15:43:14.935+05:30	t
58	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	15	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 15:43:14.764+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 15:43:14.771+05:30	2026-04-27 15:43:14.771+05:30	t
24	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.737+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 14:43:58.753+05:30	2026-04-27 14:43:58.753+05:30	f
25	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.8+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 14:43:58.813+05:30	2026-04-27 14:43:58.813+05:30	f
26	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.859+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 14:43:58.874+05:30	2026-04-27 14:43:58.874+05:30	f
3	2	Analytics & AI	analytics-ai	analytics-ai	Leverage Analytics and Artificial Intelligence to transform data into insights, improve decision-making, and drive business growth.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Analytics and Artificial Intelligence (AI) are transforming the digital landscape. In today’s IoT-driven world, data is generated every second at an exponential rate. This data can be structured, unstructured, or semi-structured.", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By leveraging Analytics and AI, organizations can unlock the true value of data. These technologies help businesses improve productivity, increase revenue, understand customer behavior, and gain deeper insights into operations. Implementing Analytics and AI solutions enables organizations to stay competitive in a rapidly evolving market.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Approach", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We design and implement robust Analytics frameworks tailored to business needs. Our solutions focus on scalability, accuracy, and real-time insights to support better decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Core Solutions", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Intelligence (BI)  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Achieve operational excellence using BI tools. We help implement and develop BI frameworks that allow you to monitor and visualize performance through interactive dashboards.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Big Data Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With massive volumes of data generated every second, Big Data Analytics helps extract meaningful insights. We deploy scalable frameworks to process and analyze large datasets efficiently.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Predictive Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhance customer experience, manage risks, and identify opportunities using predictive models. Our solutions help improve forecasting and decision-making.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Understand customer behavior, optimize operations, and improve revenue streams with customized business analytics frameworks tailored to your organization.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Statistical Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Gain deeper insights into processes with statistical models. We develop customized statistical frameworks to improve efficiency and productivity.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Quality Analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improve product quality and customer satisfaction through quality analytics. Detect variations, maintain standards, and ensure consistent performance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Industry Applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "General Manufacturing  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhance operational efficiency and productivity using analytics-driven insights across manufacturing processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Pharmaceuticals and Life Sciences  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Implement advanced analytics for drug development, clinical trials, and regulatory compliance.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Healthcare  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Build data-driven healthcare systems that improve accessibility, affordability, and patient outcomes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Technologies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our solutions are powered by industry-leading tools and technologies such as Python, Minitab, and modern AI frameworks.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Started", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Adopt Analytics and AI solutions to transform your business operations and unlock new growth opportunities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-22 09:29:48.794+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-22 09:29:48.877+05:30	2026-04-22 09:29:48.877+05:30	f
22	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 14:43:58.586+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 14:43:58.601+05:30	2026-04-27 14:43:58.601+05:30	f
40	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 15:29:12.596+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 15:29:12.612+05:30	2026-04-27 15:29:12.612+05:30	f
29	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:59.042+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 14:43:59.055+05:30	2026-04-27 14:43:59.055+05:30	f
31	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 14:46:11.6+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 14:46:11.617+05:30	2026-04-27 14:46:11.617+05:30	f
13	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 14:30:43.119+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 14:30:43.132+05:30	2026-04-27 14:30:43.132+05:30	f
59	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	16	\N	\N	\N	\N	f	2026-04-27 15:43:14.8+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 15:43:14.807+05:30	2026-04-27 15:43:14.807+05:30	t
14	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.184+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 14:30:43.227+05:30	2026-04-27 14:30:43.227+05:30	f
23	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.655+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 14:43:58.671+05:30	2026-04-27 14:43:58.671+05:30	f
34	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:11.836+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 14:46:11.851+05:30	2026-04-27 14:46:11.851+05:30	f
35	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:11.906+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 14:46:11.922+05:30	2026-04-27 14:46:11.922+05:30	f
36	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:11.974+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 14:46:11.99+05:30	2026-04-27 14:46:11.99+05:30	f
39	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 15:29:12.494+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 15:29:12.521+05:30	2026-04-27 15:29:12.521+05:30	f
60	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	17	\N	\N	\N	\N	f	2026-04-27 15:43:14.833+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 15:43:14.839+05:30	2026-04-27 15:43:14.839+05:30	t
33	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:11.768+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 14:46:11.785+05:30	2026-04-27 14:46:11.785+05:30	f
38	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:12.109+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 14:46:12.124+05:30	2026-04-27 14:46:12.124+05:30	f
41	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.643+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 15:29:12.651+05:30	2026-04-27 15:29:12.651+05:30	f
55	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.049+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 15:41:34.057+05:30	2026-04-27 15:41:34.057+05:30	f
56	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.081+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 15:41:34.091+05:30	2026-04-27 15:41:34.091+05:30	f
42	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.679+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 15:29:12.687+05:30	2026-04-27 15:29:12.687+05:30	f
43	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.721+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 15:29:12.73+05:30	2026-04-27 15:29:12.73+05:30	f
44	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.751+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 15:29:12.757+05:30	2026-04-27 15:29:12.757+05:30	f
45	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.777+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 15:29:12.783+05:30	2026-04-27 15:29:12.783+05:30	f
48	3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 15:41:33.735+05:30	2026-04-26 23:38:10.523+05:30	published	2026-04-27 15:41:33.785+05:30	2026-04-27 15:41:33.785+05:30	f
51	5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:33.929+05:30	2026-04-27 08:50:21.822+05:30	published	2026-04-27 15:41:33.937+05:30	2026-04-27 15:41:33.937+05:30	f
61	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	18	\N	\N	\N	\N	f	2026-04-27 15:43:14.864+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 15:43:14.87+05:30	2026-04-27 15:43:14.87+05:30	t
47	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.827+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 15:29:12.833+05:30	2026-04-27 15:29:12.833+05:30	f
49	2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 15:41:33.862+05:30	2026-04-22 09:05:54.601+05:30	published	2026-04-27 15:41:33.874+05:30	2026-04-27 15:41:33.874+05:30	f
50	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:33.897+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 15:41:33.904+05:30	2026-04-27 15:41:33.904+05:30	f
32	4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:11.675+05:30	2026-04-27 08:50:21.634+05:30	published	2026-04-27 14:46:11.692+05:30	2026-04-27 14:46:11.692+05:30	f
52	6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:33.959+05:30	2026-04-27 08:50:21.845+05:30	published	2026-04-27 15:41:33.965+05:30	2026-04-27 15:41:33.965+05:30	f
53	7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:33.986+05:30	2026-04-27 08:50:21.868+05:30	published	2026-04-27 15:41:33.993+05:30	2026-04-27 15:41:33.993+05:30	f
54	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:41:34.022+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 15:41:34.029+05:30	2026-04-27 15:41:34.029+05:30	f
18	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.461+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 14:30:43.477+05:30	2026-04-27 14:30:43.477+05:30	f
27	8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.922+05:30	2026-04-27 08:50:21.886+05:30	published	2026-04-27 14:43:58.936+05:30	2026-04-27 14:43:58.936+05:30	f
64	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	21	\N	\N	\N	\N	f	2026-04-27 15:43:14.962+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 15:43:14.968+05:30	2026-04-27 15:43:14.968+05:30	t
28	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:43:58.983+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 14:43:58.997+05:30	2026-04-27 14:43:58.997+05:30	f
37	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:46:12.042+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 14:46:12.059+05:30	2026-04-27 14:46:12.059+05:30	f
19	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.525+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 14:30:43.538+05:30	2026-04-27 14:30:43.538+05:30	f
46	9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:29:12.801+05:30	2026-04-27 08:50:21.9+05:30	published	2026-04-27 15:29:12.807+05:30	2026-04-27 15:29:12.807+05:30	f
65	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	22	\N	\N	\N	\N	f	2026-04-27 15:43:14.993+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 15:43:15+05:30	2026-04-27 15:43:15+05:30	t
20	10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 14:30:43.585+05:30	2026-04-27 08:50:21.912+05:30	published	2026-04-27 14:30:43.599+05:30	2026-04-27 14:30:43.599+05:30	f
\.


--
-- Data for Name: _solutions_v_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._solutions_v_rels (id, "order", parent_id, path, industries_id) FROM stdin;
1	1	1	version.industries	1
2	1	4	version.industries	1
3	1	12	version.industries	1
4	1	21	version.industries	1
5	1	30	version.industries	1
6	1	39	version.industries	1
7	1	48	version.industries	1
8	1	57	version.industries	1
\.


--
-- Data for Name: _solutions_v_version_highlights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._solutions_v_version_highlights (_order, _parent_id, id, point, _uuid) FROM stdin;
1	1	1	Real-time data insights and dashboards	69e83d0bfad2621118a3f750
2	1	2	AI-powered predictive analytics	69e83d0efad2621118a3f752
3	1	3	Scalable and secure data solutions	69e83d13fad2621118a3f754
4	1	4	Seamless integration with existing systems	69e83d18fad2621118a3f756
1	2	5	End-to-end Analytics and AI solutions	69e841f6fad2621118a3f75a
2	2	6	End-to-end Analytics and AI solutions	69e841f9fad2621118a3f75c
3	2	7	Scalable big data processing frameworks	69e841fffad2621118a3f75e
4	2	8	Industry-specific analytics implementations	69e84204fad2621118a3f760
5	2	9	Improved decision-making and business performance	69e84208fad2621118a3f762
1	3	10	End-to-end Analytics and AI solutions	69e841f6fad2621118a3f75a
2	3	11	End-to-end Analytics and AI solutions	69e841f9fad2621118a3f75c
3	3	12	Scalable big data processing frameworks	69e841fffad2621118a3f75e
4	3	13	Industry-specific analytics implementations	69e84204fad2621118a3f760
5	3	14	Improved decision-making and business performance	69e84208fad2621118a3f762
1	12	15	Servers & Personal Computers	69ef25bac1a60f7bf0a1dc0f
2	12	16	Software Tools & Components	69ef25bac1a60f7bf0a1dc10
3	12	17	Peripherals & Accessories	69ef25bac1a60f7bf0a1dc11
4	12	18	Enterprise Storage & Backup	69ef25bac1a60f7bf0a1dc12
5	12	19	Enterprise Security	69ef25bac1a60f7bf0a1dc13
6	12	20	Networking & Communications	69ef25bac1a60f7bf0a1dc14
7	12	21	Information Security	69ef25bac1a60f7bf0a1dc15
1	13	22	Business Intelligence (BI)	69ef25bbc1a60f7bf0a1dc16
2	13	23	Big Data Analytics	69ef25bbc1a60f7bf0a1dc17
3	13	24	Predictive Analytics	69ef25bbc1a60f7bf0a1dc18
4	13	25	Business Analytics	69ef25bbc1a60f7bf0a1dc19
5	13	26	Statistical Analytics	69ef25bbc1a60f7bf0a1dc1a
6	13	27	Quality Analytics	69ef25bbc1a60f7bf0a1dc1b
1	14	28	Front-Office Process Automation	69ef25bbc1a60f7bf0a1dc1c
2	14	29	Back-Office Process Automation	69ef25bbc1a60f7bf0a1dc1d
3	14	30	Analytic Process Automation	69ef25bbc1a60f7bf0a1dc1e
4	14	31	QMS Process Automation	69ef25bbc1a60f7bf0a1dc1f
5	14	32	Enhanced Productivity	69ef25bbc1a60f7bf0a1dc20
6	14	33	Better ROI	69ef25bbc1a60f7bf0a1dc21
1	15	34	Better ROI	69ef25bbc1a60f7bf0a1dc22
2	15	35	Predictive Maintenance	69ef25bbc1a60f7bf0a1dc23
3	15	36	Better Business Decisions	69ef25bbc1a60f7bf0a1dc24
4	15	37	Operational Excellence	69ef25bbc1a60f7bf0a1dc25
5	15	38	Manage Risks & Opportunities	69ef25bbc1a60f7bf0a1dc26
6	15	39	Predict Business Outcomes	69ef25bbc1a60f7bf0a1dc27
1	16	40	Better ROI	69ef25bbc1a60f7bf0a1dc28
2	16	41	Quality & Consistency	69ef25bbc1a60f7bf0a1dc29
3	16	42	Customer Satisfaction	69ef25bbc1a60f7bf0a1dc2a
4	16	43	Operational Excellence	69ef25bbc1a60f7bf0a1dc2b
5	16	44	Cost Saving	69ef25bbc1a60f7bf0a1dc2c
6	16	45	Better Decision Making	69ef25bbc1a60f7bf0a1dc2d
1	17	46	Smart Forms Capture	69ef25bbc1a60f7bf0a1dc2e
2	17	47	Automated Capture with Easy Index	69ef25bbc1a60f7bf0a1dc2f
3	17	48	Mobile App for iOS & Android	69ef25bbc1a60f7bf0a1dc30
4	17	49	Analytics & Process Automation Integration	69ef25bbc1a60f7bf0a1dc31
5	17	50	Cloud & On-Premises Deployment	69ef25bbc1a60f7bf0a1dc32
6	17	51	Document Security	69ef25bbc1a60f7bf0a1dc33
1	18	52	Flexible Data Collection & Integration	69ef25bbc1a60f7bf0a1dc34
2	18	53	Real-Time Monitoring and Analysis	69ef25bbc1a60f7bf0a1dc35
3	18	54	Real-Time Online Dashboard	69ef25bbc1a60f7bf0a1dc36
4	18	55	Automate Real-Time SPC Analysis	69ef25bbc1a60f7bf0a1dc37
5	18	56	Reduce Scrap & Costs	69ef25bbc1a60f7bf0a1dc38
6	18	57	Regulatory Compliance	69ef25bbc1a60f7bf0a1dc39
1	19	58	Quality & Consistency	69ef25bbc1a60f7bf0a1dc3a
2	19	59	Process Optimisation	69ef25bbc1a60f7bf0a1dc3b
3	19	60	Better ROI	69ef25bbc1a60f7bf0a1dc3c
4	19	61	Manage Risks & Opportunities	69ef25bbc1a60f7bf0a1dc3d
5	19	62	Operational Excellence	69ef25bbc1a60f7bf0a1dc3e
6	19	63	Better Decision Making	69ef25bbc1a60f7bf0a1dc3f
1	20	64	Quality & Consistency	69ef25bbc1a60f7bf0a1dc40
2	20	65	Customer Satisfaction	69ef25bbc1a60f7bf0a1dc41
3	20	66	Better ROI	69ef25bbc1a60f7bf0a1dc42
4	20	67	Cost Saving	69ef25bbc1a60f7bf0a1dc43
5	20	68	Operational Excellence	69ef25bbc1a60f7bf0a1dc44
6	20	69	Better Decision Making	69ef25bbc1a60f7bf0a1dc45
1	21	70	Servers & Personal Computers	69ef28d641c48849408ec0bc
2	21	71	Software Tools & Components	69ef28d641c48849408ec0bd
3	21	72	Peripherals & Accessories	69ef28d641c48849408ec0be
4	21	73	Enterprise Storage & Backup	69ef28d641c48849408ec0bf
5	21	74	Enterprise Security	69ef28d641c48849408ec0c0
6	21	75	Networking & Communications	69ef28d641c48849408ec0c1
7	21	76	Information Security	69ef28d641c48849408ec0c2
1	22	77	Business Intelligence (BI)	69ef28d641c48849408ec0c3
2	22	78	Big Data Analytics	69ef28d641c48849408ec0c4
3	22	79	Predictive Analytics	69ef28d641c48849408ec0c5
4	22	80	Business Analytics	69ef28d641c48849408ec0c6
5	22	81	Statistical Analytics	69ef28d641c48849408ec0c7
6	22	82	Quality Analytics	69ef28d641c48849408ec0c8
1	23	83	Front-Office Process Automation	69ef28d641c48849408ec0c9
2	23	84	Back-Office Process Automation	69ef28d641c48849408ec0ca
3	23	85	Analytic Process Automation	69ef28d641c48849408ec0cb
4	23	86	QMS Process Automation	69ef28d641c48849408ec0cc
5	23	87	Enhanced Productivity	69ef28d641c48849408ec0cd
6	23	88	Better ROI	69ef28d641c48849408ec0ce
1	24	89	Better ROI	69ef28d641c48849408ec0cf
2	24	90	Predictive Maintenance	69ef28d641c48849408ec0d0
3	24	91	Better Business Decisions	69ef28d641c48849408ec0d1
4	24	92	Operational Excellence	69ef28d641c48849408ec0d2
5	24	93	Manage Risks & Opportunities	69ef28d641c48849408ec0d3
6	24	94	Predict Business Outcomes	69ef28d641c48849408ec0d4
1	25	95	Better ROI	69ef28d641c48849408ec0d5
2	25	96	Quality & Consistency	69ef28d641c48849408ec0d6
3	25	97	Customer Satisfaction	69ef28d641c48849408ec0d7
4	25	98	Operational Excellence	69ef28d641c48849408ec0d8
5	25	99	Cost Saving	69ef28d641c48849408ec0d9
6	25	100	Better Decision Making	69ef28d641c48849408ec0da
1	26	101	Smart Forms Capture	69ef28d641c48849408ec0db
2	26	102	Automated Capture with Easy Index	69ef28d641c48849408ec0dc
3	26	103	Mobile App for iOS & Android	69ef28d641c48849408ec0dd
4	26	104	Analytics & Process Automation Integration	69ef28d641c48849408ec0de
5	26	105	Cloud & On-Premises Deployment	69ef28d641c48849408ec0df
6	26	106	Document Security	69ef28d641c48849408ec0e0
1	27	107	Flexible Data Collection & Integration	69ef28d641c48849408ec0e1
2	27	108	Real-Time Monitoring and Analysis	69ef28d641c48849408ec0e2
3	27	109	Real-Time Online Dashboard	69ef28d641c48849408ec0e3
4	27	110	Automate Real-Time SPC Analysis	69ef28d641c48849408ec0e4
5	27	111	Reduce Scrap & Costs	69ef28d641c48849408ec0e5
6	27	112	Regulatory Compliance	69ef28d641c48849408ec0e6
1	28	113	Quality & Consistency	69ef28d641c48849408ec0e7
2	28	114	Process Optimisation	69ef28d641c48849408ec0e8
3	28	115	Better ROI	69ef28d641c48849408ec0e9
4	28	116	Manage Risks & Opportunities	69ef28d641c48849408ec0ea
5	28	117	Operational Excellence	69ef28d641c48849408ec0eb
6	28	118	Better Decision Making	69ef28d641c48849408ec0ec
1	29	119	Quality & Consistency	69ef28d741c48849408ec0ed
2	29	120	Customer Satisfaction	69ef28d741c48849408ec0ee
3	29	121	Better ROI	69ef28d741c48849408ec0ef
4	29	122	Cost Saving	69ef28d741c48849408ec0f0
5	29	123	Operational Excellence	69ef28d741c48849408ec0f1
6	29	124	Better Decision Making	69ef28d741c48849408ec0f2
1	30	125	Servers & Personal Computers	69ef295bd2ff65210807c762
2	30	126	Software Tools & Components	69ef295bd2ff65210807c763
3	30	127	Peripherals & Accessories	69ef295bd2ff65210807c764
4	30	128	Enterprise Storage & Backup	69ef295bd2ff65210807c765
5	30	129	Enterprise Security	69ef295bd2ff65210807c766
6	30	130	Networking & Communications	69ef295bd2ff65210807c767
7	30	131	Information Security	69ef295bd2ff65210807c768
1	31	132	Business Intelligence (BI)	69ef295bd2ff65210807c769
2	31	133	Big Data Analytics	69ef295bd2ff65210807c76a
3	31	134	Predictive Analytics	69ef295bd2ff65210807c76b
4	31	135	Business Analytics	69ef295bd2ff65210807c76c
5	31	136	Statistical Analytics	69ef295bd2ff65210807c76d
6	31	137	Quality Analytics	69ef295bd2ff65210807c76e
1	32	138	Front-Office Process Automation	69ef295bd2ff65210807c76f
2	32	139	Back-Office Process Automation	69ef295bd2ff65210807c770
3	32	140	Analytic Process Automation	69ef295bd2ff65210807c771
4	32	141	QMS Process Automation	69ef295bd2ff65210807c772
5	32	142	Enhanced Productivity	69ef295bd2ff65210807c773
6	32	143	Better ROI	69ef295bd2ff65210807c774
1	33	144	Better ROI	69ef295bd2ff65210807c775
2	33	145	Predictive Maintenance	69ef295bd2ff65210807c776
3	33	146	Better Business Decisions	69ef295bd2ff65210807c777
4	33	147	Operational Excellence	69ef295bd2ff65210807c778
5	33	148	Manage Risks & Opportunities	69ef295bd2ff65210807c779
6	33	149	Predict Business Outcomes	69ef295bd2ff65210807c77a
1	34	150	Better ROI	69ef295bd2ff65210807c77b
2	34	151	Quality & Consistency	69ef295bd2ff65210807c77c
3	34	152	Customer Satisfaction	69ef295bd2ff65210807c77d
4	34	153	Operational Excellence	69ef295bd2ff65210807c77e
5	34	154	Cost Saving	69ef295bd2ff65210807c77f
6	34	155	Better Decision Making	69ef295bd2ff65210807c780
1	35	156	Smart Forms Capture	69ef295bd2ff65210807c781
2	35	157	Automated Capture with Easy Index	69ef295bd2ff65210807c782
3	35	158	Mobile App for iOS & Android	69ef295bd2ff65210807c783
4	35	159	Analytics & Process Automation Integration	69ef295bd2ff65210807c784
5	35	160	Cloud & On-Premises Deployment	69ef295bd2ff65210807c785
6	35	161	Document Security	69ef295bd2ff65210807c786
1	36	162	Flexible Data Collection & Integration	69ef295bd2ff65210807c787
2	36	163	Real-Time Monitoring and Analysis	69ef295bd2ff65210807c788
3	36	164	Real-Time Online Dashboard	69ef295bd2ff65210807c789
4	36	165	Automate Real-Time SPC Analysis	69ef295bd2ff65210807c78a
5	36	166	Reduce Scrap & Costs	69ef295bd2ff65210807c78b
6	36	167	Regulatory Compliance	69ef295bd2ff65210807c78c
1	37	168	Quality & Consistency	69ef295cd2ff65210807c78d
2	37	169	Process Optimisation	69ef295cd2ff65210807c78e
3	37	170	Better ROI	69ef295cd2ff65210807c78f
4	37	171	Manage Risks & Opportunities	69ef295cd2ff65210807c790
5	37	172	Operational Excellence	69ef295cd2ff65210807c791
6	37	173	Better Decision Making	69ef295cd2ff65210807c792
1	38	174	Quality & Consistency	69ef295cd2ff65210807c793
2	38	175	Customer Satisfaction	69ef295cd2ff65210807c794
3	38	176	Better ROI	69ef295cd2ff65210807c795
4	38	177	Cost Saving	69ef295cd2ff65210807c796
5	38	178	Operational Excellence	69ef295cd2ff65210807c797
6	38	179	Better Decision Making	69ef295cd2ff65210807c798
1	39	180	Servers & Personal Computers	69ef33705419407d0c3003fa
2	39	181	Software Tools & Components	69ef33705419407d0c3003fb
3	39	182	Peripherals & Accessories	69ef33705419407d0c3003fc
4	39	183	Enterprise Storage & Backup	69ef33705419407d0c3003fd
5	39	184	Enterprise Security	69ef33705419407d0c3003fe
6	39	185	Networking & Communications	69ef33705419407d0c3003ff
7	39	186	Information Security	69ef33705419407d0c300400
1	40	187	Business Intelligence (BI)	69ef33705419407d0c300401
2	40	188	Big Data Analytics	69ef33705419407d0c300402
3	40	189	Predictive Analytics	69ef33705419407d0c300403
4	40	190	Business Analytics	69ef33705419407d0c300404
5	40	191	Statistical Analytics	69ef33705419407d0c300405
6	40	192	Quality Analytics	69ef33705419407d0c300406
1	41	193	Front-Office Process Automation	69ef33705419407d0c300407
2	41	194	Back-Office Process Automation	69ef33705419407d0c300408
3	41	195	Analytic Process Automation	69ef33705419407d0c300409
4	41	196	QMS Process Automation	69ef33705419407d0c30040a
5	41	197	Enhanced Productivity	69ef33705419407d0c30040b
6	41	198	Better ROI	69ef33705419407d0c30040c
1	42	199	Better ROI	69ef33705419407d0c30040d
2	42	200	Predictive Maintenance	69ef33705419407d0c30040e
3	42	201	Better Business Decisions	69ef33705419407d0c30040f
4	42	202	Operational Excellence	69ef33705419407d0c300410
5	42	203	Manage Risks & Opportunities	69ef33705419407d0c300411
6	42	204	Predict Business Outcomes	69ef33705419407d0c300412
1	43	205	Better ROI	69ef33705419407d0c300413
2	43	206	Quality & Consistency	69ef33705419407d0c300414
3	43	207	Customer Satisfaction	69ef33705419407d0c300415
4	43	208	Operational Excellence	69ef33705419407d0c300416
5	43	209	Cost Saving	69ef33705419407d0c300417
6	43	210	Better Decision Making	69ef33705419407d0c300418
1	44	211	Smart Forms Capture	69ef33705419407d0c300419
2	44	212	Automated Capture with Easy Index	69ef33705419407d0c30041a
3	44	213	Mobile App for iOS & Android	69ef33705419407d0c30041b
4	44	214	Analytics & Process Automation Integration	69ef33705419407d0c30041c
5	44	215	Cloud & On-Premises Deployment	69ef33705419407d0c30041d
6	44	216	Document Security	69ef33705419407d0c30041e
1	45	217	Flexible Data Collection & Integration	69ef33705419407d0c30041f
2	45	218	Real-Time Monitoring and Analysis	69ef33705419407d0c300420
3	45	219	Real-Time Online Dashboard	69ef33705419407d0c300421
4	45	220	Automate Real-Time SPC Analysis	69ef33705419407d0c300422
5	45	221	Reduce Scrap & Costs	69ef33705419407d0c300423
6	45	222	Regulatory Compliance	69ef33705419407d0c300424
1	46	223	Quality & Consistency	69ef33705419407d0c300425
2	46	224	Process Optimisation	69ef33705419407d0c300426
3	46	225	Better ROI	69ef33705419407d0c300427
4	46	226	Manage Risks & Opportunities	69ef33705419407d0c300428
5	46	227	Operational Excellence	69ef33705419407d0c300429
6	46	228	Better Decision Making	69ef33705419407d0c30042a
1	47	229	Quality & Consistency	69ef33705419407d0c30042b
2	47	230	Customer Satisfaction	69ef33705419407d0c30042c
3	47	231	Better ROI	69ef33705419407d0c30042d
4	47	232	Cost Saving	69ef33705419407d0c30042e
5	47	233	Operational Excellence	69ef33705419407d0c30042f
6	47	234	Better Decision Making	69ef33705419407d0c300430
1	48	235	Servers & Personal Computers	69ef36552f92593bd48ea38c
2	48	236	Software Tools & Components	69ef36552f92593bd48ea38d
3	48	237	Peripherals & Accessories	69ef36552f92593bd48ea38e
4	48	238	Enterprise Storage & Backup	69ef36552f92593bd48ea38f
5	48	239	Enterprise Security	69ef36552f92593bd48ea390
6	48	240	Networking & Communications	69ef36552f92593bd48ea391
7	48	241	Information Security	69ef36552f92593bd48ea392
1	49	242	Business Intelligence (BI)	69ef36552f92593bd48ea393
2	49	243	Big Data Analytics	69ef36552f92593bd48ea394
3	49	244	Predictive Analytics	69ef36552f92593bd48ea395
4	49	245	Business Analytics	69ef36552f92593bd48ea396
5	49	246	Statistical Analytics	69ef36552f92593bd48ea397
6	49	247	Quality Analytics	69ef36552f92593bd48ea398
1	50	248	Front-Office Process Automation	69ef36552f92593bd48ea399
2	50	249	Back-Office Process Automation	69ef36552f92593bd48ea39a
3	50	250	Analytic Process Automation	69ef36552f92593bd48ea39b
4	50	251	QMS Process Automation	69ef36552f92593bd48ea39c
5	50	252	Enhanced Productivity	69ef36552f92593bd48ea39d
6	50	253	Better ROI	69ef36552f92593bd48ea39e
1	51	254	Better ROI	69ef36552f92593bd48ea39f
2	51	255	Predictive Maintenance	69ef36552f92593bd48ea3a0
3	51	256	Better Business Decisions	69ef36552f92593bd48ea3a1
4	51	257	Operational Excellence	69ef36552f92593bd48ea3a2
5	51	258	Manage Risks & Opportunities	69ef36552f92593bd48ea3a3
6	51	259	Predict Business Outcomes	69ef36552f92593bd48ea3a4
1	52	260	Better ROI	69ef36552f92593bd48ea3a5
2	52	261	Quality & Consistency	69ef36552f92593bd48ea3a6
3	52	262	Customer Satisfaction	69ef36552f92593bd48ea3a7
4	52	263	Operational Excellence	69ef36552f92593bd48ea3a8
5	52	264	Cost Saving	69ef36552f92593bd48ea3a9
6	52	265	Better Decision Making	69ef36552f92593bd48ea3aa
1	53	266	Smart Forms Capture	69ef36552f92593bd48ea3ab
2	53	267	Automated Capture with Easy Index	69ef36552f92593bd48ea3ac
3	53	268	Mobile App for iOS & Android	69ef36552f92593bd48ea3ad
4	53	269	Analytics & Process Automation Integration	69ef36552f92593bd48ea3ae
5	53	270	Cloud & On-Premises Deployment	69ef36552f92593bd48ea3af
6	53	271	Document Security	69ef36552f92593bd48ea3b0
1	54	272	Flexible Data Collection & Integration	69ef36562f92593bd48ea3b1
2	54	273	Real-Time Monitoring and Analysis	69ef36562f92593bd48ea3b2
3	54	274	Real-Time Online Dashboard	69ef36562f92593bd48ea3b3
4	54	275	Automate Real-Time SPC Analysis	69ef36562f92593bd48ea3b4
5	54	276	Reduce Scrap & Costs	69ef36562f92593bd48ea3b5
6	54	277	Regulatory Compliance	69ef36562f92593bd48ea3b6
1	55	278	Quality & Consistency	69ef36562f92593bd48ea3b7
2	55	279	Process Optimisation	69ef36562f92593bd48ea3b8
3	55	280	Better ROI	69ef36562f92593bd48ea3b9
4	55	281	Manage Risks & Opportunities	69ef36562f92593bd48ea3ba
5	55	282	Operational Excellence	69ef36562f92593bd48ea3bb
6	55	283	Better Decision Making	69ef36562f92593bd48ea3bc
1	56	284	Quality & Consistency	69ef36562f92593bd48ea3bd
2	56	285	Customer Satisfaction	69ef36562f92593bd48ea3be
3	56	286	Better ROI	69ef36562f92593bd48ea3bf
4	56	287	Cost Saving	69ef36562f92593bd48ea3c0
5	56	288	Operational Excellence	69ef36562f92593bd48ea3c1
6	56	289	Better Decision Making	69ef36562f92593bd48ea3c2
1	57	290	Servers & Personal Computers	69ef36baceae1173f40a26b5
2	57	291	Software Tools & Components	69ef36baceae1173f40a26b6
3	57	292	Peripherals & Accessories	69ef36baceae1173f40a26b7
4	57	293	Enterprise Storage & Backup	69ef36baceae1173f40a26b8
5	57	294	Enterprise Security	69ef36baceae1173f40a26b9
6	57	295	Networking & Communications	69ef36baceae1173f40a26ba
7	57	296	Information Security	69ef36baceae1173f40a26bb
1	58	297	Business Intelligence (BI)	69ef36baceae1173f40a26bc
2	58	298	Big Data Analytics	69ef36baceae1173f40a26bd
3	58	299	Predictive Analytics	69ef36baceae1173f40a26be
4	58	300	Business Analytics	69ef36baceae1173f40a26bf
5	58	301	Statistical Analytics	69ef36baceae1173f40a26c0
6	58	302	Quality Analytics	69ef36baceae1173f40a26c1
1	59	303	Front-Office Process Automation	69ef36baceae1173f40a26c2
2	59	304	Back-Office Process Automation	69ef36baceae1173f40a26c3
3	59	305	Analytic Process Automation	69ef36baceae1173f40a26c4
4	59	306	QMS Process Automation	69ef36baceae1173f40a26c5
5	59	307	Enhanced Productivity	69ef36baceae1173f40a26c6
6	59	308	Better ROI	69ef36baceae1173f40a26c7
1	60	309	Better ROI	69ef36baceae1173f40a26c8
2	60	310	Predictive Maintenance	69ef36baceae1173f40a26c9
3	60	311	Better Business Decisions	69ef36baceae1173f40a26ca
4	60	312	Operational Excellence	69ef36baceae1173f40a26cb
5	60	313	Manage Risks & Opportunities	69ef36baceae1173f40a26cc
6	60	314	Predict Business Outcomes	69ef36baceae1173f40a26cd
1	61	315	Better ROI	69ef36baceae1173f40a26ce
2	61	316	Quality & Consistency	69ef36baceae1173f40a26cf
3	61	317	Customer Satisfaction	69ef36baceae1173f40a26d0
4	61	318	Operational Excellence	69ef36baceae1173f40a26d1
5	61	319	Cost Saving	69ef36baceae1173f40a26d2
6	61	320	Better Decision Making	69ef36baceae1173f40a26d3
1	62	321	Smart Forms Capture	69ef36baceae1173f40a26d4
2	62	322	Automated Capture with Easy Index	69ef36baceae1173f40a26d5
3	62	323	Mobile App for iOS & Android	69ef36baceae1173f40a26d6
4	62	324	Analytics & Process Automation Integration	69ef36baceae1173f40a26d7
5	62	325	Cloud & On-Premises Deployment	69ef36baceae1173f40a26d8
6	62	326	Document Security	69ef36baceae1173f40a26d9
1	63	327	Flexible Data Collection & Integration	69ef36baceae1173f40a26da
2	63	328	Real-Time Monitoring and Analysis	69ef36baceae1173f40a26db
3	63	329	Real-Time Online Dashboard	69ef36baceae1173f40a26dc
4	63	330	Automate Real-Time SPC Analysis	69ef36baceae1173f40a26dd
5	63	331	Reduce Scrap & Costs	69ef36baceae1173f40a26de
6	63	332	Regulatory Compliance	69ef36baceae1173f40a26df
1	64	333	Quality & Consistency	69ef36baceae1173f40a26e0
2	64	334	Process Optimisation	69ef36baceae1173f40a26e1
3	64	335	Better ROI	69ef36baceae1173f40a26e2
4	64	336	Manage Risks & Opportunities	69ef36baceae1173f40a26e3
5	64	337	Operational Excellence	69ef36baceae1173f40a26e4
6	64	338	Better Decision Making	69ef36baceae1173f40a26e5
1	65	339	Quality & Consistency	69ef36baceae1173f40a26e6
2	65	340	Customer Satisfaction	69ef36baceae1173f40a26e7
3	65	341	Better ROI	69ef36baceae1173f40a26e8
4	65	342	Cost Saving	69ef36baceae1173f40a26e9
5	65	343	Operational Excellence	69ef36baceae1173f40a26ea
6	65	344	Better Decision Making	69ef36baceae1173f40a26eb
\.


--
-- Data for Name: _webinars_v; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._webinars_v (id, parent_id, version_title, version_slug, version_event_status, version_date, version_short_description, version_description, version_cover_image_id, version_registration_url, version_recording_url, version_partner_id, version_seo_meta_title, version_seo_meta_description, version_seo_og_image_id, version_seo_no_index, version_updated_at, version_created_at, version__status, created_at, updated_at, latest, version_registration_form_id) FROM stdin;
12	3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f334ec15ce175a0c87aa7f", "type": "upload", "value": 20, "fields": {"width": null, "alignment": "left"}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:38:02.924+05:30	2026-04-30 16:38:02.923+05:30	published	2026-04-30 16:38:04.576+05:30	2026-04-30 16:38:04.576+05:30	f	4
5	1	Qsutra Analytical Tool Webinar	qsutra-analytical-tool-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the Qsutra Analytical Tool. This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Students and Professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date: 25 April 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Time: To be announced", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Mode: Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical usage of the Qsutra Analytical Tool, helping you understand how to extract meaningful insights and apply them effectively in real-world scenarios.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Click the registration link to reserve your spot and get access details.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We look forward to seeing you in the session", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	1	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-27 07:29:38.734+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-27 07:29:38.819+05:30	2026-04-27 07:29:38.819+05:30	f	\N
4	1	Building Scalable Web Applications with Spring Boot & React	spring-boot-react-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to build scalable, secure, and high-performance web applications using Spring Boot and React in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Here’s your content converted into **plain text (no markdown, no symbols)** 👇", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on building modern, scalable web applications using Spring Boot and React. This webinar is designed for developers who want to improve their full-stack skills and build production-ready applications.", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You’ll Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Architecture of scalable web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building REST APIs with Spring Boot", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Integrating React frontend with backend services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Authentication and security best practices", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Performance optimization techniques", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world project structure and deployment tips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frontend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Backend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full Stack Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Engineering Students", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic knowledge of Java or JavaScript", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web development concepts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date: [Select Date]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time: [Add Time]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode: Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical implementation, helping you understand how real-world applications are built and scaled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Click the registration link to reserve your spot and get access details.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We look forward to seeing you in the session 🚀", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	1	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-22 16:47:52.464+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-22 16:47:52.509+05:30	2026-04-22 16:47:52.509+05:30	f	\N
7	1	Qsutra Analytical Tool Webinar	qsutra-analytical-tool-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the Qsutra Analytical Tool. This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 25 April 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Time:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " To be announced", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Mode:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical usage of the Qsutra Analytical Tool, helping you understand how to extract meaningful insights and apply them effectively in real-world scenarios.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	1	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-27 07:43:27.296+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-27 07:43:27.362+05:30	2026-04-27 07:43:27.362+05:30	t	1
1	1	Building Scalable Web Applications with Spring Boot & React	spring-boot-react-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to build scalable, secure, and high-performance web applications using Spring Boot and React in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on building modern, scalable web applications using **Spring Boot** and **React**. This webinar is designed for developers who want to improve their full-stack skills and build production-ready applications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## What You’ll Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Architecture of scalable web applications  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Building REST APIs with Spring Boot  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Integrating React frontend with backend services  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Authentication & security best practices  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Performance optimization techniques  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Real-world project structure and deployment tips  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Who Should Attend?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Frontend Developers  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Backend Developers  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Full Stack Developers  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Software Engineering Students  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Basic knowledge of Java or JavaScript  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- Familiarity with web development concepts  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- 📅 Date: [Select Date]  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- ⏰ Time: [Add Time]  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "- 📍 Mode: Online  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Why Attend?", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical implementation, helping you understand how real-world applications are built and scaled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "## Registration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Click the registration link to reserve your spot and get access details.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We look forward to seeing you in the session 🚀", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-22 08:40:04.575+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-22 08:40:04.754+05:30	2026-04-22 08:40:04.754+05:30	f	\N
3	1	Building Scalable Web Applications with Spring Boot & React	spring-boot-react-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to build scalable, secure, and high-performance web applications using Spring Boot and React in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Here’s your content converted into **plain text (no markdown, no symbols)** 👇", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on building modern, scalable web applications using Spring Boot and React. This webinar is designed for developers who want to improve their full-stack skills and build production-ready applications.", "type": "text", "style": "", "detail": 0, "format": 2, "version": 1}], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 2}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You’ll Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Architecture of scalable web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building REST APIs with Spring Boot", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Integrating React frontend with backend services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Authentication and security best practices", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Performance optimization techniques", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world project structure and deployment tips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frontend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Backend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full Stack Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Engineering Students", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic knowledge of Java or JavaScript", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web development concepts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date: [Select Date]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time: [Add Time]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode: Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical implementation, helping you understand how real-world applications are built and scaled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Click the registration link to reserve your spot and get access details.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We look forward to seeing you in the session 🚀", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-22 16:47:34.68+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-22 16:47:34.731+05:30	2026-04-22 16:47:34.731+05:30	f	\N
6	1	Qsutra Analytical Tool Webinar	qsutra-analytical-tool-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the Qsutra Analytical Tool. This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 25 April 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Time:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " To be announced", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Mode:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical usage of the Qsutra Analytical Tool, helping you understand how to extract meaningful insights and apply them effectively in real-world scenarios.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	1	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-27 07:33:19.316+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-27 07:33:19.401+05:30	2026-04-27 07:33:19.401+05:30	f	\N
2	1	Building Scalable Web Applications with Spring Boot & React	spring-boot-react-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to build scalable, secure, and high-performance web applications using Spring Boot and React in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Here’s your content converted into **plain text (no markdown, no symbols)** 👇", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "---", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on building modern, scalable web applications using Spring Boot and React. This webinar is designed for developers who want to improve their full-stack skills and build production-ready applications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You’ll Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Architecture of scalable web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Building REST APIs with Spring Boot", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Integrating React frontend with backend services", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Authentication and security best practices", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Performance optimization techniques", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world project structure and deployment tips", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Frontend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Backend Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full Stack Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Software Engineering Students", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic knowledge of Java or JavaScript", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web development concepts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date: [Select Date]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time: [Add Time]", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode: Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical implementation, helping you understand how real-world applications are built and scaled.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Registration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Click the registration link to reserve your spot and get access details.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We look forward to seeing you in the session 🚀", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-22 08:40:19.001+05:30	2026-04-22 08:40:04.574+05:30	published	2026-04-22 08:40:19.025+05:30	2026-04-22 08:40:19.025+05:30	f	\N
11	2	GageFx Intro	gagefx-intro	upcoming	2026-04-27 00:00:00+05:30	Sample	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Qsutra Analytical Tool.", "type": "text", "style": "", "detail": 0, "format": 4, "version": 1}, {"mode": "normal", "text": " This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}}	19	\N	\N	\N	\N	\N	\N	f	2026-04-30 09:14:42.585+05:30	2026-04-27 16:29:54.759+05:30	published	2026-04-30 09:14:42.624+05:30	2026-04-30 09:14:42.624+05:30	t	1
8	2	GageFx Intro	gagefx-intro	upcoming	2026-04-27 00:00:00+05:30	Sample	\N	19	\N	\N	\N	\N	\N	\N	f	2026-04-27 16:29:54.76+05:30	2026-04-27 16:29:54.759+05:30	published	2026-04-27 16:29:54.942+05:30	2026-04-27 16:29:54.942+05:30	f	2
9	2	GageFx Intro	gagefx-intro	upcoming	2026-04-27 00:00:00+05:30	Sample	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Qsutra Analytical Tool.", "type": "text", "style": "", "detail": 0, "format": 4, "version": 1}, {"mode": "normal", "text": " This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}}	19	\N	\N	\N	\N	\N	\N	f	2026-04-27 16:31:52.828+05:30	2026-04-27 16:29:54.759+05:30	published	2026-04-27 16:31:52.87+05:30	2026-04-27 16:31:52.87+05:30	f	2
10	2	GageFx Intro	gagefx-intro	upcoming	2026-04-27 00:00:00+05:30	Sample	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Qsutra Analytical Tool.", "type": "text", "style": "", "detail": 0, "format": 4, "version": 1}, {"mode": "normal", "text": " This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}}	19	\N	\N	\N	\N	\N	\N	f	2026-04-30 09:14:14.433+05:30	2026-04-27 16:29:54.759+05:30	published	2026-04-30 09:14:14.458+05:30	2026-04-30 09:14:14.458+05:30	f	2
16	3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f3391915ce175a0c87aa80", "type": "upload", "value": 24, "fields": {"width": 500, "height": 600, "alignment": "left"}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:49:14.776+05:30	2026-04-30 16:38:02.923+05:30	published	2026-04-30 16:49:14.843+05:30	2026-04-30 16:49:14.843+05:30	t	4
15	3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f3391915ce175a0c87aa80", "type": "upload", "value": 24, "fields": {"width": 15, "height": 15, "alignment": "left"}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:46:44.357+05:30	2026-04-30 16:38:02.923+05:30	published	2026-04-30 16:46:44.406+05:30	2026-04-30 16:46:44.406+05:30	f	4
14	3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f3391915ce175a0c87aa80", "type": "upload", "value": 24, "fields": {"width": 15, "height": 15, "alignment": "left"}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:45:52.418+05:30	2026-04-30 16:38:02.923+05:30	published	2026-04-30 16:45:52.514+05:30	2026-04-30 16:45:52.514+05:30	f	4
13	3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f3391915ce175a0c87aa80", "type": "upload", "value": 24, "fields": null, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:42:31.729+05:30	2026-04-30 16:38:02.923+05:30	published	2026-04-30 16:42:31.809+05:30	2026-04-30 16:42:31.809+05:30	f	4
\.


--
-- Data for Name: _webinars_v_version_speakers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._webinars_v_version_speakers (_order, _parent_id, id, name, role, photo_id, _uuid) FROM stdin;
1	12	1	Nootan	SalesForce Lead	23	69f3354815ac974356066154
1	13	2	Nootan	SalesForce Lead	23	69f3354815ac974356066154
1	14	3	Nootan	SalesForce Lead	23	69f3354815ac974356066154
1	15	4	Nootan	SalesForce Lead	23	69f3354815ac974356066154
1	16	5	Nootan	SalesForce Lead	23	69f3354815ac974356066154
\.


--
-- Data for Name: contact_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_submissions (id, name, email, phone, company, subject, message, status, updated_at, created_at) FROM stdin;
1	Nandini Chikkatumbal	ncnandini28@gmail.com	+918197220145	Swajyot	sample test subject	writing a message to check the website	new	2026-04-22 08:08:39.682+05:30	2026-04-22 08:08:39.682+05:30
2	NANDINI N C	nandininc1212@gmail.com	8197220145	techwave	webinar	sample	new	2026-04-22 14:19:00.145+05:30	2026-04-22 14:19:00.145+05:30
3	Nandini Chikkatumbal	ncnandini28@gmail.com	+918197220145	Swajyot	sample test subject	asdfgh	new	2026-04-22 16:50:15.116+05:30	2026-04-22 16:50:15.116+05:30
\.


--
-- Data for Name: footer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer (id, brand_description, show_address, show_social, copyright, updated_at, created_at) FROM stdin;
1	Over 10 years helping companies reach their financial and branding goals through Digital Transformation Solutions & Services.	t	t	\N	2026-04-22 08:20:14.458+05:30	2026-04-22 08:18:21.539+05:30
\.


--
-- Data for Name: footer_bottom_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_bottom_links (_order, _parent_id, id, label, url) FROM stdin;
1	1	69e8374dfad2621118a3f74e	Privacy Policy	/pages/privacy-policy
\.


--
-- Data for Name: footer_columns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_columns (_order, _parent_id, id, heading) FROM stdin;
1	1	69e8370ffad2621118a3f74a	Solutions
\.


--
-- Data for Name: footer_columns_links; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_columns_links (_order, _parent_id, id, label, url) FROM stdin;
1	69e8370ffad2621118a3f74a	69e83718fad2621118a3f74c	Enterprise Computing Management	/solutions/enterprise-computing-management
\.


--
-- Data for Name: form_submissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_submissions (id, form_id, updated_at, created_at) FROM stdin;
1	1	2026-04-27 07:43:50.797+05:30	2026-04-27 07:43:50.796+05:30
2	1	2026-04-27 10:25:34.188+05:30	2026-04-27 10:25:34.186+05:30
3	1	2026-04-27 10:31:12.518+05:30	2026-04-27 10:31:12.517+05:30
4	1	2026-04-27 16:09:10.457+05:30	2026-04-27 16:09:10.453+05:30
5	2	2026-04-27 16:32:24.254+05:30	2026-04-27 16:32:24.253+05:30
6	2	2026-04-27 16:33:56.005+05:30	2026-04-27 16:33:56.005+05:30
7	2	2026-04-27 16:34:15.042+05:30	2026-04-27 16:34:15.04+05:30
8	1	2026-04-30 09:16:10.302+05:30	2026-04-30 09:16:10.3+05:30
\.


--
-- Data for Name: form_submissions_submission_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.form_submissions_submission_data (_order, _parent_id, id, field, value) FROM stdin;
1	1	69eec65edce7624f50fdb71c	name	Nandini Chikkatumbal
2	1	69eec65edce7624f50fdb71d	email	ncnandini28@gmail.com
3	1	69eec65edce7624f50fdb71e	phone	8197220145
4	1	69eec65edce7624f50fdb71f	gender	f
1	2	69eeec45d0fc4c6ca0d04527	name	Nandini Narayan
2	2	69eeec45d0fc4c6ca0d04528	email	nandininc1212@gmail.com
3	2	69eeec45d0fc4c6ca0d04529	phone	8197220145
4	2	69eeec45d0fc4c6ca0d0452a	gender	f
1	3	69eeed98d0fc4c6ca0d0452b	name	Nandini Narayan
2	3	69eeed98d0fc4c6ca0d0452c	email	ncnandini28@gmail.com
3	3	69eeed98d0fc4c6ca0d0452d	phone	8197220145
4	3	69eeed98d0fc4c6ca0d0452e	gender	female
1	4	69ef3ccef44b6667f819e707	name	Nandini Chikkatumbal
2	4	69ef3ccef44b6667f819e708	email	ncnandini28@gmail.com
3	4	69ef3ccef44b6667f819e709	phone	8197220145
4	4	69ef3ccef44b6667f819e70a	gender	female
1	7	69ef42aef44b6667f819e70b	nandini	yes
1	8	69f2d082dc014b8eacee7f50	name	Nandini Chikkatumbal
2	8	69f2d082dc014b8eacee7f51	email	ncnandini28@gmail.com
3	8	69f2d082dc014b8eacee7f52	phone	8197220145
4	8	69f2d082dc014b8eacee7f53	gender	
\.


--
-- Data for Name: forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms (id, title, submit_button_label, confirmation_type, confirmation_message, redirect_type, redirect_url, slug, description, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, email_settings_send_confirmation_email, email_settings_send_notification_email, email_settings_submitter_email_field, email_settings_confirmation_subject, email_settings_confirmation_body, email_settings_notify_to, email_settings_notification_subject, email_settings_notification_body, updated_at, created_at, _status) FROM stdin;
1	Qsutra Analytical Tool Webinar Link	\N	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thank you for regirstering", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	qsutra-analytical-tool-webinar	\N	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-27 10:30:03.919+05:30	2026-04-27 07:43:13.812+05:30	published
2	GageFx Intro	Apply	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "thankuuu", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-intro	\N	\N	\N	\N	f	t	t	email	\N	Thanku....	\N	\N	\N	2026-04-27 16:33:47.713+05:30	2026-04-27 16:28:25.146+05:30	published
3	\N	\N	message	\N	reference	\N	\N	\N	\N	\N	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-27 16:36:04.266+05:30	2026-04-27 16:36:04.265+05:30	draft
4	GageFx Inro Webinar	\N	message	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Submit ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	reference	\N	gagefx-inro-webinar	\N	\N	\N	\N	f	t	t	email	\N	\N	\N	\N	\N	2026-04-30 16:37:35.595+05:30	2026-04-30 16:37:35.591+05:30	published
\.


--
-- Data for Name: forms_blocks_checkbox; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_checkbox (_order, _parent_id, _path, id, name, label, width, required, default_value, block_name) FROM stdin;
1	3	fields	69ef42d10306e6243d8e3b7a	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: forms_blocks_email; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_email (_order, _parent_id, _path, id, name, label, width, required, block_name) FROM stdin;
2	1	fields	69eec5d203be0f4f01d4ed3e	email	Enter Email	\N	t	\N
2	3	fields	69ef42dc0306e6243d8e3b7c	\N	\N	\N	\N	\N
\.


--
-- Data for Name: forms_blocks_message; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_message (_order, _parent_id, _path, id, message, block_name) FROM stdin;
5	1	fields	69eeed46d2e9e0ddd3d2e3d4	\N	\N
\.


--
-- Data for Name: forms_blocks_number; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_number (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
3	1	fields	69eec5df03be0f4f01d4ed40	phone	Enter Phone	\N	\N	\N	\N
\.


--
-- Data for Name: forms_blocks_select; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_select (_order, _parent_id, _path, id, name, label, width, default_value, placeholder, required, block_name) FROM stdin;
4	1	fields	69eec5f403be0f4f01d4ed42	gender	Select gender	\N	\N	\N	\N	\N
1	2	fields	69ef426b0306e6243d8e3b76	nandini	n	\N	\N	\N	\N	\N
3	3	fields	69ef42e90306e6243d8e3b7e	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: forms_blocks_select_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_select_options (_order, _parent_id, id, label, value) FROM stdin;
1	69eec5f403be0f4f01d4ed42	69eec60b03be0f4f01d4ed44	Male	male
2	69eec5f403be0f4f01d4ed42	69eec61103be0f4f01d4ed46	Female	female
1	69ef426b0306e6243d8e3b76	69ef42750306e6243d8e3b78	sjsg	yes
\.


--
-- Data for Name: forms_blocks_text; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_text (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
1	1	fields	69eec5c903be0f4f01d4ed3c	name	Enter Name	\N	\N	\N	\N
1	4	fields	69f3374415ac974356066156	name	Enter Name	\N	\N	t	Enter Name
\.


--
-- Data for Name: forms_blocks_textarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_blocks_textarea (_order, _parent_id, _path, id, name, label, width, default_value, required, block_name) FROM stdin;
\.


--
-- Data for Name: forms_emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_emails (_order, _parent_id, id, email_to, cc, bcc, reply_to, email_from, subject, message) FROM stdin;
1	2	69ef40d1592ed73d09895c7f	\N	info@swajyot.co.in	\N	info@swajyot.co.in	info@swajyot.co.in	You've received a new message.	\N
\.


--
-- Data for Name: forms_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forms_rels (id, "order", parent_id, path, pages_id) FROM stdin;
\.


--
-- Data for Name: industries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industries (id, title, slug, short_description, description, cover_image_id, icon_id, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at, _status) FROM stdin;
2	Information Technology & Software Services	information-technology-software-services	Custom software development, cloud solutions, and digital transformation services tailored for modern businesses.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Full Description", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We empower businesses with innovative Information Technology and Software Services designed to improve efficiency, scalability, and growth. Our expertise covers custom software development, web and mobile applications, enterprise solutions, cloud integration, DevOps, and IT consulting.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From startups to large enterprises, we help organizations streamline operations, enhance customer experiences, and accelerate digital transformation using modern technologies and best practices.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our team specializes in delivering secure, scalable, and high-performance solutions that align with business goals while ensuring long-term sustainability and innovation.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Whether it’s building robust backend systems, modern frontend applications, or complete end-to-end digital platforms, we provide technology solutions that drive real business value.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Information Technology & Software Services | Swajyot	Expert software development, cloud solutions, and IT consulting services for startups and enterprises to accelerate digital transformation.\n\nSuggested Solutions\nCustom Software Development\nWeb Application Development\nMobile App Development\nCloud Solutions\nDevOps & Automation\nEnterprise Application Development\nAPI Development & Integration\nIT Consulting Services	\N	f	2026-04-27 08:23:56.151+05:30	2026-04-27 08:23:56.151+05:30	published
3	Banking, Financial Services & Insurance (BFSI)	banking-financial-services-insurance-bfsi	Secure digital solutions for banking, financial services, and insurance businesses to improve operations, customer experience, and compliance.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Swajyot delivers advanced technology solutions for Banking, Financial Services, and Insurance (BFSI) organizations, helping them modernize operations, strengthen security, and enhance customer trust in a rapidly evolving financial ecosystem.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our expertise includes core banking solutions, digital payment platforms, fintech applications, loan management systems, insurance claim processing platforms, customer onboarding systems, fraud detection solutions, and compliance-driven enterprise applications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We support banks, NBFCs, insurance providers, fintech startups, and financial institutions with scalable and secure systems that improve transaction efficiency, customer engagement, and regulatory compliance. Our solutions are designed with high-level security, data protection, and seamless integration capabilities.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "From digital banking platforms to insurance automation and financial analytics systems, we help businesses accelerate innovation while ensuring reliability, performance, and risk management.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "With strong domain knowledge and modern technology expertise, Swajyot empowers BFSI organizations to stay competitive and deliver smarter financial services.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	BFSI Software Solutions | Banking & Financial Services | Swajyot	Secure software solutions for banking, fintech, insurance, and financial services including digital payments, loan systems, and compliance platforms.	\N	f	2026-04-27 08:25:13.855+05:30	2026-04-27 08:25:13.855+05:30	published
5	Pharmaceuticals & Life Sciences	pharmaceuticals-life-sciences	Critical drug study & development, clinical trials, and regulatory compliance reporting powered by advanced analytics and automation.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences organisations require the highest standards of data integrity, regulatory compliance, and analytical rigour.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's solutions support critical drug study & development, clinical trials, regulatory compliance reporting, data analytics, and clinical data management — with emphasis on cost efficiency and operational excellence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.449+05:30	2026-04-27 14:46:12.726+05:30	published
1	Healthcare	healthcare	Deliver affordable, accessible, and robust healthcare services through analytics, automation, and electronic health record management.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare organisations face mounting pressure to deliver affordable, accessible, and high-quality patient care while managing complex operational and compliance requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records management — freeing clinical staff to focus on patient outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	Healthcare IT Solutions | Digital Transformation | Swajyot	Explore healthcare IT solutions including EHR, telemedicine, and data analytics to improve patient care, security, and operational efficiency.	\N	f	2026-04-27 15:43:15.473+05:30	2026-04-22 08:43:13.04+05:30	published
4	General Manufacturing	general-manufacturing	Data-driven quality control, process automation, and operational excellence solutions tailored for manufacturers of all sizes.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot provides manufacturers with integrated analytics, quality management, and automation solutions to continuously monitor quality, costs, defects, and customer satisfaction.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.407+05:30	2026-04-27 14:46:12.51+05:30	published
6	Energy & Resources	energy-resources	Operational excellence, predictive maintenance, and data-driven decision-making for energy and resource sector organisations.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Energy & Resources organisations must operate with maximum efficiency, reliability, and safety while navigating volatile markets and increasing regulatory demands.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's analytics, process automation, and decision management solutions help energy organisations reduce downtime, optimise asset performance, and make faster, better-informed decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	\N	\N	\N	\N	\N	f	2026-04-27 15:43:15.497+05:30	2026-04-27 14:46:12.833+05:30	published
\.


--
-- Data for Name: industries_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.industries_rels (id, "order", parent_id, path, solutions_id) FROM stdin;
1	1	3	solutions	2
\.


--
-- Data for Name: main_nav; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_nav (id, updated_at, created_at) FROM stdin;
1	2026-04-22 07:59:30.509+05:30	2026-04-22 07:59:30.509+05:30
\.


--
-- Data for Name: main_nav_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_nav_items (_order, _parent_id, id, label, link) FROM stdin;
1	1	69e8323061f0e0715d802b83	Solutions	/solutions
2	1	69e8329861f0e0715d802b89	Services	/services
3	1	69e832b961f0e0715d802b8b	Explore	/explore
\.


--
-- Data for Name: main_nav_items_children; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.main_nav_items_children (_order, _parent_id, id, label, link, description) FROM stdin;
1	69e8323061f0e0715d802b83	69e84243fad2621118a3f764	Data Analytics	data-analytics-business-intelligence	\N
2	69e8323061f0e0715d802b83	69e84269fad2621118a3f766	Analytics & AI	analytics-ai	\N
3	69e8323061f0e0715d802b83	69ee54d902b4120a6d728c34	Enterprise Computing Management	enterprise-computing-management	\N
1	69e8329861f0e0715d802b89	69ee506102b4120a6d728c30	Software Development	software-developement	\N
2	69e8329861f0e0715d802b89	69ee507202b4120a6d728c32	Analytics Outsourcing	data-analytics-outsourcing	\N
1	69e832b961f0e0715d802b8b	69e833e7fad2621118a3f742	About Us	/explore/about-us	\N
2	69e832b961f0e0715d802b8b	69e83471fad2621118a3f744	Webinars	/explore/webinars	\N
3	69e832b961f0e0715d802b8b	69e83fbffad2621118a3f758	Partners	/explore/partners	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, alt, updated_at, created_at, url, thumbnail_u_r_l, filename, mime_type, filesize, width, height, focal_x, focal_y, sizes_thumbnail_url, sizes_thumbnail_width, sizes_thumbnail_height, sizes_thumbnail_mime_type, sizes_thumbnail_filesize, sizes_thumbnail_filename, sizes_card_url, sizes_card_width, sizes_card_height, sizes_card_mime_type, sizes_card_filesize, sizes_card_filename) FROM stdin;
1	anlytical	2026-04-22 08:13:46.375+05:30	2026-04-22 08:13:46.375+05:30	/api/media/file/Analytics_Outsourcing_BG.jpg	\N	Analytics_Outsourcing_BG.jpg	image/jpeg	31259	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	knime	2026-04-22 08:37:44.849+05:30	2026-04-22 08:37:44.849+05:30	/api/media/file/knime.png	\N	knime.png	image/png	5518	311	162	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	sample	2026-04-22 14:20:45.667+05:30	2026-04-22 14:20:45.667+05:30	/api/media/file/metric_thread_ring_gage_1.jpg	\N	metric_thread_ring_gage_1.jpg	image/jpeg	33130	800	800	50	50	/api/media/file/metric_thread_ring_gage_1-400x300.jpg	400	300	image/jpeg	15243	metric_thread_ring_gage_1-400x300.jpg	/api/media/file/metric_thread_ring_gage_1-768x512.jpg	768	512	image/jpeg	39409	metric_thread_ring_gage_1-768x512.jpg
4	sw-dev-bg	2026-04-27 14:30:37.908+05:30	2026-04-27 14:30:37.897+05:30	/api/media/file/Software_Testing_BG.jpg	\N	Software_Testing_BG.jpg	image/jpeg	31368	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	analytics-bg	2026-04-27 14:30:38.218+05:30	2026-04-27 14:30:38.218+05:30	/api/media/file/Analytics_Outsourcing_BG-1.jpg	\N	Analytics_Outsourcing_BG-1.jpg	image/jpeg	31259	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	minitab-logo	2026-04-27 14:30:38.496+05:30	2026-04-27 14:30:38.496+05:30	/api/media/file/Minitab_Corp_logo.png	\N	Minitab_Corp_logo.png	image/png	8905	300	48	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	apple-logo	2026-04-27 14:30:38.765+05:30	2026-04-27 14:30:38.765+05:30	/api/media/file/Apple_logo.png	\N	Apple_logo.png	image/png	1402	51	60	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	ms-surface-logo	2026-04-27 14:30:39.089+05:30	2026-04-27 14:30:39.089+05:30	/api/media/file/MS_Surface_Logo.jpg	\N	MS_Surface_Logo.jpg	image/jpeg	14074	510	157	50	50	/api/media/file/MS_Surface_Logo-400x300.jpg	400	300	image/jpeg	8655	MS_Surface_Logo-400x300.jpg	\N	\N	\N	\N	\N	\N
9	dell-logo	2026-04-27 14:30:39.36+05:30	2026-04-27 14:30:39.359+05:30	/api/media/file/Dell_logo.png	\N	Dell_logo.png	image/png	1930	59	59	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	siemens-logo	2026-04-27 14:30:39.723+05:30	2026-04-27 14:30:39.723+05:30	/api/media/file/siemens-plm-software_logo.png	\N	siemens-plm-software_logo.png	image/png	4197	417	60	50	50	/api/media/file/siemens-plm-software_logo-400x300.png	400	300	image/png	30096	siemens-plm-software_logo-400x300.png	\N	\N	\N	\N	\N	\N
11	swajyot-logo-blue	2026-04-27 14:30:40.37+05:30	2026-04-27 14:30:40.37+05:30	/api/media/file/Swajyot-Tech-Logo-Slogan-Blue.png	\N	Swajyot-Tech-Logo-Slogan-Blue.png	image/png	61388	1432	600	50	50	/api/media/file/Swajyot-Tech-Logo-Slogan-Blue-400x300.png	400	300	image/png	29509	Swajyot-Tech-Logo-Slogan-Blue-400x300.png	/api/media/file/Swajyot-Tech-Logo-Slogan-Blue-768x512.png	768	512	image/png	66491	Swajyot-Tech-Logo-Slogan-Blue-768x512.png
12	swajyot-logo-side	2026-04-27 14:30:42.292+05:30	2026-04-27 14:30:42.291+05:30	/api/media/file/Swajyot-Tech-Logo-slogan-side.png	\N	Swajyot-Tech-Logo-slogan-side.png	image/png	194973	4702	1214	50	50	/api/media/file/Swajyot-Tech-Logo-slogan-side-400x300.png	400	300	image/png	13016	Swajyot-Tech-Logo-slogan-side-400x300.png	/api/media/file/Swajyot-Tech-Logo-slogan-side-768x512.png	768	512	image/png	27151	Swajyot-Tech-Logo-slogan-side-768x512.png
13	qsutra-logo	2026-04-27 14:30:42.552+05:30	2026-04-27 14:30:42.552+05:30	/api/media/file/Qsutra-Logo-Light-blue-Feb-2022-pkwt87har7eu7nc900q0nozzy1qrafs7uusy32at4w.png	\N	Qsutra-Logo-Light-blue-Feb-2022-pkwt87har7eu7nc900q0nozzy1qrafs7uusy32at4w.png	image/png	3348	161	42	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	ecm-bg	2026-04-27 15:43:11.916+05:30	2026-04-27 15:43:11.914+05:30	/api/media/file/Enterprise-COMPUTING-Management-BG.webp	\N	Enterprise-COMPUTING-Management-BG.webp	image/webp	7958	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
15	aai-bg	2026-04-27 15:43:12.201+05:30	2026-04-27 15:43:12.201+05:30	/api/media/file/Analytics_AI_featured.webp	\N	Analytics_AI_featured.webp	image/webp	9970	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	dpa-bg	2026-04-27 15:43:12.471+05:30	2026-04-27 15:43:12.471+05:30	/api/media/file/Digital-Process-Automation_bg.webp	\N	Digital-Process-Automation_bg.webp	image/webp	4856	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	edm-bg	2026-04-27 15:43:12.734+05:30	2026-04-27 15:43:12.734+05:30	/api/media/file/Enterprise-Decisions-Management-BG.webp	\N	Enterprise-Decisions-Management-BG.webp	image/webp	2450	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
18	eqm-bg	2026-04-27 15:43:13.036+05:30	2026-04-27 15:43:13.036+05:30	/api/media/file/Enterprise-QUALITY-Management-BG.webp	\N	Enterprise-QUALITY-Management-BG.webp	image/webp	3246	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19	eim-bg	2026-04-27 15:43:13.378+05:30	2026-04-27 15:43:13.378+05:30	/api/media/file/Enterprise-Information-Management-BG.webp	\N	Enterprise-Information-Management-BG.webp	image/webp	2706	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
20	spc-bg	2026-04-27 15:43:13.68+05:30	2026-04-27 15:43:13.68+05:30	/api/media/file/Statistical-Process-Control-BG.webp	\N	Statistical-Process-Control-BG.webp	image/webp	7512	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	mfg-bg	2026-04-27 15:43:14.001+05:30	2026-04-27 15:43:14.001+05:30	/api/media/file/Manufacturing-Excellence-BG.webp	\N	Manufacturing-Excellence-BG.webp	image/webp	9260	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
22	svc-bg	2026-04-27 15:43:14.266+05:30	2026-04-27 15:43:14.266+05:30	/api/media/file/Service-Excellence-BG.webp	\N	Service-Excellence-BG.webp	image/webp	4940	370	240	50	50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	Nootan	2026-04-30 16:27:16.627+05:30	2026-04-30 16:27:16.627+05:30	/api/media/file/color-photo.jpeg	\N	color-photo.jpeg	image/jpeg	64080	996	996	50	50	/api/media/file/color-photo-400x300.jpg	400	300	image/jpeg	14459	color-photo-400x300.jpg	/api/media/file/color-photo-768x512.jpg	768	512	image/jpeg	33337	color-photo-768x512.jpg
24	GageFX	2026-04-30 16:42:25.73+05:30	2026-04-30 16:42:25.73+05:30	/api/media/file/metric_thread_ring_gage_1-1.jpg	\N	metric_thread_ring_gage_1-1.jpg	image/jpeg	33130	800	800	50	50	/api/media/file/metric_thread_ring_gage_1-1-400x300.jpg	400	300	image/jpeg	15243	metric_thread_ring_gage_1-1-400x300.jpg	/api/media/file/metric_thread_ring_gage_1-1-768x512.jpg	768	512	image/jpeg	39409	metric_thread_ring_gage_1-1-768x512.jpg
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pages (id, title, slug, content, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at, _status) FROM stdin;
1	Privacy Policy	privacy-policy	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This Privacy Policy unveils the security practices of Swajyot, This Policy administers how we use and ensure individual data that we gather when you visit our site, utilize our administrations, or generally draw in with us. Any practices or indicates that are explicit Swajyot are additionally clearly set apart out in this Policy.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We are attentive about the individual data we request that you give and the individual data that we gather about you through the task of our administrations. We store individual data for just as long as we have the motivation to keep it. We go for full straightforwardness on how we collect, use, and offer your very own information.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data We Collect", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We possibly gather data about you on the off chance that we have the motivation to do as such for instance, to give our Services, to speak with you, or to improve our Services. We gather data in three different ways: if and when you give data to us, consequently through working our Services, and from outside sources, How about we go over the data that we gather.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data You Provide to Us", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "It’s most likely nothing unexpected that we gather data that you give to us. The sum and kind of data rely upon the unique circumstance and how we utilize the data. We perhaps accumulate information about you if we have the inspiration to do all things considered, for example, to give our Services, to talk with you, or to improve our Services. We accumulate information in three distinct ways: if and when you offer information to us, thus through working our Services, and from outside sources, How about we go over the information that we assemble.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "For Cookies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "justify", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We use “cookies” on this site. A treat is a bit of information put away on a site guest’s hard drive to enable us to improve your entrance to our site and distinguish rehash guests to our site. For example, when we utilize a treat to distinguish you, you would not need to sign in a secret phrase more than once, subsequently sparing time while on our site. Cookies can likewise empower us to track and focus on the interests of our clients to upgrade the experience on our site. Utilization of a treat is not the slightest bit connected to any by and by recognizable data on our site.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	Privacy Policy for Swajyot pvt ltd	This Privacy Policy unveils the security practices of Swajyot, This Policy administers how we use and ensure individual data that we gather when you visit our site, utilize our administrations, or generally draw in with us. Any practices or indicates that are explicit Swajyot are additionally clearly set apart out in this Policy.	\N	f	2026-04-22 08:24:05.701+05:30	2026-04-22 08:21:55.761+05:30	published
\.


--
-- Data for Name: partners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners (id, name, slug, category, logo_id, description, detail_content, website, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at) FROM stdin;
1	KNIME	knime	data-analytics	2	KNIME is a leading open-source data analytics platform that enables users to design, build, and deploy data science workflows with ease using a visual interface.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About KNIME", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "KNIME is a powerful data analytics, reporting, and integration platform that allows users to visually create data workflows. It is widely used for data science, machine learning, and business intelligence applications.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key Features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Visual workflow-based analytics with no-code and low-code capabilities  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Seamless integration with Python, R, SQL, and big data technologies  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Advanced machine learning and AI support  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data blending, transformation, and visualization tools  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Open-source platform with enterprise extensions available  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Use Cases", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data preprocessing and transformation  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Machine learning model development  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business intelligence and reporting  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Predictive analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Automation of data workflows  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why KNIME", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "KNIME simplifies complex data processes by providing an intuitive drag-and-drop interface. It is suitable for both beginners and advanced users, enabling faster development and deployment of data-driven solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Integration & Compatibility", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "KNIME integrates with various databases, cloud platforms, and third-party tools, making it a flexible choice for modern data ecosystems.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Official Website", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"type": "autolink", "fields": {"url": "https://www.knime.com/", "linkType": "custom"}, "format": "", "indent": 0, "version": 2, "children": [{"mode": "normal", "text": "https://www.knime.com/", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	https://www.knime.com/	KNIME Data Analytics Platform | Partner | Swajyot	Explore KNIME, a powerful open-source data analytics platform for building data science workflows, machine learning models, and business intelligence solutions.	\N	f	2026-04-22 08:39:30.058+05:30	2026-04-22 08:39:30.058+05:30
2	Minitab	minitab	data-analytics	6	Leading software of choice for Data Analysis, Statistical and Process Excellence Methodologies.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Minitab is the leading software of choice for Data Analysis, Statistical and Process Excellence Methodologies.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As a Minitab partner, Swajyot Technologies delivers world-class statistical analysis, quality improvement, and process excellence solutions to organisations across manufacturing, pharmaceuticals, healthcare, and more.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	https://www.minitab.com	\N	\N	\N	f	2026-04-27 15:43:15.589+05:30	2026-04-27 14:46:13.006+05:30
5	Dell	dell	enterprise-computing	9	Dell provides the latest computer & technology solutions including Laptops, Desktops, Servers, Storage, Monitors & More.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Dell provides the latest computer & technology solutions — from Laptops and Desktops to Servers, Storage, Monitors, and enterprise networking.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies partners with Dell to deliver robust, scalable IT infrastructure solutions that meet the demands of modern enterprises.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	https://www.dell.com	\N	\N	\N	f	2026-04-27 15:43:15.635+05:30	2026-04-27 14:46:13.067+05:30
3	Apple	apple	enterprise-computing	7	Discover the innovative world of Apple — iPhone, iPad, Apple Watch, Mac and more — as an Apple Authorized Partner.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot Technologies provides the complete range of Apple Products and services for enterprise environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "From iPhone and iPad to Apple Watch and Mac, we offer procurement, deployment, management, and support services to help your organisation leverage the Apple ecosystem effectively.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	https://apple.swajyot.co.in	\N	\N	\N	f	2026-04-27 15:43:15.603+05:30	2026-04-27 14:46:13.029+05:30
4	Microsoft Surface	microsoft-surface	enterprise-computing	8	The most diverse selection of Surface devices from Microsoft — built for all the ways you create, work, and play.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Microsoft Surface delivers the most diverse selection of devices built for all the ways you create, work, and play.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies provides Microsoft Surface procurement, deployment, and management services to help organisations equip their workforce with premium, versatile productivity hardware.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	https://www.microsoft.com/en-in/surface	\N	\N	\N	f	2026-04-27 15:43:15.617+05:30	2026-04-27 14:46:13.046+05:30
6	Siemens	siemens	plm	10	Leading global provider of software solutions and services for End-to-End Product Lifecycle Management (PLM).	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Siemens is a leading global provider of software solutions and services for End-to-End Product Lifecycle Management (PLM).", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Through our partnership with Siemens, Swajyot Technologies helps organisations manage the complete product lifecycle — from concept and design through manufacturing, service, and end of life.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	https://www.sw.siemens.com	\N	\N	\N	f	2026-04-27 15:43:15.649+05:30	2026-04-27 14:46:13.09+05:30
\.


--
-- Data for Name: partners_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_rels (id, "order", parent_id, path, solutions_id) FROM stdin;
\.


--
-- Data for Name: payload_kv; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_kv (id, key, data) FROM stdin;
\.


--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_locked_documents (id, global_slug, updated_at, created_at) FROM stdin;
41	main-nav	2026-04-27 08:31:34.444+05:30	2026-04-27 08:29:21.308+05:30
\.


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_locked_documents_rels (id, "order", parent_id, path, users_id, media_id, solutions_id, services_id, industries_id, partners_id, webinars_id, team_id, contact_submissions_id, pages_id, forms_id, form_submissions_id) FROM stdin;
50	\N	41	user	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_migrations (id, name, batch, updated_at, created_at) FROM stdin;
1	dev	-1	2026-04-30 16:15:29.436+05:30	2026-04-22 07:54:06.943+05:30
\.


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_preferences (id, key, value, updated_at, created_at) FROM stdin;
5	collection-contact-submissions	{"limit": 10}	2026-04-22 08:08:55.718+05:30	2026-04-22 08:08:47.854+05:30
6	collection-services	{"editViewType": "default"}	2026-04-22 08:09:45.775+05:30	2026-04-22 08:09:41.437+05:30
7	collection-team	{}	2026-04-22 08:17:52.143+05:30	2026-04-22 08:17:52.143+05:30
9	global-footer	{"editViewType": "default"}	2026-04-22 08:18:05.569+05:30	2026-04-22 08:18:05.572+05:30
11	collection-webinars	{"editViewType": "default"}	2026-04-22 08:32:50.375+05:30	2026-04-22 08:32:47.914+05:30
12	collection-partners	{"editViewType": "default"}	2026-04-22 08:36:59.746+05:30	2026-04-22 08:36:59.754+05:30
13	collection-industries	{"editViewType": "default"}	2026-04-22 08:42:15.645+05:30	2026-04-22 08:41:50.523+05:30
10	collection-solutions	{"editViewType": "default"}	2026-04-22 08:43:22.264+05:30	2026-04-22 08:28:52.577+05:30
14	global-site-settings	{"editViewType": "default"}	2026-04-22 09:32:08.343+05:30	2026-04-22 09:32:08.346+05:30
1	collection-users	{"editViewType": "default"}	2026-04-22 14:19:25.145+05:30	2026-04-22 07:57:04.756+05:30
4	collection-media	{"limit": 5, "editViewType": "default"}	2026-04-22 16:43:04.106+05:30	2026-04-22 08:04:27.461+05:30
15	collection-services	{}	2026-04-24 11:34:08.725+05:30	2026-04-24 11:34:08.72+05:30
16	collection-forms	{"editViewType": "default"}	2026-04-27 07:40:12.42+05:30	2026-04-27 07:40:09.338+05:30
17	collection-form-submissions	{"editViewType": "default"}	2026-04-27 10:24:23.522+05:30	2026-04-27 07:45:52.698+05:30
3	nav	{"groups": {"Admin": {"open": true}, "Forms": {"open": true}, "Content": {"open": true}, "Settings": {"open": true}, "Collections": {"open": true}}}	2026-04-27 10:35:33.228+05:30	2026-04-22 08:04:18.59+05:30
2	global-main-nav	{"fields": {"items": {"collapsed": []}, "items.0.children": {"collapsed": ["69e84243fad2621118a3f764", "69e84269fad2621118a3f766", "69ee54d902b4120a6d728c34"]}, "items.1.children": {"collapsed": []}}, "editViewType": "default"}	2026-04-27 10:38:03.727+05:30	2026-04-22 07:57:50.905+05:30
8	collection-pages	{"limit": 10, "editViewType": "default"}	2026-04-27 11:38:16.076+05:30	2026-04-22 08:17:55.969+05:30
18	collection-forms-2	{"fields": {"fields": {"collapsed": ["69ef426b0306e6243d8e3b76"]}}}	2026-04-27 16:34:29.147+05:30	2026-04-27 16:34:24.294+05:30
19	collection-webinars	{"editViewType": "default"}	2026-04-30 09:13:29.254+05:30	2026-04-30 09:13:15.475+05:30
20	collection-forms	{"editViewType": "default"}	2026-04-30 09:15:21.633+05:30	2026-04-30 09:15:14.665+05:30
21	collection-media	{"editViewType": "default"}	2026-04-30 16:26:39.734+05:30	2026-04-30 16:24:18.324+05:30
22	collection-users	{"editViewType": "default"}	2026-04-30 17:20:03.562+05:30	2026-04-30 17:19:58.875+05:30
\.


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payload_preferences_rels (id, "order", parent_id, path, users_id) FROM stdin;
73	\N	19	user	3
75	\N	20	user	3
77	\N	21	user	3
79	\N	22	user	3
11	\N	5	user	1
13	\N	6	user	1
15	\N	7	user	1
17	\N	9	user	1
21	\N	11	user	1
22	\N	12	user	1
24	\N	13	user	1
25	\N	10	user	1
30	\N	14	user	1
33	\N	1	user	1
36	\N	4	user	1
37	\N	15	user	2
43	\N	16	user	1
54	\N	17	user	1
65	\N	3	user	1
67	\N	2	user	1
68	\N	8	user	1
71	\N	18	user	1
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, slug, short_description, description, cover_image_id, icon_id, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at, _status) FROM stdin;
2	Software Development	software-developement	Fully customisable, scalable & modular software — web, desktop and mobile applications built with cutting-edge open-source technologies across the full SDLC.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "With today's disruptive business environment, software must be built to adapt, just like your business. Our Software Development Services are fully Customisable, Scalable & Modular.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We provide industry-leading development services helping businesses worldwide build, manage, and modernise applications using cutting-edge and open-source technologies across the entire Software Development Life Cycle — from design through deployment and maintenance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Service Offerings", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Desktop Application Development: Windows, Linux, and macOS applications built for performance and reliability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile Application Development: Native and cross-platform Android & iOS apps.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Web Application Development: Agile-driven, full-stack web applications with rigorous testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "UI/UX Design: User-friendly, interactive, multi-channel digital experiences.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Software Testing: Cross-browser, multi-OS, multi-device compatibility testing.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Staff Augmentation: Expert development teams that extend your in-house capability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Stack", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Python, Microsoft .NET, Mendix, macOS, Linux, iOS, Android — built on proven technologies for long-term maintainability.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	4	\N	Software Developement	At our company, we provide industry-leading Software Development Services designed to help businesses build, modernize, and manage high-performance software applications with confidence. We understand that every business has unique goals, workflows, and customer expectations. That’s why we create customized software solutions tailored specifically to your operational needs and long-term growth strategy.	\N	f	2026-04-27 15:43:15.228+05:30	2026-04-22 14:33:17.926+05:30	published
1	Analytics Outsourcing	data-analytics-outsourcing	Meet your analytical needs quickly — blending Data Science, Analytics & Automation to build agile infrastructure and access diverse expertise without large upfront investment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "There are unprecedented opportunities to develop agile products and services in today's data-driven world through the blending of Data Science, Analytics & Automation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Outsourcing is a great way for organisations to meet analytical needs, create agile infrastructure quickly, and gain access to a wide variety of expertise. Many organisations lack in-house analytical capabilities due to skill gaps, process inexperience, or substantial technology costs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot Technologies combines analytical requirements with technological solutions and industry knowledge to deliver agile, rapid results.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Data Collection & Integration, Business Intelligence & Visualisation, Power of Augmented Analytics, and Analytics Automation — the full data science cycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Advantages of Outsourcing", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Save on upfront technology investments, build an agile infrastructure, access diverse expertise, create a data culture environment, achieve better business decisions, accelerate digital transformation, and maintain traceability and compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	5	\N	Data Analytics Outsourcing	There are unprecedented opportunities to develop agile products and services in today’s data-driven world through the blending of Data Science, Analytics & Automation. Organisations can stay ahead of evolving analytical needs and services through Data Analytics Outsourcing. Embrace Data Culture and accelerate Digital Transformation by overcoming business challenges. Data Analytics Outsourcing in India.	\N	f	2026-04-27 15:43:15.284+05:30	2026-04-22 08:14:35.79+05:30	published
\.


--
-- Data for Name: services_highlights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_highlights (_order, _parent_id, id, point) FROM stdin;
1	2	69ef36bbceae1173f40a26ec	Desktop Application Development (Windows, Linux, macOS)
2	2	69ef36bbceae1173f40a26ed	Mobile Application Development (Android & iOS)
3	2	69ef36bbceae1173f40a26ee	Web Application Development (Agile, front-end, back-end, testing)
4	2	69ef36bbceae1173f40a26ef	UI/UX Design
5	2	69ef36bbceae1173f40a26f0	Software Testing
6	2	69ef36bbceae1173f40a26f1	Staff Augmentation
1	1	69ef36bbceae1173f40a26f2	Digital Data Collection & Integration
2	1	69ef36bbceae1173f40a26f3	Business Intelligence & Visualisation
3	1	69ef36bbceae1173f40a26f4	Power of Augmented Analytics
4	1	69ef36bbceae1173f40a26f5	Analytics Automation
5	1	69ef36bbceae1173f40a26f6	Save on Upfront Technology Investments
6	1	69ef36bbceae1173f40a26f7	Build an Agile Infrastructure
7	1	69ef36bbceae1173f40a26f8	Diverse Expertise is Accessible
8	1	69ef36bbceae1173f40a26f9	Accelerate Digital Transformation
9	1	69ef36bbceae1173f40a26fa	Better Business Decisions
10	1	69ef36bbceae1173f40a26fb	ROI in Real Time
\.


--
-- Data for Name: services_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services_rels (id, "order", parent_id, path, solutions_id) FROM stdin;
\.


--
-- Data for Name: site_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings (id, company_name, tagline, email, phone, address_line1, address_line2, address_city, address_state, address_pincode, address_country, social_linkedin, social_twitter, social_facebook, social_instagram, social_youtube, social_pinterest, logo_id, favicon_id, default_s_e_o_meta_title, default_s_e_o_meta_description, default_s_e_o_og_image_id, updated_at, created_at) FROM stdin;
1	Swajyot Technologies Pvt. Ltd.	Always Creating Value	info@swajyot.co.in	+91-80-4010 9777 / 88	#5, 7th 'C' Cross, Ashwini Layout	Koramangala Intermediate Road	Bengaluru	Karnataka	560047	India	\N	\N	\N	\N	\N	\N	\N	\N	Swajyot Technologies – Digital Transformation Solutions	Swajyot Technologies delivers enterprise-grade Analytics & AI, Digital Process Automation, and Computing Management solutions across Manufacturing, Pharma, Healthcare, and Energy sectors.	1	2026-04-27 10:39:43.834+05:30	2026-04-27 10:39:43.834+05:30
\.


--
-- Data for Name: site_settings_office_hours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.site_settings_office_hours (_order, _parent_id, id, days, hours) FROM stdin;
\.


--
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solutions (id, title, slug, category, short_description, description, cover_image_id, icon_id, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at, _status) FROM stdin;
1	Data Analytics & Business Intelligence	data-analytics-business-intelligence	enterprise-computing	Transform raw data into actionable insights with scalable analytics, dashboards, and AI-driven decision-making solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In today’s data-driven world, businesses need the ability to analyze and interpret large volumes of data quickly. Our Data Analytics and Business Intelligence solutions help organizations make smarter decisions, improve performance, and gain a competitive edge.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What We Offer", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We provide end-to-end analytics solutions, from data collection and processing to visualization and reporting. Our systems are designed to be scalable, secure, and easy to use.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key Capabilities", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data integration from multiple sources  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data cleaning and transformation  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Interactive dashboards and reports  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-time analytics and monitoring  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Predictive analytics using AI and machine learning  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Better decision-making with real-time insights  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Improved operational efficiency  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Enhanced customer understanding  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Reduced risks through data-driven strategies  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Scalable solutions for growing businesses  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Our Approach", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We follow a structured approach that includes understanding your business needs, designing tailored solutions, implementing robust analytics systems, and providing ongoing support.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tools & Technologies", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "We work with modern tools and platforms including KNIME, Power BI, Tableau, Python, and cloud-based analytics solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Use Cases", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Sales and performance dashboards  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Customer behavior analysis  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Financial reporting and forecasting  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Operational analytics  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Marketing campaign analysis  ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Get Started", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Leverage the power of data to drive growth and innovation in your organization with our expert analytics solutions.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	\N	Data Analytics Solutions | Business Intelligence | Swajyot	Discover data analytics and business intelligence solutions to transform your data into insights with dashboards, AI models, and real-time reporting.	\N	f	2026-04-22 08:44:44.604+05:30	2026-04-22 08:44:44.603+05:30	published
9	Manufacturing Excellence	manufacturing-excellence	manufacturing	Transform your manufacturing operations — monitor quality, costs, defects, and customer satisfaction with best-in-class processes and evolving technology solutions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing is integral to business growth, encompassing product design, materials requirements, specifications, and final output delivery.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturers must continuously monitor quality, costs, defects, and customer satisfaction. How products are manufactured has changed significantly over the years due to technological evolution — and Swajyot helps organisations stay ahead.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We combine process excellence methodologies with advanced analytics and automation to help manufacturers achieve consistent quality, reduce waste, and optimise every stage of the production lifecycle.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Minitab and Microridge — the leading platforms for statistical analysis and manufacturing data collection trusted by production teams worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	21	\N	\N	\N	\N	f	2026-04-27 15:43:14.962+05:30	2026-04-27 08:50:21.9+05:30	published
10	Service Excellence	service-excellence	service-excellence	Achieve service excellence — the key to customer satisfaction, employee satisfaction, and business prosperity in today's ever-changing service landscape.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Today, every organisation wants to meet customer expectations and changing demands. Maintaining efficient growth and improving Service Quality are the major challenges in the service sector.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Due to its ever-changing phases, achieving service excellence is the key to customer satisfaction, employee satisfaction, and business prosperity. It is becoming a significant factor to determine the top performer among organisations.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our Approach", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Swajyot's Service Excellence solutions help organisations systematically monitor, measure, and improve service delivery — building a culture of continuous improvement that translates directly into competitive advantage.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality & Consistency, Customer Satisfaction, Better ROI, Cost Saving, Operational Excellence, and Better Decision Making — all driven by data and best-practice service management frameworks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	22	\N	\N	\N	\N	f	2026-04-27 15:43:14.993+05:30	2026-04-27 08:50:21.912+05:30	published
5	Enterprise Decision Management	enterprise-decision-management	enterprise-computing	Transform your process data into future insights to make better business decisions — predict outcomes, manage risks, and achieve operational excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "EDM (Enterprise Decision Management) can transform your process data into future insights which helps organisations to make better business decisions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Modern organisations need better decision planning, increased sales, enhanced productivity, revenue gains, and future trend prediction capabilities. Swajyot positions EDM as a competitive advantage tool applicable across industries and company sizes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Benefits", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Better ROI: Intelligent decision frameworks help allocate resources efficiently and maximise returns.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Maintenance: Anticipate equipment and process failures before they occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manage Risks & Opportunities: Identify and respond to business risks and growth opportunities in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predict Business Outcomes: Use historical and real-time data to forecast future performance with confidence.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	17	\N	\N	\N	\N	f	2026-04-27 15:43:14.833+05:30	2026-04-27 08:50:21.822+05:30	published
7	Enterprise Information Management	enterprise-information-management	information-management	Capture, File, Locate, Edit, Secure & Process any document in your organisation with ease — anywhere, anytime — with scalable on-premises or cloud deployment.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Information Management (EIM) provides scalable deployment options for both on-premises and cloud environments, with document and content management solutions customisable to organisational needs.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Capture, File, Locate, Edit, Secure and Process any document in your organisation with ease, anywhere, anytime.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Features", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Smart Forms Capture: EIM Forms works seamlessly with Microsoft Word and PDF form files for enhanced business workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automated Capture with Easy Index: Processes thousands of documents intelligently for EIM system organisation.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Mobile App for iOS & Android: Delivers web access capabilities with document addition functionality from any device.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & Digital Process Automation: Accelerates analytical processes for large-scale data analysis and automated document workflows.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Precise EIM and Canon — enterprise-grade document management platforms with proven deployments across industries.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	19	\N	\N	\N	\N	f	2026-04-27 15:43:14.894+05:30	2026-04-27 08:50:21.868+05:30	published
8	Statistical Process Control	statistical-process-control	quality-management	Make data-driven decisions to improve processes in real-time before any defects occur — with flexible, scalable SPC solutions that integrate into your existing infrastructure.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "SPC (Statistical Process Control) helps Organisations to make data-driven decisions to improve processes in real-time before any defects occur.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Our modern SPC solutions are flexible, scalable, and readily integrated into existing infrastructure to enhance Process Efficiency and generate improved ROI.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Key Capabilities", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Flexible Data Collection & Integration: Supports manual, automated or semi-automated data entry through scales, callipers, and other devices. Enables access from various database sources.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Monitoring and Analysis: Make real-time decisions instantly on the process floor. SPC Charts & dashboards are automatically updated in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Real-Time Online Dashboard: Visualise process analysis and track key performance metrics through an always-current dashboard.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Automate Real-Time SPC Analysis: Speed up your analytical process and analyse process data in seconds or minutes — not hours.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Outcomes", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Reduce scrap, comply with regulations and standards, improve product quality, decrease costs and risk, and meet customer requirements consistently.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	20	\N	\N	\N	\N	f	2026-04-27 15:43:14.926+05:30	2026-04-27 08:50:21.886+05:30	published
3	Enterprise Computing Management	enterprise-computing-management	enterprise-computing	Implement best-practice approaches to boost your overall computing infrastructure — from servers and storage to security and networking.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Computing Management helps your Organisation to implement best practice-based approaches to boost Your overall Computing Infrastructure.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "We deliver comprehensive solutions spanning software tools, server management, enterprise storage, backup systems, and security infrastructure — so your IT estate runs at peak performance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Core Service Categories", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Servers & Personal Computers: Network management with consulting, maintenance plans, offsite backup, and remote server monitoring.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Storage & Backup: Integration of backup technologies to shorten backup windows and decrease storage requirements.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Enterprise Security: Data protection against advanced threats and targeted attacks.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Networking & Communications: Infrastructure services focused on reducing costs while enhancing productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "As an Apple Authorized Partner, Swajyot provides the complete range of Apple Products and services alongside Dell, HP, Lenovo, Samsung, Canon, Microsoft, and Poly solutions.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	14	\N	Enterprise Computing Management Solutions & Services	Enterprise Computing Management Solutions & Services	\N	f	2026-04-27 15:43:14.688+05:30	2026-04-26 23:38:10.523+05:30	published
2	Analytics & AI	analytics-ai	analytics-ai	Harness the latest Analytics & AI trends to enhance productivity, gain revenues, and understand your customers' perspective with data-driven decisions.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics & AI are the latest trends in this digital world. With exponential growth in data across IoT environments, organisations need powerful tools to enhance productivity, gain revenues, and understand their customers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytics Frameworks", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Business Intelligence: View and monitor your process performance in an online dashboard in real time.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Predictive Analytics: Enhance customer experience, manage risks & opportunities, and increase revenue by predicting future outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Statistical Analytics: Improve your process efficiency and productivity through rigorous statistical methods.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Analytics: Boost customer satisfaction and meet quality standards with advanced quality-focused analytics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Verticals", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Critical drug study & development, clinical trials, and regulatory compliance reporting.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Deliver affordable, accessible, and robust healthcare analytics environments.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "General Manufacturing: Drive data-informed quality and operational decisions on the production floor.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	15	\N	Improved decision-making and business performance	Explore Analytics and AI solutions to transform data into insights, improve decision-making, and drive growth using BI, big data, and predictive analytics.	\N	f	2026-04-27 15:43:14.764+05:30	2026-04-22 09:05:54.601+05:30	published
4	Digital Process Automation	digital-process-automation	digital-process-automation	Drive Digital Transformation with robotic process automation and data science — reduce costs, boost workforce productivity, and set new operational benchmarks.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Digital Process Automation (DPA) is a key strategy to stay ahead in competitive markets. Modern automation utilises robotic process automation and data science to accomplish tasks with reduced human involvement while boosting workforce productivity.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Solution Framework", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Front-Office Process Automation: Attended automation deployed on local desktop systems functioning as a front-office management tool.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Back-Office Process Automation: Unattended bots automating large-scale data activities, operating as back-office managers.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Analytic Process Automation: Combines analytics and automation capabilities to accelerate analytical workflows and business outcomes.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS Process Automation: Automates Quality Management System lifecycles for consistent compliance.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Industry Applications", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Manufacturing: Automates data analysis, regulatory compliance, production acceleration, and supply chain logistics.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Pharmaceuticals & Life Sciences: Supports regulatory compliance, data analytics, and clinical data management.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Healthcare: Automates insurance claims, appointment scheduling, medical billing, OPD registration, and electronic health records.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	16	\N	\N	\N	\N	f	2026-04-27 15:43:14.8+05:30	2026-04-27 08:50:21.634+05:30	published
6	Enterprise Quality Management	enterprise-quality-management	quality-management	Systematise and streamline quality methodologies — from Quality Planning and Assurance to Control and Improvement — for compliance and continuous excellence.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "The importance of Enterprise Quality Management in an Organisation is well versed in today's competitive world. Our SMART Enterprise Quality Management Solutions help Organisations to implement all the main components of Quality Management: Quality Planning, Quality Assurance, Quality Control, and Quality Improvement.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Quality Management System (QMS)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "QMS features standardised processes, regular audits, and continuous improvement. Benefits include enhancing efficiency, customer satisfaction, regulatory compliance, and strengthening market competitiveness.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "In Process Quality Assurance (IPQA)", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "IPQA features real-time monitoring, defect prevention, and process controls — improving efficiency, ensuring compliance, reducing defects, and enhancing product consistency.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"text": "Technology Partners", "type": "text", "version": 1}], "direction": "ltr"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"text": "Powered by Qsutra QMS, Minitab, and Microridge — industry-leading quality management platforms trusted by manufacturers worldwide.", "type": "text", "version": 1}], "direction": "ltr", "textStyle": "", "textFormat": 0}], "direction": "ltr"}}	18	\N	\N	\N	\N	f	2026-04-27 15:43:14.864+05:30	2026-04-27 08:50:21.845+05:30	published
\.


--
-- Data for Name: solutions_highlights; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solutions_highlights (_order, _parent_id, id, point) FROM stdin;
1	1	69e83d0bfad2621118a3f750	Real-time data insights and dashboards
2	1	69e83d0efad2621118a3f752	AI-powered predictive analytics
3	1	69e83d13fad2621118a3f754	Scalable and secure data solutions
4	1	69e83d18fad2621118a3f756	Seamless integration with existing systems
1	3	69ef36baceae1173f40a26b5	Servers & Personal Computers
2	3	69ef36baceae1173f40a26b6	Software Tools & Components
3	3	69ef36baceae1173f40a26b7	Peripherals & Accessories
4	3	69ef36baceae1173f40a26b8	Enterprise Storage & Backup
5	3	69ef36baceae1173f40a26b9	Enterprise Security
6	3	69ef36baceae1173f40a26ba	Networking & Communications
7	3	69ef36baceae1173f40a26bb	Information Security
1	2	69ef36baceae1173f40a26bc	Business Intelligence (BI)
2	2	69ef36baceae1173f40a26bd	Big Data Analytics
3	2	69ef36baceae1173f40a26be	Predictive Analytics
4	2	69ef36baceae1173f40a26bf	Business Analytics
5	2	69ef36baceae1173f40a26c0	Statistical Analytics
6	2	69ef36baceae1173f40a26c1	Quality Analytics
1	4	69ef36baceae1173f40a26c2	Front-Office Process Automation
2	4	69ef36baceae1173f40a26c3	Back-Office Process Automation
3	4	69ef36baceae1173f40a26c4	Analytic Process Automation
4	4	69ef36baceae1173f40a26c5	QMS Process Automation
5	4	69ef36baceae1173f40a26c6	Enhanced Productivity
6	4	69ef36baceae1173f40a26c7	Better ROI
1	5	69ef36baceae1173f40a26c8	Better ROI
2	5	69ef36baceae1173f40a26c9	Predictive Maintenance
3	5	69ef36baceae1173f40a26ca	Better Business Decisions
4	5	69ef36baceae1173f40a26cb	Operational Excellence
5	5	69ef36baceae1173f40a26cc	Manage Risks & Opportunities
6	5	69ef36baceae1173f40a26cd	Predict Business Outcomes
1	6	69ef36baceae1173f40a26ce	Better ROI
2	6	69ef36baceae1173f40a26cf	Quality & Consistency
3	6	69ef36baceae1173f40a26d0	Customer Satisfaction
4	6	69ef36baceae1173f40a26d1	Operational Excellence
5	6	69ef36baceae1173f40a26d2	Cost Saving
6	6	69ef36baceae1173f40a26d3	Better Decision Making
1	7	69ef36baceae1173f40a26d4	Smart Forms Capture
2	7	69ef36baceae1173f40a26d5	Automated Capture with Easy Index
3	7	69ef36baceae1173f40a26d6	Mobile App for iOS & Android
4	7	69ef36baceae1173f40a26d7	Analytics & Process Automation Integration
5	7	69ef36baceae1173f40a26d8	Cloud & On-Premises Deployment
6	7	69ef36baceae1173f40a26d9	Document Security
1	8	69ef36baceae1173f40a26da	Flexible Data Collection & Integration
2	8	69ef36baceae1173f40a26db	Real-Time Monitoring and Analysis
3	8	69ef36baceae1173f40a26dc	Real-Time Online Dashboard
4	8	69ef36baceae1173f40a26dd	Automate Real-Time SPC Analysis
5	8	69ef36baceae1173f40a26de	Reduce Scrap & Costs
6	8	69ef36baceae1173f40a26df	Regulatory Compliance
1	9	69ef36baceae1173f40a26e0	Quality & Consistency
2	9	69ef36baceae1173f40a26e1	Process Optimisation
3	9	69ef36baceae1173f40a26e2	Better ROI
4	9	69ef36baceae1173f40a26e3	Manage Risks & Opportunities
5	9	69ef36baceae1173f40a26e4	Operational Excellence
6	9	69ef36baceae1173f40a26e5	Better Decision Making
1	10	69ef36baceae1173f40a26e6	Quality & Consistency
2	10	69ef36baceae1173f40a26e7	Customer Satisfaction
3	10	69ef36baceae1173f40a26e8	Better ROI
4	10	69ef36baceae1173f40a26e9	Cost Saving
5	10	69ef36baceae1173f40a26ea	Operational Excellence
6	10	69ef36baceae1173f40a26eb	Better Decision Making
\.


--
-- Data for Name: solutions_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solutions_rels (id, "order", parent_id, path, industries_id) FROM stdin;
1	1	1	industries	1
8	1	3	industries	1
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, name, role, bio, photo_id, linked_in, "order", updated_at, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, updated_at, created_at, email, reset_password_token, reset_password_expiration, salt, hash, login_attempts, lock_until, name) FROM stdin;
2	2026-04-22 14:19:51.043+05:30	2026-04-22 14:19:51.043+05:30	ncnandini28@gmail.com	\N	\N	7a767dc16de9df1efad4bf063965d740a02aa12e8b304ca8fcd1a2bab7914cd4	e03726bd839e9fcd018d3cf159b3fdb25d8430318fe9222ca3b894081ac7af2d7c2062186a50d034125d53bc925b441ae035b6d2c1985205b9b96b46952a2a7af5393b2e330a05793cad7470035c84c1092afae9b5efc1ff6d4cce072d77bfe8d2f731b048b4b6604c6da616d658e101a3b318ac1ebd7bcf4d72bd6eec1af3f18b89bd753b703d4e95051cf0198ccc0233762e8ad3952aa2410a472ed394e7da2bbc25fb6392a25c115c9a39060fd2f0f72cbfda1a6e7e5dace38007d736aefaa775037022bede4562b927c63440736af57f2ff32ce40dc201622aa0a81d6aab8b49cfcdc99890e26960a4c10683e928bbbd58e4afc60902b12b4a05f950ca585d5559795875d06f9686b8ca51b07e2e2f7b8be6eb0d6ffdef53904de85bd1d7be58f43c18d811ab208144809ac52c032c519d5bedf9eafa7afbf7ba06f116156961ed4c9f5d5ae09ac665d69eee958e64e77c34b522c5addb6f48253ac590bcc5c3272a7f30b579f7220fd3376342b38d3036361217f4a0d16c1a66418ae25ff6edfa143c56562359b1545599d4b49028d23db71324d004d0d0d73c5ac472bec4bc7e64a57a9cb4179a656f737f63ffba53c13083d4fb7d4fa6bf30271f29e1d08878154e8612773448b2b446b04736dab1d28cb5c6ef2fa9ae706ae5126034f61f0d3279de2b4441111c6649124c921970dc12f33ed19ac6e961a48f936ff2	0	\N	\N
1	2026-04-22 07:57:00.447+05:30	2026-04-22 07:57:00.443+05:30	nandini@swajyot.co.in	\N	\N	bc4544e208e943bcc58fd7f2976b529082c376f2b482be197b5122850c4835a5	3c595d3de93398db816f3831c71dd0700ad43576de4ba90a113fc74bba2fb0eeb7cb7e560d8b2191f32d04b8465232d7bef3172b8b1581c4a11398d30db9751e639e958348c7fc6aeeeeeadbe6c27c84843aa00698bbe799cf959ee25109243abb81d5ede70fe5aa534496afb04d6f449339f6254af1ce32361c5348e33de245d8601c32b53dfd40fa99cb5ade1abe09e4e9ba9e14acb23fae14f0c21e7c19c1fad8b70f8c39375c5d185f74b85a65c712e7278a69d9c9e2739aac7cd71c91000860ba3045f693af90488c036774a5c30aa752c37cc8219d66f80aa12bbb39cbf217114a534a0a2b214e3ee02a60b7cb3344d39cf3b6dd052cca65348c3834337b2ee18bb8769741b08d35e47d809745ebdaf74c8ac11e94d455cd6f442e48cb0f2b25fc1dbb4eaa6b74c504980a83c5011b689ecd3043f5d572770bc6cf9a4d43df28db7b0af6d1c7d026966e30fafe6d522afb8152c67bd0a85253566d69d9b053dc9962c0b733d5879a89f9fe469e0fc727f97f9dc25aad3d0ac8803e2e2d5067b9b74b8c14d6bd82564735d1b056f46b8f887777e3a90c54242bcad0c99822c65cbc3ce6e1caca705cceb14758076bb83e23e54183c12c4aeea97f30cf53f378a53a0ec648c091c97163eacf594f14e4ba170663bb608ccf2a1b28603d69b2a684cece92705c04f1dd136008cccd6e05e608e0daedae88a075cb1e8a4dd4	0	\N	\N
3	2026-04-27 16:40:06.959+05:30	2026-04-27 16:40:06.959+05:30	info@swajyot.co.in	\N	\N	db026c3e045a1c7d383150ea4ca8a8079c7fa53606d9fdac05a06b2d419bc486	030303b61dbe0cb97438195965898ddca659aeb06c1dd50737ef679b95aff457dd0852cbb86828edc00f4afe236aa6fc9f953172732656c742e42e3de1eb88b317d902897c2f7d30f1e0473c50c0798c11f31f4c9064236cc41ad7aa5909190c641b62016ffafce9589d447a2ea46107e04df35671329d60f4b246910b37bcc3022c3f4f9ed6a2e3541b0d65f203bb6588020dc67240b22731871aac6d1571c9567ff3fe939f776fca4ded6288b61d4581e3adacd79d0bdbca99805e9a975241d15f6823f3c9f3a3eaa1d20b092e400c6d3697c39de6c21a5aa1d970f9e220e63f9faa64ee0217023d2cca4add72cfcb256bec946a6844734ca17e12a19edac63b7c3177d754718dbee512c83c4a2141908c3b18a68dc27110096c091b90326d2eaf567c1a613a882077a3257649f05c885f2f822e0932f141cabbf7053dc8284e56848c406568c0c9553aa7aec8519e01baf88c9fef3666c7b7b7880932edb2dbfefdf686cc51e8c02af5ef690c64a4b7282825871a1ca0060d0e433622e118a879e50b9a8e818e03d9a3cf89af2c6f55e529414e100ac516b9247159f544df2792d0d1d9e4b917b918673e1f96e7d4d97637cfe134706fb209b1a3186cedad663b86feddd5f1edda68bb03582862cbb900485e23a687ca0af2e7b75399b896fca2f09d8b89685ca866a8a0371c65c2e63d7dcc476ecf1a12cdb063f8fdbd64	0	\N	\N
4	2026-04-30 17:21:15.372+05:30	2026-04-30 17:21:15.372+05:30	bharath@swajyot.co.in	\N	\N	27e3f23a849f298080de8e1e1803077c4431d5b8fb763ece0a96226887153905	39e5748428b9bfd00feb874ebb16e7247232ea709fe7e61e86b4fd243886784e9dd75b3f0d90cfb81f556da4320d15d85c6cf6db3f9c626683658401f33d6f50cddc7cd26fe6962dd7cd9ecab2ee1a93aa52ff70747236310930134e53d3df8126c0be37fcb83768d1402a227ce8a2fbd65092d44ac77ec1caa03f24279797a04552a3aa70a77c421167a4c13c1b01dcceddbdaacbef1568ce4e5ddd8fec2c7f4de0998fde79761ba90448c49c1067a8534731e8eb7cce82e820372f8bbb6bf0d6f0e7bbab1a4f1eb8d88242030eda80c0b1510cfb47cd4dcc683f9395c9ff10afa6d92803048b68a44854b94fc941ab445da2b70cb172ca487aa75c48d14479579d39848c9a2a3a389be435d0ce8a3087b18ddc49da5b06c4adfca68205f64b6975073054911907baca4d4910d66f85059b8d0e8c6739c7bcd01a8fd7730425b9ef5a16c04cf382a1f12ac085560e09eda5fa74231eebc88a84b53189e0c43a880840beb2ddbc5b677208ba5aed6f29891104c95ed8b20afa73440493573cff1fdd657bbf0f8a45d299f345bd174cbfe48796fed6faf2bbf61cafceaa7e8535ffdc52f702503611010a6f2136d90f577a547c926670f390559f5a671cb744c806c9765f87bfc1bc72e27dbbbce14bcc4d5ac6db25b4810185a7d0102cb7c399cb48caebc78b6c087318827ef2c31ef55bfc9b5162229cd3ad1393f3e54ff926	0	\N	Bharath R
\.


--
-- Data for Name: users_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_sessions (_order, _parent_id, id, created_at, expires_at) FROM stdin;
1	2	68cbbf78-5044-4b47-a49b-889e5dfc005d	2026-04-24 11:34:06.755+05:30	2026-04-24 13:34:06.755+05:30
1	1	e837228e-57f6-4f07-9059-f9a9dafb6466	2026-04-27 15:01:06.251+05:30	2026-04-27 17:01:06.251+05:30
2	1	420fa7c9-afdb-4f5d-aac2-267cb433e896	2026-04-27 16:01:04.445+05:30	2026-04-27 18:01:04.445+05:30
1	3	78b49943-0e23-4e44-8095-53bf9aa89ba9	2026-04-30 16:16:32.487+05:30	2026-04-30 18:16:32.487+05:30
\.


--
-- Data for Name: webinars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webinars (id, title, slug, event_status, date, short_description, description, cover_image_id, registration_url, recording_url, partner_id, seo_meta_title, seo_meta_description, seo_og_image_id, seo_no_index, updated_at, created_at, _status, registration_form_id) FROM stdin;
1	Qsutra Analytical Tool Webinar	qsutra-analytical-tool-webinar	upcoming	2026-04-25 09:00:00+05:30	Learn how to use the Qsutra Analytical Tool to analyze data, generate insights, and make smarter decisions in this practical webinar.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the Qsutra Analytical Tool. This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Details", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " 25 April 2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Time:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " To be announced", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "Mode:", "type": "text", "style": "", "detail": 0, "format": 1, "version": 1}, {"mode": "normal", "text": " Online", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 1}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Why Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session focuses on practical usage of the Qsutra Analytical Tool, helping you understand how to extract meaningful insights and apply them effectively in real-world scenarios.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	1	\N	\N	1	Spring Boot & React Webinar | Swajyot Technology	Join our webinar on building scalable web applications using Spring Boot and React. Learn architecture, APIs, security, and deployment.	\N	f	2026-04-27 07:43:27.296+05:30	2026-04-22 08:40:04.574+05:30	published	1
2	GageFx Intro	gagefx-intro	upcoming	2026-04-27 00:00:00+05:30	Sample	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "About This Webinar", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "h3", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Overview", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Join us for an in-depth session on the ", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"mode": "normal", "text": "Qsutra Analytical Tool.", "type": "text", "style": "", "detail": 0, "format": 4, "version": 1}, {"mode": "normal", "text": " This webinar is designed for users who want to understand how to leverage analytics for better decision-making and improve their workflow efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "What You Will Learn", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Overview of the Qsutra Analytical Tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "How to analyze and interpret data effectively", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Key features and functionalities of the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Best practices for generating actionable insights", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 5, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Real-world use cases and demonstrations", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 6, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Tips for improving productivity using the tool", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Who Should Attend", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Data Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Business Analysts", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 3, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Developers", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 4, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Students and professionals interested in analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}, {"tag": "h2", "type": "heading", "format": "start", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Requirements", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"tag": "ul", "type": "list", "start": 1, "format": "start", "indent": 0, "version": 1, "children": [{"type": "listitem", "value": 1, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Basic understanding of data and analytics", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}, {"type": "listitem", "value": 2, "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Familiarity with web applications", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null}], "listType": "bullet", "direction": null}], "direction": null}}	19	\N	\N	\N	\N	\N	\N	f	2026-04-30 09:14:42.585+05:30	2026-04-27 16:29:54.759+05:30	published	1
3	GageFX Intro: Smart Contract Lifecycle Management Simplified	gagefx-intro-smart-contract-lifecycle-management-simplified	upcoming	2026-05-01 17:30:00+05:30	Discover how GageFX simplifies Contract Lifecycle Management (CLM) with automation, efficiency, and modern workflows.	{"root": {"type": "root", "format": "", "indent": 0, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "table", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Webinar Title", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 3, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX Intro", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 1, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 69, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Date", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1/05/2026", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Time", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "5.30 to 6.30 PM", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "height": 45, "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Duration", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "1 Hr", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Mode", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Online(Zoom)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}, {"type": "tablerow", "format": "", "indent": 0, "version": 1, "children": [{"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "Language", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 2, "backgroundColor": null}, {"type": "tablecell", "format": "", "indent": 0, "colSpan": 1, "rowSpan": 1, "version": 1, "children": [{"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "English", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null, "headerState": 0, "backgroundColor": null}], "direction": null}], "colWidths": [118, 151], "direction": null}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"id": "69f3391915ce175a0c87aa80", "type": "upload", "value": 24, "fields": {"width": 500, "height": 600, "alignment": "left"}, "format": "", "version": 3, "relationTo": "media"}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "GageFX is a modern solution designed to streamline Contract Lifecycle Management (CLM) for businesses of all sizes. Managing contracts manually can be time-consuming and error-prone — GageFX helps solve this with automation and intelligent workflows.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "In this webinar, you will learn:", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "• Introduction to GageFX and its core features", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Understanding Contract Lifecycle Management (CLM)", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• How GageFX simplifies contract creation, approval, and tracking", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Automation and workflow benefits", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}, {"type": "linebreak", "version": 1}, {"mode": "normal", "text": "• Real-world use cases and business impact", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "This session is ideal for developers, business teams, legal professionals, and anyone interested in improving contract management processes.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}, {"type": "paragraph", "format": "", "indent": 0, "version": 1, "children": [{"mode": "normal", "text": "By the end of this webinar, you’ll have a clear understanding of how GageFX can help organizations save time, reduce risks, and improve efficiency.", "type": "text", "style": "", "detail": 0, "format": 0, "version": 1}], "direction": null, "textStyle": "", "textFormat": 0}], "direction": null}}	\N	https://swajyot.com/gagefx-webinar-register	\N	\N	\N	\N	\N	f	2026-04-30 16:49:14.776+05:30	2026-04-30 16:38:02.923+05:30	published	4
\.


--
-- Data for Name: webinars_speakers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webinars_speakers (_order, _parent_id, id, name, role, photo_id) FROM stdin;
1	3	69f3354815ac974356066154	Nootan	SalesForce Lead	23
\.


--
-- Name: _forms_v_blocks_checkbox_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_checkbox_id_seq', 1, true);


--
-- Name: _forms_v_blocks_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_email_id_seq', 3, true);


--
-- Name: _forms_v_blocks_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_message_id_seq', 1, true);


--
-- Name: _forms_v_blocks_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_number_id_seq', 2, true);


--
-- Name: _forms_v_blocks_select_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_select_id_seq', 4, true);


--
-- Name: _forms_v_blocks_select_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_select_options_id_seq', 5, true);


--
-- Name: _forms_v_blocks_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_text_id_seq', 3, true);


--
-- Name: _forms_v_blocks_textarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_blocks_textarea_id_seq', 1, false);


--
-- Name: _forms_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_id_seq', 8, true);


--
-- Name: _forms_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_rels_id_seq', 1, false);


--
-- Name: _forms_v_version_emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._forms_v_version_emails_id_seq', 4, true);


--
-- Name: _industries_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._industries_v_id_seq', 19, true);


--
-- Name: _industries_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._industries_v_rels_id_seq', 1, true);


--
-- Name: _pages_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._pages_v_id_seq', 2, true);


--
-- Name: _services_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._services_v_id_seq', 14, true);


--
-- Name: _services_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._services_v_rels_id_seq', 1, true);


--
-- Name: _services_v_version_highlights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._services_v_version_highlights_id_seq', 66, true);


--
-- Name: _solutions_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._solutions_v_id_seq', 65, true);


--
-- Name: _solutions_v_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._solutions_v_rels_id_seq', 8, true);


--
-- Name: _solutions_v_version_highlights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._solutions_v_version_highlights_id_seq', 344, true);


--
-- Name: _webinars_v_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._webinars_v_id_seq', 16, true);


--
-- Name: _webinars_v_version_speakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public._webinars_v_version_speakers_id_seq', 5, true);


--
-- Name: contact_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_submissions_id_seq', 3, true);


--
-- Name: footer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footer_id_seq', 1, true);


--
-- Name: form_submissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.form_submissions_id_seq', 8, true);


--
-- Name: forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forms_id_seq', 4, true);


--
-- Name: forms_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forms_rels_id_seq', 1, false);


--
-- Name: industries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industries_id_seq', 6, true);


--
-- Name: industries_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.industries_rels_id_seq', 1, true);


--
-- Name: main_nav_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.main_nav_id_seq', 1, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 24, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, true);


--
-- Name: partners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_id_seq', 6, true);


--
-- Name: partners_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.partners_rels_id_seq', 1, false);


--
-- Name: payload_kv_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_kv_id_seq', 1, false);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_locked_documents_id_seq', 55, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_locked_documents_rels_id_seq', 76, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_migrations_id_seq', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_preferences_id_seq', 22, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payload_preferences_rels_id_seq', 79, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 3, true);


--
-- Name: services_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_rels_id_seq', 1, true);


--
-- Name: site_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.site_settings_id_seq', 1, true);


--
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solutions_id_seq', 10, true);


--
-- Name: solutions_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solutions_rels_id_seq', 8, true);


--
-- Name: team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.team_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: webinars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.webinars_id_seq', 3, true);


--
-- Name: _forms_v_blocks_checkbox _forms_v_blocks_checkbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_checkbox
    ADD CONSTRAINT _forms_v_blocks_checkbox_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_email _forms_v_blocks_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_email
    ADD CONSTRAINT _forms_v_blocks_email_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_message _forms_v_blocks_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_message
    ADD CONSTRAINT _forms_v_blocks_message_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_number _forms_v_blocks_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_number
    ADD CONSTRAINT _forms_v_blocks_number_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_select_options _forms_v_blocks_select_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select_options
    ADD CONSTRAINT _forms_v_blocks_select_options_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_select _forms_v_blocks_select_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select
    ADD CONSTRAINT _forms_v_blocks_select_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_text _forms_v_blocks_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_text
    ADD CONSTRAINT _forms_v_blocks_text_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_textarea _forms_v_blocks_textarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_textarea
    ADD CONSTRAINT _forms_v_blocks_textarea_pkey PRIMARY KEY (id);


--
-- Name: _forms_v _forms_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v
    ADD CONSTRAINT _forms_v_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_rels _forms_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_rels
    ADD CONSTRAINT _forms_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_version_emails _forms_v_version_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_version_emails
    ADD CONSTRAINT _forms_v_version_emails_pkey PRIMARY KEY (id);


--
-- Name: _industries_v _industries_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v
    ADD CONSTRAINT _industries_v_pkey PRIMARY KEY (id);


--
-- Name: _industries_v_rels _industries_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v_rels
    ADD CONSTRAINT _industries_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _pages_v _pages_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_pkey PRIMARY KEY (id);


--
-- Name: _services_v _services_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_pkey PRIMARY KEY (id);


--
-- Name: _services_v_rels _services_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _services_v_version_highlights _services_v_version_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_version_highlights
    ADD CONSTRAINT _services_v_version_highlights_pkey PRIMARY KEY (id);


--
-- Name: _solutions_v _solutions_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v
    ADD CONSTRAINT _solutions_v_pkey PRIMARY KEY (id);


--
-- Name: _solutions_v_rels _solutions_v_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_rels
    ADD CONSTRAINT _solutions_v_rels_pkey PRIMARY KEY (id);


--
-- Name: _solutions_v_version_highlights _solutions_v_version_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_version_highlights
    ADD CONSTRAINT _solutions_v_version_highlights_pkey PRIMARY KEY (id);


--
-- Name: _webinars_v _webinars_v_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_pkey PRIMARY KEY (id);


--
-- Name: _webinars_v_version_speakers _webinars_v_version_speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v_version_speakers
    ADD CONSTRAINT _webinars_v_version_speakers_pkey PRIMARY KEY (id);


--
-- Name: contact_submissions contact_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_submissions
    ADD CONSTRAINT contact_submissions_pkey PRIMARY KEY (id);


--
-- Name: footer_bottom_links footer_bottom_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_bottom_links
    ADD CONSTRAINT footer_bottom_links_pkey PRIMARY KEY (id);


--
-- Name: footer_columns_links footer_columns_links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_columns_links
    ADD CONSTRAINT footer_columns_links_pkey PRIMARY KEY (id);


--
-- Name: footer_columns footer_columns_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_columns
    ADD CONSTRAINT footer_columns_pkey PRIMARY KEY (id);


--
-- Name: footer footer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer
    ADD CONSTRAINT footer_pkey PRIMARY KEY (id);


--
-- Name: form_submissions form_submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_pkey PRIMARY KEY (id);


--
-- Name: form_submissions_submission_data form_submissions_submission_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_email forms_blocks_email_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_message forms_blocks_message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_number forms_blocks_number_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select_options forms_blocks_select_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_select forms_blocks_select_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_text forms_blocks_text_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_pkey PRIMARY KEY (id);


--
-- Name: forms_blocks_textarea forms_blocks_textarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_pkey PRIMARY KEY (id);


--
-- Name: forms_emails forms_emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_pkey PRIMARY KEY (id);


--
-- Name: forms forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_pkey PRIMARY KEY (id);


--
-- Name: forms_rels forms_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_rels
    ADD CONSTRAINT forms_rels_pkey PRIMARY KEY (id);


--
-- Name: industries industries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_pkey PRIMARY KEY (id);


--
-- Name: industries_rels industries_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries_rels
    ADD CONSTRAINT industries_rels_pkey PRIMARY KEY (id);


--
-- Name: main_nav_items_children main_nav_items_children_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav_items_children
    ADD CONSTRAINT main_nav_items_children_pkey PRIMARY KEY (id);


--
-- Name: main_nav_items main_nav_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav_items
    ADD CONSTRAINT main_nav_items_pkey PRIMARY KEY (id);


--
-- Name: main_nav main_nav_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav
    ADD CONSTRAINT main_nav_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: partners_rels partners_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_rels
    ADD CONSTRAINT partners_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_kv payload_kv_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_kv
    ADD CONSTRAINT payload_kv_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents payload_locked_documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents
    ADD CONSTRAINT payload_locked_documents_pkey PRIMARY KEY (id);


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pkey PRIMARY KEY (id);


--
-- Name: payload_migrations payload_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_migrations
    ADD CONSTRAINT payload_migrations_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences payload_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences
    ADD CONSTRAINT payload_preferences_pkey PRIMARY KEY (id);


--
-- Name: payload_preferences_rels payload_preferences_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_pkey PRIMARY KEY (id);


--
-- Name: services_highlights services_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_highlights
    ADD CONSTRAINT services_highlights_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: services_rels services_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_pkey PRIMARY KEY (id);


--
-- Name: site_settings_office_hours site_settings_office_hours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_office_hours
    ADD CONSTRAINT site_settings_office_hours_pkey PRIMARY KEY (id);


--
-- Name: site_settings site_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_pkey PRIMARY KEY (id);


--
-- Name: solutions_highlights solutions_highlights_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_highlights
    ADD CONSTRAINT solutions_highlights_pkey PRIMARY KEY (id);


--
-- Name: solutions solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- Name: solutions_rels solutions_rels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_rels
    ADD CONSTRAINT solutions_rels_pkey PRIMARY KEY (id);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_sessions users_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_pkey PRIMARY KEY (id);


--
-- Name: webinars webinars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars
    ADD CONSTRAINT webinars_pkey PRIMARY KEY (id);


--
-- Name: webinars_speakers webinars_speakers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars_speakers
    ADD CONSTRAINT webinars_speakers_pkey PRIMARY KEY (id);


--
-- Name: _forms_v_blocks_checkbox_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_checkbox_order_idx ON public._forms_v_blocks_checkbox USING btree (_order);


--
-- Name: _forms_v_blocks_checkbox_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_checkbox_parent_id_idx ON public._forms_v_blocks_checkbox USING btree (_parent_id);


--
-- Name: _forms_v_blocks_checkbox_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_checkbox_path_idx ON public._forms_v_blocks_checkbox USING btree (_path);


--
-- Name: _forms_v_blocks_email_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_email_order_idx ON public._forms_v_blocks_email USING btree (_order);


--
-- Name: _forms_v_blocks_email_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_email_parent_id_idx ON public._forms_v_blocks_email USING btree (_parent_id);


--
-- Name: _forms_v_blocks_email_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_email_path_idx ON public._forms_v_blocks_email USING btree (_path);


--
-- Name: _forms_v_blocks_message_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_message_order_idx ON public._forms_v_blocks_message USING btree (_order);


--
-- Name: _forms_v_blocks_message_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_message_parent_id_idx ON public._forms_v_blocks_message USING btree (_parent_id);


--
-- Name: _forms_v_blocks_message_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_message_path_idx ON public._forms_v_blocks_message USING btree (_path);


--
-- Name: _forms_v_blocks_number_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_number_order_idx ON public._forms_v_blocks_number USING btree (_order);


--
-- Name: _forms_v_blocks_number_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_number_parent_id_idx ON public._forms_v_blocks_number USING btree (_parent_id);


--
-- Name: _forms_v_blocks_number_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_number_path_idx ON public._forms_v_blocks_number USING btree (_path);


--
-- Name: _forms_v_blocks_select_options_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_select_options_order_idx ON public._forms_v_blocks_select_options USING btree (_order);


--
-- Name: _forms_v_blocks_select_options_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_select_options_parent_id_idx ON public._forms_v_blocks_select_options USING btree (_parent_id);


--
-- Name: _forms_v_blocks_select_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_select_order_idx ON public._forms_v_blocks_select USING btree (_order);


--
-- Name: _forms_v_blocks_select_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_select_parent_id_idx ON public._forms_v_blocks_select USING btree (_parent_id);


--
-- Name: _forms_v_blocks_select_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_select_path_idx ON public._forms_v_blocks_select USING btree (_path);


--
-- Name: _forms_v_blocks_text_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_text_order_idx ON public._forms_v_blocks_text USING btree (_order);


--
-- Name: _forms_v_blocks_text_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_text_parent_id_idx ON public._forms_v_blocks_text USING btree (_parent_id);


--
-- Name: _forms_v_blocks_text_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_text_path_idx ON public._forms_v_blocks_text USING btree (_path);


--
-- Name: _forms_v_blocks_textarea_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_textarea_order_idx ON public._forms_v_blocks_textarea USING btree (_order);


--
-- Name: _forms_v_blocks_textarea_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_textarea_parent_id_idx ON public._forms_v_blocks_textarea USING btree (_parent_id);


--
-- Name: _forms_v_blocks_textarea_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_blocks_textarea_path_idx ON public._forms_v_blocks_textarea USING btree (_path);


--
-- Name: _forms_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_created_at_idx ON public._forms_v USING btree (created_at);


--
-- Name: _forms_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_latest_idx ON public._forms_v USING btree (latest);


--
-- Name: _forms_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_parent_idx ON public._forms_v USING btree (parent_id);


--
-- Name: _forms_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_rels_order_idx ON public._forms_v_rels USING btree ("order");


--
-- Name: _forms_v_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_rels_pages_id_idx ON public._forms_v_rels USING btree (pages_id);


--
-- Name: _forms_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_rels_parent_idx ON public._forms_v_rels USING btree (parent_id);


--
-- Name: _forms_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_rels_path_idx ON public._forms_v_rels USING btree (path);


--
-- Name: _forms_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_updated_at_idx ON public._forms_v USING btree (updated_at);


--
-- Name: _forms_v_version_emails_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_emails_order_idx ON public._forms_v_version_emails USING btree (_order);


--
-- Name: _forms_v_version_emails_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_emails_parent_id_idx ON public._forms_v_version_emails USING btree (_parent_id);


--
-- Name: _forms_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_seo_version_seo_og_image_idx ON public._forms_v USING btree (version_seo_og_image_id);


--
-- Name: _forms_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_version__status_idx ON public._forms_v USING btree (version__status);


--
-- Name: _forms_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_version_created_at_idx ON public._forms_v USING btree (version_created_at);


--
-- Name: _forms_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_version_slug_idx ON public._forms_v USING btree (version_slug);


--
-- Name: _forms_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _forms_v_version_version_updated_at_idx ON public._forms_v USING btree (version_updated_at);


--
-- Name: _industries_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_created_at_idx ON public._industries_v USING btree (created_at);


--
-- Name: _industries_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_latest_idx ON public._industries_v USING btree (latest);


--
-- Name: _industries_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_parent_idx ON public._industries_v USING btree (parent_id);


--
-- Name: _industries_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_rels_order_idx ON public._industries_v_rels USING btree ("order");


--
-- Name: _industries_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_rels_parent_idx ON public._industries_v_rels USING btree (parent_id);


--
-- Name: _industries_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_rels_path_idx ON public._industries_v_rels USING btree (path);


--
-- Name: _industries_v_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_rels_solutions_id_idx ON public._industries_v_rels USING btree (solutions_id);


--
-- Name: _industries_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_updated_at_idx ON public._industries_v USING btree (updated_at);


--
-- Name: _industries_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_seo_version_seo_og_image_idx ON public._industries_v USING btree (version_seo_og_image_id);


--
-- Name: _industries_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version__status_idx ON public._industries_v USING btree (version__status);


--
-- Name: _industries_v_version_version_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version_cover_image_idx ON public._industries_v USING btree (version_cover_image_id);


--
-- Name: _industries_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version_created_at_idx ON public._industries_v USING btree (version_created_at);


--
-- Name: _industries_v_version_version_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version_icon_idx ON public._industries_v USING btree (version_icon_id);


--
-- Name: _industries_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version_slug_idx ON public._industries_v USING btree (version_slug);


--
-- Name: _industries_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _industries_v_version_version_updated_at_idx ON public._industries_v USING btree (version_updated_at);


--
-- Name: _pages_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_created_at_idx ON public._pages_v USING btree (created_at);


--
-- Name: _pages_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_latest_idx ON public._pages_v USING btree (latest);


--
-- Name: _pages_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_parent_idx ON public._pages_v USING btree (parent_id);


--
-- Name: _pages_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_updated_at_idx ON public._pages_v USING btree (updated_at);


--
-- Name: _pages_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_seo_version_seo_og_image_idx ON public._pages_v USING btree (version_seo_og_image_id);


--
-- Name: _pages_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version__status_idx ON public._pages_v USING btree (version__status);


--
-- Name: _pages_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version_created_at_idx ON public._pages_v USING btree (version_created_at);


--
-- Name: _pages_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version_slug_idx ON public._pages_v USING btree (version_slug);


--
-- Name: _pages_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _pages_v_version_version_updated_at_idx ON public._pages_v USING btree (version_updated_at);


--
-- Name: _services_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_created_at_idx ON public._services_v USING btree (created_at);


--
-- Name: _services_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_latest_idx ON public._services_v USING btree (latest);


--
-- Name: _services_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_parent_idx ON public._services_v USING btree (parent_id);


--
-- Name: _services_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_rels_order_idx ON public._services_v_rels USING btree ("order");


--
-- Name: _services_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_rels_parent_idx ON public._services_v_rels USING btree (parent_id);


--
-- Name: _services_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_rels_path_idx ON public._services_v_rels USING btree (path);


--
-- Name: _services_v_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_rels_solutions_id_idx ON public._services_v_rels USING btree (solutions_id);


--
-- Name: _services_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_updated_at_idx ON public._services_v USING btree (updated_at);


--
-- Name: _services_v_version_highlights_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_highlights_order_idx ON public._services_v_version_highlights USING btree (_order);


--
-- Name: _services_v_version_highlights_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_highlights_parent_id_idx ON public._services_v_version_highlights USING btree (_parent_id);


--
-- Name: _services_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_seo_version_seo_og_image_idx ON public._services_v USING btree (version_seo_og_image_id);


--
-- Name: _services_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version__status_idx ON public._services_v USING btree (version__status);


--
-- Name: _services_v_version_version_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version_cover_image_idx ON public._services_v USING btree (version_cover_image_id);


--
-- Name: _services_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version_created_at_idx ON public._services_v USING btree (version_created_at);


--
-- Name: _services_v_version_version_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version_icon_idx ON public._services_v USING btree (version_icon_id);


--
-- Name: _services_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version_slug_idx ON public._services_v USING btree (version_slug);


--
-- Name: _services_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _services_v_version_version_updated_at_idx ON public._services_v USING btree (version_updated_at);


--
-- Name: _solutions_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_created_at_idx ON public._solutions_v USING btree (created_at);


--
-- Name: _solutions_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_latest_idx ON public._solutions_v USING btree (latest);


--
-- Name: _solutions_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_parent_idx ON public._solutions_v USING btree (parent_id);


--
-- Name: _solutions_v_rels_industries_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_rels_industries_id_idx ON public._solutions_v_rels USING btree (industries_id);


--
-- Name: _solutions_v_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_rels_order_idx ON public._solutions_v_rels USING btree ("order");


--
-- Name: _solutions_v_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_rels_parent_idx ON public._solutions_v_rels USING btree (parent_id);


--
-- Name: _solutions_v_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_rels_path_idx ON public._solutions_v_rels USING btree (path);


--
-- Name: _solutions_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_updated_at_idx ON public._solutions_v USING btree (updated_at);


--
-- Name: _solutions_v_version_highlights_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_highlights_order_idx ON public._solutions_v_version_highlights USING btree (_order);


--
-- Name: _solutions_v_version_highlights_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_highlights_parent_id_idx ON public._solutions_v_version_highlights USING btree (_parent_id);


--
-- Name: _solutions_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_seo_version_seo_og_image_idx ON public._solutions_v USING btree (version_seo_og_image_id);


--
-- Name: _solutions_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version__status_idx ON public._solutions_v USING btree (version__status);


--
-- Name: _solutions_v_version_version_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version_cover_image_idx ON public._solutions_v USING btree (version_cover_image_id);


--
-- Name: _solutions_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version_created_at_idx ON public._solutions_v USING btree (version_created_at);


--
-- Name: _solutions_v_version_version_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version_icon_idx ON public._solutions_v USING btree (version_icon_id);


--
-- Name: _solutions_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version_slug_idx ON public._solutions_v USING btree (version_slug);


--
-- Name: _solutions_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _solutions_v_version_version_updated_at_idx ON public._solutions_v USING btree (version_updated_at);


--
-- Name: _webinars_v_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_created_at_idx ON public._webinars_v USING btree (created_at);


--
-- Name: _webinars_v_latest_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_latest_idx ON public._webinars_v USING btree (latest);


--
-- Name: _webinars_v_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_parent_idx ON public._webinars_v USING btree (parent_id);


--
-- Name: _webinars_v_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_updated_at_idx ON public._webinars_v USING btree (updated_at);


--
-- Name: _webinars_v_version_seo_version_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_seo_version_seo_og_image_idx ON public._webinars_v USING btree (version_seo_og_image_id);


--
-- Name: _webinars_v_version_speakers_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_speakers_order_idx ON public._webinars_v_version_speakers USING btree (_order);


--
-- Name: _webinars_v_version_speakers_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_speakers_parent_id_idx ON public._webinars_v_version_speakers USING btree (_parent_id);


--
-- Name: _webinars_v_version_speakers_photo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_speakers_photo_idx ON public._webinars_v_version_speakers USING btree (photo_id);


--
-- Name: _webinars_v_version_version__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version__status_idx ON public._webinars_v USING btree (version__status);


--
-- Name: _webinars_v_version_version_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_cover_image_idx ON public._webinars_v USING btree (version_cover_image_id);


--
-- Name: _webinars_v_version_version_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_created_at_idx ON public._webinars_v USING btree (version_created_at);


--
-- Name: _webinars_v_version_version_partner_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_partner_idx ON public._webinars_v USING btree (version_partner_id);


--
-- Name: _webinars_v_version_version_registration_form_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_registration_form_idx ON public._webinars_v USING btree (version_registration_form_id);


--
-- Name: _webinars_v_version_version_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_slug_idx ON public._webinars_v USING btree (version_slug);


--
-- Name: _webinars_v_version_version_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX _webinars_v_version_version_updated_at_idx ON public._webinars_v USING btree (version_updated_at);


--
-- Name: contact_submissions_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contact_submissions_created_at_idx ON public.contact_submissions USING btree (created_at);


--
-- Name: contact_submissions_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX contact_submissions_updated_at_idx ON public.contact_submissions USING btree (updated_at);


--
-- Name: footer_bottom_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_bottom_links_order_idx ON public.footer_bottom_links USING btree (_order);


--
-- Name: footer_bottom_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_bottom_links_parent_id_idx ON public.footer_bottom_links USING btree (_parent_id);


--
-- Name: footer_columns_links_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_columns_links_order_idx ON public.footer_columns_links USING btree (_order);


--
-- Name: footer_columns_links_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_columns_links_parent_id_idx ON public.footer_columns_links USING btree (_parent_id);


--
-- Name: footer_columns_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_columns_order_idx ON public.footer_columns USING btree (_order);


--
-- Name: footer_columns_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX footer_columns_parent_id_idx ON public.footer_columns USING btree (_parent_id);


--
-- Name: form_submissions_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_submissions_created_at_idx ON public.form_submissions USING btree (created_at);


--
-- Name: form_submissions_form_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_submissions_form_idx ON public.form_submissions USING btree (form_id);


--
-- Name: form_submissions_submission_data_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_submissions_submission_data_order_idx ON public.form_submissions_submission_data USING btree (_order);


--
-- Name: form_submissions_submission_data_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_submissions_submission_data_parent_id_idx ON public.form_submissions_submission_data USING btree (_parent_id);


--
-- Name: form_submissions_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX form_submissions_updated_at_idx ON public.form_submissions USING btree (updated_at);


--
-- Name: forms__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms__status_idx ON public.forms USING btree (_status);


--
-- Name: forms_blocks_checkbox_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_checkbox_order_idx ON public.forms_blocks_checkbox USING btree (_order);


--
-- Name: forms_blocks_checkbox_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_checkbox_parent_id_idx ON public.forms_blocks_checkbox USING btree (_parent_id);


--
-- Name: forms_blocks_checkbox_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_checkbox_path_idx ON public.forms_blocks_checkbox USING btree (_path);


--
-- Name: forms_blocks_email_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_email_order_idx ON public.forms_blocks_email USING btree (_order);


--
-- Name: forms_blocks_email_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_email_parent_id_idx ON public.forms_blocks_email USING btree (_parent_id);


--
-- Name: forms_blocks_email_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_email_path_idx ON public.forms_blocks_email USING btree (_path);


--
-- Name: forms_blocks_message_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_message_order_idx ON public.forms_blocks_message USING btree (_order);


--
-- Name: forms_blocks_message_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_message_parent_id_idx ON public.forms_blocks_message USING btree (_parent_id);


--
-- Name: forms_blocks_message_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_message_path_idx ON public.forms_blocks_message USING btree (_path);


--
-- Name: forms_blocks_number_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_number_order_idx ON public.forms_blocks_number USING btree (_order);


--
-- Name: forms_blocks_number_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_number_parent_id_idx ON public.forms_blocks_number USING btree (_parent_id);


--
-- Name: forms_blocks_number_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_number_path_idx ON public.forms_blocks_number USING btree (_path);


--
-- Name: forms_blocks_select_options_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_select_options_order_idx ON public.forms_blocks_select_options USING btree (_order);


--
-- Name: forms_blocks_select_options_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_select_options_parent_id_idx ON public.forms_blocks_select_options USING btree (_parent_id);


--
-- Name: forms_blocks_select_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_select_order_idx ON public.forms_blocks_select USING btree (_order);


--
-- Name: forms_blocks_select_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_select_parent_id_idx ON public.forms_blocks_select USING btree (_parent_id);


--
-- Name: forms_blocks_select_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_select_path_idx ON public.forms_blocks_select USING btree (_path);


--
-- Name: forms_blocks_text_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_text_order_idx ON public.forms_blocks_text USING btree (_order);


--
-- Name: forms_blocks_text_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_text_parent_id_idx ON public.forms_blocks_text USING btree (_parent_id);


--
-- Name: forms_blocks_text_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_text_path_idx ON public.forms_blocks_text USING btree (_path);


--
-- Name: forms_blocks_textarea_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_textarea_order_idx ON public.forms_blocks_textarea USING btree (_order);


--
-- Name: forms_blocks_textarea_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_textarea_parent_id_idx ON public.forms_blocks_textarea USING btree (_parent_id);


--
-- Name: forms_blocks_textarea_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_blocks_textarea_path_idx ON public.forms_blocks_textarea USING btree (_path);


--
-- Name: forms_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_created_at_idx ON public.forms USING btree (created_at);


--
-- Name: forms_emails_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_emails_order_idx ON public.forms_emails USING btree (_order);


--
-- Name: forms_emails_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_emails_parent_id_idx ON public.forms_emails USING btree (_parent_id);


--
-- Name: forms_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_rels_order_idx ON public.forms_rels USING btree ("order");


--
-- Name: forms_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_rels_pages_id_idx ON public.forms_rels USING btree (pages_id);


--
-- Name: forms_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_rels_parent_idx ON public.forms_rels USING btree (parent_id);


--
-- Name: forms_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_rels_path_idx ON public.forms_rels USING btree (path);


--
-- Name: forms_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_seo_seo_og_image_idx ON public.forms USING btree (seo_og_image_id);


--
-- Name: forms_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX forms_slug_idx ON public.forms USING btree (slug);


--
-- Name: forms_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX forms_updated_at_idx ON public.forms USING btree (updated_at);


--
-- Name: industries__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries__status_idx ON public.industries USING btree (_status);


--
-- Name: industries_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_cover_image_idx ON public.industries USING btree (cover_image_id);


--
-- Name: industries_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_created_at_idx ON public.industries USING btree (created_at);


--
-- Name: industries_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_icon_idx ON public.industries USING btree (icon_id);


--
-- Name: industries_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_rels_order_idx ON public.industries_rels USING btree ("order");


--
-- Name: industries_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_rels_parent_idx ON public.industries_rels USING btree (parent_id);


--
-- Name: industries_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_rels_path_idx ON public.industries_rels USING btree (path);


--
-- Name: industries_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_rels_solutions_id_idx ON public.industries_rels USING btree (solutions_id);


--
-- Name: industries_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_seo_seo_og_image_idx ON public.industries USING btree (seo_og_image_id);


--
-- Name: industries_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX industries_slug_idx ON public.industries USING btree (slug);


--
-- Name: industries_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX industries_updated_at_idx ON public.industries USING btree (updated_at);


--
-- Name: main_nav_items_children_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_nav_items_children_order_idx ON public.main_nav_items_children USING btree (_order);


--
-- Name: main_nav_items_children_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_nav_items_children_parent_id_idx ON public.main_nav_items_children USING btree (_parent_id);


--
-- Name: main_nav_items_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_nav_items_order_idx ON public.main_nav_items USING btree (_order);


--
-- Name: main_nav_items_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX main_nav_items_parent_id_idx ON public.main_nav_items USING btree (_parent_id);


--
-- Name: media_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_created_at_idx ON public.media USING btree (created_at);


--
-- Name: media_filename_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX media_filename_idx ON public.media USING btree (filename);


--
-- Name: media_sizes_card_sizes_card_filename_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_sizes_card_sizes_card_filename_idx ON public.media USING btree (sizes_card_filename);


--
-- Name: media_sizes_thumbnail_sizes_thumbnail_filename_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_sizes_thumbnail_sizes_thumbnail_filename_idx ON public.media USING btree (sizes_thumbnail_filename);


--
-- Name: media_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX media_updated_at_idx ON public.media USING btree (updated_at);


--
-- Name: pages__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages__status_idx ON public.pages USING btree (_status);


--
-- Name: pages_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_created_at_idx ON public.pages USING btree (created_at);


--
-- Name: pages_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_seo_seo_og_image_idx ON public.pages USING btree (seo_og_image_id);


--
-- Name: pages_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pages_slug_idx ON public.pages USING btree (slug);


--
-- Name: pages_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pages_updated_at_idx ON public.pages USING btree (updated_at);


--
-- Name: partners_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_created_at_idx ON public.partners USING btree (created_at);


--
-- Name: partners_logo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_logo_idx ON public.partners USING btree (logo_id);


--
-- Name: partners_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_rels_order_idx ON public.partners_rels USING btree ("order");


--
-- Name: partners_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_rels_parent_idx ON public.partners_rels USING btree (parent_id);


--
-- Name: partners_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_rels_path_idx ON public.partners_rels USING btree (path);


--
-- Name: partners_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_rels_solutions_id_idx ON public.partners_rels USING btree (solutions_id);


--
-- Name: partners_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_seo_seo_og_image_idx ON public.partners USING btree (seo_og_image_id);


--
-- Name: partners_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX partners_slug_idx ON public.partners USING btree (slug);


--
-- Name: partners_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX partners_updated_at_idx ON public.partners USING btree (updated_at);


--
-- Name: payload_kv_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX payload_kv_key_idx ON public.payload_kv USING btree (key);


--
-- Name: payload_locked_documents_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_created_at_idx ON public.payload_locked_documents USING btree (created_at);


--
-- Name: payload_locked_documents_global_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_global_slug_idx ON public.payload_locked_documents USING btree (global_slug);


--
-- Name: payload_locked_documents_rels_contact_submissions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_contact_submissions_id_idx ON public.payload_locked_documents_rels USING btree (contact_submissions_id);


--
-- Name: payload_locked_documents_rels_form_submissions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_form_submissions_id_idx ON public.payload_locked_documents_rels USING btree (form_submissions_id);


--
-- Name: payload_locked_documents_rels_forms_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_forms_id_idx ON public.payload_locked_documents_rels USING btree (forms_id);


--
-- Name: payload_locked_documents_rels_industries_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_industries_id_idx ON public.payload_locked_documents_rels USING btree (industries_id);


--
-- Name: payload_locked_documents_rels_media_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_media_id_idx ON public.payload_locked_documents_rels USING btree (media_id);


--
-- Name: payload_locked_documents_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_order_idx ON public.payload_locked_documents_rels USING btree ("order");


--
-- Name: payload_locked_documents_rels_pages_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_pages_id_idx ON public.payload_locked_documents_rels USING btree (pages_id);


--
-- Name: payload_locked_documents_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_parent_idx ON public.payload_locked_documents_rels USING btree (parent_id);


--
-- Name: payload_locked_documents_rels_partners_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_partners_id_idx ON public.payload_locked_documents_rels USING btree (partners_id);


--
-- Name: payload_locked_documents_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_path_idx ON public.payload_locked_documents_rels USING btree (path);


--
-- Name: payload_locked_documents_rels_services_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_services_id_idx ON public.payload_locked_documents_rels USING btree (services_id);


--
-- Name: payload_locked_documents_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_solutions_id_idx ON public.payload_locked_documents_rels USING btree (solutions_id);


--
-- Name: payload_locked_documents_rels_team_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_team_id_idx ON public.payload_locked_documents_rels USING btree (team_id);


--
-- Name: payload_locked_documents_rels_users_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_users_id_idx ON public.payload_locked_documents_rels USING btree (users_id);


--
-- Name: payload_locked_documents_rels_webinars_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_rels_webinars_id_idx ON public.payload_locked_documents_rels USING btree (webinars_id);


--
-- Name: payload_locked_documents_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_locked_documents_updated_at_idx ON public.payload_locked_documents USING btree (updated_at);


--
-- Name: payload_migrations_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_migrations_created_at_idx ON public.payload_migrations USING btree (created_at);


--
-- Name: payload_migrations_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_migrations_updated_at_idx ON public.payload_migrations USING btree (updated_at);


--
-- Name: payload_preferences_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_created_at_idx ON public.payload_preferences USING btree (created_at);


--
-- Name: payload_preferences_key_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_key_idx ON public.payload_preferences USING btree (key);


--
-- Name: payload_preferences_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_order_idx ON public.payload_preferences_rels USING btree ("order");


--
-- Name: payload_preferences_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_parent_idx ON public.payload_preferences_rels USING btree (parent_id);


--
-- Name: payload_preferences_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_path_idx ON public.payload_preferences_rels USING btree (path);


--
-- Name: payload_preferences_rels_users_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_rels_users_id_idx ON public.payload_preferences_rels USING btree (users_id);


--
-- Name: payload_preferences_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX payload_preferences_updated_at_idx ON public.payload_preferences USING btree (updated_at);


--
-- Name: services__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services__status_idx ON public.services USING btree (_status);


--
-- Name: services_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_cover_image_idx ON public.services USING btree (cover_image_id);


--
-- Name: services_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_created_at_idx ON public.services USING btree (created_at);


--
-- Name: services_highlights_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_highlights_order_idx ON public.services_highlights USING btree (_order);


--
-- Name: services_highlights_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_highlights_parent_id_idx ON public.services_highlights USING btree (_parent_id);


--
-- Name: services_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_icon_idx ON public.services USING btree (icon_id);


--
-- Name: services_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_rels_order_idx ON public.services_rels USING btree ("order");


--
-- Name: services_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_rels_parent_idx ON public.services_rels USING btree (parent_id);


--
-- Name: services_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_rels_path_idx ON public.services_rels USING btree (path);


--
-- Name: services_rels_solutions_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_rels_solutions_id_idx ON public.services_rels USING btree (solutions_id);


--
-- Name: services_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_seo_seo_og_image_idx ON public.services USING btree (seo_og_image_id);


--
-- Name: services_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX services_slug_idx ON public.services USING btree (slug);


--
-- Name: services_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX services_updated_at_idx ON public.services USING btree (updated_at);


--
-- Name: site_settings_default_s_e_o_default_s_e_o_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_default_s_e_o_default_s_e_o_og_image_idx ON public.site_settings USING btree (default_s_e_o_og_image_id);


--
-- Name: site_settings_favicon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_favicon_idx ON public.site_settings USING btree (favicon_id);


--
-- Name: site_settings_logo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_logo_idx ON public.site_settings USING btree (logo_id);


--
-- Name: site_settings_office_hours_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_office_hours_order_idx ON public.site_settings_office_hours USING btree (_order);


--
-- Name: site_settings_office_hours_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX site_settings_office_hours_parent_id_idx ON public.site_settings_office_hours USING btree (_parent_id);


--
-- Name: solutions__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions__status_idx ON public.solutions USING btree (_status);


--
-- Name: solutions_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_cover_image_idx ON public.solutions USING btree (cover_image_id);


--
-- Name: solutions_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_created_at_idx ON public.solutions USING btree (created_at);


--
-- Name: solutions_highlights_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_highlights_order_idx ON public.solutions_highlights USING btree (_order);


--
-- Name: solutions_highlights_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_highlights_parent_id_idx ON public.solutions_highlights USING btree (_parent_id);


--
-- Name: solutions_icon_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_icon_idx ON public.solutions USING btree (icon_id);


--
-- Name: solutions_rels_industries_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_rels_industries_id_idx ON public.solutions_rels USING btree (industries_id);


--
-- Name: solutions_rels_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_rels_order_idx ON public.solutions_rels USING btree ("order");


--
-- Name: solutions_rels_parent_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_rels_parent_idx ON public.solutions_rels USING btree (parent_id);


--
-- Name: solutions_rels_path_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_rels_path_idx ON public.solutions_rels USING btree (path);


--
-- Name: solutions_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_seo_seo_og_image_idx ON public.solutions USING btree (seo_og_image_id);


--
-- Name: solutions_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX solutions_slug_idx ON public.solutions USING btree (slug);


--
-- Name: solutions_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solutions_updated_at_idx ON public.solutions USING btree (updated_at);


--
-- Name: team_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_created_at_idx ON public.team USING btree (created_at);


--
-- Name: team_photo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_photo_idx ON public.team USING btree (photo_id);


--
-- Name: team_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX team_updated_at_idx ON public.team USING btree (updated_at);


--
-- Name: users_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_created_at_idx ON public.users USING btree (created_at);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_sessions_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_sessions_order_idx ON public.users_sessions USING btree (_order);


--
-- Name: users_sessions_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_sessions_parent_id_idx ON public.users_sessions USING btree (_parent_id);


--
-- Name: users_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_updated_at_idx ON public.users USING btree (updated_at);


--
-- Name: webinars__status_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars__status_idx ON public.webinars USING btree (_status);


--
-- Name: webinars_cover_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_cover_image_idx ON public.webinars USING btree (cover_image_id);


--
-- Name: webinars_created_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_created_at_idx ON public.webinars USING btree (created_at);


--
-- Name: webinars_partner_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_partner_idx ON public.webinars USING btree (partner_id);


--
-- Name: webinars_registration_form_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_registration_form_idx ON public.webinars USING btree (registration_form_id);


--
-- Name: webinars_seo_seo_og_image_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_seo_seo_og_image_idx ON public.webinars USING btree (seo_og_image_id);


--
-- Name: webinars_slug_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX webinars_slug_idx ON public.webinars USING btree (slug);


--
-- Name: webinars_speakers_order_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_speakers_order_idx ON public.webinars_speakers USING btree (_order);


--
-- Name: webinars_speakers_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_speakers_parent_id_idx ON public.webinars_speakers USING btree (_parent_id);


--
-- Name: webinars_speakers_photo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_speakers_photo_idx ON public.webinars_speakers USING btree (photo_id);


--
-- Name: webinars_updated_at_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX webinars_updated_at_idx ON public.webinars USING btree (updated_at);


--
-- Name: _forms_v_blocks_checkbox _forms_v_blocks_checkbox_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_checkbox
    ADD CONSTRAINT _forms_v_blocks_checkbox_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_email _forms_v_blocks_email_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_email
    ADD CONSTRAINT _forms_v_blocks_email_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_message _forms_v_blocks_message_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_message
    ADD CONSTRAINT _forms_v_blocks_message_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_number _forms_v_blocks_number_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_number
    ADD CONSTRAINT _forms_v_blocks_number_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_select_options _forms_v_blocks_select_options_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select_options
    ADD CONSTRAINT _forms_v_blocks_select_options_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v_blocks_select(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_select _forms_v_blocks_select_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_select
    ADD CONSTRAINT _forms_v_blocks_select_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_text _forms_v_blocks_text_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_text
    ADD CONSTRAINT _forms_v_blocks_text_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_blocks_textarea _forms_v_blocks_textarea_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_blocks_textarea
    ADD CONSTRAINT _forms_v_blocks_textarea_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v _forms_v_parent_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v
    ADD CONSTRAINT _forms_v_parent_id_forms_id_fk FOREIGN KEY (parent_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _forms_v_rels _forms_v_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_rels
    ADD CONSTRAINT _forms_v_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: _forms_v_rels _forms_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_rels
    ADD CONSTRAINT _forms_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v_version_emails _forms_v_version_emails_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v_version_emails
    ADD CONSTRAINT _forms_v_version_emails_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._forms_v(id) ON DELETE CASCADE;


--
-- Name: _forms_v _forms_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._forms_v
    ADD CONSTRAINT _forms_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _industries_v _industries_v_parent_id_industries_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v
    ADD CONSTRAINT _industries_v_parent_id_industries_id_fk FOREIGN KEY (parent_id) REFERENCES public.industries(id) ON DELETE SET NULL;


--
-- Name: _industries_v_rels _industries_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v_rels
    ADD CONSTRAINT _industries_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._industries_v(id) ON DELETE CASCADE;


--
-- Name: _industries_v_rels _industries_v_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v_rels
    ADD CONSTRAINT _industries_v_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: _industries_v _industries_v_version_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v
    ADD CONSTRAINT _industries_v_version_cover_image_id_media_id_fk FOREIGN KEY (version_cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _industries_v _industries_v_version_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v
    ADD CONSTRAINT _industries_v_version_icon_id_media_id_fk FOREIGN KEY (version_icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _industries_v _industries_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._industries_v
    ADD CONSTRAINT _industries_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_parent_id_pages_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_parent_id_pages_id_fk FOREIGN KEY (parent_id) REFERENCES public.pages(id) ON DELETE SET NULL;


--
-- Name: _pages_v _pages_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._pages_v
    ADD CONSTRAINT _pages_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v _services_v_parent_id_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_parent_id_services_id_fk FOREIGN KEY (parent_id) REFERENCES public.services(id) ON DELETE SET NULL;


--
-- Name: _services_v_rels _services_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v_rels _services_v_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_rels
    ADD CONSTRAINT _services_v_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: _services_v _services_v_version_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_cover_image_id_media_id_fk FOREIGN KEY (version_cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v_version_highlights _services_v_version_highlights_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v_version_highlights
    ADD CONSTRAINT _services_v_version_highlights_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._services_v(id) ON DELETE CASCADE;


--
-- Name: _services_v _services_v_version_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_icon_id_media_id_fk FOREIGN KEY (version_icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _services_v _services_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._services_v
    ADD CONSTRAINT _services_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _solutions_v _solutions_v_parent_id_solutions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v
    ADD CONSTRAINT _solutions_v_parent_id_solutions_id_fk FOREIGN KEY (parent_id) REFERENCES public.solutions(id) ON DELETE SET NULL;


--
-- Name: _solutions_v_rels _solutions_v_rels_industries_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_rels
    ADD CONSTRAINT _solutions_v_rels_industries_fk FOREIGN KEY (industries_id) REFERENCES public.industries(id) ON DELETE CASCADE;


--
-- Name: _solutions_v_rels _solutions_v_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_rels
    ADD CONSTRAINT _solutions_v_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public._solutions_v(id) ON DELETE CASCADE;


--
-- Name: _solutions_v _solutions_v_version_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v
    ADD CONSTRAINT _solutions_v_version_cover_image_id_media_id_fk FOREIGN KEY (version_cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _solutions_v_version_highlights _solutions_v_version_highlights_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v_version_highlights
    ADD CONSTRAINT _solutions_v_version_highlights_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._solutions_v(id) ON DELETE CASCADE;


--
-- Name: _solutions_v _solutions_v_version_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v
    ADD CONSTRAINT _solutions_v_version_icon_id_media_id_fk FOREIGN KEY (version_icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _solutions_v _solutions_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._solutions_v
    ADD CONSTRAINT _solutions_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _webinars_v _webinars_v_parent_id_webinars_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_parent_id_webinars_id_fk FOREIGN KEY (parent_id) REFERENCES public.webinars(id) ON DELETE SET NULL;


--
-- Name: _webinars_v _webinars_v_version_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_version_cover_image_id_media_id_fk FOREIGN KEY (version_cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _webinars_v _webinars_v_version_partner_id_partners_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_version_partner_id_partners_id_fk FOREIGN KEY (version_partner_id) REFERENCES public.partners(id) ON DELETE SET NULL;


--
-- Name: _webinars_v _webinars_v_version_registration_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_version_registration_form_id_forms_id_fk FOREIGN KEY (version_registration_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: _webinars_v _webinars_v_version_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v
    ADD CONSTRAINT _webinars_v_version_seo_og_image_id_media_id_fk FOREIGN KEY (version_seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: _webinars_v_version_speakers _webinars_v_version_speakers_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v_version_speakers
    ADD CONSTRAINT _webinars_v_version_speakers_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public._webinars_v(id) ON DELETE CASCADE;


--
-- Name: _webinars_v_version_speakers _webinars_v_version_speakers_photo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._webinars_v_version_speakers
    ADD CONSTRAINT _webinars_v_version_speakers_photo_id_media_id_fk FOREIGN KEY (photo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: footer_bottom_links footer_bottom_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_bottom_links
    ADD CONSTRAINT footer_bottom_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: footer_columns_links footer_columns_links_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_columns_links
    ADD CONSTRAINT footer_columns_links_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer_columns(id) ON DELETE CASCADE;


--
-- Name: footer_columns footer_columns_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_columns
    ADD CONSTRAINT footer_columns_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.footer(id) ON DELETE CASCADE;


--
-- Name: form_submissions form_submissions_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_submissions
    ADD CONSTRAINT form_submissions_form_id_forms_id_fk FOREIGN KEY (form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: form_submissions_submission_data form_submissions_submission_data_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.form_submissions_submission_data
    ADD CONSTRAINT form_submissions_submission_data_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_checkbox forms_blocks_checkbox_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_checkbox
    ADD CONSTRAINT forms_blocks_checkbox_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_email forms_blocks_email_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_email
    ADD CONSTRAINT forms_blocks_email_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_message forms_blocks_message_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_message
    ADD CONSTRAINT forms_blocks_message_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_number forms_blocks_number_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_number
    ADD CONSTRAINT forms_blocks_number_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select_options forms_blocks_select_options_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_select_options
    ADD CONSTRAINT forms_blocks_select_options_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms_blocks_select(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_select forms_blocks_select_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_select
    ADD CONSTRAINT forms_blocks_select_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_text forms_blocks_text_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_text
    ADD CONSTRAINT forms_blocks_text_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_blocks_textarea forms_blocks_textarea_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_blocks_textarea
    ADD CONSTRAINT forms_blocks_textarea_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_emails forms_emails_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_emails
    ADD CONSTRAINT forms_emails_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms_rels forms_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_rels
    ADD CONSTRAINT forms_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: forms_rels forms_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms_rels
    ADD CONSTRAINT forms_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: forms forms_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forms
    ADD CONSTRAINT forms_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: industries industries_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_cover_image_id_media_id_fk FOREIGN KEY (cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: industries industries_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_icon_id_media_id_fk FOREIGN KEY (icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: industries_rels industries_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries_rels
    ADD CONSTRAINT industries_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.industries(id) ON DELETE CASCADE;


--
-- Name: industries_rels industries_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries_rels
    ADD CONSTRAINT industries_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: industries industries_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.industries
    ADD CONSTRAINT industries_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: main_nav_items_children main_nav_items_children_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav_items_children
    ADD CONSTRAINT main_nav_items_children_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.main_nav_items(id) ON DELETE CASCADE;


--
-- Name: main_nav_items main_nav_items_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_nav_items
    ADD CONSTRAINT main_nav_items_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.main_nav(id) ON DELETE CASCADE;


--
-- Name: pages pages_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: partners partners_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_logo_id_media_id_fk FOREIGN KEY (logo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: partners_rels partners_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_rels
    ADD CONSTRAINT partners_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- Name: partners_rels partners_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_rels
    ADD CONSTRAINT partners_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: partners partners_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_contact_submissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_contact_submissions_fk FOREIGN KEY (contact_submissions_id) REFERENCES public.contact_submissions(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_form_submissions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_form_submissions_fk FOREIGN KEY (form_submissions_id) REFERENCES public.form_submissions(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_forms_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_forms_fk FOREIGN KEY (forms_id) REFERENCES public.forms(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_industries_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_industries_fk FOREIGN KEY (industries_id) REFERENCES public.industries(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_media_fk FOREIGN KEY (media_id) REFERENCES public.media(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_pages_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_pages_fk FOREIGN KEY (pages_id) REFERENCES public.pages(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_locked_documents(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_partners_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_partners_fk FOREIGN KEY (partners_id) REFERENCES public.partners(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_services_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_services_fk FOREIGN KEY (services_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_team_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_team_fk FOREIGN KEY (team_id) REFERENCES public.team(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: payload_locked_documents_rels payload_locked_documents_rels_webinars_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_locked_documents_rels
    ADD CONSTRAINT payload_locked_documents_rels_webinars_fk FOREIGN KEY (webinars_id) REFERENCES public.webinars(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.payload_preferences(id) ON DELETE CASCADE;


--
-- Name: payload_preferences_rels payload_preferences_rels_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payload_preferences_rels
    ADD CONSTRAINT payload_preferences_rels_users_fk FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: services services_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_cover_image_id_media_id_fk FOREIGN KEY (cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services_highlights services_highlights_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_highlights
    ADD CONSTRAINT services_highlights_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services services_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_icon_id_media_id_fk FOREIGN KEY (icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: services_rels services_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: services_rels services_rels_solutions_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services_rels
    ADD CONSTRAINT services_rels_solutions_fk FOREIGN KEY (solutions_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: services services_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings site_settings_default_s_e_o_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_default_s_e_o_og_image_id_media_id_fk FOREIGN KEY (default_s_e_o_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings site_settings_favicon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_favicon_id_media_id_fk FOREIGN KEY (favicon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings site_settings_logo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings
    ADD CONSTRAINT site_settings_logo_id_media_id_fk FOREIGN KEY (logo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: site_settings_office_hours site_settings_office_hours_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.site_settings_office_hours
    ADD CONSTRAINT site_settings_office_hours_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.site_settings(id) ON DELETE CASCADE;


--
-- Name: solutions solutions_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT solutions_cover_image_id_media_id_fk FOREIGN KEY (cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: solutions_highlights solutions_highlights_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_highlights
    ADD CONSTRAINT solutions_highlights_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: solutions solutions_icon_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT solutions_icon_id_media_id_fk FOREIGN KEY (icon_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: solutions_rels solutions_rels_industries_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_rels
    ADD CONSTRAINT solutions_rels_industries_fk FOREIGN KEY (industries_id) REFERENCES public.industries(id) ON DELETE CASCADE;


--
-- Name: solutions_rels solutions_rels_parent_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions_rels
    ADD CONSTRAINT solutions_rels_parent_fk FOREIGN KEY (parent_id) REFERENCES public.solutions(id) ON DELETE CASCADE;


--
-- Name: solutions solutions_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solutions
    ADD CONSTRAINT solutions_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: team team_photo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_photo_id_media_id_fk FOREIGN KEY (photo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: users_sessions users_sessions_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_sessions
    ADD CONSTRAINT users_sessions_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: webinars webinars_cover_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars
    ADD CONSTRAINT webinars_cover_image_id_media_id_fk FOREIGN KEY (cover_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: webinars webinars_partner_id_partners_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars
    ADD CONSTRAINT webinars_partner_id_partners_id_fk FOREIGN KEY (partner_id) REFERENCES public.partners(id) ON DELETE SET NULL;


--
-- Name: webinars webinars_registration_form_id_forms_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars
    ADD CONSTRAINT webinars_registration_form_id_forms_id_fk FOREIGN KEY (registration_form_id) REFERENCES public.forms(id) ON DELETE SET NULL;


--
-- Name: webinars webinars_seo_og_image_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars
    ADD CONSTRAINT webinars_seo_og_image_id_media_id_fk FOREIGN KEY (seo_og_image_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- Name: webinars_speakers webinars_speakers_parent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars_speakers
    ADD CONSTRAINT webinars_speakers_parent_id_fk FOREIGN KEY (_parent_id) REFERENCES public.webinars(id) ON DELETE CASCADE;


--
-- Name: webinars_speakers webinars_speakers_photo_id_media_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.webinars_speakers
    ADD CONSTRAINT webinars_speakers_photo_id_media_id_fk FOREIGN KEY (photo_id) REFERENCES public.media(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict tM9roi1JD9r4jsDUoaeJV19FIqbevkcAvfa0oVhdhpJ2Usa14lQQcQpqqMrf0xh

