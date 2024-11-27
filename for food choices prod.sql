SELECT * FROM food.food_choices_prod;

CREATE TABLE food.food_choices_prod
SELECT GPA, gender, grade_level, marital_status, employment, income, on_off_campus, weight, self_perception_weight, exercise, sports, type_sports, vitamins, diet_current_coded, 
ideal_diet_coded, eating_changes_coded, eating_changes_coded1, comfort_food, comfort_food_reasons_coded, cook, eating_out, pay_meal_out, fav_cuisine_coded, fav_food,
food_childhood, nutritional_check, soup, fries, drink, coffee, breakfast, ethnic_food, greek_food, indian_food, italian_food, persian_food, thai_food, veggies_day, fruit_day, 
healthy_feeling
FROM food.food_choices_staging;

ALTER TABLE food.food_choices_prod 
CHANGE on_off_campus living_situation varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE diet_current_coded current_diet varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE ideal_diet_coded ideal_diet varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE eating_changes_coded eating_habit_changes varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE eating_changes_coded1 eating_changes varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE comfort_food_reasons_coded comfort_food_reasons varchar(50);

ALTER TABLE food.food_choices_prod 
CHANGE fav_cuisine_coded fav_cuisine varchar(50);

SELECT *
FROM food.food_choices_prod
WHERE employment = 'Unknown';

SET SQL_SAFE_UPDATES = 0;
UPDATE food.food_choices_prod
SET employment = 'Part Time'
WHERE employment = 'Unknown';

SELECT *
FROM food.food_choices_prod
WHERE living_situation = 'Unknown';

ALTER TABLE food.food_choices_prod
ADD COLUMN entry INT DEFAULT 0;

SET @row_num = 0;

UPDATE food.food_choices_prod
SET entry = (@row_num := @row_num + 1);


ALTER TABLE food.food_choices_prod
ADD COLUMN comfort_food2 VARCHAR(255)
AFTER comfort_food1;

ALTER TABLE food.food_choices_prod
ADD COLUMN comfort_food3 VARCHAR(255)
AFTER comfort_food2;

ALTER TABLE food.food_choices_prod
ADD COLUMN comfort_food1 VARCHAR(255)
AFTER comfort_food;

UPDATE food.food_choices_prod
SET 
    comfort_food1 = TRIM(SUBSTRING_INDEX(comfort_food, ',', 1)),
    comfort_food2 = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 2), ',', -1)),
    comfort_food3 = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(comfort_food, ',', 3), ',', -1))
WHERE 
    comfort_food IS NOT NULL;
    
UPDATE food.food_choices_prod
SET comfort_food2 = SUBSTRING_INDEX(comfort_food2, 'and', 1)
WHERE entry = 6;

UPDATE food.food_choices_prod
SET comfort_food3 = 'soda'
WHERE entry = 6 AND comfort_food3 LIKE '%soda%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'pasta'
WHERE entry = 10 AND comfort_food3 LIKE '%pasta%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'chocolate cake'
WHERE entry = 11 AND comfort_food2 LIKE '%chocolate cake%';

UPDATE food.food_choices_prod
SET comfort_food3 = ' '
WHERE entry = 11 AND comfort_food3 LIKE '% %';

UPDATE food.food_choices_prod
SET comfort_food2 = 'candy'
WHERE entry = 17 AND comfort_food2 LIKE '%candy%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'kit kat'
WHERE entry = 17 AND comfort_food3 LIKE '%kit kat%';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'ice crea', 'ice cream')
WHERE entry = 19 AND comfort_food2 LIKE '%ice crea%';

UPDATE food.food_choices_prod
SET comfort_food3 = ' '
WHERE entry = 19 AND comfort_food3 LIKE '% %';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'mac-n-cheese', 'mac and cheese')
WHERE entry = 31 AND comfort_food2 LIKE '%mac-n-cheese%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'grandma''s chinese', 'chinese food')
WHERE entry = 33 AND comfort_food1 LIKE '%grandma''s chinese%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'peruvian food'
WHERE entry = 33 AND comfort_food2 LIKE '%peruvian food%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'sushi'
WHERE entry = 33 AND comfort_food3 LIKE '%sushi%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'mac n cheese', 'mac and cheese')
WHERE entry = 36 AND comfort_food1 LIKE '%mac n cheese%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'candy'
WHERE entry = 40 AND comfort_food1 LIKE '%candy%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'chocolate'
WHERE entry = 40 AND comfort_food2 LIKE '%chocolate%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'chipotle'
WHERE entry = 40 AND comfort_food3 LIKE '%chipotle%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'chips'
WHERE entry = 32 AND comfort_food1 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'chips'
WHERE entry = 44 AND comfort_food3 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'chips'
WHERE entry = 45 AND comfort_food1 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'cookies'
WHERE entry = 48 AND comfort_food2 LIKE '%cookies%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'fried chicken'
WHERE entry = 50 AND comfort_food1 LIKE '%fried chicken%';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'mac and cheese', 'mashed potatoes')
WHERE entry = 50 AND comfort_food2 LIKE '%mac and cheese%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'chex-mix', 'chex mix')
WHERE entry = 48 AND comfort_food1 LIKE '%chex-mix%';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'pretzals', 'pretzels')
WHERE entry = 55 AND comfort_food2 LIKE '%pretzals%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'ice cream'
WHERE entry = 53 AND comfort_food3 LIKE '%ice cream%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'pizza'
WHERE entry = 58 AND comfort_food1 LIKE '%pizza%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'chocolate'
WHERE entry = 58 AND comfort_food2 LIKE '%chocolate%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'chips'
WHERE entry = 58 AND comfort_food3 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'mac n cheese'
WHERE entry = 60 AND comfort_food1 LIKE '%mac n cheese%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'mac n cheese', 'mac and cheese')
WHERE entry = 60 AND comfort_food1 LIKE '%mac n cheese';

