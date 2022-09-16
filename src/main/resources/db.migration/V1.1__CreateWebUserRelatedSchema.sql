

CREATE SEQUENCE if not exists hibernate_sequence START 1;

create table if not exists public.role
(
    web_id       bigint                  not null
        constraint pk_role
            primary key,
    version      integer   default 0     not null,
    date_created timestamp default now() not null,
    date_updated timestamp default now() not null,
    external_key varchar                 not null,
    role_code    varchar,
    title        varchar                 not null,
    description  varchar,
    use          text,
    active       boolean   default true,
    CONSTRAINT role__use
        CHECK ((use::text = ('CUSTOMER')::text) OR (use::text = ('STAFF')::text)
            OR (use::text = ('ALL')::text))
);

comment on table role is 'authentication.  This table defines the roles that users can have.';


create index ix_role__external_key
    on role (external_key);


create table if not exists permission_group
(
    web_id        bigint                                 not null
        constraint permission_group_pkey
            primary key,
    version       integer                  default 0     not null,
    date_created  timestamp with time zone default now() not null,
    date_updated  timestamp with time zone default now() not null,
    description   varchar                                not null,
    group_code    varchar,
    parent_web_id bigint
);

create table if not exists permission
(
    web_id              bigint                                 not null
        constraint pk_permission
            primary key,
    version             integer                  default 0     not null,
    date_created        timestamp with time zone default now() not null,
    date_updated        timestamp with time zone default now() not null,
    permission_code     varchar                                not null,
    title               varchar                                not null,
    description         varchar                                not null,
    permission_group_id bigint,
    use                 text,
    active              boolean                  default true,
    CONSTRAINT permission__use
        CHECK ((use::text = ('CUSTOMER')::text) OR (use::text = ('STAFF')::text)
            OR (use::text = ('ALL')::text))
);
comment on table permission is 'common, authentication';


create table if not exists role_permission
(
    web_id        bigint                                 not null
        constraint pk_role_permission
            primary key,
    version       integer                  default 0     not null,
    date_created  timestamp with time zone default now() not null,
    date_updated  timestamp with time zone default now() not null,
    role_id       bigint                                 not null
        constraint fk_role_permission__role
            references role,
    permission_id bigint                                 not null
        constraint fk_role_permission__permission
            references permission
);

comment on table role_permission is 'common, authentication';


create index ix_role_permission__web_user
    on role_permission (role_id);

create index ix_role_permission__permission
    on role_permission (permission_id);

-- web_user_* tables
create table IF NOT EXISTS public.web_user
(
    web_id         bigint                                 not null
        constraint pk_web_user
            primary key,
    version        integer                  default 0     not null,
    date_created   timestamp with time zone default now() not null,
    date_updated   timestamp with time zone default now() not null,
    status         integer                  default 0     not null,
    first_name     varchar,
    last_name      varchar,
    email          varchar,
    phone          varchar,
    user_name      varchar,
    password       varchar,
    gender         int,
    dob            timestamp with time zone,
    active         boolean                  default true,
    middle_name    varchar,
    time_zone      timestamp with time zone,
    language       varchar
);

create index ix_web_user__gender
    on public.web_user (gender);

create index ix_web_user__phone
    on public.web_user (phone);

create index ix_web_user__user_name
    on public.web_user (user_name);


create unique index ix_web_user__email
    on public.web_user (email);

create table IF NOT EXISTS public.web_user_role
(
    web_id       bigint                                 not null
        constraint pk_web_user_role
            primary key,
    version      integer                  default 0     not null,
    date_created timestamp with time zone default now() not null,
    date_updated timestamp with time zone default now() not null,
    web_user_id  bigint
        constraint fk_web_user_role__web_user
            references public.web_user,
    role_id      bigint                                 not null
        CONSTRAINT fk_web_user_role__role REFERENCES role (web_id),
    active       boolean                  default true
);


