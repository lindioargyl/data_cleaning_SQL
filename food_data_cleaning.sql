SELECT * FROM food.food_choices;

-- DATA CLEANING
CREATE TABLE food.food_choices_staging
LIKE food.food_choices;

INSERT food.food_choices_staging
SELECT *
FROM food.food_choices;

-- REPLACE MISSING VALUES

SET SQL_SAFE_UPDATES = 0;

UPDATE food.food_choices_staging
SET
	calories_day = IFNULL(calories_day, 0),
	exercise = IFNULL(exercise, 0),
    income = IFNULL (income, 0),
    GPA = IFNULL(GPA, 0),
    calories_scone = IFNULL(calories_scone, 0),
    cook = IFNULL(cook, 0),
    drink = IFNULL (drink, 0),
    cuisine = IFNULL(cuisine, 0),
    employment = IFNULL(employment, 0),
    father_education = IFNULL(father_education, 0),
    fav_food = IFNULL(fav_food, 0),
    life_rewarding = IFNULL(life_rewarding, 0),
    marital_status = IFNULL(marital_status, 0),
    mother_education = IFNULL(mother_education, 0),
    on_off_campus = IFNULL(on_off_campus, 0),
    persian_food = IFNULL(persian_food, 0),
    self_perception_weight = IFNULL(self_perception_weight, 0),
    soup = IFNULL(soup, 0),
    sports = IFNULL(sports, 0),
    tortilla_calories = IFNULL(tortilla_calories, 0);   
    
        
UPDATE food.food_choices_staging
SET 
	comfort_food = IFNULL(comfort_food, 'Unknown'),
    comfort_food_reasons = IFNULL(comfort_food_reasons, 'Unknown'),
    diet_current = IFNULL(diet_current, 'Unknown'),
    eating_changes = IFNULL(eating_changes, 'Unknown'),
    father_profession = IFNULL(father_profession, 'Unknown'),
    fav_cuisine = IFNULL (fav_cuisine, 'Unkown'),
    healthy_meal = IFNULL(healthy_meal, 'Unknown'),
    ideal_diet = IFNULL(ideal_diet, 'Unknown'),
    meals_dinner_friend = IFNULL(meals_dinner_friend, 'Unknown'),
    mother_profession = IFNULL(mother_profession, 'Unknown'),
    type_sports = IFNULL(type_sports, 'Unknown'),
    weight = IFNULL(weight, 'Unknown');
    
SELECT * FROM food.food_choices_staging;

-- Standardized format
UPDATE food.food_choices_staging
	SET comfort_food = TRIM(LOWER(comfort_food)),
		comfort_food_reasons = TRIM(LOWER(comfort_food_reasons)),
        diet_current = TRIM(LOWER(diet_current)),
        eating_changes = TRIM(LOWER(eating_changes)),
        father_profession = TRIM(LOWER(father_profession)),
        food_childhood = TRIM(lower(food_childhood)),
        fav_cuisine = TRIM(LOWER(fav_cuisine)),
        healthy_meal = TRIM(lower(healthy_meal)),
        ideal_diet = TRIM(lower(ideal_diet)),
        meals_dinner_friend = TRIM(LOWER(meals_dinner_friend)),
        mother_profession = TRIM(LOWER(mother_profession)),
        type_sports = TRIM(LOWER(type_sports));
	
    ALTER TABLE food.food_choices_staging
    DROP COLUMN `comfort_food_reasons_coded_[0]`;	
        
UPDATE food.food_choices_staging
	SET weight = REGEXP_REPLACE(weight, '[^0-9]','');
    
