-- C21342953 Andrei Voiniciuc
-- Databases ERD and SQL Assignment
-- 19/04/2023

drop table stock;
drop table recipe_ingredient;
drop table recipe;
drop table ingredient;
drop table chef;
drop table category;

--------------------------------------------------------
-- Creating the tables generated from the Data Modeler:
--------------------------------------------------------

CREATE TABLE category (
    category_id   INT NOT NULL,
    category_name VARCHAR(15) NOT NULL,
    cuisine       VARCHAR(15) NOT NULL
);

ALTER TABLE category ADD CONSTRAINT category_pk PRIMARY KEY ( category_id );

CREATE TABLE chef (
    chef_id         INT NOT NULL,
    chef_name       VARCHAR(20) NOT NULL,
    chef_restaurant VARCHAR(20) NOT NULL,
    chef_experience INT NOT NULL
);

ALTER TABLE chef ADD CONSTRAINT chef_pk PRIMARY KEY ( chef_id );

CREATE TABLE ingredient (
    ingredient_id INT NOT NULL,
    ing_name      VARCHAR(15) NOT NULL,
    ing_desc      VARCHAR(40) NOT NULL
);

ALTER TABLE ingredient ADD CONSTRAINT ingredient_pk PRIMARY KEY ( ingredient_id );

CREATE TABLE recipe (
    recipe_id      INT NOT NULL,
    recipe_name    VARCHAR(30) NOT NULL,
    recipe_desc    VARCHAR(100) NOT NULL,
    cooking_method VARCHAR(15) NOT NULL,
    category_id    INT NOT NULL,
    chef_id        INT NOT NULL
);

ALTER TABLE recipe ADD CONSTRAINT recipe_pk PRIMARY KEY ( recipe_id );

CREATE TABLE recipe_ingredient (
    recipe_id     INT NOT NULL,
    ingredient_id INT NOT NULL
);

ALTER TABLE recipe_ingredient ADD CONSTRAINT recipe_ingredient_pk PRIMARY KEY ( recipe_id,
                                                                                ingredient_id );

CREATE TABLE stock (
    stock_id       INT NOT NULL,
    stock_quantity INT NOT NULL,
    ingredient_id  INT NOT NULL
);

CREATE UNIQUE INDEX stock__idx ON
    stock (
        ingredient_id
    ASC );

ALTER TABLE stock ADD CONSTRAINT stock_pk PRIMARY KEY ( stock_id );

ALTER TABLE recipe_ingredient
    ADD CONSTRAINT ingredient_recipe_fk FOREIGN KEY ( recipe_id )
        REFERENCES recipe ( recipe_id );

ALTER TABLE recipe
    ADD CONSTRAINT recipe_category_fk FOREIGN KEY ( category_id )
        REFERENCES category ( category_id );

ALTER TABLE recipe
    ADD CONSTRAINT recipe_chef_fk FOREIGN KEY ( chef_id )
        REFERENCES chef ( chef_id );

ALTER TABLE recipe_ingredient
    ADD CONSTRAINT recipe_ingredient_fk FOREIGN KEY ( ingredient_id )
        REFERENCES ingredient ( ingredient_id );

ALTER TABLE stock
    ADD CONSTRAINT stock_ingredient_fk FOREIGN KEY ( ingredient_id )
        REFERENCES ingredient ( ingredient_id );
       
--------------------------------       
-- Insert statements below:
--------------------------------
       
-- Category table:
insert into category(category_id, category_name, cuisine)
values (1, 'Pasta', 'Italian');
insert into category(category_id, category_name, cuisine)
values (2, 'Pizza', 'Italian');

-- Chef table:
insert into chef(chef_id, chef_name, chef_restaurant, chef_experience)
values (1, 'Chef John', 'Robertos', 20);
insert into chef(chef_id, chef_name, chef_restaurant, chef_experience)
values (2, 'Chef Julio', 'Julios', 30);
insert into chef(chef_id, chef_name, chef_restaurant, chef_experience)
values (3, 'Chef Andrei', 'Pizza Hut', 5);

-- Ingredient table:
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (1, 'Penne pasta', 'Classic pasta used in many recipes');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (2, 'Chicken breast', 'Chicken breasts sliced into strips');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (3, 'Tomatoes', 'Canned chopped tomatoes');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (4, 'Mozzarella', 'Mozzarella cheese');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (5, 'Broccoli', 'long-stem broccoli, cut small');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (6, 'Parmesan cheese', 'Grated parmesan cheese');
insert into ingredient(ingredient_id, ing_name, ing_desc)
values (7, 'Pizza dough', 'Ready-made dough from flour and yeast');

-- Recipe table:
insert into recipe(recipe_id, recipe_name, recipe_desc, cooking_method, category_id, chef_id)
values (1, 'Chicken Pasta Bake', 'A gooey cheese and chicken pasta bake, perfect for a family dinner', 'Baking', 1, 1);
insert into recipe(recipe_id, recipe_name, recipe_desc, cooking_method, category_id, chef_id)
values (2, 'Chicken & Broccoli Pasta', 'A creamy chicken pasta with broccoli, perfect for any time of day', 'Fried', 1, 2);
insert into recipe(recipe_id, recipe_name, recipe_desc, cooking_method, category_id, chef_id)
values (3, 'Pizza Margherita', 'A simple margherita pizza, Italian-style', 'Baked', 2, 3);

