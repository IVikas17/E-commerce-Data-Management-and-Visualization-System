create database ecommerce;
use ecommerce;
describe promotions;
select * from promotions;
-- promotions;
-- Fixxing promotions
ALTER TABLE Promotions
ADD CONSTRAINT fk_product_id
FOREIGN KEY (product_id) REFERENCES Products(product_id);