ALTER TABLE food.food_choices_staging
MODIFY COLUMN gender varchar(10), 
MODIFY COLUMN breakfast varchar(10),
MODIFY COLUMN calories_day varchar(50),
MODIFY COLUMN coffee varchar(50),
MODIFY COLUMN comfort_food_reasons_coded varchar(50),
MODIFY COLUMN cook varchar(50),
MODIFY COLUMN cuisine varchar(50),
MODIFY COLUMN diet_current_coded varchar(50),
MODIFY COLUMN drink varchar(50),
MODIFY COLUMN eating_changes_coded varchar(50),
MODIFY COLUMN eating_changes_coded1 varchar(50),
MODIFY COLUMN eating_out varchar(50),
MODIFY COLUMN employment varchar(50),
MODIFY COLUMN ethnic_food varchar(50),
MODIFY COLUMN exercise varchar(50),
MODIFY COLUMN father_education varchar(50),
MODIFY COLUMN fav_cuisine_coded varchar(50),
MODIFY COLUMN fav_food varchar(50),
MODIFY COLUMN fries varchar(50),
MODIFY COLUMN fruit_day varchar(50),
MODIFY COLUMN grade_level varchar(50),
MODIFY COLUMN greek_food varchar(50),
MODIFY COLUMN healthy_feeling varchar(50),
MODIFY COLUMN ideal_diet_coded varchar(50),
MODIFY COLUMN income varchar(50),
MODIFY COLUMN indian_food varchar(50),
MODIFY COLUMN italian_food varchar(50),
MODIFY COLUMN marital_status varchar(50),
MODIFY COLUMN mother_education varchar(50),
MODIFY COLUMN nutritional_check varchar(50),
MODIFY COLUMN on_off_campus varchar(50),
MODIFY COLUMN parents_cook varchar(50),
MODIFY COLUMN pay_meal_out varchar(50),
MODIFY COLUMN persian_food varchar(50),
MODIFY COLUMN self_perception_weight varchar(50),
MODIFY COLUMN soup varchar(50),
MODIFY COLUMN sports varchar(50),
MODIFY COLUMN thai_food varchar(50),
MODIFY COLUMN veggies_day varchar(50),
MODIFY COLUMN vitamins varchar(50);

UPDATE food.food_choices_staging
    SET gender = CASE
        WHEN gender = 1 THEN 'Female'
        WHEN gender = 2 THEN 'Male'
        ELSE 'Unknown'
	END;
	
