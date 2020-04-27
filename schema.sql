-- -------------------------------------------------------------
-- TablePlus 3.4.0(304)
--
-- https://tableplus.com/
--
-- Database: p2-cascade
-- Generation Time: 2020-04-27 15:32:57.9960
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."_Migration";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "_Migration_revision_seq";

-- Table Definition
CREATE TABLE "public"."_Migration" (
    "revision" int4 NOT NULL DEFAULT nextval('"_Migration_revision_seq"'::regclass),
    "name" text NOT NULL,
    "datamodel" text NOT NULL,
    "status" text NOT NULL,
    "applied" int4 NOT NULL,
    "rolled_back" int4 NOT NULL,
    "datamodel_steps" text NOT NULL,
    "database_migration" text NOT NULL,
    "errors" text NOT NULL,
    "started_at" timestamp(3) NOT NULL,
    "finished_at" timestamp(3),
    PRIMARY KEY ("revision")
);

DROP TABLE IF EXISTS "public"."Parent";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "Parent_id_seq";

-- Table Definition
CREATE TABLE "public"."Parent" (
    "id" int4 NOT NULL DEFAULT nextval('"Parent_id_seq"'::regclass),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."Person";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "Person_id_seq";

-- Table Definition
CREATE TABLE "public"."Person" (
    "id" int4 NOT NULL DEFAULT nextval('"Person_id_seq"'::regclass),
    "parentId" int4,
    "studentId" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."Student";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "Student_id_seq";

-- Table Definition
CREATE TABLE "public"."Student" (
    "id" int4 NOT NULL DEFAULT nextval('"Student_id_seq"'::regclass),
    "parentId" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."User";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS "User_id_seq";

-- Table Definition
CREATE TABLE "public"."User" (
    "id" int4 NOT NULL DEFAULT nextval('"User_id_seq"'::regclass),
    "personId" int4,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."_Migration" ("revision", "name", "datamodel", "status", "applied", "rolled_back", "datamodel_steps", "database_migration", "errors", "started_at", "finished_at") VALUES
('1', '20200427152047-init', 'datasource postgresql {
  provider = "postgresql"
  url      = "postgresql://root:prisma@localhost:5432/p2-cascade?schema=public"
}

model Person {
  id        Int      @default(autoincrement()) @id
  student   Student? @relation(fields: [studentId], references: [id])
  studentId Int?
  parent    Parent?  @relation(fields: [parentId], references: [id])
  parentId  Int?
  user      User
}

model Parent {
  id       Int       @default(autoincrement()) @id
  person   Person
  students Student[]
}

model Student {
  id       Int    @default(autoincrement()) @id
  parent   Parent @relation(fields: [parentId], references: [id])
  parentId Int
  person   Person
}

model User {
  id       Int     @default(autoincrement()) @id
  person   Person? @relation(fields: [personId], references: [id])
  personId Int?
}', 'MigrationSuccess', '10', '0', '[{"tag":"CreateSource","source":"postgresql"},{"tag":"CreateArgument","location":{"tag":"Source","source":"postgresql"},"argument":"provider","value":"\"postgresql\""},{"tag":"CreateArgument","location":{"tag":"Source","source":"postgresql"},"argument":"url","value":"\"postgresql://root:prisma@localhost:5432/p2-cascade?schema=public\""},{"tag":"CreateModel","model":"Person"},{"tag":"CreateField","model":"Person","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Person","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Person","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Person","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"Person","field":"student","type":"Student","arity":"Optional"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Person","field":"student"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Person","field":"student"},"directive":"relation"},"argument":"fields","value":"[studentId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Person","field":"student"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"Person","field":"studentId","type":"Int","arity":"Optional"},{"tag":"CreateField","model":"Person","field":"parent","type":"Parent","arity":"Optional"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Person","field":"parent"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Person","field":"parent"},"directive":"relation"},"argument":"fields","value":"[parentId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Person","field":"parent"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"Person","field":"parentId","type":"Int","arity":"Optional"},{"tag":"CreateField","model":"Person","field":"user","type":"User","arity":"Required"},{"tag":"CreateModel","model":"Parent"},{"tag":"CreateField","model":"Parent","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Parent","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Parent","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Parent","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"Parent","field":"person","type":"Person","arity":"Required"},{"tag":"CreateField","model":"Parent","field":"students","type":"Student","arity":"List"},{"tag":"CreateModel","model":"Student"},{"tag":"CreateField","model":"Student","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Student","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Student","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Student","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"Student","field":"parent","type":"Parent","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"Student","field":"parent"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Student","field":"parent"},"directive":"relation"},"argument":"fields","value":"[parentId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"Student","field":"parent"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"Student","field":"parentId","type":"Int","arity":"Required"},{"tag":"CreateField","model":"Student","field":"person","type":"Person","arity":"Required"},{"tag":"CreateModel","model":"User"},{"tag":"CreateField","model":"User","field":"id","type":"Int","arity":"Required"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"id"},"directive":"default"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"User","field":"id"},"directive":"default"},"argument":"","value":"autoincrement()"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"id"},"directive":"id"}},{"tag":"CreateField","model":"User","field":"person","type":"Person","arity":"Optional"},{"tag":"CreateDirective","location":{"path":{"tag":"Field","model":"User","field":"person"},"directive":"relation"}},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"User","field":"person"},"directive":"relation"},"argument":"fields","value":"[personId]"},{"tag":"CreateArgument","location":{"tag":"Directive","path":{"tag":"Field","model":"User","field":"person"},"directive":"relation"},"argument":"references","value":"[id]"},{"tag":"CreateField","model":"User","field":"personId","type":"Int","arity":"Optional"}]', '{"before":{"tables":[{"name":"_Migration","columns":[{"name":"applied","tpe":{"raw":"int4","family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"database_migration","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"datamodel_steps","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"errors","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"finished_at","tpe":{"raw":"timestamp","family":"dateTime","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"name","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false},{"name":"revision","tpe":{"raw":"int4","family":"int","arity":"required"},"default":{"SEQUENCE":"nextval(''\"_Migration_revision_seq\"''::regclass)"},"autoIncrement":true},{"name":"rolled_back","tpe":{"raw":"int4","family":"int","arity":"required"},"default":null,"autoIncrement":false},{"name":"started_at","tpe":{"raw":"timestamp","family":"dateTime","arity":"required"},"default":null,"autoIncrement":false},{"name":"status","tpe":{"raw":"text","family":"string","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["revision"],"sequence":{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}},"foreignKeys":[]}],"enums":[],"sequences":[{"name":"_Migration_revision_seq","initialValue":1,"allocationSize":1}]},"after":{"tables":[{"name":"Person","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"studentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"Person_studentId","columns":["studentId"],"tpe":"unique"},{"name":"Person_parentId","columns":["parentId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["studentId"],"referencedTable":"Student","referencedColumns":["id"],"onDeleteAction":"setNull"},{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"setNull"}]},{"name":"Parent","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]},{"name":"Student","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"cascade"}]},{"name":"User","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"personId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User_personId","columns":["personId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["personId"],"referencedTable":"Person","referencedColumns":["id"],"onDeleteAction":"setNull"}]}],"enums":[],"sequences":[]},"original_steps":[{"CreateTable":{"table":{"name":"Person","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"studentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"Person_studentId","columns":["studentId"],"tpe":"unique"},{"name":"Person_parentId","columns":["parentId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["studentId"],"referencedTable":"Student","referencedColumns":["id"],"onDeleteAction":"setNull"},{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateTable":{"table":{"name":"Parent","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Student","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"cascade"}]}}},{"CreateTable":{"table":{"name":"User","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"personId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User_personId","columns":["personId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["personId"],"referencedTable":"Person","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateIndex":{"table":"Person","index":{"name":"Person_studentId","columns":["studentId"],"tpe":"unique"}}},{"CreateIndex":{"table":"Person","index":{"name":"Person_parentId","columns":["parentId"],"tpe":"unique"}}},{"CreateIndex":{"table":"User","index":{"name":"User_personId","columns":["personId"],"tpe":"unique"}}},{"AddForeignKey":{"table":"Person","foreign_key":{"constraintName":null,"columns":["studentId"],"referencedTable":"Student","referencedColumns":["id"],"onDeleteAction":"setNull"}}},{"AddForeignKey":{"table":"Person","foreign_key":{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"setNull"}}},{"AddForeignKey":{"table":"Student","foreign_key":{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"cascade"}}},{"AddForeignKey":{"table":"User","foreign_key":{"constraintName":null,"columns":["personId"],"referencedTable":"Person","referencedColumns":["id"],"onDeleteAction":"setNull"}}}],"corrected_steps":[{"CreateTable":{"table":{"name":"Person","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false},{"name":"studentId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"Person_studentId","columns":["studentId"],"tpe":"unique"},{"name":"Person_parentId","columns":["parentId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["studentId"],"referencedTable":"Student","referencedColumns":["id"],"onDeleteAction":"setNull"},{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateTable":{"table":{"name":"Parent","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[]}}},{"CreateTable":{"table":{"name":"Student","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"parentId","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":false}],"indices":[],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"cascade"}]}}},{"CreateTable":{"table":{"name":"User","columns":[{"name":"id","tpe":{"raw":"","family":"int","arity":"required"},"default":null,"autoIncrement":true},{"name":"personId","tpe":{"raw":"","family":"int","arity":"nullable"},"default":null,"autoIncrement":false}],"indices":[{"name":"User_personId","columns":["personId"],"tpe":"unique"}],"primaryKey":{"columns":["id"],"sequence":null},"foreignKeys":[{"constraintName":null,"columns":["personId"],"referencedTable":"Person","referencedColumns":["id"],"onDeleteAction":"setNull"}]}}},{"CreateIndex":{"table":"Person","index":{"name":"Person_studentId","columns":["studentId"],"tpe":"unique"}}},{"CreateIndex":{"table":"Person","index":{"name":"Person_parentId","columns":["parentId"],"tpe":"unique"}}},{"CreateIndex":{"table":"User","index":{"name":"User_personId","columns":["personId"],"tpe":"unique"}}},{"AddForeignKey":{"table":"Person","foreign_key":{"constraintName":null,"columns":["studentId"],"referencedTable":"Student","referencedColumns":["id"],"onDeleteAction":"setNull"}}},{"AddForeignKey":{"table":"Person","foreign_key":{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"setNull"}}},{"AddForeignKey":{"table":"Student","foreign_key":{"constraintName":null,"columns":["parentId"],"referencedTable":"Parent","referencedColumns":["id"],"onDeleteAction":"cascade"}}},{"AddForeignKey":{"table":"User","foreign_key":{"constraintName":null,"columns":["personId"],"referencedTable":"Person","referencedColumns":["id"],"onDeleteAction":"setNull"}}}],"rollback":[{"DropTable":{"name":"Person"}},{"DropTable":{"name":"Parent"}},{"DropTable":{"name":"Student"}},{"DropTable":{"name":"User"}}]}', '[]', '2020-04-27 09:50:55.136', '2020-04-27 09:50:55.219');

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

ALTER TABLE "public"."Person" ADD FOREIGN KEY ("studentId") REFERENCES "public"."Student"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."Person" ADD FOREIGN KEY ("parentId") REFERENCES "public"."Parent"("id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."Student" ADD FOREIGN KEY ("parentId") REFERENCES "public"."Parent"("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."User" ADD FOREIGN KEY ("personId") REFERENCES "public"."Person"("id") ON DELETE SET NULL ON UPDATE CASCADE;
