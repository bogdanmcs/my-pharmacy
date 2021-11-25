-- Database schema
--------------------------------------------------------
--  File created - Thursday-November-25-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "CATEGORY" 
   (	"ID_CATEGORY" NUMBER, 
	"NAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table DRUG
--------------------------------------------------------

  CREATE TABLE "DRUG" 
   (	"ID_DRUG" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"PRICE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table DRUG_CATEGORY
--------------------------------------------------------

  CREATE TABLE "DRUG_CATEGORY" 
   (	"ID_DRUG" NUMBER, 
	"ID_CATEGORY" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table PACKAGE
--------------------------------------------------------

  CREATE TABLE "PACKAGE" 
   (	"ID_PACKAGE" NUMBER, 
	"ID_PHARMACY" NUMBER, 
	"TIMESTAMP" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table PACKAGE_ITEM
--------------------------------------------------------

  CREATE TABLE "PACKAGE_ITEM" 
   (	"ID_PACKAGE" NUMBER, 
	"ID_DRUG" NUMBER, 
	"QUANTITY" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table PHARMACY
--------------------------------------------------------

  CREATE TABLE "PHARMACY" 
   (	"ID_PHARMACY" NUMBER, 
	"NAME" VARCHAR2(20 BYTE), 
	"ADDRESS" VARCHAR2(20 BYTE), 
	"PHONE_NUMBER" VARCHAR2(20 BYTE)
   ) ;
REM INSERTING into CATEGORY
SET DEFINE OFF;
Insert into CATEGORY (ID_CATEGORY,NAME) values (1,'analgesics');
Insert into CATEGORY (ID_CATEGORY,NAME) values (2,'antibiotics');
Insert into CATEGORY (ID_CATEGORY,NAME) values (3,'vitamins');
REM INSERTING into DRUG
SET DEFINE OFF;
Insert into DRUG (ID_DRUG,NAME,PRICE) values (1,'Ibuprofen',20);
Insert into DRUG (ID_DRUG,NAME,PRICE) values (2,'Xanax',15);
Insert into DRUG (ID_DRUG,NAME,PRICE) values (3,'Tramadol',30);
Insert into DRUG (ID_DRUG,NAME,PRICE) values (4,'Ditropan',50);
REM INSERTING into DRUG_CATEGORY
SET DEFINE OFF;
Insert into DRUG_CATEGORY (ID_DRUG,ID_CATEGORY) values (1,1);
Insert into DRUG_CATEGORY (ID_DRUG,ID_CATEGORY) values (1,2);
Insert into DRUG_CATEGORY (ID_DRUG,ID_CATEGORY) values (2,2);
Insert into DRUG_CATEGORY (ID_DRUG,ID_CATEGORY) values (3,3);
Insert into DRUG_CATEGORY (ID_DRUG,ID_CATEGORY) values (4,1);
REM INSERTING into PACKAGE
SET DEFINE OFF;
Insert into PACKAGE (ID_PACKAGE,ID_PHARMACY,TIMESTAMP) values (1,1,to_date('12-AUG-21','DD-MON-RR'));
Insert into PACKAGE (ID_PACKAGE,ID_PHARMACY,TIMESTAMP) values (2,2,to_date('24-AUG-21','DD-MON-RR'));
Insert into PACKAGE (ID_PACKAGE,ID_PHARMACY,TIMESTAMP) values (3,1,to_date('30-AUG-21','DD-MON-RR'));
Insert into PACKAGE (ID_PACKAGE,ID_PHARMACY,TIMESTAMP) values (4,1,to_date('01-OCT-21','DD-MON-RR'));
Insert into PACKAGE (ID_PACKAGE,ID_PHARMACY,TIMESTAMP) values (5,2,to_date('10-NOV-21','DD-MON-RR'));
REM INSERTING into PACKAGE_ITEM
SET DEFINE OFF;
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (5,1,5);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (5,4,10);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (1,1,5);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (1,2,14);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (1,4,9);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (2,2,8);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (2,4,8);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (3,2,10);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (3,3,4);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (3,4,4);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (4,1,12);
Insert into PACKAGE_ITEM (ID_PACKAGE,ID_DRUG,QUANTITY) values (5,2,7);
REM INSERTING into PHARMACY
SET DEFINE OFF;
Insert into PHARMACY (ID_PHARMACY,NAME,ADDRESS,PHONE_NUMBER) values (1,'Dona','st. Aninei','555-123       ');
Insert into PHARMACY (ID_PHARMACY,NAME,ADDRESS,PHONE_NUMBER) values (2,'Vlad','st. Daliei','555-987     ');
--------------------------------------------------------
--  DDL for Index CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CATEGORY_PK" ON "CATEGORY" ("ID_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index DRUG_CATEGORY_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "DRUG_CATEGORY_UK1" ON "DRUG_CATEGORY" ("ID_DRUG", "ID_CATEGORY") 
  ;
--------------------------------------------------------
--  DDL for Index DRUG_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DRUG_PK" ON "DRUG" ("ID_DRUG") 
  ;
--------------------------------------------------------
--  DDL for Index FARMACIE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FARMACIE_PK" ON "PHARMACY" ("ID_PHARMACY") 
  ;
--------------------------------------------------------
--  DDL for Index PACKAGE_ITEM_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "PACKAGE_ITEM_UK1" ON "PACKAGE_ITEM" ("ID_PACKAGE", "ID_DRUG") 
  ;
--------------------------------------------------------
--  DDL for Index PACKAGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PACKAGE_PK" ON "PACKAGE" ("ID_PACKAGE") 
  ;
--------------------------------------------------------
--  Constraints for Table PACKAGE_ITEM
--------------------------------------------------------

  ALTER TABLE "PACKAGE_ITEM" MODIFY ("ID_PACKAGE" NOT NULL ENABLE);
  ALTER TABLE "PACKAGE_ITEM" MODIFY ("ID_DRUG" NOT NULL ENABLE);
  ALTER TABLE "PACKAGE_ITEM" MODIFY ("QUANTITY" NOT NULL ENABLE);
  ALTER TABLE "PACKAGE_ITEM" ADD CONSTRAINT "PACKAGE_ITEM_UK1" UNIQUE ("ID_PACKAGE", "ID_DRUG")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "CATEGORY" MODIFY ("ID_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "CATEGORY" ADD CONSTRAINT "CATEGORY_PK" PRIMARY KEY ("ID_CATEGORY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PACKAGE
--------------------------------------------------------

  ALTER TABLE "PACKAGE" MODIFY ("ID_PACKAGE" NOT NULL ENABLE);
  ALTER TABLE "PACKAGE" MODIFY ("ID_PHARMACY" NOT NULL ENABLE);
  ALTER TABLE "PACKAGE" ADD CONSTRAINT "PACKAGE_PK" PRIMARY KEY ("ID_PACKAGE")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DRUG_CATEGORY
--------------------------------------------------------

  ALTER TABLE "DRUG_CATEGORY" MODIFY ("ID_DRUG" NOT NULL ENABLE);
  ALTER TABLE "DRUG_CATEGORY" MODIFY ("ID_CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "DRUG_CATEGORY" ADD CONSTRAINT "DRUG_CATEGORY_UK1" UNIQUE ("ID_DRUG", "ID_CATEGORY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table PHARMACY
--------------------------------------------------------

  ALTER TABLE "PHARMACY" MODIFY ("ID_PHARMACY" NOT NULL ENABLE);
  ALTER TABLE "PHARMACY" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PHARMACY" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "PHARMACY" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
  ALTER TABLE "PHARMACY" ADD CONSTRAINT "FARMACIE_PK" PRIMARY KEY ("ID_PHARMACY")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DRUG
--------------------------------------------------------

  ALTER TABLE "DRUG" MODIFY ("ID_DRUG" NOT NULL ENABLE);
  ALTER TABLE "DRUG" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "DRUG" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "DRUG" ADD CONSTRAINT "DRUG_PK" PRIMARY KEY ("ID_DRUG")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DRUG_CATEGORY
--------------------------------------------------------

  ALTER TABLE "DRUG_CATEGORY" ADD CONSTRAINT "DRUG_CATEGORY_FK1" FOREIGN KEY ("ID_CATEGORY")
	  REFERENCES "CATEGORY" ("ID_CATEGORY") ENABLE;
  ALTER TABLE "DRUG_CATEGORY" ADD CONSTRAINT "DRUG_CATEGORY_FK2" FOREIGN KEY ("ID_DRUG")
	  REFERENCES "DRUG" ("ID_DRUG") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PACKAGE
--------------------------------------------------------

  ALTER TABLE "PACKAGE" ADD CONSTRAINT "PACKAGE_FK1" FOREIGN KEY ("ID_PHARMACY")
	  REFERENCES "PHARMACY" ("ID_PHARMACY") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PACKAGE_ITEM
--------------------------------------------------------

  ALTER TABLE "PACKAGE_ITEM" ADD CONSTRAINT "PACKAGE_ITEM_FK1" FOREIGN KEY ("ID_PACKAGE")
	  REFERENCES "PACKAGE" ("ID_PACKAGE") ENABLE;
  ALTER TABLE "PACKAGE_ITEM" ADD CONSTRAINT "PACKAGE_ITEM_FK2" FOREIGN KEY ("ID_DRUG")
	  REFERENCES "DRUG" ("ID_DRUG") ENABLE;
