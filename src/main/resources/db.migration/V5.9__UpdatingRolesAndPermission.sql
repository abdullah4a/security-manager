-- //////////////////////
-- We are deleting already inputted data, so that data must be clean as crystal
-- //////////////////////
Delete
from web_user_role;
Delete
from role_permission;
Delete
from permission;
Delete
from role;
Delete
from web_user_permission;

-- //////////////////////
-- Insertion of New Data
-- /////////////////////

INSERT INTO public.role (web_id, version, date_created, date_updated, client_id, external_key, role_code, title,
                         description, use, active, branch_id)
VALUES (1, 0, '2022-04-28 20:52:46.889390', '2022-04-28 20:52:46.889390', 0, 'ROLE_SUPER_ADMIN', null, 'Super Admin',
        'Super Admin', 'STAFF', true, 1);
INSERT INTO public.role (web_id, version, date_created, date_updated, client_id, external_key, role_code, title,
                         description, use, active, branch_id)
VALUES (2, 3, '2022-04-28 20:52:46.889390', '2022-05-22 13:18:32.778000', 0, 'ROLE_CUSTOMER_USER', null,
        'Customer User', 'Customer can create Appointments', 'CUSTOMER', true, 1);
INSERT INTO public.role (web_id, version, date_created, date_updated, client_id, external_key, role_code, title,
                         description, use, active, branch_id)
VALUES (3, 0, '2022-04-28 20:52:46.889390', '2022-04-28 20:52:46.889390', 0, 'ROLE_SUPPORT_USER', null, 'Support User',
        'Support User', 'STAFF', true, 1);


INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (1, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 'APP:EMPLOYEE:CREATE',
        'APP:EMPLOYEE:CREATE', 'Create permission for the user in the app', 1, 'STAFF', true, 1);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (2, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 'APP:CUSTOMER:CREATE',
        'APP:CUSTOMER:CREATE', 'User can create customer', 1, 'STAFF', true, 1);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (3, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 'APP:PERMISSION:CREATE',
        'APP:PERMISSION:CREATE', 'View permission for the user in the app', 1, 'STAFF', true, 1);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (4, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 'APP:ROLE:CREATE',
        'APP:ROLE:CREATE', 'Update permission for the user in the app', 1, 'STAFF', true, 1);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (5, 0, '2022-06-01 07:34:06.833000 +00:00', '2022-06-01 07:34:06.833000 +00:00', 0, 'APP:DASHBOARD:CREATE',
        'APP:DASHBOARD:CREATE', 'Dashboard permissions for user', 1, 'STAFF', true, null);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (6, 0, '2022-05-22 08:08:42.182000 +00:00', '2022-05-22 08:08:42.182000 +00:00', 0, 'APP:SCHEDULING:CREATE',
        'APP:SCHEDULING:CREATE', 'Customer can create an appointment', 1, 'CUSTOMER', true, 1);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (7, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 0, 'APP:LOCATION:CREATE',
        'APP:LOCATION:CREATE', 'User can create location', 1, 'STAFF', true, null);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (8, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 0, 'APP:CLIENT:CREATE',
        'APP:CLIENT:CREATE', 'User can create location', 1, 'STAFF', true, null);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (9, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 0, 'APP:SERVICE:CREATE',
        'APP:SERVICE:CREATE', 'User can create location', 1, 'STAFF', true, null);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (10, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 0, 'APP:REVENUE:CREATE',
        'APP:REVENUE:CREATE', 'User can create location', 1, 'STAFF', true, null);
INSERT INTO public.permission (web_id, version, date_created, date_updated, client_id, permission_code, title,
                               description, permission_group_id, use, active, branch_id)
VALUES (11, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 0,
        'APP:API_CONFIGURATION:CREATE',
        'APP:API_CONFIGURATION:CREATE', 'User can create location', 1, 'STAFF', true, null);

INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (1, 0, '2022-05-21 12:22:54.692000 +00:00', '2022-05-21 12:22:54.692000 +00:00', 0, 1, 1);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (2, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 0, 1, 2);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (3, 0, '2022-05-21 12:23:09.052000 +00:00', '2022-05-21 12:23:09.052000 +00:00', 0, 1, 3);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (4, 0, '2022-05-21 12:23:13.452000 +00:00', '2022-05-21 12:23:13.452000 +00:00', 0, 1, 4);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (5, 0, '2022-05-22 08:09:00.052000 +00:00', '2022-05-22 08:09:00.052000 +00:00', 0, 1, 5);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (6, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 0, 1, 6);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (7, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 0, 1, 7);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (8, 0, '2022-06-01 07:35:09.155000 +00:00', '2022-06-01 07:35:09.155000 +00:00', 0, 1, 8);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (9, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 1, 9);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (10, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 1, 10);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (11, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 1, 11);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (12, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 2, 6);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (13, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 3, 5);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, client_id, role_id, permission_id)
VALUES (14, 0, '2022-06-01 08:04:00.550000 +00:00', '2022-06-01 08:04:00.550000 +00:00', 0, 3, 6);


INSERT INTO public.web_user_role (web_id, version, date_created, date_updated, client_id, web_user_id, role_id, active)
VALUES (1, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 1, 3, true);

-- //////////////////////
-- Admin User
-- //////////////////////

INSERT INTO public.web_user (web_id, version, date_created, date_updated, client_id, branch_id, status, first_name,
                             last_name, email, user_name, password, gender, dob, active, middle_name, time_zone,
                             language, web_user_services, customer_id, phone)
VALUES (2, DEFAULT, '2022-06-01 21:16:29.861000 +00:00', '2022-06-01 21:16:30.816000 +00:00', 0, 1, 0, 'Admin', 'User',
        'admin@admin.com', 'admin@admin.com', '$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6', null,
        null, DEFAULT, null, null, null, null, null, '3030123204');

-- //////////////////////
-- Admin User
-- //////////////////////

INSERT INTO public.web_user_role (web_id, version, date_created, date_updated, client_id, web_user_id, role_id, active)
VALUES (2, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 0, 2, 1, true);