UPDATE food.food_choices_prod
SET comfort_food2 = 'chips'
WHERE entry = 60 AND comfort_food2 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'ice cream'
WHERE entry = 60 AND comfort_food3 LIKE '%ice cream%';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'dessets', 'dessert')
WHERE entry = 61 AND comfort_food2 LIKE '%dessets';

UPDATE food.food_choices_prod
SET comfort_food3 = REPLACE(comfort_food3, 'pretzels.', 'pretzels')
WHERE entry = 61 AND comfort_food3 LIKE '%pretzels.';

UPDATE food.food_choices_prod
SET comfort_food3 = REPLACE(comfort_food3, 'icecream', 'ice cream')
WHERE entry = 66 AND comfort_food3 LIKE '%icecream';

UPDATE food.food_choices_prod
SET comfort_food3 = 'mashed potatoes'
WHERE entry = 75 AND comfort_food3 LIKE '%mashed potatoes%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'pizza'
WHERE entry = 76 AND comfort_food1 LIKE '%pizza%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'cookies'
WHERE entry = 76 AND comfort_food2 LIKE '%cookies%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'steak'
WHERE entry = 76 AND comfort_food3 LIKE '%steak%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'ice cream'
WHERE entry = 77 AND comfort_food3 LIKE '%ice cream%';

UPDATE food.food_choices_prod
SET comfort_food1 = 'chips'
WHERE entry = 78 AND comfort_food1 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food2 = 'sweets'
WHERE entry = 78 AND comfort_food2 LIKE '%sweets%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'popcorn'
WHERE entry = 78 AND comfort_food3 LIKE '%popcorn%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'macaroni and cheese', 'mac and cheese')
WHERE entry = 90 AND comfort_food1 LIKE '%macaroni and cheese';

UPDATE food.food_choices_prod
SET comfort_food3 = 'ice cream'
WHERE entry = 96 AND comfort_food3 LIKE '%ice cream%';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'mac & cheese', 'mac and cheese')
WHERE entry = 98 AND comfort_food1 LIKE '%mac & cheese';

UPDATE food.food_choices_prod
SET comfort_food3 = REPLACE(comfort_food3, 'chicken nuggs', 'chciken nuggets')
WHERE entry = 98 AND comfort_food3 LIKE '%chicken nuggs';

UPDATE food.food_choices_prod
SET comfort_food1 = REPLACE(comfort_food1, 'macaroni and cheese', 'mac and cheese')
WHERE entry = 100 AND comfort_food1 LIKE '%macaroni and cheese%';

UPDATE food.food_choices_prod
SET comfort_food3 = 'chips'
WHERE entry = 13 AND comfort_food3 LIKE '%chips%';

UPDATE food.food_choices_prod
SET comfort_food3 = REPLACE(comfort_food3, 'chinese', 'chinese food')
WHERE entry = 20 AND comfort_food3 LIKE '%chinese%';

UPDATE food.food_choices_prod
SET comfort_food3 = REPLACE(comfort_food3, 'chips.', 'chips')
WHERE entry = 8 AND comfort_food3 LIKE '%chips.%';

UPDATE food.food_choices_prod
SET comfort_food2 = REPLACE(comfort_food2, 'ice creamm', 'ice cream')
WHERE entry = 19 AND comfort_food2 LIKE '%ice creamm%';

ALTER TABLE food.food_choices_prod
DROP COLUMN comfort_food;

UPDATE food.food_choices_prod
SET food_childhood = 'chips'
WHERE entry = 13 AND comfort_food3 LIKE '%chips%';

ALTER TABLE food.food_choices_prod
DROP COLUMN food_childhood;


SELECT * FROM food.food_choices_prod;

 