UPDATE food.food_choices_staging
    SET breakfast = CASE
		WHEN breakfast = 1 THEN 'Cereal'
        WHEN breakfast = 2 THEN 'Donut'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET calories_day = CASE
        WHEN calories_day = 1 THEN 'Idk'
        WHEN calories_day = 2 THEN 'Not important'
        WHEN calories_day = 3 THEN 'Moderately Important'
        WHEN calories_day = 4 THEN 'Very Important'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET coffee = CASE
		WHEN coffee = 1 THEN 'Creamy Frappucino'
        WHEN coffee = 2 THEN 'Espresso'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET comfort_food_reasons_coded = CASE
		WHEN comfort_food_reasons_coded = 1 THEN 'Stress'
        WHEN comfort_food_reasons_coded = 2 THEN 'Boredom'
        WHEN comfort_food_reasons_coded = 3 THEN 'Sadness'
        WHEN comfort_food_reasons_coded = 4 THEN 'Hunger'
        WHEN comfort_food_reasons_coded = 5 THEN 'Laziness'
        WHEN comfort_food_reasons_coded = 6 THEN 'Cold Weather'
        WHEN comfort_food_reasons_coded = 7 THEN 'Happiness'
        WHEN comfort_food_reasons_coded = 8 THEN 'Watching TV'
        WHEN comfort_food_reasons_coded = 9 THEN 'None'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET cook = CASE
		WHEN cook = 1 THEN 'Everday'
        WHEN cook = 2 THEN 'Twice a week'
        WHEN cook = 3 THEN 'Not very often'
        WHEN cook = 4 THEN 'Only during Holidays'
        WHEN cook = 5 THEN 'Never'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET cuisine = CASE
		WHEN cuisine = 1 THEN 'American'
        WHEN cuisine = 2 THEN 'Mexican/Spanish'
        WHEN cuisine = 3 THEN 'Korean/Asian'
        WHEN cuisine = 4 THEN 'Indian'
        WHEN cuisine = 5 THEN 'American inspired dishes'
        WHEN cuisine = 6 THEN 'Other'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET diet_current_coded = CASE
		WHEN diet_current_coded = 1 THEN 'Healthy'
        WHEN diet_current_coded = 2 THEN 'Unhealthy'
        WHEN diet_current_coded = 3 THEN 'Same thing'
        WHEN diet_current_coded = 4 THEN 'Unclear'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET drink = CASE
		WHEN drink = 1 THEN 'Orange Juice'
        WHEN drink = 2 THEN 'Soda'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET eating_changes_coded = CASE
		WHEN eating_changes_coded = 1 THEN 'Worse'
        WHEN eating_changes_coded = 2 THEN 'Better'
        WHEN eating_changes_coded = 3 THEN 'The same'
        WHEN eating_changes_coded = 4 THEN 'Unclear'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET eating_changes_coded1 = CASE
		WHEN eating_changes_coded1 = 1 THEN 'Eat faster'
        WHEN eating_changes_coded1 = 2 THEN 'Bigger quantity'
        WHEN eating_changes_coded1 = 3 THEN 'Worse quality'
        WHEN eating_changes_coded1 = 4 THEN 'Same food'
        WHEN eating_changes_coded1 = 5 THEN 'Healthier'
        WHEN eating_changes_coded1 = 6 THEN 'Unclear'
        WHEN eating_changes_coded1 = 7 THEN 'Drink coffee'
        WHEN eating_changes_coded1 = 8 THEN 'Less food'
        WHEN eating_changes_coded1 = 9 THEN 'More sweets'
        WHEN eating_changes_coded1 = 10 THEN 'Timing'
        WHEN eating_changes_coded1 = 11 THEN 'More carbs'
        WHEN eating_changes_coded1 = 12 THEN 'More water intake'
        WHEN eating_changes_coded1 = 13 THEN 'More variety'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET eating_out = CASE
		WHEN eating_out = 1 THEN 'Never'
        WHEN eating_out = 2 THEN '1-2 times'
        WHEN eating_out = 3 THEN '2-3 times'
        WHEN eating_out = 4 THEN '3-5 times'
        WHEN eating_out = 5 THEN 'Everyday'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET employment = CASE
		WHEN employment = 1 THEN 'Full time'
        WHEN employment = 2 THEN 'Part time'
        WHEN employment = 3 THEN 'Unemployed'
        WHEN employment = 4 THEN 'Other'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET ethnic_food = CASE
		WHEN ethnic_food = 1 THEN 'Very unlikely'
        WHEN ethnic_food = 2 THEN 'Unlikely'
        WHEN ethnic_food = 3 THEN 'Neutral'
        WHEN ethnic_food = 4 THEN 'Likely'
        WHEN ethnic_food = 5 THEN 'Very likely'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET exercise = CASE
		WHEN exercise = 1 THEN 'Everday'
        WHEN exercise = 2 THEN '2-3 times a week'
        WHEN exercise = 3 THEN 'Once a week'
        WHEN exercise = 4 THEN 'Sometimes'
        WHEN exercise = 5 THEN 'Never'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET father_education = CASE
		WHEN father_education = 1 THEN 'Less than high school'
        WHEN father_education = 2 THEN 'High school degree'
        WHEN father_education = 3 THEN 'Some college degree'
        WHEN father_education = 4 THEN 'College degree'
        WHEN father_education = 5 THEN 'College graduate'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET fav_cuisine_coded = CASE
		WHEN fav_cuisine_coded = 0 THEN 'None'
        WHEN fav_cuisine_coded = 1 THEN 'Italian/French'
        WHEN fav_cuisine_coded = 2 THEN 'Spanish/Mexican'
        WHEN fav_cuisine_coded = 3 THEN 'Arabic/Turkish'
        WHEN fav_cuisine_coded = 4 THEN 'Asian'
        WHEN fav_cuisine_coded = 5 THEN 'American'
        WHEN fav_cuisine_coded = 6 THEN 'African'
        WHEN fav_cuisine_coded = 7 THEN 'Jamaican'
        WHEN fav_cuisine_coded = 8 THEN 'Indian'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET fav_food = CASE
		WHEN fav_food = 1 THEN 'Home-cooked'
        WHEN fav_food = 2 THEN 'Store bought'
        WHEN fav_food = 3 THEN 'Both'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET fries = CASE
		WHEN fries = 1 THEN 'Mcdonalds Fries'
        WHEN fries = 2 THEN 'Home fries'
        ELSE 'Unknown'
	END; 

