-- public.oauth_client_details definition

-- Drop table

-- DROP TABLE public.oauth_client_details;

CREATE TABLE public.oauth_client_details (
                                             client_id varchar(255) NOT NULL,
                                             client_secret varchar(255) NOT NULL,
                                             resource_ids varchar(255) NULL DEFAULT NULL::character varying,
                                             "scope" varchar(255) NULL DEFAULT NULL::character varying,
                                             authorized_grant_types varchar(255) NULL DEFAULT NULL::character varying,
                                             web_server_redirect_uri varchar(255) NULL DEFAULT NULL::character varying,
                                             authorities varchar(255) NULL DEFAULT NULL::character varying,
                                             access_token_validity int4 NULL,
                                             refresh_token_validity int4 NULL,
                                             additional_information varchar(4096) NULL DEFAULT NULL::character varying,
                                             autoapprove varchar(255) NULL DEFAULT NULL::character varying,
                                             CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id)
);


-- public."permission" definition

-- Drop table

-- DROP TABLE public."permission";

CREATE TABLE public."permission" (
                                     id int4 NOT NULL,
                                     "name" varchar NOT NULL,
                                     CONSTRAINT permission_pk PRIMARY KEY (id),
                                     CONSTRAINT permission_un UNIQUE (name)
);


-- public."role" definition

-- Drop table

-- DROP TABLE public."role";

CREATE TABLE public."role" (
                               id int4 NOT NULL,
                               "name" varchar NOT NULL,
                               CONSTRAINT roke_un UNIQUE (name),
                               CONSTRAINT role_pk PRIMARY KEY (id)
);


-- public."user" definition

-- Drop table

-- DROP TABLE public."user";

CREATE TABLE public."user" (
                               id int4 NOT NULL,
                               username varchar NOT NULL,
                               "password" varchar NOT NULL,
                               email varchar NOT NULL,
                               enabled bool NOT NULL,
                               account_expired bool NOT NULL,
                               credentials_expired bool NOT NULL,
                               account_locked bool NOT NULL,
                               CONSTRAINT user_pk PRIMARY KEY (id),
                               CONSTRAINT user_un UNIQUE (email)
);


-- public.permission_role_xref definition

-- Drop table

-- DROP TABLE public.permission_role_xref;

CREATE TABLE public.permission_role_xref (
                                             permission_id int4 NOT NULL,
                                             role_id int4 NOT NULL,
                                             CONSTRAINT permission_role_xref_pk PRIMARY KEY (permission_id, role_id),
                                             CONSTRAINT permission_role_xref_fk FOREIGN KEY (permission_id) REFERENCES permission(id) ON UPDATE CASCADE ON DELETE CASCADE,
                                             CONSTRAINT permission_role_xref_fk_1 FOREIGN KEY (role_id) REFERENCES role(id) ON UPDATE CASCADE ON DELETE CASCADE
);


-- public.role_user_xref definition

-- Drop table

-- DROP TABLE public.role_user_xref;

CREATE TABLE public.role_user_xref (
                                       role_id int4 NOT NULL,
                                       user_id int4 NOT NULL,
                                       CONSTRAINT role_user_xref_pk PRIMARY KEY (role_id, user_id),
                                       CONSTRAINT role_user_xref_fk FOREIGN KEY (role_id) REFERENCES role(id) ON UPDATE CASCADE ON DELETE CASCADE,
                                       CONSTRAINT role_user_xref_fk_1 FOREIGN KEY (user_id) REFERENCES "user"(id) ON UPDATE CASCADE ON DELETE CASCADE
);