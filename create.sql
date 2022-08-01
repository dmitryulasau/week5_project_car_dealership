DROP TABLE IF EXISTS "car" CASCADE;
CREATE TABLE "car" (
  "car_id" SERIAL PRIMARY KEY,
  "VIN" VARCHAR(17),
  "year" VARCHAR(4),
  "make" VARCHAR(50),
  "model" VARCHAR(50),
  "color" VARCHAR(50),
  "new" BOOLEAN
);

DROP TABLE IF EXISTS "customer" CASCADE;
CREATE TABLE "customer" (
  "customer_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50),
  "phone" VARCHAR(10),
  "email" VARCHAR(50),
  "address" VARCHAR(50),
  "city" VARCHAR(50),
  "state" VARCHAR(50),
  "country" VARCHAR(50),
  "postal_code" VARCHAR(6)
);

DROP TABLE IF EXISTS "salesperson" CASCADE;
CREATE TABLE "salesperson" (
  "salesperson_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50)
);

DROP TABLE IF EXISTS "invoice" CASCADE;
CREATE TABLE "invoice" (
  "invoice_id" SERIAL PRIMARY KEY,
  "date" DATE,
  "car_id" INTEGER NOT NULL,
  "customer_id" INTEGER NOT NULL,
  "salesperson_id" INTEGER NOT NULL,
  FOREIGN KEY (car_id) REFERENCES "car"(car_id) ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id) ON DELETE CASCADE,
  FOREIGN KEY (salesperson_id) REFERENCES "salesperson"(salesperson_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS "mechanic" CASCADE;
CREATE TABLE "mechanic" (
  "mechanic_id" SERIAL PRIMARY KEY,
  "first_name" VARCHAR(50),
  "last_name" VARCHAR(50)
  
);

DROP TABLE IF EXISTS "service" CASCADE;
CREATE TABLE "service" (
  "service_id" SERIAL PRIMARY KEY,
  "service name" VARCHAR(50),
  "price" DECIMAL(6,2)
);

DROP TABLE IF EXISTS "service_ticket" CASCADE;
CREATE TABLE "service_ticket" (
  "service_ticket_id" SERIAL PRIMARY KEY,
  "date" DATE,
  "notes" VARCHAR(50),
  "customer_id" INTEGER NOT NULL,
  "car_id" INTEGER NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id) ON DELETE CASCADE,
  FOREIGN KEY (car_id) REFERENCES "car"(car_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS "part" CASCADE;
CREATE TABLE "part" (
  "part_id" SERIAL PRIMARY KEY,
  "description" TEXT,
  "price" DECIMAL(6,2)
);

DROP TABLE IF EXISTS "service_part" CASCADE;
CREATE TABLE "service_part" (
  "service_part_id" SERIAL PRIMARY KEY,
  "quantity" INTEGER,
  "service_ticket_id" INTEGER NOT NULL,
  "part_id" INTEGER NOT NULL,
  FOREIGN KEY (service_ticket_id) REFERENCES "service_ticket"(service_ticket_id) ON DELETE CASCADE,
  FOREIGN KEY (part_id) REFERENCES "part"(part_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS "labor" CASCADE;
CREATE TABLE "labor" (
  "labor_id" SERIAL PRIMARY KEY,
  "duration_hours" INTEGER,
  "service_ticket_id" INTEGER NOT NULL,
  "service_id" INTEGER NOT NULL,
  "mechanic_id" INTEGER NOT NULL,
  FOREIGN KEY (service_ticket_id) REFERENCES "service_ticket"(service_ticket_id) ON DELETE CASCADE,
  FOREIGN KEY (service_id) REFERENCES "service"(service_id) ON DELETE CASCADE,
  FOREIGN KEY (mechanic_id) REFERENCES "mechanic"(mechanic_id) ON DELETE CASCADE
);