UPDATE food.food_choices_staging
	SET fruit_day = CASE
		WHEN fruit_day = 1 THEN 'Very unlikely'
        WHEN fruit_day = 2 THEN 'Unlikely'
        WHEN fruit_day = 3 THEN 'Neutral'
        WHEN fruit_day = 4 THEN 'Likely'
        WHEN fruit_day = 5 THEN 'Very likely'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET grade_level = CASE
		WHEN grade_level = 1 THEN 'Freshman'
        WHEN grade_level = 2 THEN 'Sophomore'
        WHEN grade_level = 3 THEN 'Junior'
        WHEN grade_level = 4 THEN 'Senior'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET greek_food = CASE
		WHEN greek_food = 1 THEN 'Very unlikely'
        WHEN greek_food = 2 THEN 'Unlikely'
        WHEN greek_food = 3 THEN 'Neutral'
        WHEN greek_food = 4 THEN 'Likely'
        WHEN greek_food = 5 THEN 'Very likely'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET ideal_diet_coded = CASE
		WHEN ideal_diet_coded = 1 THEN 'Portion control'
        WHEN ideal_diet_coded = 2 THEN 'Eating healthier'
        WHEN ideal_diet_coded = 3 THEN 'Balance'
        WHEN ideal_diet_coded = 4 THEN 'Less sugar'
        WHEN ideal_diet_coded = 5 THEN 'Home-cooked/Organic'
        WHEN ideal_diet_coded = 6 THEN 'Current diet'
        WHEN ideal_diet_coded = 7 THEN 'More protein'
        WHEN ideal_diet_coded = 8 THEN 'Unclear'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET income = CASE
		WHEN income = 1 THEN 'Less than $15,000'
        WHEN income = 2 THEN '$15,001 to $30,000'
        WHEN income = 3 THEN '$30,001 to $50,000'
        WHEN income = 4 THEN '$50,001 to $70,000'
        WHEN income = 5 THEN '$70,001 to $100,000'
        WHEN income = 6 THEN 'Higher than $100,000'
	END;
    
    UPDATE food.food_choices_staging
		SET indian_food = CASE
			WHEN indian_food = 1 THEN 'Very unlikely'
            WHEN indian_food = 2 THEN 'Unlikely'
            WHEN indian_food = 3 THEN 'Neutral'
            WHEN indian_food = 4 THEN 'Likely'
            WHEN indian_food = 5 THEN 'Very likely'
            ELSE 'Unknown'
		END;
	
    UPDATE food.food_choices_staging
		SET italian_food = CASE
			WHEN italian_food = 1 THEN 'Very unlikely'
            WHEN italian_food = 2 THEN 'Unlikely'
            WHEN italian_food = 3 THEN 'Neutral'
            WHEN italian_food = 4 THEN 'Likely'
            WHEN italian_food = 5 THEN 'Very likely'
            ELSE 'Unknown'
		END;
        
	UPDATE food.food_choices_staging
		SET marital_status = CASE
			WHEN marital_status = 1 THEN 'Single'
			WHEN marital_status = 2 THEN 'In a relationship'
            WHEN marital_status = 3 THEN 'Cohabiting'
            WHEN marital_status = 4 THEN 'Married'
            WHEN marital_status = 5 THEN 'Divorced'
            WHEN marital_status = 6 THEN 'Widowed'
            ELSE 'Unknown'
		END;
        
