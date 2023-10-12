CREATE database "Task5"
DROP DATABASE "promo_code"

SELECT *
FROM dbo.promo_code$

DROP TABLE dbo.promo_code$

ALTER TABLE dbo.promo_code$ ALTER COLUMN "promo_id" INT NOT NULL 

ALTER TABLE dbo.promo_code$ add primary key(promo_id);

CREATE TABLE buyer_table (
    buyer_id integer NOT NULL PRIMARY KEY,
    buyer_name character varying(255),
    address character varying(255),
    city character varying(255),
    zipcode bigint,
    phone bigint,
    city_code character varying(255)
);
drop table buyer_table

CREATE TABLE marketplace_table (
    item_id integer NOT NULL PRIMARY KEY,
    item_name character varying(255) NOT NULL,
    price bigint NOT NULL,
    category character varying(255),
    sub_category character varying(255),
    reviews integer,
    sold integer,
    views integer,
    rating numeric,
    seller_id integer );
drop table marketplace_table

CREATE TABLE sales_table (
    sales_id integer NOT NULL PRIMARY KEY,
    item_id integer REFERENCES marketplace_table ON UPDATE CASCADE ON DELETE CASCADE,
    purchase_date date,
    quantity integer,
    buyer_id integer REFERENCES buyer_table ON UPDATE CASCADE ON DELETE CASCADE,
    seller_id integer REFERENCES seller_table ON UPDATE CASCADE ON DELETE CASCADE,
    promo_id integer REFERENCES promo_code$ ON UPDATE CASCADE ON DELETE CASCADE
);
drop table sales_table


CREATE TABLE seller_table (
    seller_id integer NOT NULL PRIMARY KEY,
    seller_name character varying(255),
    city character varying(255),
    city_code character varying(3)
);
drop table seller_table

CREATE TABLE shipping_table (
    shipping_id integer NOT NULL PRIMARY KEY,
    sales_id integer NOT NULL REFERENCES sales_table ON UPDATE CASCADE ON DELETE CASCADE,
    purchase_date date,
    shipping_date date,
    buyer_id integer,
    seller_id integer);
drop table shipping_table

-- CREATE TABLE "Q3_Q4_REVIEW" (
--	purchase_date date,
--	promo_id int REFERENCES promo_code$ ON UPDATE CASCADE ON DELETE CASCADE)
drop table Q3_Q4_REVIEW

INSERT INTO "Q3_Q4_REVIEW" VALUES ('12/7/2022','300000','2','400000')
DELETE FROM Q3_Q4_REVIEW
WHERE promo_id = 2

ALTER TABLE Q3_Q4_REVIEW ALTER COLUMN "purchase_date" DATE NOT NULL 
ALTER TABLE Q3_Q4_REVIEW add primary key(purchase_date)

SELECT *
FROM Q3_Q4_REVIEW

ALTER TABLE Q3_Q4_REVIEW ADD [total_price] int
ALTER TABLE Q3_Q4_REVIEW ADD [price_sesudah_promo] int 

-- SELECT [total_price]=price*quantity,price,quantity
-- FROM marketplace_table
-- JOIN sales_table 
-- ON price=quantity

INSERT INTO Q3_Q4_REVIEW (total_price)
SELECT total=price*quantity
FROM marketplace_table
JOIN sales_table 
ON price=quantity

INSERT INTO Q3_Q4_REVIEW (price_sesudah_promo)
SELECT total_bersih=total_price-price_deduction
FROM Q3_Q4_REVIEW
JOIN promo_code$
ON total_price=price_deduction

--INSERT INTO Q3_Q4_REVIEW (promo_id) VALUES 
--(11),(11)
--DELETE FROM Q3_Q4_REVIEW WHERE promo_id = 11

SELECT * FROM Q3_Q4_REVIEW
SELECT * FROM promo_code$

INSERT INTO marketplace_table
SELECT * FROM Marketplace$

INSERT INTO sales_table
SELECT * FROM Salestable$