create table IF NOT EXISTS public.web_user_permission
(
    web_id        bigint                                 not null
        constraint pk_web_user_permission
            primary key,
    version       integer                  default 0     not null,
    date_created  timestamp with time zone default now() not null,
    date_updated  timestamp with time zone default now() not null,
    web_user_id   bigint
        constraint fk_web_user_permission__web_user
            references public.web_user,
    permission_id bigint                                 not null
        CONSTRAINT fk_web_user_permission__permission REFERENCES permission (web_id),
    active        boolean                  default true
);

create unique index uq_web_user_permission__web_user_id
    on public.web_user_permission (web_user_id);

create table IF NOT EXISTS public.web_user_permission_group
(
    web_id              bigint                                 not null
        constraint pk_web_user_permission_group
            primary key,
    version             integer                  default 0     not null,
    date_created        timestamp with time zone default now() not null,
    date_updated        timestamp with time zone default now() not null,
    web_user_id         bigint
        constraint "fk_web_user_permission_group__web_user"
            references public.web_user,
    permission_id       bigint
        constraint fk_web_user_permission_group__web_user_permission
            references public.web_user_permission,
    permission_group_id bigint                                 not null
        constraint fk_web_user_permission_group__permission_group
            references permission_group,
    permission          varchar(20),
    active              boolean                  default true
);

create unique index uq_web_user_permission_group__permission_id
    on public.web_user_permission_group (permission_id);

create unique index uq_web_user_permission_group__web_user_id
    on public.web_user_permission_group (web_user_id);


-- TODO data for role
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (1, now(), now(), 'ROLE_USER', null, 'Customer User',
        'User for a customer', 'CUSTOMER');
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (2, now(), now(), 'ROLE_TEST_X', null,
        'Test X', 'Test X', 'STAFF');
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (3, now(), now(), 'ROLE_SUPER_ADMIN', null,
        'Super Admin', 'Super Admin', 'STAFF');
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (4, now(), now(), 'ROLE_STAFF', null, 'Staff',
        'Client staff', 'STAFF');
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (5, now(), now(), 'ROLE_X', null, 'X',
        'APP X - Needs to be updated', 'STAFF');
INSERT INTO public.role (web_id, date_created, date_updated, external_key, role_code, title,
                         description, use)
VALUES (6, now(), now(), 'ROLE_SUPPORT', null, 'support', 'support',
        'STAFF');

-- TODO data for permission_group
INSERT INTO public.permission_group (web_id, date_created, date_updated, description,
                                     group_code, parent_web_id)
VALUES (1, now(), now(), 'Admin Settings', 'ADMIN_SETTING', null);

-- TODO data for permission
INSERT INTO public.permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (1, now(), now(), 'APP:USER:CREATE', 'APP:USER:CREATE',
        'Create permission for the user in the app', 1, 'STAFF');
INSERT INTO public.permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (2, now(), now(), 'APP:USER:DELETE', 'APP:USER:DELETE',
        'Delete permission for the user in the app', 1, 'STAFF');
INSERT INTO public.permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (3, now(), now(), 'APP:USER:READ', 'APP:USER:READ',
        'View permission for the user in the app',
        1, 'STAFF');
INSERT INTO public.permission (web_id, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use)
VALUES (4, now(), now(), 'APP:USER:UPDATE', 'APP:USER:UPDATE',
        'Update permission for the user in the app', 1, 'STAFF');


-- TODO data for web_user -- password is hash of password
INSERT INTO public.web_user (web_id, date_created, date_updated, first_name, last_name, email,
                             user_name, password)
VALUES (1, now(), now(), 'Support', 'User', 'admin@TEST01.com', 'admin@TEST01.com',
        '$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6');

-- TODO data for web_user_role
INSERT INTO public.web_user_role (web_id, date_created, date_updated, web_user_id, role_id)
VALUES (1, now(), now(), 1, 3);
