CREATE TABLE "Product" (
  "ProductID" SERIAL PRIMARY KEY,
  "Name" VARCHAR(255),
  "Category" VARCHAR(50),
  "Description" TEXT
);

CREATE TABLE "TimeDimension" (
  "TimeDate" DATE PRIMARY KEY,
  "Day" INT,
  "Month" INT,
  "Quarter" INT,
  "Year" INT
);

CREATE TABLE "Location" (
  "LocationID" SERIAL PRIMARY KEY,
  "Region" VARCHAR(50),
  "City" VARCHAR(100),
  "Country" VARCHAR(100)
);

CREATE TABLE "Sales" (
  "SalesID" SERIAL PRIMARY KEY,
  "ProductID" INT,
  "SaleDate" DATE,
  "Quantity" INT,
  "UnitPrice" DECIMAL(10,2),
  "TotalAmount" DECIMAL(10,2),
  "LocationID" INT
);

ALTER TABLE "Sales" ADD FOREIGN KEY ("ProductID") REFERENCES "Product" ("ProductID");

ALTER TABLE "Sales" ADD FOREIGN KEY ("SaleDate") REFERENCES "TimeDimension" ("TimeDate");

ALTER TABLE "Sales" ADD FOREIGN KEY ("LocationID") REFERENCES "Location" ("LocationID");
