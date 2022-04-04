CREATE TABLE if not exists author
(
    id uuid NOT NULL default gen_random_uuid(),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT author_pkey PRIMARY KEY (id)
);
CREATE TABLE if not exists book
(
    id uuid NOT NULL default gen_random_uuid(),
    title character varying(255) COLLATE pg_catalog."default" NOT NULL,
    author uuid NOT NULL,
    date_of_partition timestamp without time zone NOT NULL,
    CONSTRAINT book_pkey PRIMARY KEY (id),
    CONSTRAINT "book_to_author_FK" FOREIGN KEY (author)
    REFERENCES public.author (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
);