UPDATE food.food_choices_staging
	SET mother_education = CASE
		WHEN mother_education = 1 THEN 'Less than high school'
        WHEN mother_education = 2 THEN 'High school degree'
        WHEN mother_education = 3 THEN 'Some college degree'
        WHEN mother_education = 4 THEN 'College degree'
        WHEN mother_education = 5 THEN 'College graduate'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET nutritional_check = CASE
		WHEN nutritional_check = 1 THEN 'Never'
        WHEN nutritional_check = 2 THEN 'On certain products only'
        WHEN nutritional_check = 3 THEN 'Very rarely'
        WHEN nutritional_check = 4 THEN 'On most products'
        WHEN nutritional_check = 5 THEN 'On everything'
        ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET on_off_campus = CASE
		WHEN on_off_campus = 1 THEN 'On campus'
        WHEN on_off_campus = 2 THEN 'Rent out of campus'
        WHEN on_off_campus = 3 THEN 'Living with parents and commute'
        WHEN on_off_campus = 4 THEN 'House owned'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET parents_cook = CASE
		WHEN parents_cook = 1 THEN 'Almost everyday'
        WHEN parents_cook = 2 THEN '2-3 times a week'
        WHEN parents_cook = 3 THEN '1-2 times a week'
        WHEN parents_cook = 4 THEN 'Holidays only'
        WHEN parents_cook = 5 THEN 'Never'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET pay_meal_out = CASE
		WHEN pay_meal_out = 1 THEN 'up to $5.00'
        WHEN pay_meal_out = 2 THEN '$5.01 to $10.00'
        WHEN pay_meal_out = 3 THEN '$10.01 to $20.00'
        WHEN pay_meal_out = 4 THEN '$20.01 to $30.00'
        WHEN pay_meal_out = 5 THEN '$30.01 to $40.00'
        WHEN pay_meal_out = 6 THEN 'more than $40.01'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET persian_food = CASE
		WHEN persian_food = 1 THEN 'Very unlikely'
		WHEN persian_food = 2 THEN 'Unlikely'
		WHEN persian_food = 3 THEN 'Neutral'
		WHEN persian_food = 4 THEN 'Likely'
		WHEN persian_food = 5 THEN 'Very likely'
		ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET self_perception_weight = CASE
		WHEN self_perception_weight = 1 THEN 'Slim'
        WHEN self_perception_weight = 2 THEN 'Very fit'
        WHEN self_perception_weight = 3 THEN 'Just right'
        WHEN self_perception_weight = 4 THEN 'Slightly overweight'
        WHEN self_perception_weight = 5 THEN 'Overweight'
        WHEN self_perception_weight = 6 THEN 'I dont think myself in these terms'
		ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET soup = CASE
		WHEN soup = 1 THEN 'Veggie soup'
        WHEN soup = 2 THEN 'Creamy soup'
		ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET sports = CASE
		WHEN sports = 1 THEN 'Yes'
        WHEN sports = 2 THEN 'No'
		ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
	SET thai_food = CASE
		WHEN thai_food = 1 THEN 'Very unlikely'
		WHEN thai_food = 2 THEN 'Unlikely'
		WHEN thai_food = 3 THEN 'Neutral'
		WHEN thai_food = 4 THEN 'Likely'
		WHEN thai_food = 5 THEN 'Very likely'
		ELSE 'Unknown'
	END;

UPDATE food.food_choices_staging
	SET veggies_day = CASE
		WHEN veggies_day = 1 THEN 'Very unlikely'
		WHEN veggies_day = 2 THEN 'Unlikely'
		WHEN veggies_day = 3 THEN 'Neutral'
		WHEN veggies_day = 4 THEN 'Likely'
		WHEN veggies_day = 5 THEN 'Very likely'
		ELSE 'Unknown'
    END;

UPDATE food.food_choices_staging
	SET vitamins = CASE
		WHEN vitamins = 1 THEN 'Yes'
        WHEN vitamins = 2 THEN 'No'
        ELSE 'Unknown'
	END;
    
UPDATE food.food_choices_staging
SET GPA = ROUND(GPA,1);

ALTER TABLE food.food_choices_staging
MODIFY COLUMN GPA DECIMAL(5, 1);

SELECT * FROM food.food_choices_staging;

	
    










    



