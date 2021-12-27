CREATE DATABASE hafta4
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Turkish_Turkey.1254'
    LC_CTYPE = 'Turkish_Turkey.1254'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

    
CREATE TABLE public.devices
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    vehicle_id integer,
    device_type_id integer,
    device_name character varying(75) COLLATE pg_catalog."default",
    is_online boolean,
    is_active boolean,
    CONSTRAINT devices_pkey PRIMARY KEY (id)
);


CREATE TABLE public.devices_type
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    type_name character varying(75) COLLATE pg_catalog."default",
    type_description character varying(255) COLLATE pg_catalog."default",
    is_active boolean,
    CONSTRAINT devices_type_pkey PRIMARY KEY (id)
);


CREATE TABLE public.log_location
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    vehicle_id integer,
    device_id integer,
    latitude character varying(50) COLLATE pg_catalog."default",
    longitude character varying(50) COLLATE pg_catalog."default",
    created_at timestamp with time zone,
    CONSTRAINT log_location_pkey PRIMARY KEY (id)
);


CREATE TABLE public.log_temperature
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    vehicle_id integer,
    device_id integer,
    read_data character varying(50) COLLATE pg_catalog."default",
    created_at timestamp with time zone,
    CONSTRAINT log_temperature_pkey PRIMARY KEY (id)
);


CREATE TABLE public.vehicles
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    vehicle_plate character varying(20) COLLATE pg_catalog."default",
    current_status integer,
    is_active boolean,
    CONSTRAINT vehicles_pkey PRIMARY KEY (id)
);