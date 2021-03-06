--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comfy_cms_blocks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_blocks (
    id integer NOT NULL,
    identifier character varying NOT NULL,
    content text,
    blockable_id integer,
    blockable_type character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comfy_cms_blocks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_blocks_id_seq OWNED BY comfy_cms_blocks.id;


--
-- Name: comfy_cms_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_categories (
    id integer NOT NULL,
    site_id integer NOT NULL,
    label character varying NOT NULL,
    categorized_type character varying NOT NULL
);


--
-- Name: comfy_cms_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_categories_id_seq OWNED BY comfy_cms_categories.id;


--
-- Name: comfy_cms_categorizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_categorizations (
    id integer NOT NULL,
    category_id integer NOT NULL,
    categorized_type character varying NOT NULL,
    categorized_id integer NOT NULL
);


--
-- Name: comfy_cms_categorizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_categorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_categorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_categorizations_id_seq OWNED BY comfy_cms_categorizations.id;


--
-- Name: comfy_cms_files; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_files (
    id integer NOT NULL,
    site_id integer NOT NULL,
    block_id integer,
    label character varying NOT NULL,
    file_file_name character varying NOT NULL,
    file_content_type character varying NOT NULL,
    file_file_size integer NOT NULL,
    description character varying(2048),
    "position" integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comfy_cms_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_files_id_seq OWNED BY comfy_cms_files.id;


--
-- Name: comfy_cms_layouts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_layouts (
    id integer NOT NULL,
    site_id integer NOT NULL,
    parent_id integer,
    app_layout character varying,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    content text,
    css text,
    js text,
    "position" integer DEFAULT 0 NOT NULL,
    is_shared boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comfy_cms_layouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_layouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_layouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_layouts_id_seq OWNED BY comfy_cms_layouts.id;


--
-- Name: comfy_cms_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_pages (
    id integer NOT NULL,
    site_id integer NOT NULL,
    layout_id integer,
    parent_id integer,
    target_page_id integer,
    label character varying NOT NULL,
    slug character varying,
    full_path character varying NOT NULL,
    content_cache text,
    "position" integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL,
    is_published boolean DEFAULT true NOT NULL,
    is_shared boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comfy_cms_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_pages_id_seq OWNED BY comfy_cms_pages.id;


--
-- Name: comfy_cms_revisions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_revisions (
    id integer NOT NULL,
    record_type character varying NOT NULL,
    record_id integer NOT NULL,
    data text,
    created_at timestamp without time zone
);


--
-- Name: comfy_cms_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_revisions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_revisions_id_seq OWNED BY comfy_cms_revisions.id;


--
-- Name: comfy_cms_sites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_sites (
    id integer NOT NULL,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    hostname character varying NOT NULL,
    path character varying,
    locale character varying DEFAULT 'en'::character varying NOT NULL,
    is_mirrored boolean DEFAULT false NOT NULL
);


--
-- Name: comfy_cms_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_sites_id_seq OWNED BY comfy_cms_sites.id;


--
-- Name: comfy_cms_snippets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comfy_cms_snippets (
    id integer NOT NULL,
    site_id integer NOT NULL,
    label character varying NOT NULL,
    identifier character varying NOT NULL,
    content text,
    "position" integer DEFAULT 0 NOT NULL,
    is_shared boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comfy_cms_snippets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comfy_cms_snippets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comfy_cms_snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comfy_cms_snippets_id_seq OWNED BY comfy_cms_snippets.id;


--
-- Name: entry_owners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE entry_owners (
    id integer NOT NULL,
    price_entry_id integer,
    shopper_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: entry_owners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE entry_owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entry_owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE entry_owners_id_seq OWNED BY entry_owners.id;


--
-- Name: invites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invites (
    id integer NOT NULL,
    price_book_id integer,
    name character varying,
    email character varying,
    status character varying DEFAULT 'sent'::character varying NOT NULL,
    token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    price_book_id integer,
    shopper_id integer,
    admin boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- Name: price_book_pages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE price_book_pages (
    id integer NOT NULL,
    name character varying,
    category character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    product_names text[] DEFAULT '{}'::text[],
    unit character varying,
    price_book_id integer
);


--
-- Name: price_book_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE price_book_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: price_book_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE price_book_pages_id_seq OWNED BY price_book_pages.id;


--
-- Name: price_books; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE price_books (
    id integer NOT NULL,
    _deprecated_shopper_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying DEFAULT 'My Price Book'::character varying NOT NULL,
    _deprecated_shopper_id_migrated boolean DEFAULT false NOT NULL,
    region_codes character varying[] DEFAULT '{}'::character varying[],
    store_ids integer[] DEFAULT '{}'::integer[]
);


--
-- Name: price_books_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE price_books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: price_books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE price_books_id_seq OWNED BY price_books.id;


--
-- Name: price_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE price_entries (
    id integer NOT NULL,
    date_on date NOT NULL,
    store_id integer,
    product_name character varying NOT NULL,
    amount integer NOT NULL,
    package_size integer NOT NULL,
    package_unit character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total_price money NOT NULL
);


--
-- Name: price_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE price_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: price_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE price_entries_id_seq OWNED BY price_entries.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: shoppers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shoppers (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    guest boolean DEFAULT false NOT NULL
);


--
-- Name: shoppers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shoppers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shoppers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shoppers_id_seq OWNED BY shoppers.id;


--
-- Name: shopping_list_item_purchases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shopping_list_item_purchases (
    id integer NOT NULL,
    shopping_list_item_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: shopping_list_item_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shopping_list_item_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_list_item_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shopping_list_item_purchases_id_seq OWNED BY shopping_list_item_purchases.id;


--
-- Name: shopping_list_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shopping_list_items (
    id integer NOT NULL,
    shopping_list_id integer,
    name character varying,
    amount integer,
    unit character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: shopping_list_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shopping_list_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_list_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shopping_list_items_id_seq OWNED BY shopping_list_items.id;


--
-- Name: shopping_lists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE shopping_lists (
    id integer NOT NULL,
    _deprecated_shopper_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying,
    price_book_id integer,
    _deprecated_shopper_id_migrated boolean DEFAULT false NOT NULL
);


--
-- Name: shopping_lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE shopping_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shopping_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE shopping_lists_id_seq OWNED BY shopping_lists.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    name character varying NOT NULL,
    location character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    region_code character varying NOT NULL
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_blocks ALTER COLUMN id SET DEFAULT nextval('comfy_cms_blocks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_categories ALTER COLUMN id SET DEFAULT nextval('comfy_cms_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_categorizations ALTER COLUMN id SET DEFAULT nextval('comfy_cms_categorizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_files ALTER COLUMN id SET DEFAULT nextval('comfy_cms_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_layouts ALTER COLUMN id SET DEFAULT nextval('comfy_cms_layouts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_pages ALTER COLUMN id SET DEFAULT nextval('comfy_cms_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_revisions ALTER COLUMN id SET DEFAULT nextval('comfy_cms_revisions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_sites ALTER COLUMN id SET DEFAULT nextval('comfy_cms_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comfy_cms_snippets ALTER COLUMN id SET DEFAULT nextval('comfy_cms_snippets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY entry_owners ALTER COLUMN id SET DEFAULT nextval('entry_owners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY price_book_pages ALTER COLUMN id SET DEFAULT nextval('price_book_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY price_books ALTER COLUMN id SET DEFAULT nextval('price_books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY price_entries ALTER COLUMN id SET DEFAULT nextval('price_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shoppers ALTER COLUMN id SET DEFAULT nextval('shoppers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_list_item_purchases ALTER COLUMN id SET DEFAULT nextval('shopping_list_item_purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_list_items ALTER COLUMN id SET DEFAULT nextval('shopping_list_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_lists ALTER COLUMN id SET DEFAULT nextval('shopping_lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: comfy_cms_blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_blocks
    ADD CONSTRAINT comfy_cms_blocks_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_categories
    ADD CONSTRAINT comfy_cms_categories_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_categorizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_categorizations
    ADD CONSTRAINT comfy_cms_categorizations_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_files
    ADD CONSTRAINT comfy_cms_files_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_layouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_layouts
    ADD CONSTRAINT comfy_cms_layouts_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_pages
    ADD CONSTRAINT comfy_cms_pages_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_revisions
    ADD CONSTRAINT comfy_cms_revisions_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_sites
    ADD CONSTRAINT comfy_cms_sites_pkey PRIMARY KEY (id);


--
-- Name: comfy_cms_snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comfy_cms_snippets
    ADD CONSTRAINT comfy_cms_snippets_pkey PRIMARY KEY (id);


--
-- Name: entry_owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY entry_owners
    ADD CONSTRAINT entry_owners_pkey PRIMARY KEY (id);


--
-- Name: invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: price_book_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY price_book_pages
    ADD CONSTRAINT price_book_pages_pkey PRIMARY KEY (id);


--
-- Name: price_books_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY price_books
    ADD CONSTRAINT price_books_pkey PRIMARY KEY (id);


--
-- Name: price_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY price_entries
    ADD CONSTRAINT price_entries_pkey PRIMARY KEY (id);


--
-- Name: shoppers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shoppers
    ADD CONSTRAINT shoppers_pkey PRIMARY KEY (id);


--
-- Name: shopping_list_item_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shopping_list_item_purchases
    ADD CONSTRAINT shopping_list_item_purchases_pkey PRIMARY KEY (id);


--
-- Name: shopping_list_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shopping_list_items
    ADD CONSTRAINT shopping_list_items_pkey PRIMARY KEY (id);


--
-- Name: shopping_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY shopping_lists
    ADD CONSTRAINT shopping_lists_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: index_cms_categories_on_site_id_and_cat_type_and_label; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cms_categories_on_site_id_and_cat_type_and_label ON comfy_cms_categories USING btree (site_id, categorized_type, label);


--
-- Name: index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id ON comfy_cms_categorizations USING btree (category_id, categorized_type, categorized_id);


--
-- Name: index_cms_revisions_on_rtype_and_rid_and_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cms_revisions_on_rtype_and_rid_and_created_at ON comfy_cms_revisions USING btree (record_type, record_id, created_at);


--
-- Name: index_comfy_cms_blocks_on_blockable_id_and_blockable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_blocks_on_blockable_id_and_blockable_type ON comfy_cms_blocks USING btree (blockable_id, blockable_type);


--
-- Name: index_comfy_cms_blocks_on_identifier; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_blocks_on_identifier ON comfy_cms_blocks USING btree (identifier);


--
-- Name: index_comfy_cms_files_on_site_id_and_block_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_files_on_site_id_and_block_id ON comfy_cms_files USING btree (site_id, block_id);


--
-- Name: index_comfy_cms_files_on_site_id_and_file_file_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_files_on_site_id_and_file_file_name ON comfy_cms_files USING btree (site_id, file_file_name);


--
-- Name: index_comfy_cms_files_on_site_id_and_label; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_files_on_site_id_and_label ON comfy_cms_files USING btree (site_id, label);


--
-- Name: index_comfy_cms_files_on_site_id_and_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_files_on_site_id_and_position ON comfy_cms_files USING btree (site_id, "position");


--
-- Name: index_comfy_cms_layouts_on_parent_id_and_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_layouts_on_parent_id_and_position ON comfy_cms_layouts USING btree (parent_id, "position");


--
-- Name: index_comfy_cms_layouts_on_site_id_and_identifier; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_comfy_cms_layouts_on_site_id_and_identifier ON comfy_cms_layouts USING btree (site_id, identifier);


--
-- Name: index_comfy_cms_pages_on_parent_id_and_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_pages_on_parent_id_and_position ON comfy_cms_pages USING btree (parent_id, "position");


--
-- Name: index_comfy_cms_pages_on_site_id_and_full_path; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_pages_on_site_id_and_full_path ON comfy_cms_pages USING btree (site_id, full_path);


--
-- Name: index_comfy_cms_sites_on_hostname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_sites_on_hostname ON comfy_cms_sites USING btree (hostname);


--
-- Name: index_comfy_cms_sites_on_is_mirrored; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_sites_on_is_mirrored ON comfy_cms_sites USING btree (is_mirrored);


--
-- Name: index_comfy_cms_snippets_on_site_id_and_identifier; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_comfy_cms_snippets_on_site_id_and_identifier ON comfy_cms_snippets USING btree (site_id, identifier);


--
-- Name: index_comfy_cms_snippets_on_site_id_and_position; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comfy_cms_snippets_on_site_id_and_position ON comfy_cms_snippets USING btree (site_id, "position");


--
-- Name: index_entry_owners_on_price_entry_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_entry_owners_on_price_entry_id ON entry_owners USING btree (price_entry_id);


--
-- Name: index_entry_owners_on_shopper_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_entry_owners_on_shopper_id ON entry_owners USING btree (shopper_id);


--
-- Name: index_invites_on_price_book_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invites_on_price_book_id ON invites USING btree (price_book_id);


--
-- Name: index_invites_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invites_on_token ON invites USING btree (token);


--
-- Name: index_members_on_price_book_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_members_on_price_book_id ON members USING btree (price_book_id);


--
-- Name: index_members_on_shopper_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_members_on_shopper_id ON members USING btree (shopper_id);


--
-- Name: index_price_book_pages_on_price_book_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_price_book_pages_on_price_book_id ON price_book_pages USING btree (price_book_id);


--
-- Name: index_price_books_on__deprecated_shopper_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_price_books_on__deprecated_shopper_id ON price_books USING btree (_deprecated_shopper_id);


--
-- Name: index_price_entries_on_package_unit; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_price_entries_on_package_unit ON price_entries USING btree (package_unit);


--
-- Name: index_price_entries_on_store_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_price_entries_on_store_id ON price_entries USING btree (store_id);


--
-- Name: index_shoppers_on_confirmation_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shoppers_on_confirmation_token ON shoppers USING btree (confirmation_token);


--
-- Name: index_shoppers_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shoppers_on_email ON shoppers USING btree (email);


--
-- Name: index_shoppers_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_shoppers_on_reset_password_token ON shoppers USING btree (reset_password_token);


--
-- Name: index_shopping_list_item_purchases_on_shopping_list_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shopping_list_item_purchases_on_shopping_list_item_id ON shopping_list_item_purchases USING btree (shopping_list_item_id);


--
-- Name: index_shopping_list_items_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shopping_list_items_on_created_at ON shopping_list_items USING btree (created_at);


--
-- Name: index_shopping_lists_on__deprecated_shopper_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shopping_lists_on__deprecated_shopper_id ON shopping_lists USING btree (_deprecated_shopper_id);


--
-- Name: index_shopping_lists_on_price_book_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_shopping_lists_on_price_book_id ON shopping_lists USING btree (price_book_id);


--
-- Name: index_stores_on_region_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_stores_on_region_code ON stores USING btree (region_code);


--
-- Name: price_entries_replace_lower_product_name_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX price_entries_replace_lower_product_name_idx ON price_entries USING btree (replace(lower((product_name)::text), ' '::text, ''::text));


--
-- Name: stores_replace_lower_loc_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX stores_replace_lower_loc_idx ON stores USING btree (replace(lower((location)::text), ' '::text, ''::text));


--
-- Name: stores_replace_lower_name_idx; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX stores_replace_lower_name_idx ON stores USING btree (replace(lower((name)::text), ' '::text, ''::text));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_182f20ecae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_lists
    ADD CONSTRAINT fk_rails_182f20ecae FOREIGN KEY (price_book_id) REFERENCES price_books(id);


--
-- Name: fk_rails_26957f8c33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entry_owners
    ADD CONSTRAINT fk_rails_26957f8c33 FOREIGN KEY (price_entry_id) REFERENCES price_entries(id);


--
-- Name: fk_rails_39170d4e81; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY price_entries
    ADD CONSTRAINT fk_rails_39170d4e81 FOREIGN KEY (store_id) REFERENCES stores(id);


--
-- Name: fk_rails_8f738f4b5c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY members
    ADD CONSTRAINT fk_rails_8f738f4b5c FOREIGN KEY (price_book_id) REFERENCES price_books(id);


--
-- Name: fk_rails_bf4ff095ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY price_book_pages
    ADD CONSTRAINT fk_rails_bf4ff095ea FOREIGN KEY (price_book_id) REFERENCES price_books(id);


--
-- Name: fk_rails_e83b3f2d1d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY shopping_list_item_purchases
    ADD CONSTRAINT fk_rails_e83b3f2d1d FOREIGN KEY (shopping_list_item_id) REFERENCES shopping_list_items(id);


--
-- Name: fk_rails_ef460209ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY members
    ADD CONSTRAINT fk_rails_ef460209ef FOREIGN KEY (shopper_id) REFERENCES shoppers(id);


--
-- Name: fk_rails_f40128c16f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY entry_owners
    ADD CONSTRAINT fk_rails_f40128c16f FOREIGN KEY (shopper_id) REFERENCES shoppers(id);


--
-- Name: fk_rails_fdfc126295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT fk_rails_fdfc126295 FOREIGN KEY (price_book_id) REFERENCES price_books(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150515135324');

INSERT INTO schema_migrations (version) VALUES ('20150517163242');

INSERT INTO schema_migrations (version) VALUES ('20150526134610');

INSERT INTO schema_migrations (version) VALUES ('20150526162500');

INSERT INTO schema_migrations (version) VALUES ('20150602144258');

INSERT INTO schema_migrations (version) VALUES ('20150603150915');

INSERT INTO schema_migrations (version) VALUES ('20150623100624');

INSERT INTO schema_migrations (version) VALUES ('20150623133041');

INSERT INTO schema_migrations (version) VALUES ('20150703104544');

INSERT INTO schema_migrations (version) VALUES ('20150704110603');

INSERT INTO schema_migrations (version) VALUES ('20150704125425');

INSERT INTO schema_migrations (version) VALUES ('20150719122747');

INSERT INTO schema_migrations (version) VALUES ('20150722073017');

INSERT INTO schema_migrations (version) VALUES ('20150722133633');

INSERT INTO schema_migrations (version) VALUES ('20150722185828');

INSERT INTO schema_migrations (version) VALUES ('20150722191719');

INSERT INTO schema_migrations (version) VALUES ('20150728060734');

INSERT INTO schema_migrations (version) VALUES ('20150802092633');

INSERT INTO schema_migrations (version) VALUES ('20150804070800');

INSERT INTO schema_migrations (version) VALUES ('20150812211210');

INSERT INTO schema_migrations (version) VALUES ('20150825073302');

INSERT INTO schema_migrations (version) VALUES ('20150901184909');

INSERT INTO schema_migrations (version) VALUES ('20150913110243');

INSERT INTO schema_migrations (version) VALUES ('20150915112020');

INSERT INTO schema_migrations (version) VALUES ('20151018103303');

INSERT INTO schema_migrations (version) VALUES ('20151018104004');

INSERT INTO schema_migrations (version) VALUES ('20151018110108');

INSERT INTO schema_migrations (version) VALUES ('20160222063236');

INSERT INTO schema_migrations (version) VALUES ('20160315215629');

INSERT INTO schema_migrations (version) VALUES ('20160315220121');

INSERT INTO schema_migrations (version) VALUES ('20160321222045');

INSERT INTO schema_migrations (version) VALUES ('20160321225104');

INSERT INTO schema_migrations (version) VALUES ('20160325102353');

INSERT INTO schema_migrations (version) VALUES ('20160325104640');

INSERT INTO schema_migrations (version) VALUES ('20160325104938');

INSERT INTO schema_migrations (version) VALUES ('20160325113925');

INSERT INTO schema_migrations (version) VALUES ('20160325115200');

INSERT INTO schema_migrations (version) VALUES ('20160325122950');

INSERT INTO schema_migrations (version) VALUES ('20160328063823');

INSERT INTO schema_migrations (version) VALUES ('20160420201023');

INSERT INTO schema_migrations (version) VALUES ('20160422074848');

INSERT INTO schema_migrations (version) VALUES ('20160422074934');

INSERT INTO schema_migrations (version) VALUES ('20160422130026');

INSERT INTO schema_migrations (version) VALUES ('20160422132605');

INSERT INTO schema_migrations (version) VALUES ('20160422134223');

INSERT INTO schema_migrations (version) VALUES ('20160423082705');

INSERT INTO schema_migrations (version) VALUES ('20160423133138');

INSERT INTO schema_migrations (version) VALUES ('20160425061130');

INSERT INTO schema_migrations (version) VALUES ('20160426040101');

INSERT INTO schema_migrations (version) VALUES ('20160426060238');

INSERT INTO schema_migrations (version) VALUES ('20160427034514');

INSERT INTO schema_migrations (version) VALUES ('20160427044309');

INSERT INTO schema_migrations (version) VALUES ('20160427053838');

