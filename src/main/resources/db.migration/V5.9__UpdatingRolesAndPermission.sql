-- //////////////////////
-- We are deleting already inputted data, so that data must be clean as crystal
-- //////////////////////
Delete
from web_user_role;

-- //////////////////////
-- Admin User
-- //////////////////////
Delete
from web_user
where email ilike '%admin%';
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

INSERT INTO public.role (web_id, version, date_created, date_updated, external_key, role_code, title,
                         description, use, active)
VALUES (1, 0, '2022-04-28 20:52:46.889390', '2022-04-28 20:52:46.889390', 'ROLE_SUPER_ADMIN', null, 'Super Admin',
        'Super Admin', 'STAFF', true);
INSERT INTO public.role (web_id, version, date_created, date_updated, external_key, role_code, title,
                         description, use, active)
VALUES (3, 0, '2022-04-28 20:52:46.889390', '2022-04-28 20:52:46.889390', 'ROLE_SUPPORT_USER', null, 'Support User',
        'Support User', 'STAFF', true);


INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (1, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 'APP:TRACKER:CREATE',
        'APP:TRACKER:CREATE', 'Create permission for the user in the app', 1, 'STAFF', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (2, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 'APP:SHEET:CREATE',
        'APP:SHEET:CREATE', 'User can create customer', 1, 'STAFF', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (3, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 'APP:CALENDER:CREATE',
        'APP:CALENDER:CREATE', 'View permission for the user in the app', 1, 'STAFF', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (4, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 'APP:USER:CREATE',
        'APP:USER:CREATE', 'Update permission for the user in the app', 1, 'STAFF', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (5, 0, '2022-06-01 07:34:06.833000 +00:00', '2022-06-01 07:34:06.833000 +00:00', 'APP:DASHBOARD:CREATE',
        'APP:DASHBOARD:CREATE', 'Dashboard permissions for user', 1, 'STAFF', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (6, 0, '2022-05-22 08:08:42.182000 +00:00', '2022-05-22 08:08:42.182000 +00:00', 'APP:INVOICES:CREATE',
        'APP:INVOICES:CREATE', 'Customer can create an appointment', 1, 'CUSTOMER', true);
INSERT INTO public.permission (web_id, version, date_created, date_updated, permission_code, title,
                               description, permission_group_id, use, active)
VALUES (7, 0, '2022-06-01 08:03:42.440000 +00:00', '2022-06-01 08:03:42.440000 +00:00', 'APP:PROJECT:CREATE',
        'APP:PROJECT:CREATE', 'User can create location', 1, 'STAFF', true);

INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (1, 0, '2022-05-21 12:22:54.692000 +00:00', '2022-05-21 12:22:54.692000 +00:00', 1, 1);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (2, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 1, 2);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (3, 0, '2022-05-21 12:23:09.052000 +00:00', '2022-05-21 12:23:09.052000 +00:00', 1, 3);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (4, 0, '2022-05-21 12:23:13.452000 +00:00', '2022-05-21 12:23:13.452000 +00:00', 1, 4);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (5, 0, '2022-05-22 08:09:00.052000 +00:00', '2022-05-22 08:09:00.052000 +00:00', 1, 5);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (6, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 1, 6);
INSERT INTO public.role_permission (web_id, version, date_created, date_updated, role_id, permission_id)
VALUES (7, 0, '2022-05-21 12:23:05.388000 +00:00', '2022-05-21 12:23:05.388000 +00:00', 1, 7);


INSERT INTO public.web_user_role (web_id, version, date_created, date_updated, web_user_id, role_id, active)
VALUES (1, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 1, 3, true);

INSERT INTO public.web_user (web_id, version, date_created, date_updated, status, first_name,
                             last_name, email, user_name, password, gender, dob, active, middle_name, time_zone,
                             language, phone)
VALUES (2, DEFAULT, '2022-06-01 21:16:29.861000 +00:00', '2022-06-01 21:16:30.816000 +00:00', 0, 'Admin', 'User',
        'admin@admin.com', 'admin', '$2a$10$CkQY8PpSb2tvPHnAnXb3ju00RZec4ivvrfSilQLywJFs2PYqWqAu6', null,
        null, DEFAULT, null, null, null, '3030123204');

-- //////////////////////
-- Admin User
-- //////////////////////

INSERT INTO public.web_user_role (web_id, version, date_created, date_updated, web_user_id, role_id, active)
VALUES (2, 0, '2022-04-28 15:52:46.889390 +00:00', '2022-04-28 15:52:46.889390 +00:00', 2, 1, true);