-- Recipe_Ingredient relation table:
insert into recipe_ingredient(recipe_id, ingredient_id)
values (1,1);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (1,2);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (1,3);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (1,4);


insert into recipe_ingredient(recipe_id, ingredient_id)
values (2,1);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (2,2);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (2,5);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (2,6);


insert into recipe_ingredient(recipe_id, ingredient_id)
values (3,3);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (3,4);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (3,7);
insert into recipe_ingredient(recipe_id, ingredient_id)
values (3,6);

-- Stock table:
insert into stock(stock_id, stock_quantity, ingredient_id)
values (1, 0, 1);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (2, 100, 2);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (3, 250, 3);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (4, 250, 4);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (5, 100, 5);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (6, 150, 6);
insert into stock(stock_id, stock_quantity, ingredient_id)
values (7, 100, 7);


-----------------------------
-- Select statements below:
-----------------------------

-- Inner Join query:
-- This query selects recipe_name, category_name and chef_name
-- The data is combined by inner joins
-- The 'where' clause filters the results to only show recipes
-- with a cooking method of 'Baking'
SELECT r.recipe_name, c.category_name, ch.chef_name
FROM recipe r
INNER JOIN category c ON r.category_id = c.category_id
INNER JOIN chef ch ON r.chef_id = ch.chef_id
WHERE r.cooking_method = 'Baking';

-- Outer Join query:
-- This query selects recipe_id, recipe_name, ing_name and stock_quantity
-- and the data is joined with left outer joins to combine the tables
-- The results are filtered to only show data where the stock_quantity is not null.
SELECT recipe.recipe_id, recipe.recipe_name, ingredient.ing_name, stock.stock_quantity
FROM recipe
LEFT OUTER JOIN recipe_ingredient ON recipe.recipe_id = recipe_ingredient.recipe_id
LEFT OUTER JOIN ingredient ON recipe_ingredient.ingredient_id = ingredient.ingredient_id
LEFT OUTER JOIN stock ON ingredient.ingredient_id = stock.ingredient_id
WHERE stock.stock_quantity IS NOT NULL;

------------------------
-- Aggregate queries
------------------------

-- This query gets the number of recipes in each category.
SELECT c.category_name, COUNT(*) as num_recipes 
FROM recipe r 
JOIN category c ON r.category_id = c.category_id 
GROUP BY c.category_name;

-- This query gets the total number of ingredients in stock.
SELECT SUM(stock_quantity) as total_stock FROM stock;

-------------------------------
-- SET operating queries
-------------------------------

-- This query gets all the ingredients used in the "Chicken Pasta Bake" and "Pizza Margherita" recipes:
SELECT ing_name FROM ingredient
WHERE ingredient_id IN 
(SELECT ingredient_id FROM recipe_ingredient WHERE recipe_id = 1)
UNION
SELECT ing_name FROM ingredient
WHERE ingredient_id IN 
(SELECT ingredient_id FROM recipe_ingredient WHERE recipe_id = 3);

-- This query gets all the ingredients that are used in the "Chicken Pasta Bake" recipe but not in the "Chicken & Broccoli Pasta" recipe:
SELECT ing_name FROM ingredient
WHERE ingredient_id IN 
(SELECT ingredient_id FROM recipe_ingredient WHERE recipe_id = 1)
EXCEPT
SELECT ing_name FROM ingredient
WHERE ingredient_id IN 
(SELECT ingredient_id FROM recipe_ingredient WHERE recipe_id = 2);


-----------------
-- Sub-query
-----------------

-- This sub-query retrieves a list of ingredients that have zero quantity in stock.
SELECT r.recipe_id, r.recipe_name, i.ing_name
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.recipe_id = ri.recipe_id
INNER JOIN ingredient i ON ri.ingredient_id = i.ingredient_id
WHERE ri.ingredient_id NOT IN (
  SELECT s.ingredient_id 
  FROM stock s 
  WHERE s.stock_quantity > 0
);

----------------------------
-- Data manipulation SQL
----------------------------

-- Simulating that the stock of mozzarella cheese is about to finish, and we need to order more:
-- The transaction below adds a new record to the stock table with the stock quantity
-- increased by 50 for mozzarella cheese.
BEGIN TRANSACTION;

UPDATE stock
SET stock_quantity = stock_quantity + 50
WHERE ingredient_id = 4;

COMMIT;

-- Removing the "Pizza Margherita" recipe from the database, including its associated
-- recipe_ingredient records, which is done with the DELETE statement:
BEGIN TRANSACTION;

DELETE FROM recipe_ingredient
WHERE recipe_id = 3;

DELETE FROM recipe
WHERE recipe_id = 3;

COMMIT;








