-- -------------------------------------------------------------
-- TablePlus 3.4.0(304)
--
-- https://tableplus.com/
--
-- Database: p2-cascade
-- Generation Time: 2020-04-27 15:36:15.6250
-- -------------------------------------------------------------


INSERT INTO "public"."Parent" ("id") VALUES
('1');

INSERT INTO "public"."Person" ("id", "parentId", "studentId") VALUES
('1', NULL, '2'),
('2', '1', NULL);

INSERT INTO "public"."Student" ("id", "parentId") VALUES
('2', '1');

INSERT INTO "public"."User" ("id", "personId") VALUES
('1', '1'),
('2', '2');

