CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "username" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "contacts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "bdate" date, "anniv" date, "email" varchar);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "resource_type" varchar, "resource_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_roles_on_resource_type_and_resource_id" ON "roles" ("resource_type", "resource_id");
CREATE TABLE "users_roles" ("user_id" integer, "role_id" integer);
CREATE INDEX "index_users_roles_on_user_id" ON "users_roles" ("user_id");
CREATE INDEX "index_users_roles_on_role_id" ON "users_roles" ("role_id");
CREATE INDEX "index_roles_on_name" ON "roles" ("name");
CREATE INDEX "index_roles_on_name_and_resource_type_and_resource_id" ON "roles" ("name", "resource_type", "resource_id");
CREATE INDEX "index_users_roles_on_user_id_and_role_id" ON "users_roles" ("user_id", "role_id");
CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "street" varchar, "city" varchar, "state" varchar, "zipcode" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "contact_id" integer, "country" varchar, "country_id" integer);
CREATE TABLE "countries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "name" varchar, "dial_code" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "phone_numbers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "area_code" varchar DEFAULT NULL, "fax_number" varchar DEFAULT NULL, "contact_id" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "alternate_number" varchar DEFAULT NULL, "country_id" integer DEFAULT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20171004073742'),
('20171004080039'),
('20171004093722'),
('20171004100212'),
('20171004171957'),
('20171004172209'),
('20171004173005'),
('20171004173238'),
('20171004173446'),
('20171006111403'),
('20171008050347'),
('20171008051245');


