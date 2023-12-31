~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Program Description: Databases ERD and SQL Assignment
Authors: C21342953 Andrei Voiniciuc
Date: 19/04/2023
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#####################
 Project Description
#####################

I created this project as my Databases module assignment, in which I had to display my knowledge of ERD systems and SQL database creation and information selection. I was provided with the guidelines of creating a restaurant database, which gave me a baseline on what tables I should create for the database. My database contains five tables, which are shown in the Logical and Relational Models included with the project, as well as the SQL code. The table creation code was auto-generated by the Oracle Data Modeler program. I inserted information into the tables and wrote Select statements to show several views of the information in the database.

########################
 Project Implementation
########################

I started by planning out my tables for the database. I decided on five tables: Recipe, Recipe Category, Ingredient, Stock and Chef. Each table had its own respective variables, as well as Primary and Foreign Keys in each required case.

Breakdown of tables and variables:

Table 1: Recipe
•	int recipe_id
•	Varchar recipe_name
•	Varchar desc
•	int category_id
•	Int ingredient_id
•	Int chef_id
•	Varchar cooking_method
Table 2: Recipe Category
•	Int category_id
•	Varchar category_name
•	Varchar cuisine
Table 3: Ingredient
•	Int ingredient_id
•	Varchar ing_name
•	Varchar ing_desc
•	Int stock_id
Table 4: Stock
•	Int Stock_id
•	Int stock_quantity
Table 5: Chef
•	Int chef_id
•	Varchar chef_name
•	Varchar chef_restaurant
•	Int chef_experience

I then proceeded to input this information into the Oracle Data Modeler, which provided me with a Logical and Relational Model of my database, screenshots are included in the Word document included with this project.

I then generated the SQL code to create the tables, which I inserted into a running database that I set up using a Docker Container and the DBeaver database tool to allow me to work inside my created database.

The next part of my assignment was to insert appropriate information into each table in the database. I inserted recipe categories, chef names, ingredients, recipes, and stock values.

I then proceeded to write Select statements to show the information in my database. I used Inner and Outer Join queries, Aggregate queries, Set operating queries and sub-queries. Each query had a different purpose for the information shown to the user, e.g. "This query gets the number of recipes in each category".

To finalise the project, I had to write a few SQL queries to manipulate data in the database. My first query simulated that the stock for an ingredient ran out, and more had to be ordered, so the stock was increased by 50. The stock table was updated with the new quantity.

My second query removed a specific recipe, as well as its associated recipe_ingredient records from the database.

########################################
 What would I add if I had more time:
########################################

I would have added another table to provide more real-life functionality to the database, and added more information to each table to show how the database would function with a larger number of entries.

##########################
 Final notes and sources:
##########################

I believe this project was a true learning experience in creating a database with a real-life purpose, thinking about how each variable links each table, and how this would translate into a real-life scenario. I was able to implement all necessary functionality into my database and to show how I can add, show and edit information with each query written.

All the code for this project was written by me, using information I learned in my Databases module as well as table creation code generated by the Oracle Data Modeler.



